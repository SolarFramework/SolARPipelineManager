# SolARPipelineManager

To build the SolARPipelineManager, first run the BuildCSharp.bat (or BuildSCharp.sh on linux). This script will generate first a PipelineManager_wrap.cpp file in yrou src folder, and a set of csharp files in your CSharp/SolAR/PipelineManager folder.

Then build your SolARPipelineManager project by using QTCreator or Visual.

Finally, move your csharp files and the new binary of the PipelineManager where you want to use the csharp wrapper (e.g. in the Assets folder of your Unity project, the binary under a Plugins folder)