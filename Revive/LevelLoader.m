#import "LevelLoader.h"

@implementation LevelLoader

+(void)LoadLevel:(NSMutableArray *)walls updateableObjects:(NSMutableArray *)updateableObjects filename:(NSString *)filename
{
    if(walls)
        [walls removeAllObjects];
    else walls = [[NSMutableArray alloc] init];
    
    if(updateableObjects)
        [updateableObjects removeAllObjects];
    else updateableObjects = [[NSMutableArray alloc] init];
    
    NSFileHandle* file = [NSFileHandle fileHandleForReadingAtPath:filename];
    if(file)
    {
        NSData* buffer;
        buffer = [file readDataToEndOfFile];
        int index = 0;
        
        while(index < [buffer length])
        {
            Byte ID;
            [buffer getBytes:&ID range:NSMakeRange(index, 1)];
            if(ID == 122)
            {
                index++;
                isBuildingWorldBodies = true;
                continue;
            }
            
            int x;
            [buffer getBytes:&x range:NSMakeRange(index + 1, 4)];
            
            int y;
            [buffer getBytes:&y range:NSMakeRange(index + 5, 4)];
            
            index += 9;
            
            //Converts the byte ordering appropriateley
            if (CFByteOrderGetCurrent() == CFByteOrderBigEndian)
            {
                x = CFSwapInt32(x);
                y = CFSwapInt32(y);
            }
            
            
        }
        [file closeFile];
    }
}

@end
