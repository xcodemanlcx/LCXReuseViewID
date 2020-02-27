//
//  BCollectionViewCell.m
//  LCXReuseViewID
//
//  Created by lcx on 2020/2/25.
//  Copyright © 2020 lcx. All rights reserved.
//

#import "BCollectionViewCell.h"

@implementation BCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];

        UILabel *lab = [[UILabel alloc] initWithFrame:self.contentView.bounds];
        [self.contentView addSubview:lab];
        lab.font = [UIFont systemFontOfSize:20];
        lab.textColor = [UIColor blackColor];
        lab.textAlignment = NSTextAlignmentCenter;
        lab.text = NSStringFromClass(self.class);
    }
    return self;
}

@end
