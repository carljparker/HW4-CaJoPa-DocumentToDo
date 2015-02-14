//
//  Document.m
//  CaJoPaToDo
//
//  Created by Parker, Carl (HBO) on 2/9/15.
//  Copyright (c) 2015 Parker, Carl (HBO). All rights reserved.
//

#import "Document.h"
#import "ViewController.h"
#import "ToDoList.h"

@interface Document ()

@property (strong) ToDoList *toDoList;

@end

@implementation Document

- (instancetype)init {
    
    NSLog(@"%s", __PRETTY_FUNCTION__);
    

    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
        //instantiate the To Do List object
        self.toDoList = [ToDoList groceryList];
        self.toDoList.duplicatesOK = YES;
    }
    return self;
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController {
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
}

+ (BOOL)autosavesInPlace {
    return YES;
}


- (void)makeWindowControllers {
    // Override to return the Storyboard file name of the document.

    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    NSStoryboard *sb = [NSStoryboard storyboardWithName:@"Main" bundle:nil];
                               
    NSWindowController *wc = [sb instantiateControllerWithIdentifier:@"Document Window Controller"];
    
    [self addWindowController:wc];
    
    if([wc.contentViewController isKindOfClass:[ViewController class]] ) {
        ((ViewController *) wc.contentViewController).toDoList = self.toDoList;
        [((ViewController *) wc.contentViewController) updateUI];
    }

}


// see 28:00 in the video from class
- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError {
    
    NSLog(@"%s", __PRETTY_FUNCTION__);

    return [NSKeyedArchiver archivedDataWithRootObject:self.toDoList];
    
}


- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError {

    NSLog(@"%s", __PRETTY_FUNCTION__);

    self.toDoList = [NSKeyedUnarchiver unarchiveObjectWithData:data];

    return YES;
    
}

@end
