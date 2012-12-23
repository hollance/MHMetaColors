
#import <objc/runtime.h>
#import "NSObject+ISSwizzling.h"

@implementation NSObject (ISSwizzling)

+ (BOOL)swizzleMethod:(SEL)origSelector withMethod:(SEL)newSelector
{
	Method origMethod = class_getInstanceMethod(self, origSelector);
	Method newMethod = class_getInstanceMethod(self, newSelector);

	if (origMethod && newMethod)
	{
		if (class_addMethod(self, origSelector, method_getImplementation(newMethod), method_getTypeEncoding(newMethod)))
		{
			class_replaceMethod(self, newSelector, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
		}
		else
		{
			method_exchangeImplementations(origMethod, newMethod);
		}
		return YES;
	}
	return NO;
}

+ (BOOL)swizzleClassMethod:(SEL)origSelector withMethod:(SEL)newSelector
{
	Method origMethod = class_getClassMethod(self, origSelector);
	Method newMethod = class_getClassMethod(self, newSelector);

	Class class = object_getClass((id)self);

	if (origMethod && newMethod)
	{
		if (class_addMethod(class, origSelector, method_getImplementation(newMethod), method_getTypeEncoding(newMethod)))
		{
			class_replaceMethod(class, newSelector, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
		}
		else
		{
			method_exchangeImplementations(origMethod, newMethod);
		}
		return YES;
	}
	return NO;
}

@end
