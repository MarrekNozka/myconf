#include <X11/extensions/scrnsaver.h>
#include <stdio.h>


int getIdle(void) {
    Display *dpy = XOpenDisplay(NULL);

    if (!dpy) {
        return(1);
    }

    XScreenSaverInfo *info = XScreenSaverAllocInfo();
    XScreenSaverQueryInfo(dpy, DefaultRootWindow(dpy), info);
    return info->idle;
}

