SET compiler=win-cl-14.1

mkdir "%REMAKEN_PKG_ROOT%/packages/SolARBuild/%compiler%/SolARPipelineManager/0.7.0/csharp"
del /s "%REMAKEN_PKG_ROOT%\packages\SolARBuild\%compiler%\SolARPipelineManager\0.7.0\csharp\*.*"

swig -csharp -namespace SolAR -c++ -fcompact -small -O -Iswig -I%REMAKEN_PKG_ROOT%/packages/%compiler%/xpcf/2.3.4/interfaces -I%REMAKEN_PKG_ROOT%/packages/SolARBuild/%compiler%/SolARFramework/0.7.0/interfaces -DXPCF_USE_BOOST -DSWIG_CSHARP_NO_WSTRING_HELPER -outdir "%REMAKEN_PKG_ROOT%/packages/SolARBuild/%compiler%/SolARPipelineManager/0.7.0/csharp" -o "src/SolARPluginPipelineManager_wrap.cpp" interfaces/SolARPipelineManager.i

echo off
echo ------------------ sub Bat file completed -----------------------------
