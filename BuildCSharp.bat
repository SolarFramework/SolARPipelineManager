SET compiler=win-cl-14.1
SET SOLAR_VERSION=0.9.0
SET XPCF_VERSION=2.4.0
SET SCURRENTDIR=%cd%

mkdir "%REMAKEN_PKG_ROOT%/packages/SolARBuild/%compiler%/SolARPipelineManager/%SOLAR_VERSION%/csharp"
del /s /q "%REMAKEN_PKG_ROOT%\packages\SolARBuild\%compiler%\SolARPipelineManager\%SOLAR_VERSION%\csharp\*.*"

swig -csharp -namespace SolAR -c++ -fcompact -O -Iswig -I%REMAKEN_PKG_ROOT%/packages/%compiler%/xpcf/%XPCF_VERSION%/interfaces -I%REMAKEN_PKG_ROOT%/packages/SolARBuild/%compiler%/SolARFramework/%SOLAR_VERSION%/interfaces -DXPCF_USE_BOOST -DSWIG_CSHARP_NO_WSTRING_HELPER -outdir "%REMAKEN_PKG_ROOT%/packages/SolARBuild/%compiler%/SolARPipelineManager/%SOLAR_VERSION%/csharp" -o "src/SolARPluginPipelineManager_wrap.cpp" interfaces/SolARPipelineManager.i

@echo off
:: MonoPInvokeCallback should be added to static method generated by SWIG while using IL2CPP
echo ---------------- Edit for Android support ----------------------
echo DIR : %REMAKEN_PKG_ROOT%/packages/SolARBuild/%compiler%/SolARPipelineManager/%SOLAR_VERSION%/csharp
cd /D %REMAKEN_PKG_ROOT%/packages/SolARBuild/%compiler%/SolARPipelineManager/%SOLAR_VERSION%/csharp
powershell -command "Get-ChildItem -Path .\ -Filter *PINVOKE.cs -Recurse -File -Name | ForEach-Object {echo """# $_""";[System.IO.File]::WriteAllText($_,([System.IO.File]::ReadAllText($_) -replace 'static void SetPending','[AOT.MonoPInvokeCallback(typeof(ExceptionDelegate))] static void SetPending' -replace 'static string CreateString','[AOT.MonoPInvokeCallback(typeof(SWIGStringDelegate))] static string CreateString'))}"
cd /D %SCURRENTDIR%

echo ------------------ sub Bat file completed -----------------------------
