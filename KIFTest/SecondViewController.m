//
//  SecondViewController.m
//  KIFTest
//
//  Created by Alessio Roberto on 13/04/16.
//  Copyright © 2016 alessio. All rights reserved.
//

#import "SecondViewController.h"
#import "Constants.h"

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UILabel *firstLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondLabel;
@property (weak, nonatomic) IBOutlet UITextField *firstTextField;
@property (weak, nonatomic) IBOutlet UITextField *secondTextField;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
}

- (void)setupUI {
    self.title = kSecondViewTitle;
    self.firstLabel.text = kFirstLabel;
    self.firstLabel.accessibilityLabel = kFirstLabel;
    self.secondLabel.text = kSecondLabel;
    self.secondLabel.accessibilityLabel = kSecondLabel;
    self.firstTextField.accessibilityLabel = kFirstTextField;
    self.secondTextField.accessibilityLabel = kSecondTextField;
}

@end
