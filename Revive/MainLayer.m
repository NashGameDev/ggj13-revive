#import "MainLayer.h"
#import "ObjectList.h"
@implementation MainLayer

@synthesize walls = _walls;
@synthesize player = _player;
@synthesize spriteBatch = _spriteBatch;

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	
	MainLayer *layer = [MainLayer node];
	
	[scene addChild: layer];
	
	return scene;
}

-(void)tick: (ccTime)dt
{
    
}

-(id) init
{
	if( (self=[super init]))
    {
        [ObjectList CreateList];
        
        self.walls = [[NSMutableArray alloc] init];
        self.objects = [[NSMutableArray alloc] init];
        
        self.spriteBatch = [CCSpriteBatchNode batchNodeWithFile:@"spritesheet.png"];
        [self addChild:self.spriteBatch];
        
        [self schedule:@selector(tick:)];
    }
	return self;
}

- (void) dealloc
{
    [ObjectList ReleaseList];
    [self.walls dealloc];
    [self.spriteBatch release];
    
	[super dealloc];
}
@end

