#include "SolARPluginPipelineManager.h"
#include "api/source/ISourceReturnCode.h"
#include "api/sink/ISinkReturnCode.h"
#include "xpcf/core/uuid.h"
#include "xpcf/core/Exception.h"
#include "core/Log.h"

#include <boost/log/core.hpp>

#include <iostream>


namespace SolAR {
using namespace datastructure;
using namespace api::pipeline;
using namespace api::sink;
using namespace api::source;
namespace PIPELINE {

SolARPluginPipelineManager::SolARPluginPipelineManager() : m_pipeline( nullptr )
{
    LOG_INFO("Pipeline Manager Constructor");
}

SolARPluginPipelineManager::~SolARPluginPipelineManager()
{
    xpcf::getComponentManagerInstance()->clear();
}

bool SolARPluginPipelineManager::init( const std::string& conf_path)
{
#if NDEBUG
    boost::log::core::get()->set_logging_enabled(false);
#endif

    LOG_ADD_LOG_TO_CONSOLE();

    LOG_INFO("Start PipelineManager::init")
    LOG_FLUSH
    SRef<xpcf::IComponentManager> xpcfComponentManager = xpcf::getComponentManagerInstance();
    bool load_ok = false;
    LOG_INFO("conf_path : {}", conf_path.c_str())
    try{
            if (xpcfComponentManager->load(conf_path.c_str()) == org::bcom::xpcf::_SUCCESS)
                load_ok = true;
    }
    catch (const std::exception& exception)
    {
        std::cout << exception.what() << std::endl;
        return false;
    }

    if (!load_ok)
        return false;

    m_pipeline = xpcfComponentManager->resolve<IPoseEstimationPipeline>();
    LOG_INFO("Pipeline Component has been created")

    if (m_pipeline == nullptr)
        return false;

    return (m_pipeline->init()== FrameworkReturnCode::_SUCCESS);

}

SolAR::datastructure::CameraParameters SolARPluginPipelineManager::getCameraParameters()
{
    return m_pipeline->getCameraParameters();
}

PIPELINEMANAGER_RETURNCODE SolARPluginPipelineManager::loadSourceImage(void* sourceTextureHandle, int width, int height)
{
    if (m_pipeline == nullptr)
        return PIPELINEMANAGER_RETURNCODE::_ERROR;

    SourceReturnCode returnCode = m_pipeline->loadSourceImage(sourceTextureHandle,width,height);
    if (returnCode == SourceReturnCode::_ERROR)
        return PIPELINEMANAGER_RETURNCODE::_ERROR;

    return PIPELINEMANAGER_RETURNCODE::_NEW_IMAGE;
}

bool SolARPluginPipelineManager::start(void* textureHandle)
{
    if( m_pipeline == nullptr )
         return false;

    return (m_pipeline->start(textureHandle) == FrameworkReturnCode::_SUCCESS);	
}

PIPELINEMANAGER_RETURNCODE SolARPluginPipelineManager::udpate(Transform3Df& pose)
{
    if (m_pipeline == nullptr)
        return PIPELINEMANAGER_RETURNCODE::_ERROR;

    SinkReturnCode returnCode = m_pipeline->update(pose);
    if (returnCode == SinkReturnCode::_ERROR)
        return PIPELINEMANAGER_RETURNCODE::_ERROR;
    if (returnCode == SinkReturnCode::_NEW_POSE)
        return PIPELINEMANAGER_RETURNCODE::_NEW_POSE;
    if (returnCode == SinkReturnCode::_NEW_POSE_AND_IMAGE)
        return PIPELINEMANAGER_RETURNCODE::_NEW_POSE_AND_IMAGE;
    if (returnCode == SinkReturnCode::_NEW_IMAGE)
        return PIPELINEMANAGER_RETURNCODE::_NEW_IMAGE;

    return PIPELINEMANAGER_RETURNCODE::_NOTHING;
}

void SolARPluginPipelineManager::udpatePose(void* pose)
{
     if (m_pipeline == nullptr)
        return ;

    Transform3Df solarPose;
    SinkReturnCode returnCode = m_pipeline->update(solarPose);
    if (returnCode == SinkReturnCode::_ERROR)
        return ;

    if ((returnCode & SinkReturnCode::_NEW_POSE) != SinkReturnCode::_NOTHING)
    {
        std::cout <<"  new pose \n";
        float* tmp2=solarPose.matrix().data();
        float* tmp1=(float*)pose;
        for(int i=0;i<16;i++)
            tmp1[i]=tmp2[i];

        return ;
    }

    // std::cout <<" no new pose \n";
    // return false if the pose has not been updated
    // TODO : return a more explicit returnCode to make the difference beteen "Error" and "Pose not updated"
    return ;
}

bool SolARPluginPipelineManager::stop()
{
    if (m_pipeline != nullptr)
    {
        return (m_pipeline->stop() == FrameworkReturnCode::_SUCCESS);
    }
    return true;
}

}
}
