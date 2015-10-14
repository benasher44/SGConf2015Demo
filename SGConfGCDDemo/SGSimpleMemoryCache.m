//
//  SGSimpleMemoryCache.m
//  SGConfGCDDemo
//
//  Created by Ben Asher on 10/13/15.
//

#import "SGSimpleMemoryCache.h"

@interface SGSimpleMemoryCache ()

@property (strong, nonatomic) NSMutableDictionary *cache; // Not-thread safe, need to protect this

@end

@implementation SGSimpleMemoryCache

- (instancetype)init {
  if (self = [super init]) {
    _cache = [NSMutableDictionary dictionary];
  }
  return self;
}

- (void)setObject:(id)object forKey:(nonnull NSString *)key {
  [self.cache setObject:object forKey:key];
}

- (id)objectForKey:(nonnull NSString *)key {
  return [self.cache objectForKey:key];
}


@end
