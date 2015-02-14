//
//  ViewController.m
//  CaJoPaToDo
//
//  Created by Parker, Carl (HBO) on 2/9/15.
//  Copyright (c) 2015 Parker, Carl (HBO). All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

// ToDoList *toDoList;

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
    
    
}



-(void) controlTextDidChange:(NSNotification *)obj {
    
    NSString * fieldContents = self.itemTextField.stringValue;
    
    // Only enable the add button if constraints are met
    if ( fieldContents ) {
        if ( self.toDoList.duplicatesOK ) {
            self.addTextAsItem.enabled = YES;
        } else if ( ! [ self.toDoList hasItemWithTitle:fieldContents] ) {
            self.addTextAsItem.enabled = YES;
        } else {
            self.addTextAsItem.enabled = NO;
        }
    }
    
    // enable remove button if the text matches something in the list
    if ( [self.toDoList hasItemWithTitle:fieldContents] ) {
        self.removeItemWithText.enabled = YES;
    }
    else {
        self.removeItemWithText.enabled = NO;
    }
    NSLog( @"%@", self.itemTextField.stringValue);
    
}

- (void) tableViewSelectionDidChange:(NSNotification *)notification {
    
    NSIndexSet * idxSet = [self.itemListTable selectedRowIndexes];
    
    if ( idxSet.count == 0 ) {
        NSLog(@"Rows selected: Zero");
        [self updateUI];
    }
    else if ( idxSet.count == 1 ) {
        NSLog(@"Rows selected: One");
        NSLog(@"%@", [self.toDoList itemTitles][idxSet.firstIndex]);
        
        self.itemTextField.stringValue = [self.toDoList itemTitles][idxSet.firstIndex];
        
    }
    else {
        NSLog(@"Rows selected: Multiple");
        
        [idxSet enumerateIndexesUsingBlock: ^(NSUInteger idx, BOOL *stop) {
            NSLog(@"%@", [self.toDoList itemTitles][idx]);
        }];
    }
    
    
}

- (IBAction)addItemButton:(id)sender {
    
    // add the item
    [self.toDoList addItemWithTitle:self.itemTextField.stringValue];
    
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
    [self.toDoList removeItemWithTitle:self.itemTextField.stringValue];
    
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
    
    NSLog(@"%@", [self.toDoList itemTitles][row]);
    
    cell.textField.stringValue = [self.toDoList itemTitles][row];
    return cell;
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return [self.toDoList itemCount];
}

- (IBAction)setDups:(id)sender {
    self.toDoList.duplicatesOK = ! self.toDoList.duplicatesOK;
    
    // Ugh. Reproducing this block of code from
    // controlTextDidChange
    NSString * fieldContents = self.itemTextField.stringValue;
    
    // Only enable the add button if constraints are met
    if ( fieldContents ) {
        if ( self.toDoList.duplicatesOK ) {
            self.addTextAsItem.enabled = YES;
        } else if ( ! [self.toDoList hasItemWithTitle:fieldContents] ) {
            self.addTextAsItem.enabled = YES;
        } else {
            self.addTextAsItem.enabled = NO;
        }
    }
    
}


@end
