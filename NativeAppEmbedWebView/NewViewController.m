//
//  NewViewController.m
//  NativeAppEmbedWebView
//
//  Created by Haozhe Li on 2/5/13.
//  Copyright (c) 2013 Adobe. All rights reserved.
//

#import "NewViewController.h"

@implementation NewViewController 

@synthesize homeWidget, CDVViewDict, widgetNameArray;

@synthesize currentWidget;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        [super viewDidLoad];
        
        gtmobURL = @"http://hli352.m3.cip.gatech.edu/";
        
        // Do any additional setup after loading the view, typically from a nib.
        
        //Initialization of necessary variables
        
        CDVViewDict = [[NSMutableDictionary alloc]init];
                
        widgetNameArray = [[NSMutableArray alloc] init];
        
        //Initialize popup view
        multitaskView = [[MultitaskDetailView alloc] initWithNibName:@"MultitaskDetailView" bundle:nil];
        
        //Initialize currentWidget pointer for homeWidget
        currentWidget = [CDVViewController new];
        
        //Initialize homeWidget
        homeWidget = [CDVViewController new];
        homeWidget.wwwFolderName=@"";
        
        //address for homeWidget
        homeWidget.startPage = gtmobURL;
        
        homeWidget.view.frame = CGRectMake(0, 0, 320, 460 - self.navigationController.toolbar.bounds.size.height);
        homeWidget.view.hidden = NO;
        
        [self.view addSubview:homeWidget.view];
        currentWidget = homeWidget;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    multitaskView = [[MultitaskDetailView alloc] initWithNibName:@"MultitaskDetailView" bundle:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//Function to init CDVView
-(void) initCDVViewWithWidgetName: (NSString*)name andURL:(NSString*)URL{
    
    CDVViewController * CDVView = [CDVViewController new];
    CDVView.wwwFolderName=@"";
    CDVView.startPage = URL;
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CDVView.view.frame = CGRectMake(0, 0, screenRect.size.width, screenRect.size.height - 20  - self.navigationController.toolbar.bounds.size.height);
    CDVView.view.alpha = 0;
    
    //Update data
    [CDVViewDict setValue:CDVView forKey:name];
    
    [widgetNameArray addObject:name];
    
    [self.view addSubview:CDVView.view];
    
    [UIView animateWithDuration:0.5 animations:^{CDVView.view.alpha = 1.0;}];
    
    currentWidget = CDVView;
}

//Function to open view
-(void) openViewWithWidgetName:(NSString*) widgetName andURL:(NSString*) URL andIconName:(NSString*)icon{
    
    //Check if Widget is already initialized
    if([CDVViewDict objectForKey:widgetName]) {
        //If already exist, bring it up to front, only if currentWidget is not the target widget
        [self showWidgetWithName:widgetName];

    } else {
        //If not exist, init one
        [self initCDVViewWithWidgetName:widgetName andURL:URL];
        //Add one row in multitaskdetail view
        [multitaskView addWidgetWithName:widgetName andIcon:icon];

    }
}

-(void) showWidgetWithName:(NSString*) widgetName{    
    CDVViewController* tempCDVView = [CDVViewDict objectForKey:(NSString*)widgetName];
    
    if(![currentWidget isEqual:tempCDVView])
    {
        currentWidget = tempCDVView;
        [self hideAllWidgetsExceptCurrentWidget];
        [UIView animateWithDuration:0.25 animations:^{tempCDVView.view.alpha = 1.0;}];
    }
    
}

-(void) removeWidgetWithName:(NSString*) widgetName {
    CDVViewController* tempCDVView = [CDVViewDict objectForKey:(NSString*)widgetName];
    
    [UIView animateWithDuration:0.25 animations:^{tempCDVView.view.alpha = 0;}];
    
    [tempCDVView removeFromParentViewController];
    [CDVViewDict removeObjectForKey:widgetName];
    [self showHomeWidget];
}

-(void) hideAllWidgetsExceptCurrentWidget {
    if (currentWidget.view.alpha != 1) {
        [UIView animateWithDuration:0.25 animations:^{currentWidget.view.alpha = 1;}];
    }
    if (currentWidget != homeWidget) {
        [self hideHomeWidget];
    }
    for (NSString *widgetName in CDVViewDict) {
        CDVViewController *widget = [CDVViewDict objectForKey:widgetName];
        if (widget != currentWidget) {
            [UIView animateWithDuration:0.25 animations:^{widget.view.alpha = 0;}];
        }
    }
}

-(void) showHomeWidget {
    currentWidget = homeWidget;
    [self hideAllWidgetsExceptCurrentWidget];
    
    if (![homeWidget.webView.request.URL isEqual:[NSURL URLWithString:gtmobURL]]) {
        [homeWidget.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:gtmobURL]]];
    }
}

-(void) hideHomeWidget{
    homeWidget.view.alpha = 0;
}

-(void) showPageAtIndex:(NSInteger)i {
    [self hideAllWidgetsExceptCurrentWidget];
}

-(void) showMultitask{
    NSLog(@"Inside show multitask function");
    
    UIViewController *con = [[UIViewController alloc] init];
    con.view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 100)];
    con.view.backgroundColor=[UIColor redColor];
    //[self presentPopupViewController:con animationType:@"slide - bottom to bottom"];
    NSLog(@"%@", [multitaskView.view description]);
    [self presentPopupViewController:multitaskView animationType:@"slide - bottom to bottom"];
}

-(void) hideMultitask{
    [self dismissPopupViewControllerWithanimationType:@"slide - bottom to bottom"];
}

- (void)refreshCurrentWidget {
    [currentWidget.webView reload];
}

@end
