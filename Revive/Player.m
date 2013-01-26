#import "Player.h"
#define PLAYER_GRAVITY 0.2f
#define PLAYER_HORIZ_SPEED 0.2f
#define PLAYER_MAX_HORIZ_SPEED 2.0f
#define PLAYER_WIDTH 32.0f
#define PLAYER_HEIGHT 32.0f

@implementation Player

@synthesize sprite = _sprite;
@synthesize x = _x;
@synthesize y = _y;
@synthesize jumping = _jumping;
@synthesize falling = _falling;
@synthesize velocityX = _velocityX;
@synthesize velocityY = _velocityY;
@synthesize affectedByGravity = _affectedByGravity;
@synthesize mainLayer = _mainLayer;

-(void)setX:(float)x
{
    if(self.sprite)
        self.sprite.position = ccp(x, self.sprite.position.y);
}

-(void)setY:(float)y
{
    if(self.sprite)
        self.sprite.position = ccp(self.sprite.position.x, y);
}

-(float)x
{
    return self.sprite.position.x;
}

-(float)y
{
    return self.sprite.position.y;
}

-(void)MoveRight
{
    self.velocityX += PLAYER_HORIZ_SPEED;
    if(self.velocityX > PLAYER_MAX_HORIZ_SPEED)
        self.velocityX = PLAYER_MAX_HORIZ_SPEED;
}

-(void)MoveLeft
{
    self.velocityX -= PLAYER_HORIZ_SPEED;
    if(self.velocityX < -PLAYER_MAX_HORIZ_SPEED)
        self.velocityX = -PLAYER_MAX_HORIZ_SPEED;
}

-(void)Update
{
    //Check to see if he can fall
    if (!self.falling && !self.jumping)
    {
        CGRect collisionRect = CGRectMake(self.x, self.y, PLAYER_WIDTH, PLAYER_HEIGHT);
        for (Wall *wall in)
        {
        }
    }
}

-(id)initWithPos:(CGPoint)pos mainLayer:(MainLayer *)mainLayer
{
    self.mainLayer = mainLayer;
    self.sprite = []
    self.x = pos.x;
    self.y = pos.y;
}

@end
