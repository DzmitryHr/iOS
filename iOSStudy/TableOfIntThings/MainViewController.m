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

@property (weak, nonatomic) IBOutlet UITableView *tableViewOfThings;

@end


@implementation MainViewController
{
    NSArray *arrayOfRoomHouse; // describe the number of rooms
    int i;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    // load data  from *.plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"RoomOfHouseList"
                                                     ofType:@"plist"];
    arrayOfRoomHouse = [[NSArray alloc] initWithContentsOfFile:path];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrayOfRoomHouse count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{   
    TemplateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL_ID" forIndexPath:indexPath];
    
    cell.title.text = [[arrayOfRoomHouse objectAtIndex:indexPath.row]
                       objectForKey:@"title"];
    cell.subtitle.text = [[ arrayOfRoomHouse objectAtIndex:indexPath.row]
                          objectForKey:@"subtitle"];
    cell.image.image = [UIImage imageNamed: [[arrayOfRoomHouse objectAtIndex:indexPath.row] objectForKey:@"imageName"]];
    
    i++;
    NSLog(@"method tableViewcell for row at ... %i",i);
    
    return cell;
}

- (IBAction)LoadButton:(UIButton *)sender {
    NSLog(@"button is put");
    [self.tableViewOfThings reloadData];
    
}



@end
