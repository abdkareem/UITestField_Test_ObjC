//
//  ViewController.m
//  UITextField_Test
//
//  Created by Abdul kareem Khaja mohammed on 2/13/17.
//  Copyright © 2017 Abdul Kareem. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    NSMutableArray * sampleDB;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.text1.delegate = self;
    self.text2.delegate = self;
    self.text3.delegate = self;
    
    sampleDB = [NSMutableArray arrayWithObjects:@"BMW", @"Mercedes", @"Volvo", @"Porsche", @"The Land Rover", @"Bently", @"Jaguar", nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.text1) {
        // Before moving on to next field, authenticate the content in current field. In order to move onto next field, user may either  press the next button on keypad or press the next field abruptly. In both the scenarios, code should be able to authenticate the content. In this method validating content upon keyboard button press.
        
        //Check whether the content is already present in the database. If present, alert user to re-enter the field and dont resign the first responder. if not present, add it to the db and assign first responder to the next field.
        if(![sampleDB containsObject:textField.text]) {
            //1. Do I have to resign first responder from current fiedl before assigning it to next one ?
            [textField resignFirstResponder];
            [self.text2 becomeFirstResponder];
            return YES;
        }
        else {
            self.label1.text = @"Brand already exists. Please re-enter";
            return NO;
        }
    }
        //2. Identify the text field using tag or the field object, which one should be preferred ?
    if (textField == self.text2) {
        [self.text3 becomeFirstResponder];
    }
    [textField resignFirstResponder];
    return YES;
}

    // Below piece of code won't let the text field resign first responder as long it does not not contain a unique value. Once it does it resigned the first responder.
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    if (![sampleDB containsObject:textField.text]) {
        self.label1.text = @"";
        return YES;
    }
    else {
        self.label1.text = @"Brand already exists. Please re-enter";
        //[self textFieldDidBeginEditing:textField];
        return NO;
    }
}
    // The method textFieldShouldEndEditing can be made to behave aggressive when it comes to validating value by not allowing the field to resign first responder aslong as its value is not unique. To have a relaxed approach, try using textFieldDidEndEditing. The code in this method / validation is executed / performed after the field has resigned its first responder.

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    // Note that the password entry is a secure field.When user wishes to update the password field, it is recommended to reset the field and then enter the new password phrase
    if (textField.tag == 3) {
        // clears on insertion waits for keyboard input, as soon as there is an input it clears the old content and places new one.
        self.text3.clearsOnInsertion = YES;
        // Alternate to above line is the one below. Clears on begin editing clears the field as soon as it becomes first responder
        //self.text3.clearsOnBeginEditing = YES;
        self.label3.text = @"";
    }
    if (textField.tag == 1) {
        self.label1.text = @"";
    }
    if (textField.tag == 2) {
        self.label2.text = @"";
    }
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    if (textField.tag == 1) {
        self.label1.text = @"";
        return YES;
    }
    if (textField.tag == 2) {
        self.label2.text = @"";
        return YES;
    }
    if (textField.tag == 3) {
        self.label3.text = @"";
        return YES;
    }
    return NO;
}
- (IBAction)save:(id)sender {
}

//- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
//    return YES;
//}

@end
