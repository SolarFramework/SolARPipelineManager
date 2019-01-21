#include "Unity/IUnityInterface.h"
#include "Unity/IUnityGraphics.h"

#include <windows.h>
#include <iostream>


static IUnityGraphics* g_Graphics;
static UnityGfxRenderer g_DeviceType;
static IUnityInterfaces* g_UnityInterfaces;

extern "C"
{
	void ProcessDeviceEvent(UnityGfxDeviceEventType type, IUnityInterfaces* interfaces)
	{
		//Nothing to do... yet
	}

	static void OnGraphicsDeviceEvent(UnityGfxDeviceEventType eventType)
	{
		// Create graphics API implementation upon initialization
		if (eventType == kUnityGfxDeviceEventInitialize)
		{
			g_DeviceType = g_Graphics->GetRenderer();
		}

		// Let the implementation process the device related events
		if (g_DeviceType != kUnityGfxRendererNull)
		{
			ProcessDeviceEvent(eventType, g_UnityInterfaces);
		}

		// Cleanup graphics API implementation upon shutdown
		if (eventType == kUnityGfxDeviceEventShutdown)
		{
			g_DeviceType = kUnityGfxRendererNull;
		}
	}

	void UnityPluginLoad(IUnityInterfaces* unityInterfaces)
	{
		g_UnityInterfaces = unityInterfaces;
		g_Graphics = g_UnityInterfaces->Get<IUnityGraphics>();
		g_Graphics->RegisterDeviceEventCallback(OnGraphicsDeviceEvent);

		// Run OnGraphicsDeviceEvent(initialize) manually on plugin load
		OnGraphicsDeviceEvent(kUnityGfxDeviceEventInitialize);
	}

	void UnityPluginUnload()
	{
		g_Graphics->UnregisterDeviceEventCallback(OnGraphicsDeviceEvent);
	}
}