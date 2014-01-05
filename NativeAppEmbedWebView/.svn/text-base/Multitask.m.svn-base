//
//  Multitask.m
//  NativeAppEmbedWebView
//
//  Created by Haozhe Li on 2/28/13.
//  Copyright (c) 2013 Adobe. All rights reserved.
//

#import "Multitask.h"
#import "AppDelegate.h"

@implementation Multitask

-(id) initialize{
    
    self = [super initialize];
    NSLog(@"Multitask plugin initialized");
}

-(void) open:(CDVInvokedUrlCommand *)command {
    CDVPluginResult* pluginResult = nil;
        NSString* id = [command.arguments objectAtIndex:0];
        NSString* url = [command.arguments objectAtIndex:1];
        NSString* name = [command.arguments objectAtIndex:2];
        NSString* icon = [command.arguments objectAtIndex:3];
    if (url != nil && [url length] > 0 ) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArray:url];
        AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
        //NSLog(@"Open View at %@",url);
        
        NSLog(@"id: %@", id);
        NSLog(@"url: %@", url);
        NSLog(@"name: %@", name);
        NSLog(@"icon: %@", icon);
        
        [delegate.viewController openViewWithWidgetName:name andURL:url andIconName:icon];
        
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

-(void) closeWidget:(CDVInvokedUrlCommand *)command{
    
}

-(void) change:(CDVInvokedUrlCommand *)command{
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Multitask Switchboard opened."];
    AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    [delegate.viewController showMultitask];
}

-(void) backWidget:(CDVInvokedUrlCommand *)command{
    
}

-(void) home:(CDVInvokedUrlCommand *)command{
    NSLog(@"open home widget in native");
    
    
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Home Widget opened."];
    AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    //NSLog(@"Open View at %@",url);
    [delegate.viewController showHomeWidget];
    
}
@end
