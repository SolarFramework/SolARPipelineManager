mkdir "%BCOMDEVROOT%/bcomBuild/SolARPipelineManager/0.5.2/CSharp"
del /s "%BCOMDEVROOT%\bcomBuild\SolARPipelineManager\0.5.2\CSharp\*.*"
swig -csharp -namespace SolAR -c++ -fcompact -small -O -Iswig -I%BCOMDEVROOT%/thirdParties/xpcf/2.1.0/interfaces -I%BCOMDEVROOT%/bcomBuild/SolARFramework/0.5.2/interfaces -DSWIG_CSHARP_NO_WSTRING_HELPER -outdir "%BCOMDEVROOT%/bcomBuild/SolARPipelineManager/0.5.2/CSharp" -o "src/PipelineManager_wrap.cpp" interfaces/SolARPipelineManager.i
