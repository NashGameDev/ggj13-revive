#import <Foundation/Foundation.h>
#import "Player.h"
#import "MainLayer.h"

@interface LevelLoader : NSObject

+(void)LoadLevel:(NSMutableArray *)walls updateableOjects:(NSMutableArray *)updateableObjects player:(Player *)player mainLayer:(MainLayer *)mainLayer filename:(NSString *)filename;

@end
