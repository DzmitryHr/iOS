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

@property (strong, nonatomic) NSURLSession *session;
@property (strong, nonatomic) NSURL *url;

@end


@implementation MainViewController
{
    NSArray *arrayOfRoomHouse; // describe the number of rooms
    int i;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
// load data  from *.plist
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"RoomOfHouseList"
//                                                     ofType:@"plist"];
//    arrayOfRoomHouse = [[NSArray alloc] initWithContentsOfFile:path];

    self.tableViewOfThings.estimatedRowHeight = 120.0f;
    self.tableViewOfThings.rowHeight = UITableViewAutomaticDimension;
    
    NSURLSessionConfiguration *sessionCongiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    self.session = [NSURLSession sessionWithConfiguration:sessionCongiguration];
    self.url = [NSURL URLWithString:@"https://raw.githubusercontent.com/DzmitryHr/iOS/Sprint2Storyboard/iOSStudy/TableOfIntThings/TableOfIntThings/RoomOfHouseList.plist"];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrayOfRoomHouse count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{   
    TemplateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL_ID" forIndexPath:indexPath];
    
    cell.title.text = [[arrayOfRoomHouse objectAtIndex:indexPath.row]
                       objectForKey:@"title"];
    cell.subtitle.text = [[ arrayOfRoomHouse objectAtIndex:indexPath.row]
                          objectForKey:@"subtitle"];
    cell.image.image = [UIImage imageNamed: [[arrayOfRoomHouse objectAtIndex:indexPath.row] objectForKey:@"imageName"]];
    
    return cell;
}

- (IBAction)loadButton:(UIButton *)sender {
    
    NSURLSessionDataTask *dataTask = [self.session dataTaskWithURL:self.url completionHandler:^(NSData * data, NSURLResponse * response, NSError *error) {
                                                
                                                //  not in the main queu
                                                NSError *err;
                                                NSArray *plist = [NSPropertyListSerialization propertyListWithData:data options:NSPropertyListImmutable format:nil error:&err];
//                                                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data                                                                                                     options:0 error:nil];
                                                NSLog(@"%@", plist);
                                                NSLog(@"other queue");
                                                
                                                dispatch_async(dispatch_get_main_queue(), ^{
                                                    arrayOfRoomHouse = plist;
                                                    [self.tableViewOfThings reloadData];
                                                    // in main quene
                                                    NSLog(@"main queue");
                                                    
                                                    
                                                });
                                            }];
    [dataTask resume];
    
    [self.tableViewOfThings reloadData];
    
}



@end
