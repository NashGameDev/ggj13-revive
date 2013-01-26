#import "Heart.h"

@implementation Heart
@synthesize sprite = _sprite;

-(void)Update
{
}

-(id)initWithPos:(CGPoint)pos mainLayer:(MainLayer *)mainLayer
{
    if((self = [super init]))
    {
        self.sprite = [CCSprite spriteWithFile:@"heart.png"];
        self.sprite.position = pos;
        self.startPoint = pos;
        self.mainLayer = mainLayer;
        self.canGrab = true;
        [mainLayer addChild:self.sprite];
    }
    return self;
}

-(id)CreateFromSelf:(CGPoint)pos mainLayer:(MainLayer *)mainLayer
{
    return [[Heart alloc] initWithPos:pos mainLayer:mainLayer];
}

-(id)initForList
{
    return (self = [super init]);
}

@end
