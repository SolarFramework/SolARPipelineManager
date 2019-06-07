#include "PipelineManager.h"
#include "xpcf/core/uuid.h"
#include "xpcf/core/Exception.h"
#include "core/Log.h"
#include <iostream>


namespace SolAR {
using namespace datastructure;
using namespace api::pipeline;
using namespace api::sink;
using namespace api::source;
namespace PIPELINE {

PipelineManager::PipelineManager() : m_pipeline( nullptr )
{
	LOG_INFO("Pipeline Manager Constructor");
}

PipelineManager::~PipelineManager()
{
	xpcf::getComponentManagerInstance()->clear();
}

bool PipelineManager::init( const std::string& conf_path, const std::string& pipelineUUID)
{
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

    m_pipeline = xpcfComponentManager->createComponent<IPipeline>(xpcf::toUUID(pipelineUUID))->bindTo<api::pipeline::IPipeline>();
    LOG_INFO("Pipeline Component has been created")

    if (m_pipeline == nullptr)
        return false;

    return (m_pipeline->init(xpcfComponentManager)== FrameworkReturnCode::_SUCCESS);

}

<<<<<<< HEAD:src/SolARPluginPipelineManager.cpp
//SolARPluginPipelineManager::CamParams SolARPluginPipelineManager::getCameraParameters()
CamCalibration SolARPluginPipelineManager::getCameraParameters()
=======
PipelineManager::CamParams PipelineManager::getCameraParameters()
>>>>>>> develop:src/PipelineManager.cpp
{
    /*CameraParameters cameraParameters =  m_pipeline->getCameraParameters();
    CamParams camParams;
    camParams.width = cameraParameters.width;
    camParams.height = cameraParameters.height;
    camParams.focalX = cameraParameters.focalX;
    camParams.focalY = cameraParameters.focalY;
    camParams.centerX = cameraParameters.centerX;
    camParams.centerY = cameraParameters.centerY;

    return camParams;*/
	return m_pipeline->getCameraParameters();
}

PIPELINEMANAGER_RETURNCODE PipelineManager::loadSourceImage(void* sourceTextureHandle, int width, int height)
{
    if (m_pipeline == nullptr)
        return PIPELINEMANAGER_RETURNCODE::_ERROR;

    SourceReturnCode returnCode = m_pipeline->loadSourceImage(sourceTextureHandle,width,height);
    if (returnCode == SourceReturnCode::_ERROR)
        return PIPELINEMANAGER_RETURNCODE::_ERROR;

    return PIPELINEMANAGER_RETURNCODE::_NEW_IMAGE;
}

bool PipelineManager::start(void* textureHandle)
{
    if( m_pipeline == nullptr )
         return false;

    return (m_pipeline->start(textureHandle) == FrameworkReturnCode::_SUCCESS);	
}

<<<<<<< HEAD:src/SolARPluginPipelineManager.cpp
PIPELINEMANAGER_RETURNCODE SolARPluginPipelineManager::udpate(Transform3Df& pose)
{
	if (m_pipeline == nullptr)
        return PIPELINEMANAGER_RETURNCODE::_ERROR;

    SinkReturnCode returnCode = m_pipeline->update(pose);
    if (returnCode == SinkReturnCode::_ERROR)
        return PIPELINEMANAGER_RETURNCODE::_ERROR;

    if ((returnCode & SinkReturnCode::_NEW_POSE) != SinkReturnCode::_NOTHING)
    {
        return PIPELINEMANAGER_RETURNCODE::_NEW_POSE_AND_IMAGE;
    }
	
    return PIPELINEMANAGER_RETURNCODE::_NEW_IMAGE;

}

/*PIPELINEMANAGER_RETURNCODE SolARPluginPipelineManager::udpate(Transform3Df& pose)
=======
PIPELINEMANAGER_RETURNCODE PipelineManager::udpate(PipelineManager::Pose& pose)
>>>>>>> develop:src/PipelineManager.cpp
{
    if (m_pipeline == nullptr)
        return PIPELINEMANAGER_RETURNCODE::_ERROR;

    Transform3Df solarPose;
    SinkReturnCode returnCode = m_pipeline->update(solarPose);
    if (returnCode == SinkReturnCode::_ERROR)
        return PIPELINEMANAGER_RETURNCODE::_ERROR;

    if ((returnCode & SinkReturnCode::_NEW_POSE) != SinkReturnCode::_NOTHING)
    {
        pose.T[0] = solarPose.translation()(0);
        pose.T[1] = solarPose.translation()(1);
        pose.T[2] = solarPose.translation()(2);

        pose.R[0][0] = solarPose.rotation()(0,0);
        pose.R[0][1] = solarPose.rotation()(0,1);
        pose.R[0][2] = solarPose.rotation()(0,2);
        pose.R[1][0] = solarPose.rotation()(1,0);
        pose.R[1][1] = solarPose.rotation()(1,1);
        pose.R[1][2] = solarPose.rotation()(1,2);
        pose.R[2][0] = solarPose.rotation()(2,0);
        pose.R[2][1] = solarPose.rotation()(2,1);
        pose.R[2][2] = solarPose.rotation()(2,2);
        return PIPELINEMANAGER_RETURNCODE::_NEW_POSE_AND_IMAGE;
    }

//    std::cout <<" no new pose \n";
    // return false if the pose has not been updated
    // TODO : return a more explicit returnCode to make the difference beteen "Error" and "Pose not updated"
    return PIPELINEMANAGER_RETURNCODE::_NEW_IMAGE;

}*/

void PipelineManager::udpatePose(void* pose)
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

//    std::cout <<" no new pose \n";
    // return false if the pose has not been updated
    // TODO : return a more explicit returnCode to make the difference beteen "Error" and "Pose not updated"
    return ;
}

bool PipelineManager::stop()
{
    if (m_pipeline != nullptr)
    {
        return (m_pipeline->stop() == FrameworkReturnCode::_SUCCESS);
    }
    return true;
}

}
}

