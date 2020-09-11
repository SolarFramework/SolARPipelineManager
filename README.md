# SolARPipelineManager

[![License](https://img.shields.io/github/license/SolARFramework/SolARPipelineManager?style=flat-square&label=License)](https://www.apache.org/licenses/LICENSE-2.0)
[![Build Status](http://argo.ci.b-com.com/buildStatus/icon?job=SolAR-Modules%2FSolARPipelineManager%2Fmaster&style=flat-square&subject=Master)](http://argo.ci.b-com.com/job/SolAR-Modules/job/SolARPipelineManager/job/master/)
[![Build Status](http://argo.ci.b-com.com/buildStatus/icon?job=SolAR-Modules%2FSolARPipelineManager%2Fdevelop&style=flat-square&subject=Dev)](http://argo.ci.b-com.com/job/SolAR-Modules/job/SolARPipelineManager/job/develop/)

**SolARPipelineManager** able to run SolAR pipelines in the Unity environment. But more generally, its goal is to manage pipelines in different environments, Unity being one of them. It does not offer an access to the whole SolAR API, but just to the API allowing to load and initialize an existing pipeline implementing the IPipeline interface, to start and stop it, to optionally feed it with images, and to get access to the pose of the camera estimated by the pipeline.

As Unity only supports the C# language, the Pipeline Manager must first use the [SolAR Wrapper](https://github.com/SolarFramework/SwigWrapper/tree/master) to wrap the C++ code of a pipeline in C#. Then, this manager will take the right interfaces to make this pipeline compatible with the Unity environment.

## Build instruction

To build the SolARPipelineManager : 
* Run the `BuildCSharp.bat` (or `BuildSCharp.sh` on Linux). This script will generate first a *PipelineManager_wrap.cpp* file in your `./src` folder, and a set of csharp files in your `%REMAKEN_PKG_ROOT%/packages/SolARBuild/%compiler%/SolARPipelineManager/%SOLAR_VERSION%/csharp` folder.

Then build your SolARPipelineManager project by using QTCreator or Visual Studio.

Finally, move your csharp files and the new binary of the PipelineManager where you want to use the csharp wrapper (e.g. in the Assets folder of your Unity project, the binary under a Plugins folder)