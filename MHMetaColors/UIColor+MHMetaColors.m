
#import <objc/runtime.h>
#import "UIColor+MHMetaColors.h"
#import "NSObject+ISSwizzling.h"

@implementation UIColor (MHMetaColors)

#define MAKE_COLOR(r, g, b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0f]

static NSDictionary *mh_colorDictionary(void)
{
	static dispatch_once_t pred;
	static NSDictionary *colorDictionary;
	dispatch_once(&pred, ^
	{
		// List of colors taken from:
		// http://iphonedevelopment.blogspot.nl/2008/11/more-colors-more-compact.html

		colorDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
			MAKE_COLOR(240, 248, 255), @"aliceBlue", 
			MAKE_COLOR(227, 38, 54), @"alizarin", 
			MAKE_COLOR(229, 43, 80), @"amaranth", 
			MAKE_COLOR(255, 191, 0), @"amber", 
			MAKE_COLOR(153, 102, 204), @"amethyst", 
			MAKE_COLOR(251, 206, 177), @"apricot", 
			MAKE_COLOR(0, 255, 255), @"aqua", 
			MAKE_COLOR(127, 255, 212), @"aquamarine", 
			MAKE_COLOR(75, 83, 32), @"armyGreen", 
			MAKE_COLOR(123, 160, 91), @"asparagus", 
			MAKE_COLOR(255, 153, 102), @"atomicTangerine", 
			MAKE_COLOR(111, 53, 26), @"auburn", 
			MAKE_COLOR(0, 127, 255), @"azure", 
			MAKE_COLOR(240, 255, 255), @"azureWeb", 
			MAKE_COLOR(224, 255, 255), @"babyBlue", 
			MAKE_COLOR(245, 245, 220), @"beige", 
			MAKE_COLOR(61, 43, 31), @"bistre", 
			MAKE_COLOR(0, 0, 0), @"black", 
			MAKE_COLOR(0, 0, 255), @"blue", 
			MAKE_COLOR(51, 51, 153), @"pigmentBlue", 
			MAKE_COLOR(2, 71, 254), @"rybBlue", 
			MAKE_COLOR(0, 223, 223), @"blueGreen", 
			MAKE_COLOR(138, 43, 226), @"blueViolet", 
			MAKE_COLOR(0, 149, 182), @"bondiBlue", 
			MAKE_COLOR(181, 166, 66), @"brass", 
			MAKE_COLOR(102, 255, 0), @"brightGreen", 
			MAKE_COLOR(255, 0, 127), @"brightPink", 
			MAKE_COLOR(8, 232, 222), @"brightTurquoise", 
			MAKE_COLOR(255, 85, 163), @"brilliantRose", 
			MAKE_COLOR(0, 66, 37), @"britishRacingGreen", 
			MAKE_COLOR(205, 127, 50), @"bronze", 
			MAKE_COLOR(150, 75, 0), @"brown", 
			MAKE_COLOR(240, 220, 130), @"buff", 
			MAKE_COLOR(128, 0, 32), @"burgundy", 
			MAKE_COLOR(204, 85, 0), @"burntOrange", 
			MAKE_COLOR(233, 116, 81), @"burntSienna", 
			MAKE_COLOR(138, 51, 36), @"burntUmber", 
			MAKE_COLOR(120, 134, 107), @"camouflageGreen", 
			MAKE_COLOR(89, 39, 32), @"caputMortuum", 
			MAKE_COLOR(196, 30, 58), @"cardinal", 
			MAKE_COLOR(150, 0, 24), @"carmine", 
			MAKE_COLOR(255, 166, 201), @"carnationPink", 
			MAKE_COLOR(156, 186, 227), @"carolinaBlue", 
			MAKE_COLOR(237, 145, 33), @"carrotOrange", 
			MAKE_COLOR(172, 225, 175), @"celadon", 
			MAKE_COLOR(222, 49, 99), @"cerise", 
			MAKE_COLOR(0, 123, 167), @"cerulean", 
			MAKE_COLOR(42, 82, 190), @"ceruleanBlue", 
			MAKE_COLOR(247, 231, 206), @"champagne", 
			MAKE_COLOR(70, 70, 70), @"charcoal", 
			MAKE_COLOR(223, 255, 0), @"chartreuse", 
			MAKE_COLOR(127, 255, 0), @"chartreuseWeb", 
			MAKE_COLOR(255, 183, 197), @"cherryBlossomPink", 
			MAKE_COLOR(205, 92, 92), @"chestnut", 
			MAKE_COLOR(123, 63, 0), @"chocolate", 
			MAKE_COLOR(227, 66, 52), @"cinnabar", 
			MAKE_COLOR(210, 105, 30), @"cinnamon", 
			MAKE_COLOR(0, 71, 171), @"cobalt", 
			MAKE_COLOR(155, 221, 255), @"columbiaBlue", 
			MAKE_COLOR(184, 115, 51), @"copper", 
			MAKE_COLOR(153, 102, 102), @"copperRose", 
			MAKE_COLOR(255, 127, 80), @"coral", 
			MAKE_COLOR(255, 64, 64), @"coralRed", 
			MAKE_COLOR(251, 236, 93), @"corn", 
			MAKE_COLOR(100, 149, 237), @"cornflowerBlue", 
			MAKE_COLOR(255, 248, 231), @"cosmicLatte", 
			MAKE_COLOR(255, 253, 208), @"cream", 
			MAKE_COLOR(220, 20, 60), @"crimson", 
			MAKE_COLOR(0, 255, 255), @"cyan", 
			MAKE_COLOR(0, 180, 247), @"processCyan", 
			MAKE_COLOR(0, 0, 139), @"darkBlue", 
			MAKE_COLOR(101, 67, 33), @"darkBrown", 
			MAKE_COLOR(8, 69, 126), @"darkCerulean", 
			MAKE_COLOR(152, 105, 96), @"darkChestnut", 
			MAKE_COLOR(205, 91, 69), @"darkCoral", 
			MAKE_COLOR(184, 134, 11), @"darkGoldenrod", 
			MAKE_COLOR(1, 50, 32), @"darkGreen", 
			MAKE_COLOR(189, 183, 107), @"darkKhaki", 
			MAKE_COLOR(3, 192, 60), @"darkPastelGreen", 
			MAKE_COLOR(231, 84, 128), @"darkPink", 
			MAKE_COLOR(86, 3, 125), @"darkScarlet", 
			MAKE_COLOR(233, 150, 122), @"darkSalmon", 
			MAKE_COLOR(47, 79, 79), @"darkSlateGray", 
			MAKE_COLOR(23, 114, 69), @"darkSpringGreen", 
			MAKE_COLOR(145, 129, 81), @"darkTan", 
			MAKE_COLOR(0, 206, 209), @"darkTurquoise", 
			MAKE_COLOR(148, 0, 211), @"darkViolet", 
			MAKE_COLOR(218, 50, 135), @"deepCerise", 
			MAKE_COLOR(185, 78, 72), @"deepChestnut", 
			MAKE_COLOR(193, 84, 193), @"deepFuchsia", 
			MAKE_COLOR(153, 85, 187), @"deepLilac", 
			MAKE_COLOR(204, 0, 204), @"deepMagenta", 
			MAKE_COLOR(255, 203, 164), @"deepPeach", 
			MAKE_COLOR(255, 20, 147), @"deepPink", 
			MAKE_COLOR(21, 96, 189), @"denim", 
			MAKE_COLOR(30, 144, 255), @"dodgerBlue", 
			MAKE_COLOR(194, 178, 128), @"ecru", 
			MAKE_COLOR(16, 52, 166), @"egyptianBlue", 
			MAKE_COLOR(125, 249, 255), @"electricBlue", 
			MAKE_COLOR(0, 255, 0), @"electricGreen", 
			MAKE_COLOR(102, 0, 255), @"electricIndigo", 
			MAKE_COLOR(204, 255, 0), @"electricLime", 
			MAKE_COLOR(191, 0, 255), @"electricPurple", 
			MAKE_COLOR(80, 200, 120), @"emerald", 
			MAKE_COLOR(97, 64, 81), @"eggplant", 
			MAKE_COLOR(128, 24, 24), @"faluRed", 
			MAKE_COLOR(79, 121, 66), @"fernGreen", 
			MAKE_COLOR(178, 34, 34), @"firebrick", 
			MAKE_COLOR(238, 220, 130), @"flax", 
			MAKE_COLOR(34, 139, 34), @"forestGreen", 
			MAKE_COLOR(246, 74, 138), @"frenchRose", 
			MAKE_COLOR(255, 0, 255), @"fuchsia", 
			MAKE_COLOR(255, 119, 255), @"fuchsiaPink", 
			MAKE_COLOR(228, 155, 15), @"gamboge", 
			MAKE_COLOR(212, 175, 55), @"metallicGold", 
			MAKE_COLOR(255, 215, 0), @"goldWeb", 
			MAKE_COLOR(153, 101, 21), @"goldenBrown", 
			MAKE_COLOR(255, 223, 0), @"goldenYellow", 
			MAKE_COLOR(218, 165, 32), @"goldenrod", 
			MAKE_COLOR(70, 89, 69), @"greyAsparagus", 
			MAKE_COLOR(0, 255, 0), @"green", 
			MAKE_COLOR(0, 128, 0), @"greenWeb", 
			MAKE_COLOR(0, 165, 80), @"pigmentGreen", 
			MAKE_COLOR(102, 176, 50), @"rybGreen", 
			MAKE_COLOR(173, 255, 47), @"greenYellow", 
			MAKE_COLOR(128, 128, 128), @"grey", 
			MAKE_COLOR(82, 24, 250), @"hanPurple", 
			MAKE_COLOR(63, 255, 0), @"harlequin", 
			MAKE_COLOR(223, 115, 255), @"heliotrope", 
			MAKE_COLOR(244, 0, 161), @"hollywoodCerise", 
			MAKE_COLOR(255, 0, 204), @"hotMagenta", 
			MAKE_COLOR(255, 105, 180), @"hotPink", 
			MAKE_COLOR(0, 65, 106), @"indigo", 
			MAKE_COLOR(75, 0, 130), @"indigoWeb", 
			MAKE_COLOR(0, 47, 167), @"internationalKleinBlue", 
			MAKE_COLOR(255, 79, 0), @"internationalOrange", 
			MAKE_COLOR(0, 153, 0), @"islamicGreen", 
			MAKE_COLOR(255, 255, 240), @"ivory", 
			MAKE_COLOR(0, 168, 107), @"jade", 
			MAKE_COLOR(76, 187, 23), @"kellyGreen", 
			MAKE_COLOR(195, 176, 145), @"khaki", 
			MAKE_COLOR(240, 230, 140), @"lightKhaki", 
			MAKE_COLOR(181, 126, 220), @"lavender", 
			MAKE_COLOR(230, 230, 250), @"lavenderWeb", 
			MAKE_COLOR(204, 204, 255), @"lavenderBlue", 
			MAKE_COLOR(255, 240, 245), @"lavenderBlush", 
			MAKE_COLOR(196, 195, 221), @"lavenderGrey", 
			MAKE_COLOR(238, 130, 238), @"lavenderMagenta", 
			MAKE_COLOR(251, 174, 210), @"lavenderPink", 
			MAKE_COLOR(150, 120, 182), @"lavenderPurple", 
			MAKE_COLOR(251, 160, 227), @"lavenderRose", 
			MAKE_COLOR(124, 252, 0), @"lawnGreen", 
			MAKE_COLOR(253, 233, 16), @"lemon", 
			MAKE_COLOR(255, 250, 205), @"lemonChiffon", 
			MAKE_COLOR(173, 216, 230), @"lightBlue", 
			MAKE_COLOR(255, 182, 193), @"lightPink", 
			MAKE_COLOR(200, 162, 200), @"lilac", 
			MAKE_COLOR(191, 255, 0), @"lime", 
			MAKE_COLOR(0, 255, 0), @"limeWeb", 
			MAKE_COLOR(50, 205, 50), @"limeGreen", 
			MAKE_COLOR(250, 240, 230), @"linen", 
			MAKE_COLOR(255, 0, 255), @"magenta", 
			MAKE_COLOR(202, 31, 23), @"magentaDye", 
			MAKE_COLOR(255, 0, 144), @"processMagenta", 
			MAKE_COLOR(170, 240, 209), @"magicMint", 
			MAKE_COLOR(248, 244, 255), @"magnolia", 
			MAKE_COLOR(11, 218, 81), @"malachite", 
			MAKE_COLOR(128, 0, 0), @"maroonWeb", 
			MAKE_COLOR(176, 48, 96), @"maroon", 
			MAKE_COLOR(115, 194, 251), @"mayaBlue", 
			MAKE_COLOR(224, 176, 255), @"mauve", 
			MAKE_COLOR(145, 95, 109), @"mauveTaupe", 
			MAKE_COLOR(0, 0, 205), @"mediumBlue", 
			MAKE_COLOR(175, 64, 53), @"mediumCarmine", 
			MAKE_COLOR(204, 153, 204), @"mediumLavenderMagenta", 
			MAKE_COLOR(147, 112, 219), @"mediumPurple", 
			MAKE_COLOR(0, 250, 154), @"mediumSpringGreen", 
			MAKE_COLOR(0, 51, 102), @"midnightBlue", 
			MAKE_COLOR(152, 255, 152), @"mintGreen", 
			MAKE_COLOR(255, 228, 225), @"mistyRose", 
			MAKE_COLOR(173, 223, 173), @"mossGreen", 
			MAKE_COLOR(153, 122, 141), @"mountbattenPink", 
			MAKE_COLOR(255, 219, 88), @"mustard", 
			MAKE_COLOR(33, 66, 30), @"myrtle", 
			MAKE_COLOR(255, 222, 173), @"navajoWhite", 
			MAKE_COLOR(0, 0, 128), @"navyBlue", 
			MAKE_COLOR(204, 119, 34), @"ochre", 
			MAKE_COLOR(0, 128, 0), @"officeGreen", 
			MAKE_COLOR(207, 181, 59), @"oldGold", 
			MAKE_COLOR(253, 245, 230), @"oldLace", 
			MAKE_COLOR(121, 104, 120), @"oldLavender", 
			MAKE_COLOR(192, 46, 76), @"oldRose", 
			MAKE_COLOR(128, 128, 0), @"olive", 
			MAKE_COLOR(107, 142, 35), @"oliveDrab", 
			MAKE_COLOR(154, 185, 115), @"olivine", 
			MAKE_COLOR(255, 127, 0), @"orange", 
			MAKE_COLOR(251, 153, 2), @"rybOrange", 
			MAKE_COLOR(255, 165, 0), @"orangeWeb", 
			MAKE_COLOR(255, 160, 0), @"orangePeel", 
			MAKE_COLOR(255, 69, 0), @"orangeRed", 
			MAKE_COLOR(218, 112, 214), @"orchid", 
			MAKE_COLOR(175, 238, 238), @"paleBlue", 
			MAKE_COLOR(152, 118, 84), @"paleBrown", 
			MAKE_COLOR(175, 64, 53), @"paleCarmine", 
			MAKE_COLOR(221, 173, 175), @"paleChestnut", 
			MAKE_COLOR(171, 205, 239), @"paleCornflowerBlue", 
			MAKE_COLOR(249, 132, 229), @"paleMagenta", 
			MAKE_COLOR(250, 218, 221), @"palePink", 
			MAKE_COLOR(219, 112, 147), @"paleRedViolet", 
			MAKE_COLOR(255, 239, 213), @"papayaWhip", 
			MAKE_COLOR(119, 221, 119), @"pastelGreen", 
			MAKE_COLOR(255, 209, 220), @"pastelPink", 
			MAKE_COLOR(255, 229, 180), @"peach", 
			MAKE_COLOR(255, 204, 153), @"peachOrange", 
			MAKE_COLOR(250, 223, 173), @"peachYellow", 
			MAKE_COLOR(209, 226, 49), @"pear", 
			MAKE_COLOR(204, 204, 255), @"periwinkle", 
			MAKE_COLOR(28, 57, 187), @"persianBlue", 
			MAKE_COLOR(0, 166, 147), @"persianGreen", 
			MAKE_COLOR(50, 18, 122), @"persianIndigo", 
			MAKE_COLOR(217, 144, 88), @"persianOrange", 
			MAKE_COLOR(204, 51, 51), @"persianRed", 
			MAKE_COLOR(247, 127, 190), @"persianPink", 
			MAKE_COLOR(254, 40, 162), @"persianRose", 
			MAKE_COLOR(236, 88, 0), @"persimmon", 
			MAKE_COLOR(1, 121, 111), @"pineGreen", 
			MAKE_COLOR(255, 192, 203), @"pink", 
			MAKE_COLOR(255, 153, 102), @"pinkOrange", 
			MAKE_COLOR(229, 228, 226), @"platinum", 
			MAKE_COLOR(204, 153, 204), @"plum", 
			MAKE_COLOR(176, 224, 230), @"powderBlue", 
			MAKE_COLOR(204, 136, 153), @"puce", 
			MAKE_COLOR(0, 49, 83), @"prussianBlue", 
			MAKE_COLOR(221, 0, 255), @"psychedelicPurple", 
			MAKE_COLOR(255, 117, 24), @"pumpkin", 
			MAKE_COLOR(128, 0, 128), @"purpleWeb", 
			MAKE_COLOR(160, 92, 240), @"purple", 
			MAKE_COLOR(80, 64, 77), @"purpleTaupe", 
			MAKE_COLOR(115, 74, 18), @"rawUmber", 
			MAKE_COLOR(227, 11, 92), @"razzmatazz", 
			MAKE_COLOR(255, 0, 0), @"red", 
			MAKE_COLOR(237, 28, 36), @"pigmentRed", 
			MAKE_COLOR(254, 39, 18), @"rybRed", 
			MAKE_COLOR(199, 21, 133), @"redBiolet", 
			MAKE_COLOR(215, 0, 64), @"richCarmine", 
			MAKE_COLOR(0, 204, 204), @"robinEggBlue", 
			MAKE_COLOR(255, 0, 127), @"rose", 
			MAKE_COLOR(227, 38, 54), @"roseMadder", 
			MAKE_COLOR(144, 93, 93), @"roseTaupe", 
			MAKE_COLOR(65, 105, 225), @"royalBlue", 
			MAKE_COLOR(107, 63, 160), @"royalPurple", 
			MAKE_COLOR(224, 17, 95), @"ruby", 
			MAKE_COLOR(128, 70, 27), @"russet", 
			MAKE_COLOR(183, 65, 14), @"rust", 
			MAKE_COLOR(255, 102, 0), @"safetyOrange", 
			MAKE_COLOR(255, 102, 0), @"blazeOrange", 
			MAKE_COLOR(244, 196, 48), @"saffron", 
			MAKE_COLOR(255, 140, 105), @"salmon", 
			MAKE_COLOR(244, 164, 96), @"sandyBrown", 
			MAKE_COLOR(146, 0, 10), @"sangria", 
			MAKE_COLOR(8, 37, 103), @"sapphire", 
			MAKE_COLOR(255, 36, 0), @"scarlet", 
			MAKE_COLOR(255, 216, 0), @"schoolBusYellow", 
			MAKE_COLOR(46, 139, 87), @"seaGreen", 
			MAKE_COLOR(255, 245, 238), @"seashell", 
			MAKE_COLOR(255, 186, 0), @"selectiveYellow", 
			MAKE_COLOR(112, 66, 20), @"sepia", 
			MAKE_COLOR(0, 158, 96), @"shamrockGreen", 
			MAKE_COLOR(252, 15, 192), @"shockingPink", 
			MAKE_COLOR(192, 192, 192), @"silver", 
			MAKE_COLOR(135, 206, 235), @"skyBlue", 
			MAKE_COLOR(112, 128, 144), @"slateGrey", 
			MAKE_COLOR(0, 51, 153), @"smalt", 
			MAKE_COLOR(167, 252, 0), @"springBud", 
			MAKE_COLOR(0, 255, 127), @"springGreen", 
			MAKE_COLOR(70, 130, 180), @"steelBlue", 
			MAKE_COLOR(210, 180, 140), @"tan", 
			MAKE_COLOR(242, 133, 0), @"tangerine", 
			MAKE_COLOR(255, 204, 0), @"tangerineYellow", 
			MAKE_COLOR(72, 60, 50), @"taupe", 
			MAKE_COLOR(208, 240, 192), @"teaGreen", 
			MAKE_COLOR(248, 131, 194), @"teaRoseOrange", 
			MAKE_COLOR(244, 194, 194), @"teaRose", 
			MAKE_COLOR(0, 128, 128), @"teal", 
			MAKE_COLOR(205, 87, 0), @"tawny", 
			MAKE_COLOR(226, 114, 91), @"terraCotta", 
			MAKE_COLOR(216, 191, 216), @"thistle", 
			MAKE_COLOR(255, 99, 71), @"tomato", 
			MAKE_COLOR(48, 213, 200), @"turquoise", 
			MAKE_COLOR(102, 2, 60), @"tyrianPurple", 
			MAKE_COLOR(18, 10, 143), @"ultramarine", 
			MAKE_COLOR(91, 146, 229), @"unitedNationsBlue", 
			MAKE_COLOR(197, 179, 88), @"vegasGold", 
			MAKE_COLOR(227, 66, 51), @"vermilion", 
			MAKE_COLOR(139, 0, 255), @"violet", 
			MAKE_COLOR(238, 130, 238), @"violetWeb", 
			MAKE_COLOR(2, 71, 54), @"rybViolet", 
			MAKE_COLOR(64, 130, 109), @"viridian", 
			MAKE_COLOR(245, 222, 179), @"wheat", 
			MAKE_COLOR(255, 255, 255), @"white", 
			MAKE_COLOR(201, 160, 220), @"wisteria", 
			MAKE_COLOR(255, 255, 0), @"yellow", 
			MAKE_COLOR(255, 239, 0), @"processYellow", 
			MAKE_COLOR(254, 254, 51), @"rybYellow", 
			MAKE_COLOR(154, 205, 50), @"yellowGreen", 
			MAKE_COLOR(235, 194, 175), @"zinnwaldite", 
			nil];
	});
	return colorDictionary;
}

