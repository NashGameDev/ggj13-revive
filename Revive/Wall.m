#import "Wall.h"
#import "MainLayer.h"

@implementation Wall
@synthesize sprite = _sprite;
@synthesize collisionRect = _collisionRect;

-(id)CreateFromSelf:(CGPoint)pos mainLayer:(MainLayer *)mainLayer
{
    Wall *wall = [[Wall alloc] init];
    wall.sprite = [CCSprite spriteWithFile:@"brick.png"];
    wall.sprite.position = pos;
    wall.spriteRect = self.spriteRect;
    wall.collisionRect = CGRectOffset(CGRectMake(0, 0, 32, 32), pos.x-16, pos.y - 16);
    
    //CCSpriteFrame *spriteFrame = [CCSpriteFrame frameWithTextureFilename:@"spritesheet.png" rect: self.spriteRect];
    
    
    [mainLayer addChild:wall.sprite];
    
    return wall;
}

-(id)initForList:(CGRect)spriteRect
{
    if ((self = [super init]))
    {
        self.spriteRect = spriteRect;
    }
    return self;
}

@end
