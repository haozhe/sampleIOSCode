//
//  Multitask.h
//  NativeAppEmbedWebView
//
//  Created by Haozhe Li on 2/28/13.
//  Copyright (c) 2013 Adobe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>

@interface Multitask : CDVPlugin

-(void) open:(CDVInvokedUrlCommand*)command;

-(void) closeWidget:(CDVInvokedUrlCommand*)command;

-(void) change:(CDVInvokedUrlCommand*)command;

-(void) backWidget:(CDVInvokedUrlCommand*)command;

-(void) home:(CDVInvokedUrlCommand*)command;

@end
