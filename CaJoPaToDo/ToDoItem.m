//
//  ToDoItem.m
//  HW3
//
//  Created by Parker, Carl (HBO) on 2/3/15.
//  Copyright (c) 2015 Parker, Carl (HBO). All rights reserved.
//

#import "ToDoItem.h"

@implementation ToDoItem

+(instancetype)toDoItemWithTitle:(NSString*)title
{
    ToDoItem *object = [[self alloc] init];
    object.title = title;
    return object;
}

@end

