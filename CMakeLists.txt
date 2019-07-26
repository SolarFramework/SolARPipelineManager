cmake_minimum_required(VERSION 3.7.2)

##################################################
set (VERSION_NUMBER "0.6.0")
project("SolARPipelineManager")
set (SOURCES
	src/SolARPluginPipelineManager_wrap.cpp
	src/SolARPluginPipelineManager.cpp
)

set (HEADERS
	interfaces/SolARPluginPipelineManager.h
	interfaces/PipelineManagerAPI.h
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
