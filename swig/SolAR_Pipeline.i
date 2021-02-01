%module SolARPipelineManager
%{
#include "SolARPluginPipelineManager.h"
#include "PipelineManagerAPI.h"
%}

%include "Swig.i"

%import (module="SolAR.Datastructure") "SolAR_Datastructure.i"

%typemap(csimports) SWIGTYPE
%{
    using SolAR.Datastructure;
%}

///

%template(StringVector) std::vector<std::string>;

//Use IntPtr for void* type
%typemap( cstype ) void* "System.IntPtr"
%typemap( csin ) void* %{ $csinput %}
%typemap( imtype ) void* "System.IntPtr"

///

//%ignore IPipeline;

%include "PipelineManagerAPI.h"

%typemap(csclassmodifiers) SolAR::PIPELINE::SolARPluginPipelineManager "public partial class"
%include "SolARPluginPipelineManager.h"
