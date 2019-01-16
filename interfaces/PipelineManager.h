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

#ifndef SOLARPIPELINEMANAGER_H
#define SOLARPIPELINEMANAGER_H

#include "PipelineManagerAPI.h"
#include "api/pipeline/IPipeline.h"
#include <string>

namespace SolAR {
namespace PIPELINE {
class PIPELINEMANAGER_INTERFACE_EXPORT PipelineManager
{
public:

    struct Pose
	{
        float T[3] = {0.0f, 0.0f, 0.0f};
        float R[3][3] = {{1.0f, 0.0f, 0.0f},{0.0f, 1.0f, 0.0f},{0.0f, 0.0f, 1.0f}};

		void reset();
		//This is needed for the SWIG C# interface
		float translation( int i ) { return T[i]; }
		float rotation( int i, int j ) { return R[i][j]; }
	};

    struct CamParams
    {
        int width = 0;
        int height = 0;
        float focalX = 0.0f;
        float focalY = 0.0f;
		int centerx = 320;
		int centery = 240;
    };

public:
    PipelineManager();
    ~PipelineManager();

    bool init( const std::string& conf_path, const std::string& pipelineUUID);

    CamParams getCameraParameters();

    bool start(void* textureHandle);

    bool udpate(Pose& pose);

	void updateFrameDataOGL(int eventID);

    bool stop();

private:
    SRef<api::pipeline::IPipeline> m_pipeline;

};

}
}

#endif //SOLARPIPELINEMANAGER_H


