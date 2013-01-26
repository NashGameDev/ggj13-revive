#import "ObjectList.h"
#import "Wall.h"

@implementation ObjectList
static NSArray *list;

+(void)CreateList
{
    list = [[NSArray alloc] initWithObjects:
            [[Wall alloc] initForList:CGRectMake(0, 0, 32, 32)],
            nil];
}

+(void)ReleaseList
{
    [list release];
    list = nil;
}

+(id)CreateFromID:(Byte)ID pos: (CGPoint)pos
{
    return [[list objectAtIndex:ID] CreateFromSelf:pos];
}

@end
