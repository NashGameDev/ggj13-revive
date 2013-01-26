#import <Foundation/Foundation.h>
#import "Prefab.h"
#import "cocos2d.h"
#import "MainLayer.h"

@interface Heart : NSObject<Prefab>

@property(nonatomic, retain)CCSprite *sprite;
@property(nonatomic, assign)MainLayer *mainLayer;

-(id)initWithPos: (CGPoint)pos mainLayer: (MainLayer *)mainLayer;
-(id)initForList;

@end
