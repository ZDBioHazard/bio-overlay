These patches originally added "URxvt 1015" and "SGR 1006"
mouse position handling to `>=x11-libs/vte-0.38` (GTK+3)

I have backported them to the old `0.28.2` (GTK+2) codebase.
Now `app-misc/tmux` in `x11-terms/xfce-terminal` no longer
gets corrupted when clicking past the 226th column.

The original patches were written by Egmont Koblinger in 2011.
I just rebased them on `0.28.2` and fixed up a couple tiny conflicts.

They must be applied in order.
