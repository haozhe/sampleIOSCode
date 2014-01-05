//
//  NewViewController.h
//  NativeAppEmbedWebView
//
//  Created by Haozhe Li on 2/5/13.
//  Copyright (c) 2013 Adobe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Cordova/CDVViewController.h>

#import "MultitaskDetailView.h"
#import "EGORefreshHeaderView.h"
#import "MultitaskViewController.h"

@interface NewViewController : UIViewController{
    MultitaskDetailView *multitaskView;
    NSString *gtmobURL;
}

//Pointer to homeWidget
@property (retain) CDVViewController *homeWidget;
//Pointer to currentWidget
@property (retain) CDVViewController *currentWidget;

//Dictionary variable to store widgetName - widgetView keyvalue paire
@property (retain, readwrite) NSMutableDictionary *CDVViewDict;
//Array variable to store widgetName
@property (retain, readwrite) NSMutableArray *widgetNameArray;

- (void)refreshCurrentWidget;

@end
