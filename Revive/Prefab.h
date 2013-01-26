#import <Foundation/Foundation.h>

@protocol Prefab <NSObject>

@required
-(id)CreateFromSelf: (CGPoint)pos;

@end
