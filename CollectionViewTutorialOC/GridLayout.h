//
//  GridLayout.h
//  CollectionViewTutorialOC
//
//  Created by James Rochabrun on 12/14/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GridLayout : UICollectionViewFlowLayout
@property (nonatomic) CGFloat innerSpace;
@property (nonatomic) CGFloat numberOfItemsInRow;

@end
