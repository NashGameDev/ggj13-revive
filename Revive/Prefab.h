#import <Foundation/Foundation.h>
@class MainLayer;

@protocol Prefab <NSObject>

@required
-(id)CreateFromSelf:(CGPoint)pos mainLayer:(MainLayer *)mainLayer;

@end
