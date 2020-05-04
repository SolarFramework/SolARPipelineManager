COMPILER="linux-gcc"
SOLAR_VERSION=0.8.0
XPCF_VERSION=2.3.4

CSharpFolder=$HOME/.remaken/packages/SolARBuild/$COMPILER/SolARPipelineManager/$SOLAR_VERSION/csharp

mkdir -p $CSharpFolder
if [ "$(ls -A $CSharpFolder)" ]; then
    echo "Suppress csharp interfaces in $CSharpFolder/"
    rm -r $CSharpFolder/*.*
fi

echo "Generate SolARPipelineManager csharp interfaces with SWIG"
swig -csharp -namespace SolAR -c++ -fcompact -small -O -Iswig -I$HOME/.remaken/packages/$COMPILER/xpcf/$XPCF_VERISON/interfaces -I$HOME/.remaken/packages/SolARBuild/$COMPILER/SolARFramework/$SOLAR_VERSION/interfaces -DXPCF_USE_BOOST -DSWIG_CSHARP_NO_WSTRING_HELPER -outdir "$CSharpFolder" -o "src/SolARPluginPipelineManager_wrap.cpp" interfaces/SolARPipelineManager.i

echo off
echo ------------------ sub Bat file completed -----------------------------
