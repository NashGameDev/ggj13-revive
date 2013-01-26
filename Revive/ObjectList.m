#import "ObjectList.h"
#import "Wall.h"
#import "Player.h"

@implementation ObjectList
static NSDictionary *list;

+(void)CreateList
{
    list = [[NSDictionary alloc] initWithObjectsAndKeys:
            [[Wall alloc] initForList:CGRectMake(0, 0, 32, 32)], @"#",
            [[Player alloc] initForList], @"@",
            nil];
}

+(void)ReleaseList
{
    [list release];
    list = nil;
}

+(id)CreateFromID:(char)ID pos: (CGPoint)pos mainLayer:(id)mainLayer
{
    NSLog(@"CreateFromID");
    return [[list objectForKey:[NSString stringWithFormat:@"%c", ID]] CreateFromSelf:pos mainLayer:mainLayer];
}

@end
