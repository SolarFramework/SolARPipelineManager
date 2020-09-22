# SolARPipelineManager

[![License](https://img.shields.io/github/license/SolARFramework/SolARPipelineManager?style=flat-square&label=License)](https://www.apache.org/licenses/LICENSE-2.0)

The SolAR **PipelineManager** is currently used to run SolAR pipelines in the Unity environment. But more generally, its goal is to manage pipelines in different environments, Unity is one of them. It does not offer access to the whole SolAR API, but just to the API allowing to load and initialize an existing pipeline implementing the IPipeline interface, to start and stop it, to optionally feed it with images, and to get access to the pose of the camera estimated by the pipeline.

As Unity only supports the C# language, the Pipeline Manager :exclamation: must first use the **[SolAR Wrapper](https://github.com/SolarFramework/SwigWrapper/)** :exclamation: to wrap the C++ code of a pipeline in C#. Then, this manager will take the right interfaces to make this pipeline compatible with the Unity environment.

## How to build

* Build [SolAR Wrapper](https://github.com/SolarFramework/SwigWrapper/)

* Run the `./BuildCSharp.bat`. This script will generate first a `./src/SolARPluginPipelineManager_wrap.cpp` file in yrou src, and a set of csharp files in your `$REMAKEN_PKG_ROOT/packages/SolARBuild/win-cl-14.1/SolARPipelineManager/x.x.x/csharp`.

* Then open `SolARPipelineManager.pro` and build it

* Finally, move your csharp files and the new binary of the PipelineManager where you want to use the csharp wrapper (e.g. in the Assets folder of your Unity project, the binary under a Plugins folder).   
:information_source: **This is automatically done by running `Install.bat` / `Bundle.bat` script of [SolARUnityPlugin](https://github.com/SolarFramework/SolARUnityPlugin).**