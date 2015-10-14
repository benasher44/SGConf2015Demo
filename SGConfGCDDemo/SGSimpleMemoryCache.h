//
//  SGSimpleMemoryCache.h
//  SGConfGCDDemo
//
//  Created by Ben Asher on 10/13/15.
//

#import <Foundation/Foundation.h>

@interface SGSimpleMemoryCache : NSObject

- (void)setObject:(nonnull id)object forKey:(nonnull NSString *)key;

- (nullable id)objectForKey:(nonnull NSString *)key;

@end
