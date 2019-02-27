//
//  UpdateViewController.m
//  ass3
//
//  Created by Patel, Binal Shaileshkumar on 10/31/18.
//  Copyright © 2018 Patel, Binal Shaileshkumar. All rights reserved.
//

#import "UpdateViewController.h"
#import "DeadlinesDML.h"
#import "Deadlines+CoreDataClass.h"

@interface UpdateViewController ()
@property (weak, nonatomic) IBOutlet UITextView *updatenum;

- (IBAction)btnupdatemethod:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *updatename;
@property (weak, nonatomic) IBOutlet UITextView *updatesem;
@property (weak, nonatomic) IBOutlet UITextView *updatetest;
@property (weak, nonatomic) IBOutlet UITextView *updatedate;

- (IBAction)btndelete:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *cnum;
@property (weak, nonatomic) IBOutlet UILabel *sem;
@property (weak, nonatomic) IBOutlet UILabel *test;
@property (weak, nonatomic) IBOutlet UILabel *date;

@property (weak, nonatomic) IBOutlet UILabel *cname;



@end

@implementation UpdateViewController
@synthesize cid;

- (void)viewDidLoad {
    [super viewDidLoad];
    _cnum.text = @"CourseNumber :";
    _cname.text = @"CourseName :";
    _sem.text = @"Semester :";
    _test.text = @"Test :";
    _date.text = @"DueDate :";
    
    _eachDetail= [DeadlinesDML fetchdetail:cid];
    _updatenum.text = [_eachDetail objectAtIndex:0];
    _updatename.text = [_eachDetail objectAtIndex:1];
    _updatesem.text= [_eachDetail objectAtIndex:2];
    _updatetest.text = [_eachDetail objectAtIndex:3];
    _updatedate.text = [_eachDetail objectAtIndex:4];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnupdatemethod:(id)sender {
    NSString *Number = _updatenum.text;
    NSString *Name = _updatename.text;
    NSString *semester = _updatesem.text;
    NSString *test = _updatetest.text;
    NSString *duedate = _updatedate.text;
    
    NSDateFormatter *dateFormat =[[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"MM-dd-yyyy"];
    NSDate *date = [dateFormat dateFromString:duedate];
    // NSString *record = @[Number,Name,semester,test,duedate];
    NSArray *record = [NSArray arrayWithObjects:Number,Name,semester,test,date, nil];
    
    [DeadlinesDML updateRecord:record];
    
}

- (IBAction)btndelete:(id)sender {
    NSString *Number = _updatenum.text;
    NSString *Name = _updatename.text;
    NSString *semester = _updatesem.text;
    NSString *test = _updatetest.text;
    NSString *duedate = _updatedate.text;
    
    
    NSDateFormatter *dateFormat =[[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"MM-dd-yyyy"];
    NSDate *date = [dateFormat dateFromString:duedate];
    
    NSArray *record = [NSArray arrayWithObjects:Number,Name,semester,test,date, nil];
    
    [DeadlinesDML deleteRecord:record];
}
@end
