# UIColor+MHMetaColors

This is a silly example of meta programming with the Objective-C runtime. The MHMetaColors category adds methods to `UIColor` during runtime for any new colors that you request.

For example, you can now do `[UIColor xRRGGBB]` where `RRGGBB` are the hex values of the new color:

    UIColor *myColor = [UIColor xFF3399];

This dynamically adds the class method `xFF3399` to `UIColor` and returns the color value you requested. Other possibilities are: `xRRGGBBAA`, `xRGBA`, and `xRGB`.

In addition, you can do `[UIColor nameColor]` where `name` is a key in a dictionary. For example:

    UIColor *myColor = [UIColor atomicTangerineColor];

This is not one of the standard `UIColor` construction methods. There are a number of `UIColor` categories out there that add a ton of these additional colors as class methods, but MHMetaColors only adds the methods during runtime when they are first used.

NOTE: Under ARC using these "automatic methods" gives a compiler error (No known class method for selector); without ARC it is just a warning (Class method not found). I could not find a compiler flag to turn off this warning, other than "-w" on the entire file. So that limits the practical use of this category somewhat.
