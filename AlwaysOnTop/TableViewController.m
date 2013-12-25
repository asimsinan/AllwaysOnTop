//
//  ASYViewController.m
//  AlwaysOnTop
//
//  Created by Asim Sinan Yuksel on 25.12.2013.
//  Copyright (c) 2013 Asim Sinan Yuksel. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

NSArray *tableData;

@implementation TableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    tableData=[[NSArray alloc] initWithObjects:@"Asim",@"Sinan",@"Yuksel",@"Asim",@"Sinan",@"Yuksel",@"Asim",@"Sinan",@"Yuksel",@"Asim",@"Sinan",@"Yuksel",@"Asim",@"Sinan",@"Yuksel",nil];
    [self scrollToBottom];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.topView.layer.zPosition = 1;
    CGRect topviewFrame = self.topView.frame;
    topviewFrame.origin.y = scrollView.contentOffset.y+ CGRectGetHeight(scrollView.frame)-self.topView.frame.size.height;
    
    self.topView.frame = topviewFrame;
}

-(void) scrollToBottom{
    CGPoint offset = CGPointMake(0, self.tableView.contentSize.height -     self.tableView.frame.size.height);
    [self.tableView setContentOffset:offset animated:YES];
    
    [self.tableView setContentOffset:CGPointMake(0, CGFLOAT_MAX)];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return tableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
        }
        
    NSString *dataString =  tableData[indexPath.row];
    cell.textLabel.text=dataString;

        return cell;
   }

@end
