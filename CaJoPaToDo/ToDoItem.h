//
//  ToDoItem.h
//  HW3
//
//  Created by Parker, Carl (HBO) on 2/3/15.
//  Copyright (c) 2015 Parker, Carl (HBO). All rights reserved.
//

#ifndef HW3_ToDoItem_h
#define HW3_ToDoItem_h

#import <Foundation/Foundation.h>

//// properties
//@property (strong, nonatomic) NSUUID *uuid;
//@property (copy, nonatomic) NSString *handle;
//
//// readonly properties
//@property (nonatomic, readonly ) NSArray *followedUserIds;
//@property (nonatomic, readonly ) NSURL *profilePageURL;
//
//// methods
//-(void)followUserWithUUID:(NSUUID*)uuid;
//

@interface ToDoItem : NSObject

// properties
@property (strong, nonatomic) NSString* title;

// methods
+(instancetype)toDoItemWithTitle:(NSString *)title;

@end

#endif
