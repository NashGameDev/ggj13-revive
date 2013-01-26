#import "MainLayer.h"
#import "ObjectList.h"
@implementation MainLayer

@synthesize walls = _walls;

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	
	MainLayer *layer = [MainLayer node];
	
	[scene addChild: layer];
	
	return scene;
}

-(id) init
{
	if( (self=[super init]))
    {
        [ObjectList CreateList];
        self.walls = [[NSMutableArray alloc] init];
	}
	return self;
}

- (void) dealloc
{
    [ObjectList ReleaseList];
    [self.walls dealloc];
    
	[super dealloc];
}
@end

