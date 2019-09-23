/**
 * @copyright Copyright (c) 2017 B-com http://www.b-com.com/
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef SolARPluginPipelineManager_H
#define SolARPluginPipelineManager_H

#include "PipelineManagerAPI.h"
#include "api/pipeline/IPipeline.h"
#include "datastructure/MathDefinitions.h"
#include "datastructure/CameraDefinitions.h"
#include <string>

namespace SolAR {
using namespace datastructure;
namespace PIPELINE {

enum PIPELINEMANAGER_RETURNCODE {

    _NOT_IMPLEMENTED= -2,
    _ERROR= -1,
    _NOTHING = 0,
    _NEW_IMAGE= 0x01,
    _NEW_POSE= 0x02,
    _NEW_POSE_AND_IMAGE = 0x03,
};

class PIPELINEMANAGER_INTERFACE_EXPORT SolARPluginPipelineManager
{
public:
    SolARPluginPipelineManager();
    ~SolARPluginPipelineManager();

    bool init( const std::string& conf_path, const std::string& pipelineUUID);
	
    SolAR::datastructure::CameraParameters getCameraParameters();
	
    bool start(void* textureHandle);

    PIPELINEMANAGER_RETURNCODE udpate(Transform3Df& pose);

    PIPELINEMANAGER_RETURNCODE loadSourceImage(void* sourceTextureHandle, int width, int height);

    void udpatePose(void* pose);

    bool stop();

private:
    SRef<api::pipeline::IPipeline> m_pipeline;

};

}
}

#endif //SOLARPIPELINEMANAGER_H


