//
//  ViewController.m
//  TipCalculator
//
//  Created by Brian Vo on 2018-04-20.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()  <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;
@property (weak, nonatomic) IBOutlet UITextField *tipPercentageField;
@property (nonatomic) NSNotificationCenter *notificationCenter;
@property (nonatomic) UITouch *touch;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tipPercentageField.placeholder = @"Tip %";
    
    self.billAmountTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.billAmountTextField.delegate = self;
    
    self.tipPercentageField.keyboardType = UIKeyboardTypeNumberPad;
    self.tipPercentageField.delegate = self;
    
}

- (IBAction)calculateTip:(UIButton *)sender {
    NSInteger bill = [self.billAmountTextField.text integerValue];
    CGFloat tip = [self.tipPercentageField.text floatValue] / 100;
    
    self.tipAmountLabel.text = [NSString stringWithFormat:@"$%g.00", tip * bill];
}
- (IBAction)adjustTipPercentage:(UISlider *)sender {
    CGFloat tip = [self.tipPercentageField.text floatValue];
    tip = sender.value;
    self.tipPercentageField.text = [NSString stringWithFormat:@"%g", tip];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch * touch = [touches anyObject];
    if(touch.phase == UITouchPhaseBegan) {
        [self.billAmountTextField resignFirstResponder];
        [self.tipPercentageField resignFirstResponder];
    }
}


@end
