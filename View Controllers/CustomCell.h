//
//  CustomCell.h
//  ass3
//
//  Created by Patel, Binal Shaileshkumar on 10/25/18.
//  Copyright © 2018 Patel, Binal Shaileshkumar. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblCourseName;
@property (weak, nonatomic) IBOutlet UILabel *lblTestName;
@property (weak, nonatomic) IBOutlet UILabel *lbldueDate;

@end

NS_ASSUME_NONNULL_END
