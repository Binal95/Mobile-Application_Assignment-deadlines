//
//  DeadlineTableViewController.m
//  ass3
//
//  Created by Patel, Binal Shaileshkumar on 10/25/18.
//  Copyright © 2018 Patel, Binal Shaileshkumar. All rights reserved.
//

#import "DeadlineTableViewController.h"
#import "CustomCell.h"
#import "DetailViewController.h"
//#import "DeadlinesDML.h"
#import "DeadlinesDML.h"
#import "Deadlines+CoreDataClass.h"

@interface DeadlineTableViewController ()
- (IBAction)btnAddDeadline:(id)sender;

@end

@implementation DeadlineTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _getAll = [DeadlinesDML fetchall];
   
}

#pragma mark - Table view data source
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    
    _getAll = [DeadlinesDML fetchall];
    [self.tableView reloadData];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return _getAll.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     //_deatailArray = [DeadlinesDML fetchrecord];
  
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    
  

    Deadlines *due = [_getAll objectAtIndex:indexPath.row];
    NSString *cname  = due.courseName;
    NSString *tname  = due.testName;
     NSDate *store = due.dueDate;
    NSDateFormatter* strformat = [[NSDateFormatter alloc]init];
    [strformat setDateFormat:@"MM/dd/yyyy"];
     NSString* result= (NSString*)[strformat stringFromDate:store];
    
    cell.lblCourseName.text = cname;
    cell.lblTestName.text = tname;
    cell.lbldueDate.text = result;
    
    
   
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView * )tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    
    Deadlines *due1 = [_getAll objectAtIndex:indexPath.row];
    NSString *pass  = (due1.courseNumber);
    cidpass = pass;
    [self performSegueWithIdentifier:@"deadline2detail" sender:self];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue is to GameVC
    if ([[segue identifier] isEqualToString:@"deadline2detail"])
    {
        
        DetailViewController *detailVC = [segue destinationViewController];
        detailVC.cid = cidpass;
        
        
    }
    
}
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

- (IBAction)btnAddDeadline:(id)sender {
    [self performSegueWithIdentifier:@"deadline2add" sender:self];
    
}
@end
