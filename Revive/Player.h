#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Prefab.h"

@class MainLayer;

@interface Player : NSObject<Prefab>

@property(nonatomic, retain)CCSprite *sprite;
@property(nonatomic, assign)float x;
@property(nonatomic, assign)float y;
@property(nonatomic, assign)BOOL falling;
@property(nonatomic, assign)BOOL jumping;
@property(nonatomic, assign)float velocityX;
@property(nonatomic, assign)float velocityY;
@property(nonatomic, assign)BOOL affectedByGravity;
@property(nonatomic, assign)MainLayer *mainLayer;
@property(nonatomic, assign)float aliveAmount;

-(void)Update;
-(void)MoveRight;
-(void)MoveLeft;
-(void)MoveUp;
-(void)MoveDown;
-(void)LoseHearts;
-(void)Jump;


-(id)initWithPos: (CGPoint)pos mainLayer: (MainLayer *)mainLayer;
-(id)initForList;

@end
