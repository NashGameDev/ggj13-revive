#import <Foundation/Foundation.h>
#import "MainLayer.h"

@interface ObjectList : NSObject

+(void)CreateList;
+(id)CreateFromID: (char)ID pos: (CGPoint)pos mainLayer:(MainLayer *)mainLayer;
+(void)ReleaseList;

@end
