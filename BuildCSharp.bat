SET compiler=win-cl-14.1
SET SOLAR_VERSION=0.8.1
SET XPCF_VERSION=2.3.4

mkdir "%REMAKEN_PKG_ROOT%/packages/SolARBuild/%compiler%/SolARPipelineManager/%SOLAR_VERSION%/csharp"
del /s "%REMAKEN_PKG_ROOT%\packages\SolARBuild\%compiler%\SolARPipelineManager\%SOLAR_VERSION%\csharp\*.*"

swig -csharp -namespace SolAR -c++ -fcompact -small -O -Iswig -I%REMAKEN_PKG_ROOT%/packages/%compiler%/xpcf/%XPCF_VERSION%/interfaces -I%REMAKEN_PKG_ROOT%/packages/SolARBuild/%compiler%/SolARFramework/%SOLAR_VERSION%/interfaces -DXPCF_USE_BOOST -DSWIG_CSHARP_NO_WSTRING_HELPER -outdir "%REMAKEN_PKG_ROOT%/packages/SolARBuild/%compiler%/SolARPipelineManager/%SOLAR_VERSION%/csharp" -o "src/SolARPluginPipelineManager_wrap.cpp" interfaces/SolARPipelineManager.i

echo off
echo ------------------ sub Bat file completed -----------------------------
