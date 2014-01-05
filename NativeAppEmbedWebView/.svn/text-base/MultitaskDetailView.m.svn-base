//
//  MJDetailViewController.m
//  MJPopupViewControllerDemo
//
//  Created by Martin Juhasz on 24.06.12.
//  Copyright (c) 2012 martinjuhasz.de. All rights reserved.
//

#import "MultitaskDetailView.h"

@implementation MultitaskDetailView

@synthesize widgetNameArray,iconURLArray,iconDataArray,URLArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    NSLog(@"inside init func");
    iconURLArray = [[NSMutableArray alloc] init];
    widgetNameArray = [[NSMutableArray alloc] init];
    
    //Make tableview selectable
    [multitaskTableView setAllowsSelection:YES];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"multitaskdetail view did load");
    
    [UIView animateWithDuration:2 animations:^{reminder.alpha = 1.0;}];
    
    [self setEditing:YES animated:YES];

}

-(void) viewWillAppear:(BOOL)animated{
    
    [multitaskTableView reloadData];
    
}

-(void) viewDidDisappear:(BOOL)animated {
    reminder.alpha = 0;
}

-(void) addWidgetWithName:(NSString *)newWidgetName andIcon:(NSString*) newIconURL{
    
    NSLog(@"new widget added with %@ and %@",newWidgetName,newIconURL);

    [self addWidgetNameArrayObject:newWidgetName];
    [self addIconURLArrayObject:newIconURL];
    
    NSLog(@"new array is %@", widgetNameArray);
}

-(void) removeWidgetWithName:(NSString*)widgetName {
    NSInteger index = [widgetNameArray indexOfObject:widgetName];
    [widgetNameArray removeObjectAtIndex:index];
    [iconURLArray removeObjectAtIndex:index];
    [iconDataArray removeObjectAtIndex:index];
}

-(void) addIconURLArrayObject:(NSString *)newIconURL {
    [iconURLArray addObject:newIconURL];
    
    //Load image file from url and save it to iconDataArray
    NSURL *url = [NSURL URLWithString: newIconURL];
    NSData *imgData = [NSData dataWithContentsOfURL:url];
    [iconDataArray addObject:imgData];
    NSLog(@"icon Data added %@", newIconURL);
}

-(void) removeIconURLArrayObject:(NSString *)iconURL {
    [iconURLArray removeObject:iconURL];
}

-(void) addWidgetNameArrayObject:(NSString *)newWidgetName {
    [widgetNameArray addObject:newWidgetName];
}

-(void) removeWidgetNameArrayObject:(NSString *)widgetName{
    [widgetNameArray removeObject:widgetName];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [widgetNameArray count];
};

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]
                             initWithStyle:UITableViewCellStyleSubtitle
                             reuseIdentifier:@"cell"];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [[cell textLabel] setText:[widgetNameArray objectAtIndex:[indexPath row]]];
//
    NSURL *url = [NSURL URLWithString: [iconURLArray objectAtIndex:[indexPath row]]];
////    NSString *iconPath = [[NSBundle mainBundle]pathForResource:[iconNameArray objectAtIndex:[indexPath row]] ofType:@"png"];
    NSData *imgData = [NSData dataWithContentsOfURL:url];
//    NSData *imgData = [iconDataArray objectAtIndex:[indexPath row]];
    UIImage *icon = [UIImage imageWithData:imgData];
//    [self.view addSubview:[[UIImageView alloc] initWithImage:icon]];
    
    

    cell.imageView.image = icon;
    
    return cell;
};

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [tableView beginUpdates];
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        NSString* widgetName = [widgetNameArray objectAtIndex:[indexPath row]];
        [self removeWidgetWithName:widgetName];
        
        //Update CDVView
        AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
        [delegate.viewController removeWidgetWithName: widgetName];
        
        [tableView endUpdates];
        
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}

// Table selection
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Widget name %@, icon name: %@", [widgetNameArray objectAtIndex:[indexPath row]], [iconURLArray objectAtIndex:[indexPath row]]);
    //Show widget with name
    AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    [delegate.viewController openViewWithWidgetName:[widgetNameArray objectAtIndex:[indexPath row]] andURL:@"no url" andIconName:@"no icon" ];
}

//Customize deletion confirmation text
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(3_0){
    return @"Close";
}

//- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0){
//    return YES;
//}

- (void)dealloc {
//    [multitaskTableView release];
//    [super dealloc];
}
- (void)viewDidUnload {
//    [multitaskTableView release];
    multitaskTableView = nil;
    [super viewDidUnload];
}
@end
