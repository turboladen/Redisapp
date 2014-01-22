//
//  main.m
//  Redisapp
//
//  Created by Steve Loveless on 1/22/14.
//  Copyright (c) 2014 Steve Loveless. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import <RubyCocoa/RBRuntime.h>

int main(int argc, const char * argv[])
{
    RBApplicationInit("rb_main.rb", argc, (const char **)argv, nil);
    return NSApplicationMain(argc, (const char **)argv);
}
