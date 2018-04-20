//
//  ViewController.m
//  TipCalculator
//
//  Created by Brian Vo on 2018-04-20.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;
@property (weak, nonatomic) IBOutlet UITextField *tipPercentageField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tipPercentageField.placeholder = @"Tip %";
}

- (IBAction)calculateTip:(UIButton *)sender {
    NSInteger bill = [self.billAmountTextField.text integerValue];
    CGFloat tip = [self.tipPercentageField.text floatValue] / 100;
    
    self.tipAmountLabel.text = [NSString stringWithFormat:@"$%g.00", tip * bill];
    
}


@end
