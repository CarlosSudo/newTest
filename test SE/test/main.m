//
//  main.m
//  test
//
//  Created by tom on 16/6/4.
//  Copyright © 2016年 tom. All rights reserved.
//

#import <Cocoa/Cocoa.h>

void nothing(){
    return;
}

int main(int argc, const char * argv[]) {
    
//    float a = 0.0100;
    int b = 1;
    void *f = nothing;
    b = ((int(*)(void))f)();
//    double c = 0.0;
//    
//    c = a*b;
//    NSLog(@"%f",c);
//    NSLog(@"%.2f",c);
//    
//    
//    c = a*(double)b;
//    NSLog(@"%f",c);
//    NSLog(@"%.2f",c);
//    
//    double tmpa = (double)((int)(a*100))/100;
//    c = tmpa * (double)b;
//    NSLog(@"%.4f",c);
//    c = a*(double)b;
//    NSLog(@"%d",b);
    
    static NSUInteger a[40000];
    a[40000-1] = 1;
    
    NSUInteger upBit = 0, n = 10000, digit=1;
    int i = 0, bigIndex = 40000-1, littleIndex=40000-1;
    
    clock_t clockA = clock();
    for (; digit<n+1; digit++) {
        upBit = 0;
        for (i=littleIndex; i >= bigIndex-1; i--) {
            a[i] = a[i] * digit + upBit;
            upBit = a[i]/1000000000000000;
            a[i] = a[i]%1000000000000000;
        }
        for (bigIndex= i-1; bigIndex<40000 && a[bigIndex]==0; bigIndex++);
        for (; littleIndex>=0 && a[littleIndex]==0; littleIndex--);
    }
    printf("time of cal is %f sec\n", (double)(clock() -clockA)/CLOCKS_PER_SEC);
    
    for (i=0; i<40000 && a[i]==0; i++);
    printf("%lu",a[i]);
    for (i++; i<40000; i++) printf("%015lu",a[i]);
    
    return NSApplicationMain(argc, argv);
}



    
