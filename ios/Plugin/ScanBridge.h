#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>
#import "ScanSendOutput.h"

@class Scan;

@interface ScanBridge : NSObject

@property(strong, nonatomic) Scan *plugin;

+ (NSString*) getCPUType;

- (instancetype)initWithPlugin:(Scan *)plugin;

- (void) start: (NSString*)variant;
- (void) cmd: (NSString*)command;
- (void) exit;


@end
