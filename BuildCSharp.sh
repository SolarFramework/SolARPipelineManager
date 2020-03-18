COMPILER="linux-gcc"

mkdir -p "$HOME/.remaken/packages/SolARBuild/$COMPILER/SolARPipelineManager/0.7.0/csharp"
rm -r "$HOME/.remaken/packages/SolARBuild/$COMPILER/SolARPipelineManager/0.7.0/csharp/*.*"

swig -csharp -namespace SolAR -c++ -fcompact -small -O -Iswig -I$HOME/.remaken/packages/$COMPILER/xpcf/2.3.3/interfaces -I$HOME/.remaken/packages/SolARBuild/$COMPILER/SolARFramework/0.7.0/interfaces -DSWIG_CSHARP_NO_WSTRING_HELPER -outdir "$HOME/.remaken/packages/SolARBuild/$COMPILER/SolARPipelineManager/0.7.0/csharp" -o "src/SolARPluginPipelineManager_wrap.cpp" interfaces/SolARPipelineManager.i

echo off
echo ------------------ sub Bat file completed -----------------------------
