//
//  ViewController.h
//  CaJoPaToDo
//
//  Created by Parker, Carl (HBO) on 2/9/15.
//  Copyright (c) 2015 Parker, Carl (HBO). All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ToDoList.h"

@interface ViewController : NSViewController <NSTextFieldDelegate, NSTableViewDelegate, NSTableViewDataSource>

@property (strong) ToDoList *toDoList;

@property (weak) IBOutlet NSButton *addTextAsItem;

@property (weak) IBOutlet NSButton *removeItemWithText;

@property (weak) IBOutlet NSTextField *itemTextField;

@property (weak) IBOutlet NSTableView *itemListTable;

@end

