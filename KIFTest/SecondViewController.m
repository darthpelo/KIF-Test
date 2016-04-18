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
@property (weak, nonatomic) IBOutlet UIButton *doneButton;

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
    [_doneButton setTitle:kDoneButton forState:UIControlStateNormal];
    _doneButton.accessibilityLabel = kDoneButton;
}

- (IBAction)dobeButtonTapped:(id)sender {
    if ([_firstTextField.text length] == 0 || [_secondTextField.text length] == 0) {
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:kAlertTitle
                                      message:kAlertMessage
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        alert.accessibilityLabel = kAlertTitle;
        
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 [self.navigationController popViewControllerAnimated:YES];
                                 
                             }];
        UIAlertAction* cancel = [UIAlertAction
                                 actionWithTitle:@"Cancel"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     [alert dismissViewControllerAnimated:YES completion:nil];
                                     
                                 }];
        
        [alert addAction:ok];
        [alert addAction:cancel];
        
        [self presentViewController:alert animated:YES completion:nil];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
