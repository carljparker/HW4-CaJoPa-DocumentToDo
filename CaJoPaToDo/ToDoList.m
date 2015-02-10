//
//  ToDoList.m
//  HW3
//
//  Created by Parker, Carl (HBO) on 2/4/15.
//  Copyright (c) 2015 Parker, Carl (HBO). All rights reserved.
//

#import "ToDoList.h"

@interface ToDoList ()

@property (readwrite, assign) NSString * listTitle;
@property (readwrite) NSMutableArray * theList;

@end


@implementation ToDoList


+(instancetype)toDoListWithTitle:(NSString *)title;
{
    ToDoList *object = [[self alloc] init];
    object.listTitle = title;
    object.theList = [NSMutableArray new];
    return object;
}

+(instancetype)groceryList {
    ToDoList *object = [[self alloc] init];
    object.listTitle = @"Groceries";
    object.theList = [NSMutableArray new];
    
    NSArray * groceries = @[ @"Water", @"Goat Milk Kefir", @"Goji Berries", @"Kombucha"];
    for (id item in groceries) {
        [object.theList addObject:[ToDoItem toDoItemWithTitle:item]];
    }
    
    return object;
}

+(instancetype)burningManList {
    ToDoList *object = [[self alloc] init];
    object.listTitle = @"Burning Man";
    object.theList = [NSMutableArray new];
    
    NSArray * supplies = @[ @"Tent", @"Water", @"Beer in Cans"];
    for (id item in supplies) {
        [object.theList addObject:[ToDoItem toDoItemWithTitle:item]];
    }
    
    return object;
}


  // create and insert item if OK
-(void) addItemWithTitle:(NSString*) title {
    
    NSUInteger currentCount = [_theList count];
    
    ToDoItem * newItem = [ToDoItem toDoItemWithTitle:title];
    
    [_theList addObject:newItem];
    
    // test
    NSUInteger newCount = [_theList count];
    assert( newCount == currentCount + 1);
    
}


-(void)removeItemWithTitle:(NSString *) title {
    NSUInteger currentCount = [_theList count];
    
    // yes, this will remove all items in the list that
    // match the specified title . . . by design.
    
    // This approach is necessary because you can't change
    // the mutable array while you are enumerating it.
    NSMutableArray * removeList = [NSMutableArray new];
    
    // Create a list of all the items to remove
    for (id item in _theList) {
        if ( [[item title] isEqualToString:title] ) {
            [removeList addObject:item];
        }
    }
    
    // Remove them
    for (id item in removeList) {
        [_theList removeObject:item];
    }
    
    // test
    NSUInteger newCount = [_theList count];
    assert( newCount < currentCount );
}


  // check if any item contained already has the specified title
-(BOOL) hasItemWithTitle:(NSString*) title {
    for (id item in _theList) {
        if ( [[item title] isEqualToString:title] ) {
            return YES;
        }
    }
    return NO;
}


  // an array of all item titles (NSString*)
-(NSArray*) itemTitles {
  
    NSMutableArray * titleArray = [NSMutableArray new];
    
    for (id item in _theList) {
        [titleArray addObject:[item title]];
    }
    NSLog(@"%lu", (unsigned long)[titleArray count]);
    return [NSArray arrayWithArray:titleArray];

}

         
  // an array of all items
-(NSArray*) allItems {
    
    return [NSArray arrayWithArray:_theList];
    
}

         
  // number of items contained in list
-(NSUInteger) itemCount {
  
    return [_theList count];
}


@end

