//
//  MGMenu.m
//  Mirage
//
//  Created by Diego German Amezquita Mesa on 9/27/13.
//  Copyright (c) 2013 appmunki. All rights reserved.
//

#import "MGMenu.h"

@implementation MGMenu

@synthesize title = _title;
@synthesize rating = _rating;

-(id)initWithTitle:(NSString *)title rating:(float)rating{
    if((self=[super init])){
        self.title = title;
        self.rating = rating;
    }
    return self;
}

@end
