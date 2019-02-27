//
//  DeadlinesDML.h
//  ass3
//
//  Created by Patel, Binal Shaileshkumar on 10/25/18.
//  Copyright © 2018 Patel, Binal Shaileshkumar. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DeadlinesDML : NSObject


+ (NSMutableArray* )fetchall;
+ (NSMutableArray*) fetchdetail:(NSString *)cid;

+ (bool)sortData;
+ (bool)adddeadline:(NSArray*)record;
+ (bool)updateRecord:(NSArray*)record;
+ (bool)deleteRecord:(NSArray*)record;
+ (bool)deleteWord:(NSString *)wordString;

@end

NS_ASSUME_NONNULL_END
