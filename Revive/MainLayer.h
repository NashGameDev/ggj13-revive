#import "cocos2d.h"
#import "Player.h"

@interface MainLayer : CCLayer
{
}
@property(nonatomic, retain)NSMutableArray *objects;
@property(nonatomic, retain)NSMutableArray *walls;
@property(nonatomic, retain)Player *player;
@property(nonatomic, retain)CCSpriteBatchNode *spriteBatch;

+(CCScene *) scene;

@end
