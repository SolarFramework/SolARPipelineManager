HEADERS += \
    interfaces/PipelineManagerAPI.h \
    interfaces/SolARPluginPipelineManager.h

SOURCES += \
    src/swig/SolAR_Core_wrap.cxx \
    src/swig/SolAR_Datastructure_wrap.cxx \
    src/swig/SolARPipelineManager_wrap.cxx \
    src/swig/XPCF_Core_wrap.cxx \
    src/SolARPluginPipelineManager.cpp
