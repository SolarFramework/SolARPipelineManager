#pragma once

#include "Unity/IUnityGraphics.h"

extern "C"
{
	static void UNITY_INTERFACE_API OnGraphicsDeviceEvent( UnityGfxDeviceEventType eventType );
	void UNITY_INTERFACE_EXPORT UNITY_INTERFACE_API UnityPluginLoad( IUnityInterfaces* unityInterfaces );
	void UNITY_INTERFACE_EXPORT UNITY_INTERFACE_API UnityPluginUnload();
}