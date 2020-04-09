SET compiler=win-cl-14.1
SET solar_version=0.7.0
SET xpcf_version=2.3.4

mkdir "%REMAKEN_PKG_ROOT%/packages/SolARBuild/%compiler%/SolARPipelineManager/%solar_version%/csharp"
del /s "%REMAKEN_PKG_ROOT%\packages\SolARBuild\%compiler%\SolARPipelineManager\%solar_version%\csharp\*.*"

swig -csharp -namespace SolAR -c++ -fcompact -small -O -Iswig -I%REMAKEN_PKG_ROOT%/packages/%compiler%/xpcf/%xpcf_version%/interfaces -I%REMAKEN_PKG_ROOT%/packages/SolARBuild/%compiler%/SolARFramework/%solar_version%/interfaces -DXPCF_USE_BOOST -DSWIG_CSHARP_NO_WSTRING_HELPER -outdir "%REMAKEN_PKG_ROOT%/packages/SolARBuild/%compiler%/SolARPipelineManager/%solar_version%/csharp" -o "src/SolARPluginPipelineManager_wrap.cpp" interfaces/SolARPipelineManager.i

echo off
echo ------------------ sub Bat file completed -----------------------------
