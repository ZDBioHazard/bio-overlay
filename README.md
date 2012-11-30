Bio's Portage Overlay
=====================

I enjoy hacking up my system, so I write ebuilds to expedite fixes or just mess
with stuff.

I figured that the world might want a enjoy a few of my ebuilds.

These are usually new packages or fixes I find on the
[Gentoo Bugzilla](http://bugs.gentoo.org/) and adapt for my use, but sometimes
I write my own from scratch too. I'll try to credit when I remember. :)

About /patches/
===============

These are just my little patches that aren't worth the fuss of making and
maintaining a whole ebuild. You can put them in /etc/portage/patches and they
will be automatically included when an ebuild calls epatch_user(). Neat huh?

NOTE: If you do put them in /etc/portage/patches, be aware that some ebuilds do
not call epatch_user(). It is up to you to decide how you want to hack up
portage to make it work.

Notice About Ebuilds
====================

Remember to add the "**" keyword in /etc/portage/package.keywords for any live
ebuilds you want to use.

Please note that I'm still fairly new at writing ebuilds, so the dependencies or
use flags may not always be entirely correct.

