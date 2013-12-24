//
//  MGMenu.h
//  Mirage
//
//  Created by Diego German Amezquita Mesa on 9/27/13.
//  Copyright (c) 2013 appmunki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MGMenu : NSObject

@property (strong) NSString *title;
@property (assign) float rating;

-(id)initWithTitle:(NSString*)title rating:(float)rating;

@end
