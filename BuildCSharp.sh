COMPILER="linux-gcc"
SOLAR_VERSION=0.9.0
XPCF_VERSION=2.5.0
LANG="csharp"
OUT="src/swig"

if [ -n "$1" ]
then
	COMPILER="$1"
fi

if [ -n "$2" ]
then 
	SOLAR_VERSION="$2"
fi

if [ -n "$3" ]
then 
	XPCF_VERSION="$3"
fi

CSharpFolder=$HOME/.remaken/packages/SolARBuild/$COMPILER/SolARPipelineManager/$SOLAR_VERSION/csharp

mkdir -p $CSharpFolder
if [ "$(ls -A $CSharpFolder)" ]; then
    echo "Suppress csharp interfaces in $CSharpFolder/"
    rm -r $CSharpFolder/*.*
fi

echo "Generate SolARPipelineManager csharp interfaces with SWIG"

OPTIONS="-c++ -$LANG -fcompact -O -Iswig -Iswig/include -Iinterfaces -I$HOME/.remaken/packages/$COMPILER/xpcf/$XPCF_VERSION/interfaces -I$HOME/.remaken/packages/SolARBuild/$COMPILER/SolARFramework/$SOLAR_VERSION/interfaces -DXPCF_USE_BOOST -DSWIG_CSHARP_NO_WSTRING_HELPER"

for swigFile in swig/*.i ; do
   echo "########"
   echo "# $swigFile"
   file_name="${swigFile##*/}"
   file="${file_name%.*}"
   outdir="$LANG/${file/_//}"
   if [ ! -d "$outdir" ]; then
      mkdir -p "$outdir"
   fi
   if [ ! -d "$OUT" ]; then
      mkdir -p "$OUT"
   fi
   find "$outdir" -name "*.*" -type f -delete
   echo "swig $OPTIONS -namespace ${file/_/.} -outdir $outdir -o $OUT/${file}_wrap.cxx $swigFile"
   swig $OPTIONS -namespace ${file/_/.} -outdir $outdir -o $OUT/${file}_wrap.cxx $swigFile 
done


echo off
echo ------------------ sub Bat file completed -----------------------------


echo ------------------ Patch for Android support -----------------------------

files=`find $CSharpFolder -name "*PINVOKE.cs"`
#MonoPInvokeCallback should be added to static method generated by SWIG while using IL2CPP
echo "########## Edit for Android support"
for file in $files
do
    echo "#" $file
    sed -i -e 's/static void SetPending/[AOT.MonoPInvokeCallback(typeof(ExceptionDelegate))]\n\t\tstatic void SetPending/g' $file
    sed -i -e 's/static string CreateString(string cString)/[AOT.MonoPInvokeCallback(typeof(SWIGStringDelegate))]\n\t\tstatic string CreateString(string cString)/g' $file
done

echo ------------------ Patch completed -----------------------------

echo ------------------ Copy to REMAKEN_PKG_ROOT -----------------------------

export REMAKEN_PKG_ROOT=~/.remaken

OUT=$REMAKEN_PKG_ROOT/packages/SolARBuild/$COMPILER/SolARPipelineManager/$SOLAR_VERSION/$LANG
mkdir -p $OUT
if [ "$(ls -A $OUT)" ]; then
    echo "Suppress csharp interfaces in $OUT/"
    rm -r $OUT/*.*
fi
cp -R $LANG/* $OUT
echo ------------------ Copy completed  -----------------------------
