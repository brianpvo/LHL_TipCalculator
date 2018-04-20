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
@property (nonatomic) UITouch *touch;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.billAmountTextField.placeholder = @"Bill Amount";
    self.billAmountTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.billAmountTextField.delegate = self;
    
    self.tipPercentageField.placeholder = @"Tip %";
    self.tipPercentageField.backgroundColor = [UIColor lightGrayColor];
    self.tipPercentageField.keyboardType = UIKeyboardTypeNumberPad;
    self.tipPercentageField.delegate = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifyView) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(afterNotifyView) name:UIKeyboardDidHideNotification object:nil];
    
}

- (IBAction)calculateTip:(UIButton *)sender {
    NSInteger bill = [self.billAmountTextField.text integerValue];
    CGFloat tip = [self.tipPercentageField.text floatValue] / 100;
    
    self.tipAmountLabel.text = [NSString stringWithFormat:@"$%.2f", tip * bill];
}
- (IBAction)adjustTipPercentage:(UISlider *)sender {
    CGFloat tip = [self.tipPercentageField.text floatValue];
    tip = sender.value;
    self.tipPercentageField.text = [NSString stringWithFormat:@"%.2f", tip];
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

-(void)notifyView {
    [self.view layoutIfNeeded];
    [UIView animateWithDuration:0.1 animations:^{
        self.bottomConstraint.constant = 350;
        [self.view layoutIfNeeded];
    }];
}

-(void)afterNotifyView {
    [self.view layoutIfNeeded];
    [UIView animateWithDuration:0.1 animations:^{
        self.bottomConstraint.constant = 100;
        [self.view layoutIfNeeded];
    }];
}


@end
