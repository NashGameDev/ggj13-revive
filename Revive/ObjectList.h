#import <Foundation/Foundation.h>

@interface ObjectList : NSObject

+(void)CreateList;
+(id)CreateFromID: (Byte)ID pos: (CGPoint)pos;
+(void)ReleaseList;

@end
