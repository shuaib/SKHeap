//
//  SKHeap.m
//  SKHeap
//
//  Created by Shuaib on 13/05/2014.
//  Copyright (c) 2014 Bytehood. All rights reserved.
//

#import "SKHeap.h"

@interface SKHeap ()
{
    NSMutableArray *_array;
    int _heapSize;
}
@end

@implementation SKHeap

- (instancetype)initWithArray:(NSArray *)array
{
    self = [super init];
    if (self) {
        _array = [array mutableCopy];
        _heapSize = 0;
        [self buildMaxHeap];
    }
    return self;
}

- (instancetype)init
{
    return [self initWithArray:[NSArray array]];
}

- (id)max
{
    NSAssert(_heapSize, @"Heap is empty");
    
    return _array[0];
}

- (id)popMax
{
    NSAssert(_heapSize, @"Heap is empty");
    
    id result = _array[0];
    _array[0] = _array[_heapSize-1];
    _heapSize -= 1;
    [self maxHeapify:0];

    return result;
}

- (void)insertObject:(id)object
{
    [_array addObject:object];
    [_array exchangeObjectAtIndex:_heapSize withObjectAtIndex:_array.count-1];
    int i=_heapSize;
    int p = [self parentOf:i];
    while(p>=0 && _array[p]<_array[i]) {
        [_array exchangeObjectAtIndex:p withObjectAtIndex:i];
        i = p;
        p = [self parentOf:i];
    }
    _heapSize += 1;
}

- (NSArray *)sortedArray
{
    NSMutableArray *array = [_array mutableCopy];
    for(int i=_heapSize-1;i>=0;i--) {
        array[i] = [self popMax];
    }
    
    return array;
}

#pragma mark - Private Methods;

- (int)parentOf:(int)i
{
    return (i/2)-1;
}

- (int)leftOf:(int)i
{
    return (2*i)+1;
}

- (int)rightOf:(int)i
{
    return (2*i)+2;
}

- (void)buildMaxHeap
{
    _heapSize = (int)_array.count;
    int N = (int)_array.count;
    for(int i = (N/2);i>=0;i--) {
        [self maxHeapify:i];
    }
}

- (void)maxHeapify:(int)index
{
    int l = [self leftOf:index];
    int r = [self rightOf:index];
    int largest = index;
    if (l<_heapSize && _array[l]>_array[largest]) {
        largest = l;
    }
    if(r<_heapSize && _array[r]>_array[largest]) {
        largest = r;
    }
    if (largest != index) {
        [_array exchangeObjectAtIndex:index withObjectAtIndex:largest];
        [self maxHeapify:largest];
    }
}

@end
