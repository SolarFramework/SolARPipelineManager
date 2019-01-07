#ifndef CONSOLEREDIRECTOR_H
#define CONSOLEREDIRECTOR_H

#include "PipelineManagerAPI.h"

extern "C"
{
    void PIPELINEMANAGER_INTERFACE_EXPORT PIPELINEMANAGER_INTERFACE_API RedirectIOToConsole( bool createConsole );
//    void PIPELINEMANAGER_INTERFACE_EXPORT PIPELINEMANAGER_INTERFACE_API LogInFile( const char* log_File_Path, const bool rewind = true);
}


#endif // CONSOLEREDIRECTOR_H
