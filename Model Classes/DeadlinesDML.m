//
//  DeadlinesDML.m
//  ass3
//
//  Created by Patel, Binal Shaileshkumar on 10/25/18.
//  Copyright © 2018 Patel, Binal Shaileshkumar. All rights reserved.
//

#import "DeadlinesDML.h"
#import "Deadlines+CoreDataClass.h"
#import "AppDelegate.h"
#import "DetailViewController.h"
//#import "DeadlineTableViewCotroller.h" 



@implementation DeadlinesDML

+ (NSManagedObjectContext *) getManagedObjectContext
{
    AppDelegate* appDelegate = [[UIApplication sharedApplication] delegate];
    return appDelegate.persistentContainer.viewContext;
}
+ (NSMutableArray* )fetchall{
    NSManagedObjectContext* context =[[self class] getManagedObjectContext];
    // Define our table/entity to use
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Deadlines" inManagedObjectContext:context];
    // Setup the fetch request
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    // Define how we will sort the records
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"dueDate" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    [request setSortDescriptors:sortDescriptors];
    // Fetch the records and handle an error
    NSError *error;
    NSMutableArray *mutableFetchResults = [[context executeFetchRequest:request error:&error] mutableCopy];
    
    NSMutableArray *getRecord=[[NSMutableArray alloc]init];
    if (!mutableFetchResults)
    {
        return nil;
    }
    else
    {
        
        if([mutableFetchResults count] > 0)
        {
            
            
            for (int i =0; i<mutableFetchResults.count;i++)
            {
                
                Deadlines *Deadlineobj = [mutableFetchResults objectAtIndex:i];
                [getRecord addObject: Deadlineobj];
                
                
            }
        }
        
       
    }
    
    return getRecord;
    
}


    




+ (NSMutableArray*) fetchdetail:(NSString*)cid
{
    //Get managed object context
    NSManagedObjectContext* context =[[self class] getManagedObjectContext];
    // Define our table/entity to use
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Deadlines" inManagedObjectContext:context];
    // Setup the fetch request
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"courseNumber=%@",cid];
    [request setPredicate:predicate];
    
    NSError *error;
    NSMutableArray *mutableFetchResults = [[context executeFetchRequest:request error:&error] mutableCopy];
    //NSString* retStr = nil;
    // NSMutableArray *getRecord = nil;
    NSMutableArray *getRecord=[[NSMutableArray alloc]init];
    if (!mutableFetchResults)
    {
        return nil;
    }
    else
    {
        
        if([mutableFetchResults count] > 0)
        {
            
            for (int i =0; i<mutableFetchResults.count;i++)
            {
                
                Deadlines *Deadlineobj = [mutableFetchResults objectAtIndex:i];
                
                //[getRecord addObject: Deadlineobj];
                NSString *d1 =[NSString stringWithFormat:@"%@",Deadlineobj.courseNumber];
                 NSString *d2 =[NSString stringWithFormat:@"%@",Deadlineobj.courseName];
                 NSString *d3 =[NSString stringWithFormat:@"%@",Deadlineobj.semester];
                 NSString *d4 =[NSString stringWithFormat:@"%@",Deadlineobj.testName];
                 //NSString *d5 =[NSString stringWithFormat:@"%@",Deadlineobj.dueDate];
                
                NSDate *store = Deadlineobj.dueDate;
                NSDateFormatter* strformat = [[NSDateFormatter alloc]init];
                [strformat setDateFormat:@"MM/dd/yyyy"];
                NSString* result= (NSString*)[strformat stringFromDate:store];
                getRecord = [NSMutableArray arrayWithObjects:d1,d2,d3,d4,result, nil];
                //[getRecord addObject : [NSString stringWithFormat:@"%@",Deadlineobj.courseName]];
                //}
            }
        }
        
        //  NSString* cn= mutableFetchResults.
        // NSString *temp = (NSString*)[getRecord objectAtIndex:1];
        // NSLog(@"%@", temp);
        //}*/
    }
    //return mutableFetchResults;
    return getRecord;
    
    
}

+(bool)adddeadline:(NSArray*)record
{
    
    //Get managed object context
    NSManagedObjectContext* context =[[self class] getManagedObjectContext];
    //Create a blank new record
    Deadlines *deadlineObject = (Deadlines *)[NSEntityDescription insertNewObjectForEntityForName:@"Deadlines" inManagedObjectContext:context];
    [deadlineObject setCourseNumber:(NSString*)[record objectAtIndex:0]];
    [deadlineObject setCourseName:(NSString*)[record objectAtIndex:1]];
    [deadlineObject setSemester:(NSString*)[record objectAtIndex:2]];
    [deadlineObject setTestName:(NSString*)[record objectAtIndex:3]];
    [deadlineObject setDueDate:[record objectAtIndex:4]];
    
    
    
    
    
    //Save the new record
 NSError *error;
    if(![context save:&error])
    {
        return false;
    }
    else
    {
        //[DeadlinesDML sortData];
        return true;
    }

}


+ (bool)updateRecord:(NSArray*)record
{
    NSManagedObjectContext* context =[[self class] getManagedObjectContext];
    // Define our table/entity to use
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Deadlines" inManagedObjectContext:context];
    // Setup the fetch request
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"courseNumber=%@",[record objectAtIndex:0]];
    [request setPredicate:predicate];
    NSError *error;
    NSMutableArray *mutableFetchResults = [[context executeFetchRequest:request error:&error] mutableCopy];
    Deadlines *Deadlineobj = [mutableFetchResults objectAtIndex:0];
    [Deadlineobj setCourseNumber:(NSString*)[record objectAtIndex:0]];
    [Deadlineobj setCourseName:(NSString*)[record objectAtIndex:1]];
    [Deadlineobj setSemester:(NSString*)[record objectAtIndex:2]];
    [Deadlineobj setTestName:(NSString*)[record objectAtIndex:3]];
    [Deadlineobj setDueDate:[record objectAtIndex:4]];
    
 
    if(![context save:&error])
    {
        return false;
    }
    else
    {
        //[DeadlinesDML sortData];
        return true;
    }
}

+ (bool)deleteRecord:(NSArray*)record
{
    NSManagedObjectContext* context =[[self class] getManagedObjectContext];
    // Define our table/entity to use
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Deadlines" inManagedObjectContext:context];
    // Setup the fetch request
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"courseNumber=%@",[record objectAtIndex:0]];
    [request setPredicate:predicate];
    NSError *error;
    NSMutableArray *mutableFetchResults = [[context executeFetchRequest:request error:&error] mutableCopy];
    Deadlines *Deadlineobj = [mutableFetchResults objectAtIndex:0];
    [context deleteObject:Deadlineobj];
    if (![context save:&error])
    {
        return false;
    }

return true;
}



@end
