//
//  SKHeap.h
//  SKHeap
//
//  Created by Shuaib on 13/05/2014.
//  Copyright (c) 2014 Bytehood. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SKHeap : NSObject

- (instancetype)initWithArray:(NSArray *)array;

// Returns maximum element in the heap
- (id)max;

// Returns maximum element and removes it from the heap
- (id)popMax;

// Inserts a new object into the heap
- (void)insertObject:(id)object;

// Returns an array with elements of the heap in sorted order
- (NSArray *)sortedArray;

@end
