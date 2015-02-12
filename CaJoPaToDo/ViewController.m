//
//  ViewController.m
//  CaJoPaToDo
//
//  Created by Parker, Carl (HBO) on 2/9/15.
//  Copyright (c) 2015 Parker, Carl (HBO). All rights reserved.
//

#import "ViewController.h"
#import "ToDoList.h"

@implementation ViewController


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.itemTextField.delegate = self;
    
    self.itemListTable.delegate = self;
    self.itemListTable.dataSource = self;
    
    // Set default state for controls
    self.addTextAsItem.enabled = NO;
    self.removeItemWithText.enabled = NO;
    
    //instantiate the To Do List object
    toDoList = [ToDoList groceryList];
    toDoList.duplicatesOK = YES;
    
}

ToDoList *toDoList;


-(void) controlTextDidChange:(NSNotification *)obj {
    
    NSString * fieldContents = self.itemTextField.stringValue;
    
    // Only enable the add button if constraints are met
    if ( fieldContents ) {
        if ( toDoList.duplicatesOK ) {
            self.addTextAsItem.enabled = YES;
        } else if ( ! [toDoList hasItemWithTitle:fieldContents] ) {
            self.addTextAsItem.enabled = YES;
        } else {
            self.addTextAsItem.enabled = NO;
        }
    }
    
    // enable remove button if the text matches something in the list
    if ( [toDoList hasItemWithTitle:fieldContents] ) {
        self.removeItemWithText.enabled = YES;
    }
    else {
        self.removeItemWithText.enabled = NO;
    }
    NSLog( @"%@", self.itemTextField.stringValue);
    
}

- (IBAction)addItemButton:(id)sender {
    
    // add the item
    [toDoList addItemWithTitle:self.itemTextField.stringValue];
    
    // reset the text field and add button
    // and redraw the table
    [self updateUI];
}


// if a user types into text field and hits return behave as though
// they had clicked "Add" button.
- (IBAction)addOnTextFieldReturn:(id)sender {
    
    // if we haven't enabled the add button
    // then return won't do anything either
    if (self.addTextAsItem.enabled) {
        [self addItemButton:sender];
        NSLog(@"Add an item by pressing return in text field.");
    }
    
}

- (IBAction)removeItemButton:(id)sender {
    
    // remove the item
    [toDoList removeItemWithTitle:self.itemTextField.stringValue];
    
    // reset the text field and add button
    // and redraw the table
    [self updateUI];
    
}


- (void) updateUI {
    self.itemTextField.stringValue = @"";
    self.addTextAsItem.enabled = NO;
    self.removeItemWithText.enabled = NO;
    
    [self.itemListTable reloadData];
}


- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    // For this to work, Table Cell View in Main.storyboard 
    // must have Identity | Identifier set to "Cell"
    NSTableCellView *cell = [tableView makeViewWithIdentifier:@"Cell" owner:nil];
    
    NSLog(@"%@", [toDoList itemTitles][row]);
    
    cell.textField.stringValue = [toDoList itemTitles][row];
    return cell;
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return [toDoList itemCount];
}

- (IBAction)setDups:(id)sender {
    toDoList.duplicatesOK = ! toDoList.duplicatesOK;
    
    // Ugh. Reproducing this block of code from
    // controlTextDidChange
    NSString * fieldContents = self.itemTextField.stringValue;
    
    // Only enable the add button if constraints are met
    if ( fieldContents ) {
        if ( toDoList.duplicatesOK ) {
            self.addTextAsItem.enabled = YES;
        } else if ( ! [toDoList hasItemWithTitle:fieldContents] ) {
            self.addTextAsItem.enabled = YES;
        } else {
            self.addTextAsItem.enabled = NO;
        }
    }
    
}


@end
