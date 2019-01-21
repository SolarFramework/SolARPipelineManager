cmake_minimum_required(VERSION 3.7.2)

##################################################
set (VERSION_NUMBER "0.1.0")
project("SolARPipelineManager")
set (SOURCES
	src/PipelineManager.cpp
	src/PipelineManager_wrap.cpp
	src/ConsoleRedirector.cpp
	src/Unity/UnityPluginInterface.cpp
)

set (HEADERS
	interfaces/PipelineManager.h
	interfaces/PipelineManagerAPI.h
	interfaces/ConsoleRedirector.h
	interfaces/Unity/IUnityGraphics.h
	interfaces/Unity/IUnityInterface.h
	interfaces/Unity/UnityPluginInterface.h
)


#install (FILES "${CMAKE_CURRENT_SOURCE_DIR}/xpcf_SolARPipelineManager_registry.xml" DESTINATION $ENV{BCOMDEVROOT}/.xpcf/SolAR/	)

##################################################

# various macros
include("$ENV{BCOMDEVROOT}/bcomBuild/SolARFramework/solarmacros.cmake")
# config setup
setup()
# process packagedependencies.txt
processPackagedependencies()
# define targets (type library)
defineTargets("library" "")
