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
                        path:(NSString*)imagePath
                     success:(void(^)(NSURLRequest *request, NSHTTPURLResponse *response, id JSON))success
                     failure:(void(^)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON))failure
                    progress:(void(^)(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite))progress;

-(void)editPatternWithId:(NSString*)idPattern
                    name:(NSString*)name
             description:(NSString*)description
                 success:(void(^)(NSURLRequest *request, NSHTTPURLResponse *response, id JSON))success
                 failure:(void(^)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON))failure;

-(void) deletePatternWithId:(NSString*)idPattern
                    success:(void(^)(NSURLRequest *request, NSHTTPURLResponse *response, id JSON))success
                    failure:(void(^)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON))failure;

-(void)doMatch:(NSString*)pathImage
       success:(void(^)(NSURLRequest *request, NSHTTPURLResponse *response, id JSON))success
       failure:(void(^)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON))failure
      progress:(void(^)(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite))progress;


-(void)test;
@end
