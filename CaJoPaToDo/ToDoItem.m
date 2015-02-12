//
//  ToDoItem.m
//  HW3
//
//  Created by Parker, Carl (HBO) on 2/3/15.
//  Copyright (c) 2015 Parker, Carl (HBO). All rights reserved.
//

#import "ToDoItem.h"

@implementation ToDoItem

NSString * const itemTitleKey = @"itemTitleKey";

+(instancetype)toDoItemWithTitle:(NSString*)title
{
    ToDoItem *object = [[self alloc] init];
    object.title = title;
    return object;
}

- (void) encodeWithCoder:(NSCoder *) aCoder
{
    [aCoder encodeObject:self.title forKey:itemTitleKey];
}

-(id) initWithCoder:(NSCoder *)aDecoder
{
    // Our super class doesn't implement NSCoding
    // so we just say `init` here, not `initWithCoder
    
    // QUESTION: Why do I need to do this at all?
    self = [super init];
    
    _title = [aDecoder decodeObjectForKey:itemTitleKey];
    
    return self;
    
}

@end

