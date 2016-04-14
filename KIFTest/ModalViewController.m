//
//  ModalViewController.m
//  KIFTest
//
//  Created by Alessio Roberto on 14/04/16.
//  Copyright © 2016 alessio. All rights reserved.
//

#import "ModalViewController.h"
#import "Constants.h"

@interface ModalViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *productsList;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;
@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
}

- (void)setupUI {
    self.titleLabel.text = kModalViewTitle;
    self.titleLabel.accessibilityLabel = kModalViewTitle;
    self.tableView.accessibilityLabel = kTableView;
    [self.closeButton setTitle:kCloseButtonLabel forState:UIControlStateNormal];
    self.closeButton.accessibilityLabel = kCloseButtonLabel;
    
    self.productsList = @[@"a", @"b", @"c", @"a", @"b", @"c", @"a", @"b", @"c"];
    
    [self.tableView reloadData];
}

- (IBAction)closeButtonTapped:(UIButton *)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.productsList.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellId"];
    
    if (!cell) {
        cell =  [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellId"];
    }
    
    cell.textLabel.text = _productsList[indexPath.row];
    
    return cell;
}

@end
