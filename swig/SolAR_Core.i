%module solar_core
%{
#include "core/Log.h"
#include "core/Messages.h"
#include "core/SerializationDefinitions.h"
#include "core/SolARFramework.h"
#include "core/SolARFrameworkDefinitions.h"
%}

%include "Swig.i"

%typemap(csimports) SWIGTYPE
%{
%}

///

%include "core/Messages.h"

%ignore SolAR::getSolARFrameworkVersion(); //TODO Missing implementation
%include "core/SolARFramework.h"

%include "core/SolARFrameworkDefinitions.h"

//#include "SolARFrameworkDefinitions.h"
%ignore SolAR::Log::logger(); // spdlog::logger
%ignore SolAR::Log::add_sink_file( std::vector<const char*>& args ); // const char* -> IntPtr or string
%include "core/Log.h"

//#include <core/SolARFrameworkDefinitions.h>
%include "core/SerializationDefinitions.h"
#undef DECLARESERIALIZE
#define DECLARESERIALIZE(T) ;
#undef IMPLEMENTSERIALIZE
#define IMPLEMENTSERIALIZE(T) ;
#undef BOOST_SERIALIZATION_ASSUME_ABSTRACT
#define BOOST_SERIALIZATION_ASSUME_ABSTRACT(T) ;