mkdir "%BCOMDEVROOT%/bcomBuild/SolARPipelineManager/0.1.0/CSharp"
del /s "%BCOMDEVROOT%/bcomBuild/SolARPipelineManager/0.1.0/CSharp/*.*"
swig -csharp -namespace SolAR -c++ -fcompact -small -O -Iswig -outdir "%BCOMDEVROOT%/bcomBuild/SolARPipelineManager/0.1.0/CSharp" -o "src/PipelineManager_wrap.cpp" interfaces/SolARPipelineManager.i