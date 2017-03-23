//
//  TemplateTableViewCell.h
//  TableOfIntThings
//
//  Created by Dz Hg on 13/03/2017.
//  Copyright © 2017 Dz Hg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TemplateTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *subtitle;
@property (weak, nonatomic) IBOutlet UIImageView *image;


/*
@property (nonatomic, strong) IBOutlet UILabel *lableInCell1;
@property (nonatomic, strong) IBOutlet UILabel *lableInCell2;
@property (nonatomic, strong) IBOutlet UIImageView *imageInCell;
*/

@end
