/**
 * @copyright Copyright (c) 2017 B-com http://www.b-com.com/
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "ConsoleRedirector.h"
#include "core/Log.h"
#include <windows.h>
#include <iostream>
/*
#include <boost/log/core.hpp>
#include <boost/log/trivial.hpp>
#include <boost/log/expressions.hpp>
#include <boost/log/utility/setup/file.hpp>
*/
extern "C"
{

	void RedirectIOToConsole(bool createConsole)
	{
		if (createConsole)
		{
			CONSOLE_SCREEN_BUFFER_INFO coninfo;

			// allocate a console for this app
			AllocConsole();

			// set the screen buffer to be big enough to let us scroll text
			GetConsoleScreenBufferInfo(GetStdHandle(STD_OUTPUT_HANDLE), &coninfo);

			coninfo.dwSize.Y = 500;

			SetConsoleScreenBufferSize(GetStdHandle(STD_OUTPUT_HANDLE), coninfo.dwSize);

			freopen("CONIN$", "r", stdin);
			freopen("CONOUT$", "w", stdout);
			freopen("CONOUT$", "w", stderr);

			std::wcout.clear();
			std::cout.clear();
			std::wcerr.clear();
			std::cerr.clear();
			std::wcin.clear();
			std::cin.clear();

			// make cout, wcout, cin, wcin, wcerr, cerr, wclog and clog point to console as well
			std::ios::sync_with_stdio();
		}
		else
		{
			FreeConsole();
		}
	}
/*
	void LogInFile(const char* log_File_Path, const bool rewind)
	{
		std::string xpcfLogFile = log_File_Path;
		size_t pointPosition = xpcfLogFile.find_last_of(".");
		xpcfLogFile.insert(pointPosition, "_xpcf");
		boost::log::add_file_log(xpcfLogFile);
		boost::log::core::get()->set_filter
		(
			boost::log::trivial::severity >= boost::log::trivial::info
		);
		if (rewind)
		{
			LOG_ADD_LOG_TO_FILE(log_File_Path, "r")
		}
		else
		{
			LOG_ADD_LOG_TO_FILE(log_File_Path)
		}
		LOG_INFO("Start a new pipeline")
		LOG_FLUSH
	}
*/
}
