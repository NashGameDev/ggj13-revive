#import "LevelLoader.h"
#import "MainLayer.h"
#import "Wall.h"
#import "Player.h"
#import "Heart.h"
#import "ObjectList.h"
#import "MainLayer.h"

@implementation LevelLoader

+(void)LoadLevel:(NSMutableArray *)walls updateableOjects:(NSMutableArray *)updateableObjects player:(Player *)player mainLayer:(MainLayer *)mainLayer filename:(NSString *)filename
{
    mainLayer.heartsInRoomAtStart = 0;
    
    if(walls)
        [walls removeAllObjects];
    else walls = [[NSMutableArray alloc] init];
    
    if(updateableObjects)
        [updateableObjects removeAllObjects];
    else updateableObjects = [[NSMutableArray alloc] init];
    NSLog(@"load");
    NSFileHandle* file = [NSFileHandle fileHandleForReadingAtPath:filename];
    if(file)
    {
        NSLog(@"file good");
        NSData* buffer;
        buffer = [file readDataToEndOfFile];
        int index = 0;
        
        CGRect screenSize = [MainLayer screenSize];
        
        int x = 0;
        int y = screenSize.size.height / 32;
        
        while(index < [buffer length])
        {
            Byte ID;
            [buffer getBytes:&ID range:NSMakeRange(index, 1)];
            
            id object = [ObjectList CreateFromID:(char)ID pos:ccp((x * 32) - 16, (y * 32) + 16) mainLayer: mainLayer];
            if(object)
            {
                if ([object isKindOfClass:[Wall class]])
                {
                    [walls addObject:object];
                }
                else if([object isKindOfClass:[Player class]])
                {
                    player = (Player *)object;
                }
                else
                {
                    [updateableObjects addObject:object];
                }
            }
            
            x += 1;
            if(x > screenSize.size.width / 32)
            {
                x = 0;
                y -= 1;
            }
            index += 1;
        }
        [file closeFile];
    }
    
    for (Heart *heart in updateableObjects)
    {
       mainLayer.heartsInRoomAtStart += 1;
    }
}

@end
