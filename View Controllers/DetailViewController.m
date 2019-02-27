//
//  DetailViewController.m
//  ass3
//
//  Created by Patel, Binal Shaileshkumar on 10/30/18.
//  Copyright © 2018 Patel, Binal Shaileshkumar. All rights reserved.
//

#import "DetailViewController.h"
#import "DeadlineTableViewController.h"
#import "DeadlinesDML.h"
#import "Deadlines+CoreDataClass.h"
#import "AppDelegate.h"
#import "UpdateViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UITextView *txtCourseNumber;


@property (weak, nonatomic) IBOutlet UITextView *txtCourseName;

@property (weak, nonatomic) IBOutlet UITextView *txtSemester;
@property (weak, nonatomic) IBOutlet UITextView *txtTestname;
@property (weak, nonatomic) IBOutlet UITextView *txtdueDate;
- (IBAction)doupdate:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lcnum;
@property (weak, nonatomic) IBOutlet UILabel *lcname;
@property (weak, nonatomic) IBOutlet UILabel *lsem;
@property (weak, nonatomic) IBOutlet UILabel *ldate;
@property (weak, nonatomic) IBOutlet UILabel *ltest;




@end

@implementation DetailViewController
@synthesize cid;
+ (NSManagedObjectContext *) getManagedObjectContext
{
    AppDelegate* appDelegate = [[UIApplication sharedApplication] delegate];
    return appDelegate.persistentContainer.viewContext;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _lcnum.text = @"CourseNumber :";
    _lcname.text = @"CourseName :";
    _lsem.text = @"Semester :";
    _ltest.text = @"Test :";
    _ldate.text = @"DueDate :";
    
     _txtCourseName.editable = NO;
    _txtCourseNumber.editable = NO;
    _txtSemester.editable = NO;
    _txtTestname.editable = NO;
    _txtdueDate.editable = NO;
    
    NSLog(@"%@", cid);
    _eachDetail= [DeadlinesDML fetchdetail:cid];
    cidpass = [_eachDetail objectAtIndex:0];
    _txtCourseNumber.text = [_eachDetail objectAtIndex:0];
    _txtCourseName.text = [_eachDetail objectAtIndex:1];
    _txtSemester.text= [_eachDetail objectAtIndex:2];
    _txtTestname.text = [_eachDetail objectAtIndex:3];
    _txtdueDate.text = [_eachDetail objectAtIndex:4];
    
    
    
   
  
    
    
   
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/




- (IBAction)doupdate:(id)sender {
    [self performSegueWithIdentifier:@"detail2update" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue is to GameVC
    if ([[segue identifier] isEqualToString:@"detail2update"])
    {
        
        UpdateViewController *detailVC = [segue destinationViewController];
        detailVC.cid = cidpass;
        
        
    }
    
}



@end

