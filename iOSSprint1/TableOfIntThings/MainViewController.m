//
//  MainViewController.m
//  TableOfIntThings
//
//  Created by Dz Hg on 12/03/2017.
//  Copyright © 2017 Dz Hg. All rights reserved.
//

#import "MainViewController.h"
#import "TemplateTableViewCell.h"


@interface MainViewController ()

@end


@implementation MainViewController{

    NSArray *arrayOfRoomHouse; // describe the number of rooms

}

- (void)viewDidLoad {

    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    // create object ViewController
    UITableView *tableViewOfIntThings = [[[UITableView alloc] initWithFrame:
                                         [[UIScreen mainScreen] bounds] style:
                                         UITableViewStylePlain] autorelease];
    
    NSLog(@"=1 RC MainViewController tableViewOfThings = %lu",(unsigned long)[tableViewOfIntThings retainCount]);
    
    tableViewOfIntThings.autoresizingMask= UIViewAutoresizingFlexibleHeight;
    tableViewOfIntThings.delegate = self;
    tableViewOfIntThings.dataSource = self;
    tableViewOfIntThings.backgroundView = nil;
    tableViewOfIntThings.rowHeight = 80.f;
    
    [tableViewOfIntThings reloadData];

    [tableViewOfIntThings registerClass:[TemplateTableViewCell class]
                 forCellReuseIdentifier:@"CELL_Identifier"];

    [self.view addSubview:tableViewOfIntThings];

    
    // load data  from *.plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"RoomOfHouseList" ofType:@"plist"];
//? leak memory?
    arrayOfRoomHouse = [[NSArray alloc] initWithContentsOfFile:path];

    NSLog(@"=2 RC MainViewController tableViewOfThings = %lu",(unsigned long)[tableViewOfIntThings retainCount]);
    
 //   [tableViewOfIntThings release];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
 
    return [arrayOfRoomHouse count];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TemplateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL_Identifier"];
    
    NSLog(@"=1 RC MainViewController cell = %lu",(unsigned long)[cell retainCount]);
    
    // cell padding
    cell.lableInCell1.text = [[arrayOfRoomHouse objectAtIndex:indexPath.row] objectForKey:@"title"];
    cell.lableInCell2.text = [[arrayOfRoomHouse objectAtIndex:indexPath.row] objectForKey:@"subtitle"];
    cell.imageInCell.image = [UIImage imageNamed:                              [[arrayOfRoomHouse objectAtIndex:indexPath.row] objectForKey:@"imageName" ]];
    
    NSLog(@"=2 RC MainViewController cell = %lu",(unsigned long)[cell retainCount]);

//?   why??
//    [cell release];
    
    return cell;

}



@end
