#import "cocos2d.h"
#import "Player.h"

@interface MainLayer : CCLayer
{
}
@property(nonatomic, retain)NSMutableArray *walls;
@property(nonatomic, retain)Player *player;

+(CCScene *) scene;

@end
