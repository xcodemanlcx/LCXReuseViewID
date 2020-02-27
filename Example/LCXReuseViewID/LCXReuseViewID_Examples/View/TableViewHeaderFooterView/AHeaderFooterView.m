//
//  AHeaderFooterView.m
//  LCXReuseViewID
//
//  Created by lcx on 2020/2/25.
//  Copyright © 2020 lcx. All rights reserved.
//

#import "AHeaderFooterView.h"

@implementation AHeaderFooterView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor orangeColor];
    
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
        [self.contentView addSubview:lab];
        lab.font = [UIFont systemFontOfSize:20];
        lab.textColor = [UIColor whiteColor];
        lab.textAlignment = NSTextAlignmentLeft;
        lab.text = NSStringFromClass(self.class);
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
