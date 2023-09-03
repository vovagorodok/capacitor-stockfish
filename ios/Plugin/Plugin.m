#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>
#import "ScanBridge.h"

// Define the plugin using the CAP_PLUGIN Macro, and
// each method the plugin supports using the CAP_PLUGIN_METHOD macro.
CAP_PLUGIN(Scan, "Scan",
           CAP_PLUGIN_METHOD(getMaxMemory, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(getCPUArch, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(start, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(cmd, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(exit, CAPPluginReturnPromise);
)
