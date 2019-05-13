%module SolARPipelineManager

%{
#include "SolARPluginPipelineManager.h"
#include "PipelineManagerAPI.h"
%}
%include "Swig.i"

%template(StringVector) std::vector<std::string>;

//Use IntPtr for void* type
%typemap( cstype ) void* "System.IntPtr"
%typemap( csin ) void* %{ $csinput %}
%typemap( imtype ) void* "System.IntPtr"

///// BEGIN ENUM /////
//For loading the enums used in the SolAR Extractors and Detectors
//Ignore the XPCF macro
#define XPCF_DECLARE_UUID(X) ;

//Do not generate wrappers for IPipeline
%ignore IPipeline;

%include "PipelineManagerAPI.h"
%include "SolARPluginPipelineManager.h"
