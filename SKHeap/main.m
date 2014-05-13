//
//  main.m
//  SKHeap
//
//  Created by Shuaib on 13/05/2014.
//  Copyright (c) 2014 Bytehood. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SKHeap.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        
        NSArray *array = @[@10, @11, @1, @4, @15, @6, @3];
        SKHeap *heap = [[SKHeap alloc] initWithArray:array];
        NSArray *sorted = [heap sortedArray];
        NSLog(@"Sorted: %@", sorted);
        
    }
    return 0;
}

