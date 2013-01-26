#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Prefab.h"

@interface Wall : NSObject<Prefab>

@property(nonatomic, retain)CCSprite *sprite;
@property(nonatomic, assign)CGRect collisionRect;
@property(nonatomic, assign)CGRect spriteRect;

-(id)initForList: (CGRect)spriteRect;

@end
