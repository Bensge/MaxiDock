#import <objc/runtime.h>
#import <UIKit/UIKit.h>

@interface SBIconController : NSObject {}
- (struct CGRect)_dockContainerViewFrameForCurrentOrientation;
@end

@interface SBDockIconListView {}
+ (unsigned int)iconRowsForInterfaceOrientation:(int)arg1;
+ (unsigned int)iconColumnsForInterfaceOrientation:(int)arg1;
- (float)topIconInset;
@end

@interface SBIconListView {}
- (struct CGSize)defaultIconSize;
- (unsigned int)iconRowsForCurrentOrientation;


@end

%hook SBIconController

- (struct CGRect)_dockContainerViewFrameForCurrentOrientation{
	

	return CGRectMake(0,300,320,180);
}

%end

%hook SBDockIconListView

+ (unsigned int)iconRowsForInterfaceOrientation:(int)arg1{
	
	return (unsigned int)2;
}

+ (unsigned int)iconColumnsForInterfaceOrientation:(int)arg1{
	return (unsigned int)5;
}

%end


%hook SBIconListView



+ (unsigned int)iconRowsForInterfaceOrientation:(int)arg1{
	
	return 3;
}



%end

/* How to Hook with Logos
Hooks are written with syntax similar to that of an Objective-C @implementation.
You don't need to #include <substrate.h>, it will be done automatically, as will
the generation of a class list and an automatic constructor.

%hook ClassName

// Hooking a class method
+ (id)sharedInstance {
	return %orig;
}

// Hooking an instance method with an argument.
- (void)messageName:(int)argument {
	%log; // Write a message about this call, including its class, name and arguments, to the system log.

	%orig; // Call through to the original function with its original arguments.
	%orig(nil); // Call through to the original function with a custom argument.

	// If you use %orig(), you MUST supply all arguments (except for self and _cmd, the automatically generated ones.)
}

// Hooking an instance method with no arguments.
- (id)noArguments {
	%log;
	id awesome = %orig;
	[awesome doSomethingElse];

	return awesome;
}

// Always make sure you clean up after yourself; Not doing so could have grave consequences!
%end
*/
