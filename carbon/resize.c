#include <Carbon/Carbon.h>
#include <stdlib.h>  // for strtol

static bool amIAuthorized ()
{
    if (AXAPIEnabled() != 0) {
        return true;
    }
    if (AXIsProcessTrusted() != 0) {
        return true;
    }
    return false;
}

static AXUIElementRef getFrontMostApp ()
{
    pid_t pid;
    ProcessSerialNumber psn;

    GetFrontProcess(&psn);
    GetProcessPID(&psn, &pid);
    return AXUIElementCreateApplication(pid);
}

int main ( int argc, char ** argv) {
    int i;
    AXValueRef temp;
    CGSize windowSize;
    CGPoint windowPosition;
    CFStringRef windowTitle;
    AXUIElementRef frontMostApp;
    AXUIElementRef frontMostWindow;

    int width = strtol(argv[1], NULL, 10);
    int height = strtol(argv[2], NULL, 10);

    if (!amIAuthorized()) {
        printf("Can't use accessibility API!\n");
        return 1;
    }

    frontMostApp = getFrontMostApp();

    AXUIElementCopyAttributeValue( frontMostApp, kAXFocusedWindowAttribute, (CFTypeRef *)&frontMostWindow );
    AXUIElementCopyAttributeValue( frontMostWindow, kAXTitleAttribute, (CFTypeRef *)&windowTitle );
    AXUIElementCopyAttributeValue( frontMostWindow, kAXSizeAttribute, (CFTypeRef *)&temp );

    AXValueGetValue(temp, kAXValueCGSizeType, &windowSize);
    CFRelease(temp);

    AXUIElementCopyAttributeValue( frontMostWindow, kAXPositionAttribute, (CFTypeRef *)&temp );
    AXValueGetValue(temp, kAXValueCGPointType, &windowPosition);
    CFRelease(temp);

    printf("\n");
    CFShow(windowTitle);
    printf("Window is at (%f, %f) and has dimension of (%f, %f)\n",
        windowPosition.x,
        windowPosition.y,
        windowSize.width,
        windowSize.height);

    int origWidth = windowSize.width;
    int origHeight = windowSize.height;

    // Update size
    windowSize.width = width;
    windowSize.height = height;
    temp = AXValueCreate(kAXValueCGSizeType, &windowSize);
    AXUIElementSetAttributeValue(frontMostWindow,kAXSizeAttribute, temp);
    CFRelease(temp);

    // Move
    windowPosition.x += (origWidth - width) / 2;
    windowPosition.y += (origHeight - height) / 2;
    temp = AXValueCreate(kAXValueCGPointType, &windowPosition);
    AXUIElementSetAttributeValue(frontMostWindow, kAXPositionAttribute, temp);
    CFRelease(temp);

    CFRelease(frontMostWindow);
    CFRelease(frontMostApp);
    return 0;
}