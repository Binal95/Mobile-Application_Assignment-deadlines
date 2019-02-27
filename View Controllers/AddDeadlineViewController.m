//
//  AddDeadlineViewController.m
//  ass3
//
//  Created by Patel, Binal Shaileshkumar on 10/31/18.
//  Copyright © 2018 Patel, Binal Shaileshkumar. All rights reserved.
//

#import "AddDeadlineViewController.h"
#import "DeadlinesDML.h" 

@interface AddDeadlineViewController ()
@property (weak, nonatomic) IBOutlet UITextView *addCourseNumber;
@property (weak, nonatomic) IBOutlet UITextView *addCourseName;
@property (weak, nonatomic) IBOutlet UITextView *addSemester;
@property (weak, nonatomic) IBOutlet UITextView *addTestName;
@property (weak, nonatomic) IBOutlet UITextView *addDueDate;
- (IBAction)addBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lblcn;
@property (weak, nonatomic) IBOutlet UILabel *lblcname;
@property (weak, nonatomic) IBOutlet UILabel *lblsem;
@property (weak, nonatomic) IBOutlet UILabel *lbltest;
@property (weak, nonatomic) IBOutlet UILabel *lbldate;

@end

@implementation AddDeadlineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _lblcn.text = @"CourseNumber :";
    _lblcname.text = @"CourseName :";
    _lblsem.text = @"Semester :";
    _lbltest.text = @"Test :";
    _lbldate.text = @"DueDate :";
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

- (IBAction)addBtn:(id)sender {
    NSString *Number = _addCourseNumber.text;
    NSString *Name = _addCourseName.text;
    NSString *semester = _addSemester.text;
    NSString *test = _addTestName.text;
    NSString *duedate = _addDueDate.text;
    
    NSDateFormatter *dateFormat =[[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"MM-dd-yyyy"];
    NSDate *date = [dateFormat dateFromString:duedate];
   
    NSArray *record = [NSArray arrayWithObjects:Number,Name,semester,test,date, nil];
    
    [DeadlinesDML adddeadline:record];
    
}
@end
