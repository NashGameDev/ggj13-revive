#import <Foundation/Foundation.h>
#import "Prefab.h"
#import "cocos2d.h"
#import "MainLayer.h"

@interface Heart : NSObject<Prefab>

@property(nonatomic, retain)CCSprite *sprite;
@property(nonatomic, assign)MainLayer *mainLayer;
@property(nonatomic, assign)CGPoint startPoint;
@property(nonatomic, assign)BOOL canGrab;

-(id)initWithPos: (CGPoint)pos mainLayer: (MainLayer *)mainLayer;
-(id)initForList;

@end