static id mh_lookupColor(id self, SEL _cmd)
{
	NSString *selectorString = NSStringFromSelector(_cmd);
	NSString *colorName = [selectorString substringToIndex:[selectorString length] - 5];
	return [mh_colorDictionary() objectForKey:colorName];
}

static id mh_hexColor(id self, SEL _cmd)
{
	NSString *selectorString = NSStringFromSelector(_cmd);
	NSString *colorName = [selectorString substringFromIndex:1];
	NSUInteger length = [colorName length];

	unsigned int hexValue = 0;
	NSScanner *scanner = [NSScanner scannerWithString:colorName];
	[scanner scanHexInt:&hexValue];

	int r = 0;
	int g = 0;
	int b = 0;
	int a = 255;

	if (length == 3)       // RGB
	{
		r = ((hexValue >> 8) & 0x0F);
		g = ((hexValue     ) & 0xF0) >> 4;
		b = ((hexValue     ) & 0x0F);

		r = (r << 4) + r;
		g = (g << 4) + g;
		b = (b << 4) + b;
	}
	else if (length == 4)  // RGBA
	{
		r = ((hexValue >> 8) & 0xF0) >> 4;
		g = ((hexValue >> 8) & 0x0F);
		b = ((hexValue     ) & 0xF0) >> 4;
		a = ((hexValue     ) & 0x0F);

		r = (r << 4) + r;
		g = (g << 4) + g;
		b = (b << 4) + b;
		a = (a << 4) + a;
	}
	else if (length == 6)  // RRGGBB
	{
		r = ((hexValue >> 16) & 0xFF);
		g = ((hexValue >>  8) & 0xFF);
		b = ((hexValue      ) & 0xFF);
	}
	else if (length == 8)  // RRGGBBAA
	{
		r = ((hexValue >> 24) & 0xFF);
		g = ((hexValue >> 16) & 0xFF);
		b = ((hexValue >>  8) & 0xFF);
		a = ((hexValue      ) & 0xFF);
	}

	return [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a/255.0f];
}

+ (BOOL)mh_resolveClassMethod:(SEL)sel
{
	NSString *selectorString = NSStringFromSelector(sel);

	if ([selectorString hasSuffix:@"Color"])
	{
		NSString *selfClassName = NSStringFromClass([self class]);
		Class selfMetaClass = objc_getMetaClass([selfClassName UTF8String]);
		class_addMethod(selfMetaClass, sel, (IMP)mh_lookupColor, "@@:");
		return YES;
	}
	else if ([selectorString hasPrefix:@"x"])
	{
		NSString *selfClassName = NSStringFromClass([self class]);
		Class selfMetaClass = objc_getMetaClass([selfClassName UTF8String]);
		class_addMethod(selfMetaClass, sel, (IMP)mh_hexColor, "@@:");
		return YES;
	}

	return [self mh_resolveClassMethod:sel];
}

+ (void)load
{
	// It's not a good idea to simply override resolveClassMethod: in a
	// category, in case the original class also has placed this method
	// in a category of its own. There is no guarantee which of these two
	// methods will "win". Therefore, it's safer to swizzle.

	[self swizzleClassMethod:@selector(resolveClassMethod:) withMethod:@selector(mh_resolveClassMethod:)];
}

@end
