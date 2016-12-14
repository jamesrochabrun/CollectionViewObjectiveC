//
//  GridLayout.m
//  CollectionViewTutorialOC
//
//  Created by James Rochabrun on 12/14/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "GridLayout.h"

@implementation GridLayout



- (instancetype)init {
    self = [super init];
    if (self)
    {
        self.innerSpace = 1;
        self.numberOfItemsInRow = 3;
        self.minimumLineSpacing = self.innerSpace;
        self.minimumInteritemSpacing = self.innerSpace;
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
       
    }
    return self;
}

- (CGSize)itemSize {
    
    return CGSizeMake(self.itemWidth, self.itemWidth);
    
}

- (CGFloat)itemWidth {
    return (self.collectionView.frame.size.width/self.numberOfItemsInRow) - self.innerSpace;
}


@end
