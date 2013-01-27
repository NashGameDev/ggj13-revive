#import "MainLayer.h"
#import "LevelLoader.h"
#import "ObjectList.h"

@implementation MainLayer

@synthesize walls = _walls;
@synthesize player = _player;
@synthesize spriteBatch = _spriteBatch;
@synthesize heartsInRoomAtStart = _heartsInRoomAtStart;

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	
	MainLayer *layer = [MainLayer node];
	
	[scene addChild: layer];
	
	return scene;
}

+(CGRect)screenSize
{
    return CGRectMake(0, 0, 480, 320);
}

static float deltaTime = 0;

-(void)tick: (ccTime)dt
{
    deltaTime += dt;
    while (deltaTime >= 1/30.0f)
    {
        deltaTime -= 1/30.0f;
        [self.player Update];
        for(id object in self.objects)
        {
            [object Update];
        }
    }
}

-(id) init
{
	if((self=[super init]))
    {
        [ObjectList CreateList];
        
        self.walls = [[NSMutableArray alloc] init];
        self.objects = [[NSMutableArray alloc] init];
        
        //self.spriteBatch = [CCSpriteBatchNode batchNodeWithFile:@"spritesheet.png"];
        //[self addChild:self.spriteBatch];
        
        //[LevelLoader LoadLevel:self.walls updateableOjects:self.objects player:self.player mainLayer:self filename:[[NSBundle mainBundle] pathForResource:@"level1" ofType:@".lvl"]];
        NSString *filename = [[NSBundle mainBundle] pathForResource:@"level1" ofType:@"lvl"];
        
        [LevelLoader LoadLevel:self.walls updateableOjects:self.objects player:self.player mainLayer:self filename:filename];
        
        [self schedule:@selector(tick:)];
    }
	return self;
}

- (void) dealloc
{
    [ObjectList ReleaseList];
    [self.objects release];
    [self.walls release];
    [self.spriteBatch release];
    
	[super dealloc];
}
@end

