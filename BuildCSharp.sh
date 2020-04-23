COMPILER="linux-gcc"
SOLAR_VERSION=0.8.0
XPCF_VERSION=2.3.4

mkdir -p $HOME/.remaken/packages/SolARBuild/$COMPILER/SolARPipelineManager/$SOLAR_VERSION/csharp
rm -r $HOME/.remaken/packages/SolARBuild/$COMPILER/SolARPipelineManager/$SOLAR_VERSION/csharp/*.*

swig -csharp -namespace SolAR -c++ -fcompact -small -O -Iswig -I$HOME/.remaken/packages/$COMPILER/xpcf/$XPCF_VERSION/interfaces -I$HOME/.remaken/packages/SolARBuild/$COMPILER/SolARFramework/$SOLAR_VERSION/interfaces -DXPCF_USE_BOOST -DSWIG_CSHARP_NO_WSTRING_HELPER -outdir "$HOME/.remaken/packages/SolARBuild/$COMPILER/SolARPipelineManager/$SOLAR_VERSION/csharp" -o "src/SolARPluginPipelineManager_wrap.cpp" interfaces/SolARPipelineManager.i

echo off
echo ------------------ sub Bat file completed -----------------------------
