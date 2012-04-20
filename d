[33mcommit 6498c5bc299b66d4b024e792b8afd72b9a048ae6[m
Author: Yorke Lee <yorke_rulez@yahoo.com>
Date:   Thu Apr 19 19:13:49 2012 -0700

    Successfully integrated pthreads into Mupdf. Single thread renders half a page

[33mcommit e6b8d0c6b1809e012da290202108f1ac76153774[m
Author: Robin Watts <robin.watts@artifex.com>
Date:   Tue Apr 10 13:42:40 2012 +0100

    Add fz_new_draw_device_with_bbox function
    
    Restricts rendering to a sub rectangle of the supplied bbox.

[33mcommit ed187a8bd9340788bca2ee84b93c965f38c8821f[m
Author: Robin Watts <robin.watts@artifex.com>
Date:   Mon Apr 9 16:44:21 2012 +0100

    Fix use of uninitialised variable.
    
    In my previous commit, I forgot to initialise the variable before
    using it. Thanks to Bas Weelinck for spotting this.

[33mcommit 3c1654b2db5866394476de4fc0dff80e055bc376[m
Author: Robin Watts <robin.watts@artifex.com>
Date:   Mon Apr 9 13:02:59 2012 +0100

    Bug 692979: Fix race condition in thread debugging.
    
    Bas Weelinck points out a potential problem with multiple threads
    starting up at the same time, running into a race condition in
    the thread debugging code. He suggests using an extra lock to
    avoid this, and indeed, it would be a simple way.
    
    I am reluctant to introduce an extra lock purely for this case
    though, so I've instead reused the ALLOC lock. This has the advantage
    of us not having to take the lock except in the 'first call with a
    new context' case.

[33mcommit 3f89d1b6d1d28018f8706faefbbac040e4188e1a[m
Author: Robin Watts <Robin.Watts@artifex.com>
Date:   Mon Apr 9 12:08:48 2012 +0100

    Bug 692976: Fix spurious thread lock debug warnings on context clones
    
    When cloning, ensure the locks are done on the new context, not the
    old one; this makes no difference except to suppress some spurious
    debugging messages.
    
    Also ensure that DEBUG is predefined for Makefile based debug and memento
    builds.
    
    Thanks to Bas Weelinck.

[33mcommit 10c3dc0da2d157723c6bfcdc81dd797430063366[m
Author: Robin Watts <robin.watts@artifex.com>
Date:   Mon Apr 9 10:47:55 2012 +0100

    Bug 692977: Stop harmless thread debugging messages during cmapdump
    
    If compiled with -DDEBUG, cmapdump throws a large number of warnings
    regarding thread locking. These are harmless and can be ignored, but
    are, nonetheless, not pretty. Fixed here.
    
    Thanks to Bas Weelinck for the report.

[33mcommit 72f739984d85050422c64c5661cf0e750aa3d49d[m
Author: Robin Watts <robin.watts@artifex.com>
Date:   Fri Apr 6 09:38:24 2012 +0100

    mucbz: use fz_malloc, not malloc.

[33mcommit a91e0a14294fe23f891051e4cf6725bf5914b05c[m
Author: Robin Watts <robin.watts@artifex.com>
Date:   Fri Apr 6 09:06:14 2012 +0100

    Bug 692960: Ensure that -g flag overrides filename detection
    
    Currently the colorspace is selected on detecting -g, but may
    then be overridden based on the filename; the -g option should
    be given priority so the fix is simply to move the check for
    -g down a few lines.
    
    Thanks to James Cloos for spotting the problem and suggesting
    the fix.

[33mcommit e7b13e1de4b29f36ed536bb863e5d81768550490[m
Author: Robin Watts <robin.watts@artifex.com>
Date:   Thu Apr 5 18:01:54 2012 +0100

    Fix potential problems on malloc failure.
    
    Don't reset the size of arrays until we have successfully resized them.

[33mcommit ff55e72b741b955bbd0e23bd9d724c6682a181ac[m
Author: Robin Watts <robin.watts@artifex.com>
Date:   Thu Apr 5 17:48:24 2012 +0100

    Bug 692946 - fix 'stray white pixels in black areas' when halftoning.
    
    Depending on the operation used (< or <=) the threshold array should
    never have either 0 and ff in it. As we are using <, it should never
    have 0 in it. Fixed here.

[33mcommit 4184ba5d2930b337fddf3ad8e612a88adb08d8c1[m
Author: Robin Watts <robin.watts@artifex.com>
Date:   Thu Apr 5 12:48:19 2012 +0100

    Don't unlock a lock we don't own.
    
    While debugging Bug 692943, I spotted a case where we can attempt to
    unlock the file while we don't hold the file lock due to an error
    being thrown while we momentarily drop that lock. Simple solution
    is to add a new fz_try()/fz_catch() to retake the lock in such
    an error circumstance.

[33mcommit b32c5d4f88835ad7b36946f8fcec47e809bcd11b[m
Author: Robin Watts <robin.watts@artifex.com>
Date:   Thu Apr 5 12:24:53 2012 +0100

    Bug 692141 - Work around bug in VS2005 Team Suite
    
    Put the logf call in it's own statement to fix a stupid header file
    bug.

[33mcommit 0c0398c06c6e2a1bc9ca0765836cc4beb997cfa7[m
Author: Robin Watts <robin.watts@artifex.com>
Date:   Wed Mar 28 17:56:41 2012 +0530

    Add documentation for fz_link_dest and text extraction device.

[33mcommit ccf2483b87c006b3e35c371ba0d79adbe34d84d9[m
Author: Tor Andersson <tor.andersson@artifex.com>
Date:   Wed Mar 28 13:47:15 2012 +0200

    Update application icons.

[33mcommit b3d85b5a5cb40a281700bed76618a2578fb4d90e[m
Author: Tor Andersson <tor.andersson@artifex.com>
Date:   Wed Mar 28 13:20:07 2012 +0200

    Warn that the fz_link_dest struct is not finished.

[33mcommit 76be9e137312e1f9e120f343d9c0be1566394c96[m
Author: Tor Andersson <tor.andersson@artifex.com>
Date:   Wed Mar 28 13:03:19 2012 +0200

    Bump version string to 1.0 release candidate 1.

[33mcommit 68d088baf6a8950f005f17a5e65a22e679989c56[m
Author: Tor Andersson <tor.andersson@artifex.com>
Date:   Tue Mar 20 17:17:40 2012 +0100

    Disable link support in android app for 1.0 release.
    
    The link support still has several outstanding issues that need to be
    solved.

[33mcommit 335ee09b2553f8870d05e0370af6845810fdcfdc[m
Author: Tor Andersson <tor.andersson@artifex.com>
Date:   Wed Mar 28 13:44:51 2012 +0200

    Fix access of recently freed memory.

[33mcommit 68f746a1075518182ba30d35be28a8163e06c6ed[m
Author: Tor Andersson <tor.andersson@artifex.com>
Date:   Wed Mar 28 13:42:57 2012 +0200

    Whitespace fixes.

[33mcommit bdb6b688a238df56b2cf47fa17a08a4dd4b7a122[m
Author: Tor Andersson <tor.andersson@artifex.com>
Date:   Wed Mar 21 21:19:04 2012 +0100

    Fix warning where we return nothing rather than NULL in sweepref.

[33mcommit 3960e9a02f4064422645b1e65230fe39708dd48f[m
Author: Tor Andersson <tor.andersson@artifex.com>
Date:   Wed Mar 21 17:57:33 2012 +0100

    Update iOS app.

[33mcommit 9a278ec1303231d24b0ba1abb8a934409f2cd73a[m
Author: Tor Andersson <tor.andersson@artifex.com>
Date:   Tue Mar 20 16:58:14 2012 +0100

    Use a subtler background tiling pattern from subtlepatterns.com
    
    The patterns can be used freely in both personal and commercial projects
    with no attribution required, but always appreciated.
    
    darkdenim3.png was made by Brandon Jacoby.

[33mcommit 0cb12a83c1ab0d2a273eb1e8d0b7bf47f01e3442[m
Author: Paul Gardiner <paul@glidos.net>
Date:   Tue Mar 20 17:52:51 2012 +0000

    Android app: fix missing highlights

[33mcommit f27da2574c1b9389f02efff8223ee0e6a4ae4d55[m
Author: Paul Gardiner <paul@glidos.net>
Date:   Tue Mar 20 16:57:20 2012 +0000

    Android app: delay the appearance of the page render progress dialogs

[33mcommit ee46d71962a7c79aeca01f8db4a00fec3410a540[m
Author: Paul Gardiner <paul@glidos.net>
Date:   Tue Mar 20 16:22:08 2012 +0000

    Android app: delay the appearance of the search progress dialog

[33mcommit 7f2aca7f6efa4677f419712c3ff81033f0eb1c08[m
Author: Robin Watts <robin.watts@artifex.com>
Date:   Tue Mar 20 14:34:29 2012 +0000

    Updated README file for 1.0 release.

[33mcommit 515971b28b71dbdf5c5e88cb60697d81566314a6[m
Author: Robin Watts <robin.watts@artifex.com>
Date:   Mon Mar 19 19:54:26 2012 +0000

    Tweaks to CONTRIBUTORS file.
    
    I had missed an umlaut, and misused a capital letter.

[33mcommit 79c112d2e143c0433eb6a5014553e042e5d53029[m
Author: Robin Watts <robin.watts@artifex.com>
Date:   Mon Mar 19 19:39:41 2012 +0000

    mupdfclean: eliminate mutual recursion (sweepobj/sweepref).
    
    Mutual recursion was blowing the stack. This will still blow the
    stack, but less often.

[33mcommit 40ae12884335856f803dc76bfbe97b1c8743b9b9[m
Author: Tor Andersson <tor.andersson@artifex.com>
Date:   Mon Mar 19 17:45:54 2012 +0100

    Fix typo in text device where lines would group into blocks too eagerly.
    
    The default page userspace transform changed to a top-down coordinate
    space, and I forgot this detail when updating the text device branch.
    
    Also remove the final block sorting pass to give preference to the original
    PDF text order.

[33mcommit 51cdfc4b174b6175c8dd1827998224ca680f3ca7[m
Author: Tor Andersson <tor.andersson@artifex.com>
Date:   Mon Mar 19 17:49:33 2012 +0100

    Don't create empty spans and lines in the text device.

[33mcommit d853e201d409baf3ae9c8f1e59477337e2935ace[m
Author: Robin Watts <robin.watts@artifex.com>
Date:   Mon Mar 19 16:07:10 2012 +0000

    Bug 692669: Snap Rotate values for pages to be a multiple of 90
    
    Previously we attempted to honour page rotation values, which is
    technically against the spec.

[33mcommit d11a38dbd783b746d7a35f03fecfb3cbca65527e[m
Author: Robin Watts <robin.watts@artifex.com>
Date:   Mon Mar 19 15:19:17 2012 +0000

    Bug 692746; avoid 'double palettes' on jpx images.
    
    It seems that JPX images can be supplied in indexed format, with
    both a palette internal to the jpx stream, and a palette in the
    PDF. Googling seems to suggest that the internal palette should
    be ignored in this case, and the external palette applied.
    
    Fortunately, since OpenJPEG-1.5 there is a flag that can be used
    to tell OpenJPEG not to decode palettes. We update the code here
    to spot that there is an external palette, and to set this flag.

[33mcommit 3598f93db06f029ce4851cc0b43bdfa9ec182a2d[m
Author: Robin Watts <robin.watts@artifex.com>
Date:   Mon Mar 19 12:07:21 2012 +0000

    Add simple CONTRIBUTORS file.
    
    Simple file to acknowledge major outside contributors.
