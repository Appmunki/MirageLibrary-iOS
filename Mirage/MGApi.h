//
//  MGApi.h
//  Mirage
//
//  Created by Diego German Amezquita Mesa on 9/19/13.
//  Copyright (c) 2013 appmunki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface MGApi : NSObject
{
    NSString *api_key;
}

-(id)init:(NSString*)apiKey;

-(void)createPatternWithName:(NSString*)name
         description:(NSString*)description
                path:(NSString*)imagePath;

-(void)editPatternWithId:(NSString*)idPattern
              name:(NSString*)name
       description:(NSString*)description;

-(void) deletePatternWithId:(NSString*)idPattern;

-(void)doMatch:(NSString*)pathImage;

@end
