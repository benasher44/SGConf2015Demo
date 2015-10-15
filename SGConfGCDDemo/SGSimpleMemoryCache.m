//
//  SGSimpleMemoryCache.m
//  SGConfGCDDemo
//
//  Created by Ben Asher on 10/13/15.
//

#import "SGSimpleMemoryCache.h"

#import <UIKit/UIKit.h>

@interface SGSimpleMemoryCache ()

@property (strong, nonatomic) NSMutableDictionary *cache; // Not-thread safe, need to protect this

@end

@implementation SGSimpleMemoryCache

/*
 Requirements for cache:
 - Access to self.cache should be thread-safe
 - Should minimize blocking the main thread
 */

- (instancetype)init {
  if (self = [super init]) {
    _cache = [NSMutableDictionary dictionary];
    
    // Listen for memory warnings
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveMemoryWarning)
                                                 name:UIApplicationDidReceiveMemoryWarningNotification
                                               object:nil];
  }
  return self;
}

- (void)setObject:(id)object forKey:(nonnull NSString *)key {
  [self.cache setObject:object forKey:key];
}

- (id)objectForKey:(nonnull NSString *)key {
  return [self.cache objectForKey:key];
}

- (void)didReceiveMemoryWarning {
  [self.cache removeAllObjects];
}


@end
