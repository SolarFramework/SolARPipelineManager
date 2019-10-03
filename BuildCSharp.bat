mkdir "%REMAKENROOT%/SolARPipelineManager/0.6.0/CSharp"
del /s "%REMAKENROOT%\SolARPipelineManager\0.6.0\CSharp\*.*"

swig -csharp -namespace SolAR -c++ -fcompact -small -O -Iswig -I%REMAKENROOT%/xpcf/2.3.0/interfaces -I%REMAKENROOT%/SolARFramework/0.6.0/interfaces -DSWIG_CSHARP_NO_WSTRING_HELPER -outdir "%REMAKENROOT%/SolARPipelineManager/0.6.0/CSharp" -o "src/SolARPluginPipelineManager_wrap.cpp" interfaces/SolARPipelineManager.i

echo off
echo ------------------ sub Bat file completed -----------------------------
