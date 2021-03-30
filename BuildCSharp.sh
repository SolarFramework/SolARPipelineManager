COMPILER="linux-gcc"
SOLAR_VERSION=0.9.4
XPCF_VERSION=2.5.0

CSharpFolder=$HOME/.remaken/packages/SolARBuild/$COMPILER/SolARPipelineManager/$SOLAR_VERSION/csharp

mkdir -p $CSharpFolder
if [ "$(ls -A $CSharpFolder)" ]; then
    echo "Suppress csharp interfaces in $CSharpFolder/"
    rm -r $CSharpFolder/*.*
fi

echo "Generate SolARPipelineManager csharp interfaces with SWIG"
echo swig -csharp -namespace SolAR -c++ -fcompact -O -Iswig -I$HOME/.remaken/packages/$COMPILER/xpcf/$XPCF_VERSION/interfaces -I$HOME/.remaken/packages/SolARBuild/$COMPILER/SolARFramework/$SOLAR_VERSION/interfaces -DXPCF_USE_BOOST -DSWIG_CSHARP_NO_WSTRING_HELPER -outdir "$CSharpFolder" -o "src/SolARPluginPipelineManager_wrap.cpp" interfaces/SolARPipelineManager.i
swig -csharp -namespace SolAR -c++ -fcompact -small -O -Iswig -I$HOME/.remaken/packages/$COMPILER/xpcf/$XPCF_VERSION/interfaces -I$HOME/.remaken/packages/SolARBuild/$COMPILER/SolARFramework/$SOLAR_VERSION/interfaces -DXPCF_USE_BOOST -DSWIG_CSHARP_NO_WSTRING_HELPER -outdir "$CSharpFolder" -o "src/SolARPluginPipelineManager_wrap.cpp" interfaces/SolARPipelineManager.i

echo off
echo ------------------ sub Bat file completed -----------------------------


files=`find $CSharpFolder -name "*PINVOKE.cs"`
#MonoPInvokeCallback should be added to static method generated by SWIG while using IL2CPP
echo "########## Edit for Android support"
for file in $files
do
    echo "#" $file
    sed -i -e 's/static void SetPending/[AOT.MonoPInvokeCallback(typeof(ExceptionDelegate))]\n\t\tstatic void SetPending/g' $file
    sed -i -e 's/static string CreateString(string cString)/[AOT.MonoPInvokeCallback(typeof(SWIGStringDelegate))]\n\t\tstatic string CreateString(string cString)/g' $file
done	