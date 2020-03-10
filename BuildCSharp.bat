SET compiler=win-cl-14.1

mkdir "%REMAKEN_PKG_ROOT%/packages/SolARBuild/%compiler%/SolARPipelineManager/0.7.0/CSharp"
del /s "%REMAKEN_PKG_ROOT%\packages\SolARBuild\%compiler%\SolARPipelineManager\0.7.0\CSharp\*.*"

swig -csharp -namespace SolAR -c++ -fcompact -small -O -Iswig -I%REMAKEN_PKG_ROOT%/packages/%compiler%/xpcf/2.3.1/interfaces -I%REMAKEN_PKG_ROOT%/packages/SolARBuild/%compiler%/SolARFramework/0.7.0/interfaces -DSWIG_CSHARP_NO_WSTRING_HELPER -outdir "%REMAKEN_PKG_ROOT%/packages/SolARBuild/%compiler%/SolARPipelineManager/0.7.0/CSharp" -o "src/SolARPluginPipelineManager_wrap.cpp" interfaces/SolARPipelineManager.i

echo off
echo ------------------ sub Bat file completed -----------------------------
