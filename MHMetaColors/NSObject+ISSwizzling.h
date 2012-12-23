
/*
 * Category for swizzling method implementations.
 *
 * From code by Ivan Vučica.
 */
@interface NSObject (ISSwizzling)

+ (BOOL)swizzleMethod:(SEL)origSelector withMethod:(SEL)newSelector;
+ (BOOL)swizzleClassMethod:(SEL)origSelector withMethod:(SEL)newSelector;

@end
