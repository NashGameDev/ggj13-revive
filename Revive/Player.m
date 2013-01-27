#import "Player.h"
#import "Wall.h"
#import "MainLayer.h"
#import "Heart.h"
#import "Spike.h"

#define PLAYER_GRAVITY 0.2f
#define PLAYER_SPEED 0.2f
#define PLAYER_MAX_SPEED 2.0f
#define PLAYER_WIDTH 32.0f
#define PLAYER_HEIGHT 64.0f
#define PLAYER_JUMP_SPEED 6.0f

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
    self.velocityX += PLAYER_SPEED;
    if(self.velocityX > PLAYER_MAX_SPEED)
        self.velocityX = PLAYER_MAX_SPEED;
}

-(void)MoveLeft
{
    self.velocityX -= PLAYER_SPEED;
    if(self.velocityX < -PLAYER_MAX_SPEED)
        self.velocityX = -PLAYER_MAX_SPEED;
}

-(void)MoveUp
{
    if(self.affectedByGravity)
        return;
    
    self.velocityY += PLAYER_SPEED;
    if(self.velocityY > PLAYER_MAX_SPEED)
        self.velocityY = PLAYER_MAX_SPEED;
}

-(void)MoveDown
{
    if(self.affectedByGravity)
        return;
    
    self.velocityY -= PLAYER_SPEED;
    if(self.velocityY < -PLAYER_MAX_SPEED)
        self.velocityY = -PLAYER_MAX_SPEED;
}

-(void)Jump
{
    self.velocityY = -PLAYER_JUMP_SPEED;
    self.jumping = true;
}

-(void)Update
{
    //Check to see if he can fall
    if (!self.falling && !self.jumping)
    {
        CGRect collisionRect = CGRectOffset(CGRectMake(0, 1, PLAYER_WIDTH, PLAYER_HEIGHT), self.x-PLAYER_WIDTH / 2, self.y - (PLAYER_HEIGHT / 2));
        BOOL canFall = true;
        for (Wall *wall in self.mainLayer.walls)
        {
            if(CGRectIntersectsRect(collisionRect, wall.collisionRect))
            {
                NSLog(@"collide");
                canFall = false;
            }
        }
        if(canFall)
            self.falling = true;
    }
    if(self.falling && self.affectedByGravity)
    {
        self.velocityY -= PLAYER_GRAVITY;
    }
    
    
    //Falling and Jumping collision check
    if(self.velocityY != 0)
    {
       CGRect collisionRect = CGRectOffset(CGRectMake(0, self.velocityY, PLAYER_WIDTH, PLAYER_HEIGHT), self.x-(PLAYER_WIDTH / 2), self.y - (PLAYER_HEIGHT / 2));
        
        BOOL canMove = true;
        for (Wall *wall in self.mainLayer.walls)
        {
            if(CGRectIntersectsRect(collisionRect, wall.collisionRect))
            {
                //Falling collide
                if(self.velocityY < 0)
                {
                    canMove = false;
                    self.falling = false;
                    self.velocityY = 0;
                    self.y = wall.sprite.position.y + (wall.collisionRect.size.height / 2) + (PLAYER_HEIGHT / 2) + 1;
                }
                //Jumping collide
                else
                {
                    canMove = false;
                    self.jumping = false;
                    self.falling = true;
                    self.velocityY = 0;
                    self.y = wall.sprite.position.y - (wall.collisionRect.size.height / 2) - (PLAYER_HEIGHT / 2) - 1;
                }
                break;
            }
        }
        if(canMove)
        {
            self.y += self.velocityY;
        }
    }
    if(self.velocityX != 0)
    {
        CGRect collisionRect = CGRectOffset(CGRectMake(-self.velocityX, 0, PLAYER_WIDTH, PLAYER_HEIGHT), self.x-(PLAYER_WIDTH / 2), self.y - PLAYER_HEIGHT / 2);
        
        BOOL canMove = true;
        for (Wall *wall in self.mainLayer.walls)
        {
            if(CGRectIntersectsRect(collisionRect, wall.collisionRect))
            {
                //Moving left collide
                if(self.velocityX < 0)
                {
                    NSLog(@"collide left");
                    canMove = false;
                    self.velocityX = 0;
                    self.x = wall.sprite.position.x + 16 + (PLAYER_WIDTH / 2) + 1;
                }
                //Moving right collide
                else
                {
                    canMove = false;
                    self.velocityX = 0;
                    self.x = wall.sprite.position.x - 16 - (PLAYER_WIDTH / 2) - 1;
                }
            }
        }
        if(canMove)
        {
            self.x += self.velocityX;
        }
    }
    CGRect collisionRect = CGRectOffset(CGRectMake(0, 0, PLAYER_WIDTH, PLAYER_HEIGHT), self.x-PLAYER_WIDTH / 2, self.y - PLAYER_HEIGHT / 2);
    
    //Checks for heart collisions
    for (Heart *heart in self.mainLayer.objects)
    {
        if(heart.sprite.visible)
        {
            CGRect heartRect = CGRectMake(heart.sprite.position.x - 16, heart.sprite.position.y + 16, 32, 32);
            
            if(CGRectIntersectsRect(heartRect, collisionRect))
            {
                heart.sprite.visible = false;
                self.mainLayer.lifeGained = 0;
            }
        }
    }
    
    //Spike collisions
    for (Spike *spike in self.mainLayer.objects)
    {
        CGRect spikeRect = CGRectMake(spike.sprite.position.x - 16, spike.sprite.position.y + 16, 32, 32);
        
        if(CGRectIntersectsRect(spikeRect, collisionRect))
        {
            [self LoseHearts];
            
        }
    }
}

-(void)LoseHearts
{
    for (Heart *heart in self.mainLayer.objects)
    {
        if(!heart.sprite.visible)
        {
            heart.sprite.visible = true;
            [heart resetPos];
        }
    }
}

-(id)initForList
{
    return self;
}

-(id)CreateFromSelf:(CGPoint)pos mainLayer:(MainLayer *)mainLayer
{
    return (self = [self initWithPos:pos mainLayer: mainLayer]);
}

-(id)initWithPos:(CGPoint)pos mainLayer:(MainLayer *)mainLayer
{
    self.mainLayer = mainLayer;
    CCSpriteFrame *spriteFrame = [CCSpriteFrame frameWithTextureFilename:@"dude1.png" rect:CGRectMake(0, 0, 32, 64)];
    self.sprite = [CCSprite spriteWithSpriteFrame:spriteFrame];
    self.x = pos.x;
    self.y = pos.y;
    self.affectedByGravity = true;
    [mainLayer addChild:self.sprite];
    
    return self;
}

@end
