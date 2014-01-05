//
//  ControlViewController.h
//  NativeAppEmbedWebView
//
//  Created by Haozhe Li on 3/6/13.
//  Copyright (c) 2013 Adobe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ControlViewController :UIViewController<UITableViewDataSource, UITableViewDelegate>{
    IBOutlet UIButton *ok;
}

@property (nonatomic, retain) IBOutlet UIButton *ok;

- (IBAction)okPressed:(id)sender;

@end
