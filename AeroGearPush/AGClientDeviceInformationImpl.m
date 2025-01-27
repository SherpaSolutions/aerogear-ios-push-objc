/*
 * JBoss, Home of Professional Open Source.
 * Copyright Red Hat, Inc., and individual contributors
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

#import "AGClientDeviceInformationImpl.h"

@implementation NSData (RemoteNotification)

- (NSString *)remoteNotificationDeviceToken {
    NSMutableString *deviceToken = [NSMutableString stringWithCapacity:([self length] * 2)];
    Byte *bytes = (Byte*)[self bytes];
    for (NSUInteger i = 0; i < [self length]; i++) {
        [deviceToken appendFormat:@"%02X", bytes[i]];
    }
    return [deviceToken lowercaseString];
}

@end

@interface AGClientDeviceInformationImpl()
- (NSString *) convertToNSString:(NSData *)deviceToken;
@end

@implementation AGClientDeviceInformationImpl

// "push" related fields
@synthesize deviceToken = _deviceToken;
@synthesize variantID = _variantID;
@synthesize variantSecret = _variantSecret;
@synthesize alias = _alias;
@synthesize categories = _categories;

// "sysinfo" metadata fields
@synthesize operatingSystem = _operatingSystem;
@synthesize osVersion = _osVersion;
@synthesize deviceType = _deviceType;

- (id)init {
    self = [super init];
    if (self) {

    }
    return self;
}

-(NSDictionary *) extractValues {
    NSMutableDictionary *values = [NSMutableDictionary dictionary];
    
    [values setValue:[self convertToNSString:_deviceToken] forKey:@"deviceToken"];
    [values setValue:_alias forKey:@"alias"];
    [values setValue:_categories forKey:@"categories"];

    [values setValue:_operatingSystem forKey:@"operatingSystem"];
    [values setValue:_osVersion forKey:@"osVersion"];
    [values setValue:_deviceType forKey:@"deviceType"];
    
    return values;
}

// little helper to transform the NSData-based token into a (useful) String:
- (NSString *) convertToNSString:(NSData *)deviceToken {
    return [deviceToken remoteNotificationDeviceToken];
}

@end
