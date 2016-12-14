//
//  ImageCell.m
//  CollectionViewTutorialOC
//
//  Created by James Rochabrun on 12/14/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "ImageCell.h"

@implementation ImageCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        _imageView = [UIImageView new];
        _imageView.userInteractionEnabled = NO;
        [self addSubview:_imageView];
    }
    return self;
}


- (void)layoutSubviews {

    [super layoutSubviews];
    CGRect frame = _imageView.frame;
    frame.size.height = self.frame.size.height;
    frame.size.width = self.frame.size.width;
    frame.origin.x = 0;
    frame.origin.y = 0;
    _imageView.frame = frame;
}

@end
