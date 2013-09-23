//
//  MGApi.m
//  Mirage
//
//  Created by Diego German Amezquita Mesa on 9/19/13.
//  Copyright (c) 2013 appmunki. All rights reserved.
//

#import "MGApi.h"

@implementation MGApi

-(id)init:(NSString*)apiKey{
    self = [super init];
    if (self)
    {
        api_key = apiKey;
    }
    return self;
}


-(void)createPatternWithName:(NSString*)name
                 description:(NSString*)description
                        path:(NSString*)imagePath
                     success:(void(^)(NSURLRequest *request, NSHTTPURLResponse *response, id JSON))success
                     failure:(void(^)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON))failure
                    progress:(void(^)(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite))progress{
    
    
    
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            name,@"_name",
                            description,@"_description",
                            api_key,@"api_key",
                            @"",@"r_image_cache", nil ];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://192.168.0.13:3000/"];
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];
    
    
    
    UIImage *image = [[UIImage alloc] initWithContentsOfFile:imagePath];
    NSData *imageData = UIImageJPEGRepresentation(image, 0.6);
    
    
    
    
    
    NSMutableURLRequest *request = [httpClient multipartFormRequestWithMethod:@"POST" path:@"patterns" parameters:params constructingBodyWithBlock: ^(id <AFMultipartFormData>formData) {
        [formData appendPartWithFileData:imageData name:@"r_image" fileName:@"ios_pattern.jpg" mimeType:@"image/jpg"];
        
        
    }];
    
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation
                                         JSONRequestOperationWithRequest:request
                                         success:success
                                         failure:failure];
    
    
    
    [operation setUploadProgressBlock:progress];
    
    [httpClient enqueueHTTPRequestOperation:operation];
}




-(void)editPatternWithId:(NSString*)idPattern
                    name:(NSString*)name
             description:(NSString*)description
                 success:(void(^)(NSURLRequest *request, NSHTTPURLResponse *response, id JSON))success
                 failure:(void(^)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON))failure{
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://192.168.0.13:3000/"];
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:url];
    
    
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            name,@"_name",
                            description,@"_description",
                            @"",@"r_image_cache", nil ];
    
    
    NSString *servicePath = [NSString stringWithFormat:@"patterns/%@",idPattern];
    
    NSURLRequest *request = [client requestWithMethod:@"PUT" path:servicePath parameters:params];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation
                                         JSONRequestOperationWithRequest:request
                                         success:success
                                         failure:failure];
    
    
    [operation start];
}





-(void) deletePatternWithId:(NSString*)idPattern
                    success:(void(^)(NSURLRequest *request, NSHTTPURLResponse *response, id JSON))success
                    failure:(void(^)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON))failure{
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://192.168.0.13:3000/"];
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:url];
    
    NSString *servicePath = [NSString stringWithFormat:@"patterns/%@",idPattern];
    
    NSURLRequest *request = [client requestWithMethod:@"DELETE" path:servicePath parameters:nil];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation
                                         JSONRequestOperationWithRequest:request
                                         success:success
                                         failure:failure];
    
    
    [operation start];
}


-(void)doMatch:(NSString*)pathImage
       success:(void(^)(NSURLRequest *request, NSHTTPURLResponse *response, id JSON))success
       failure:(void(^)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON))failure
      progress:(void(^)(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite))progress{
    
    UIImage *img = [[UIImage alloc] initWithContentsOfFile:pathImage];
    
    NSData *imageData = UIImageJPEGRepresentation(img, 0.6);
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://192.168.0.13:3000/uploads"];
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];
    
    NSMutableURLRequest *request = [httpClient multipartFormRequestWithMethod:@"POST" path:@"http://192.168.0.13:3000/uploads" parameters:nil constructingBodyWithBlock: ^(id <AFMultipartFormData>formData) {
        [formData appendPartWithFileData:imageData name:@"upload" fileName:@"photoo.jpg" mimeType:@"image/jpg"];
        
    }];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation
                                         JSONRequestOperationWithRequest:request
                                         success:success
                                         failure:failure];
    
    [operation setUploadProgressBlock:progress];
    
    
    [httpClient enqueueHTTPRequestOperation:operation];
}




@end
