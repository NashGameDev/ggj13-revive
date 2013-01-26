#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "MainLayer.h"

@interface Player : NSObject

@property(nonatomic, retain)CCSprite *sprite;
@property(nonatomic, assign)float x;
@property(nonatomic, assign)float y;
@property(nonatomic, assign)BOOL falling;
@property(nonatomic, assign)BOOL jumping;
@property(nonatomic, assign)float velocityX;
@property(nonatomic, assign)float velocityY;
@property(nonatomic, assign)BOOL affectedByGravity;
@property(nonatomic, assign)MainLayer *mainLayer;

-(void)Update;
-(void)MoveRight;
-(void)MoveLeft;
-(void)Jump;

-(id)initWithPos: (CGPoint)pos mainLayer: (MainLayer *)mainLayer;

@end
