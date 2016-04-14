//
//  ViewController.m
//  KIFTest
//
//  Created by Alessio Roberto on 12/04/16.
//  Copyright © 2016 alessio. All rights reserved.
//

#import "ViewController.h"
#import "Constants.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIButton *modalButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupUI {
    self.title = kFirstViewTitle;
    [self.nextButton setTitle:kNextButtonLabel forState:UIControlStateNormal];
    self.nextButton.accessibilityLabel = kNextButtonLabel;
    
    [self.modalButton setTitle:kModalButtonLabel forState:UIControlStateNormal];
    self.modalButton.accessibilityLabel = kModalButtonLabel;
}
@end
