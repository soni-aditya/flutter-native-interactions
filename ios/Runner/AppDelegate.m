#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
    FlutterViewController* controller = (FlutterViewController*) self.window.rootViewController;
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:@"soni.aditya.com/info"
                                     binaryMessenger:controller];
    [channel setMethodCallHandler:^(FlutterMethodCall* call,FlutterResult result){
        NSString *from = call.arguments[@"from"];
        if([@"getMessage" isEqualToString:call.method]){
            NSString *message = @"IOS says Hi !";
            NSString *returnMessage = [message stringByAppendingString:from];
            result(returnMessage);
        }
    }];
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
