Warning
=======
Due to changes in VLC's lua API, this project is deprecated and not supported anymore for VLC 2.1.* and higher! 
Please take a look at [nurupo's plugin](https://github.com/nurupo/vlc-pause-click-plugin) instead. It does the same. 


Introduction
============

This extension allow playing/pausing videos by clicking on a screen.
Similar to youtube videos behaviour.

Download
========
From [project on github](http://3demax.github.io/vlc-clickpause/) or 
[videolan addons page](http://addons.videolan.org/content/show.php/Click+to+Play%2BPause?content=158285&PHPSESSID=6ac0dbec95c0dee45c8b4b1c494a0ff1)

Installation
============

To install, drop "clickpause.lua" into the VLC extensions directory. 
The extensions directories are located at:

 - OS X systemwide: /Applications/VLC.app/Contents/MacOS/share/lua/extensions/
 - OS X current user: ~/Library/Application Support/org.videolan.vlc/lua/extensions/
 - Linux systemwide: depends upon distro
 - Linux current user: ~/.local/share/vlc/lua/extensions/
 - Windows systemwide: %ProgramFiles%\VideoLAN\VLC\lua\extensions\
 - Windows current user: %APPDATA%\vlc\lua\extensions\

This extension was tested and sound working at following configurations:

 * VLC: 2.0.1; OS: Windows XP
 * VLC: 2.0.5; OS: Linux

But it doesn't depend on specific things, and highly probably would work
on other configurations.

Usage
=====

In "View" menu tick "Click screen to Play/Pause".
Enjoy!

Know Bugs
=========

 * You need to tick it every time you open VLC. This is a limitation of VLC lua api.


