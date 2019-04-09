mkdir "%BCOMDEVROOT%/bcomBuild/SolARPipelineManager/0.5.2/CSharp"
del /s "%BCOMDEVROOT%\bcomBuild\SolARPipelineManager\0.5.2\CSharp\*.*"
swig -csharp -namespace SolAR -c++ -fcompact -small -O -Iswig -outdir "%BCOMDEVROOT%/bcomBuild/SolARPipelineManager/0.5.2/CSharp" -o "src/PipelineManager_wrap.cpp" interfaces/SolARPipelineManager.i