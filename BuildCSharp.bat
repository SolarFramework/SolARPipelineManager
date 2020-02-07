SET compiler=win-cl-14.1

mkdir "%REMAKENROOT%/packages/SolARBuild/%compiler%/SolARPipelineManager/0.7.0/CSharp"
del /s "%REMAKENROOT%\packages\SolARBuild\%compiler%\SolARPipelineManager\0.7.0\CSharp\*.*"

swig -csharp -namespace SolAR -c++ -fcompact -small -O -Iswig -I%REMAKENROOT%/packages/%compiler%/xpcf/2.3.0/interfaces -I%REMAKENROOT%/packages/SolARBuild/%compiler%/SolARFramework/0.7.0/interfaces -DSWIG_CSHARP_NO_WSTRING_HELPER -outdir "%REMAKENROOT%/packages/SolARBuild/%compiler%/SolARPipelineManager/0.7.0/CSharp" -o "src/SolARPluginPipelineManager_wrap.cpp" interfaces/SolARPipelineManager.i

echo off
echo ------------------ sub Bat file completed -----------------------------
