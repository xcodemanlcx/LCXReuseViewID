//
//  BCollectionHeaderView.m
//  LCXReuseViewID
//
//  Created by lcx on 2020/2/25.
//  Copyright © 2020 lcx. All rights reserved.
//

#import "BCollectionHeaderView.h"

@implementation BCollectionHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
            self.backgroundColor = [UIColor blueColor];
        
            UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 30)];
            [self addSubview:lab];
            lab.font = [UIFont systemFontOfSize:20];
            lab.textColor = [UIColor whiteColor];
            lab.textAlignment = NSTextAlignmentLeft;
            lab.text = NSStringFromClass(self.class);
    }
    return self;
}

@end
