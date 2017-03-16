//
//  TemplateTableViewCell.m
//  TableOfIntThings
//
//  Created by Dz Hg on 13/03/2017.
//  Copyright © 2017 Dz Hg. All rights reserved.
//

#import "TemplateTableViewCell.h"


@implementation TemplateTableViewCell


-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
   
    if (self){
        [self initLable];
        [self initImage];
    }
    
    NSLog(@"=1 RC TemplateTableViewCell self = %lu",(unsigned long)[self retainCount]);
    //? [self release] - need???
    return self;

}

//? format text?
-(void)  initLable{
    UILabel *lable1 = [[UILabel alloc] initWithFrame:CGRectMake(
                        CGRectGetMidX(self.contentView.frame),
                        CGRectGetMidY(self.contentView.frame) / 2.0f,
                        CGRectGetMaxX(self.contentView.frame),
                        CGRectGetMidY(self.contentView.frame))];
    
     NSLog(@"=1 RC TemplateTableViewCell lable1 = %lu",(unsigned long)[lable1 retainCount]);
    
    UILabel *lable2 = [[UILabel alloc] initWithFrame:
                       CGRectMake(                                                                CGRectGetMaxX(self.contentView.frame)*(3.0f/5.0f),                                                                CGRectGetMaxY(self.contentView.frame)*(3.0f/4.0f),                                                                CGRectGetMaxX(self.contentView.frame),                                                                CGRectGetMaxY(self.contentView.frame))];
    
    [self.contentView addSubview:lable1];
    
    // Why???
    NSLog(@"=2 RC TemplateTableViewCell lable1 = %lu",(unsigned long)[lable1 retainCount]);
    
    self.lableInCell1 = lable1;
    
    NSLog(@"=3 RC TemplateTableViewCell lable1 = %lu",(unsigned long)[lable1 retainCount]);

    [lable1 release];
    
    
    
    [self.contentView addSubview:lable2];
    self.lableInCell2 = lable2;
    [lable2 release];

}

// autoResize?
-(void) initImage{
    UIImageView *image = [[UIImageView alloc] initWithFrame:
    CGRectMake(
               20,
               20,
               CGRectGetMidX(self.contentView.frame) / 2.0f,
               CGRectGetMaxY(self.contentView.frame))];
    
    NSLog(@"=1 RC TemplateTableViewCell image = %lu",(unsigned long)[image retainCount]);
    
    [self.contentView addSubview:image];
    
    self.imageInCell = image;

     NSLog(@"=2 RC TemplateTableViewCell image = %lu",(unsigned long)[image retainCount]);
    [image release];
}

@end
