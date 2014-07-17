-- automatically generated file. Do not edit (see /usr/share/doc/menu/html)

module("debian.menu")

Debian_menu = {}

Debian_menu["Debian_Applications_Accessibility"] = {
	{"Xmag","xmag"},
}
Debian_menu["Debian_Applications_Data_Management"] = {
	{"JabRef","jabref","/usr/share/pixmaps/jabref32.xpm"},
	{"LibreOffice Base","/usr/bin/libreoffice --base","/usr/share/icons/hicolor/32x32/apps/libreoffice-base.xpm"},
}
Debian_menu["Debian_Applications_Editors"] = {
	{"Emacs 24 (text)", "x-terminal-emulator -e ".."/usr/bin/emacs24 -nw"},
	{"Emacs 24 (X11)","/usr/bin/emacs24"},
	{"Gedit","/usr/bin/gedit","/usr/share/pixmaps/gedit-icon.xpm"},
	{"GVIM","/usr/bin/vim.gnome -g -f","/usr/share/pixmaps/vim-32.xpm"},
	{"hexedit", "x-terminal-emulator -e ".."/usr/bin/hexedit"},
	{"Jed", "x-terminal-emulator -e ".."/usr/bin/jed"},
	{"Joe", "x-terminal-emulator -e ".."/usr/bin/joe"},
	{"Kile","/usr/bin/kile","/usr/share/pixmaps/kile.xpm"},
	{"Nano", "x-terminal-emulator -e ".."/bin/nano","/usr/share/nano/nano-menu.xpm"},
	{"texmaker","/usr/bin/texmaker","/usr/share/pixmaps/texmaker.xpm"},
	{"Xedit","xedit"},
	{"XEmacs21-mule","/usr/bin/xemacs21-mule"},
}
Debian_menu["Debian_Applications_File_Management"] = {
	{"Baobab","/usr/bin/baobab","/usr/share/pixmaps/baobab.xpm"},
	{"Brasero","/usr/bin/brasero"},
	{"File-Roller","/usr/bin/file-roller","/usr/share/pixmaps/file-roller.xpm"},
	{"grun","/usr/bin/grun","/usr/share/pixmaps/grun.xpm"},
	{"Nautilus","/usr/bin/nautilus","/usr/share/pixmaps/nautilus.xpm"},
}
Debian_menu["Debian_Applications_Graphics"] = {
	{"Dia (GNOME)","/usr/bin/dia","/usr/share/pixmaps/dia_menu.xpm"},
	{"dotty","/usr/bin/dotty"},
	{"Geeqie","/usr/bin/geeqie","/usr/share/pixmaps/geeqie.xpm"},
	{"gtk-recordmydesktop","/usr/bin/gtk-recordmydesktop","/usr/share/pixmaps/gtk-recordmydesktop.xpm"},
	{"Hugin","/usr/bin/hugin"},
	{"ImageMagick","/usr/bin/display.im6 logo:","/usr/share/pixmaps/display.im6.xpm"},
	{"Inkscape","/usr/bin/inkscape","/usr/share/pixmaps/inkscape.xpm"},
	{"Ipe","/usr/bin/ipe"},
	{"lefty","/usr/bin/lefty"},
	{"LibreOffice Draw","/usr/bin/libreoffice --draw","/usr/share/icons/hicolor/32x32/apps/libreoffice-draw.xpm"},
	{"PTBatcherGUI","/usr/bin/PTBatcherGUI"},
	{"Stable version of Scribus","/usr/bin/scribus","/usr/share/pixmaps/scribus.xpm"},
	{"The GIMP","/usr/bin/gimp","/usr/share/pixmaps/gimp.xpm"},
	{"X Window Snapshot","xwd | xwud"},
	{"xfig","/usr/bin/xfig","/usr/share/pixmaps/xfig32x32cmap.xpm"},
}
Debian_menu["Debian_Applications_Network_Communication"] = {
	{"GNOME SSH Tunnel Manager","gstm"},
	{"gnubiff","/usr/bin/gnubiff"},
	{"heirloom-mailx", "x-terminal-emulator -e ".."/usr/bin/heirloom-mailx"},
	{"Irssi", "x-terminal-emulator -e ".."/usr/bin/irssi"},
	{"Minicom", "x-terminal-emulator -e ".."/usr/bin/minicom"},
	{"Minicom (X11)","/usr/bin/xminicom"},
	{"Mumble","/usr/bin/mumble","/usr/share/pixmaps/mumble.xpm"},
	{"Mutt", "x-terminal-emulator -e ".."/usr/bin/mutt","/usr/share/pixmaps/mutt.xpm"},
	{"Remmina","/usr/bin/remmina"},
	{"Telnet", "x-terminal-emulator -e ".."/usr/bin/telnet"},
	{"Xbiff","xbiff"},
}
Debian_menu["Debian_Applications_Network_File_Transfer"] = {
	{"cadaver", "x-terminal-emulator -e ".."/usr/bin/cadaver"},
	{"gFTP","/usr/bin/gftp-gtk","/usr/share/pixmaps/gftp.xpm"},
	{"ncftp", "x-terminal-emulator -e ".."/usr/bin/ncftp3"},
	{"Transmission BitTorrent Client (GTK)","/usr/bin/transmission-gtk","/usr/share/pixmaps/transmission.xpm"},
}
Debian_menu["Debian_Applications_Network_Monitoring"] = {
	{"IPTraf", "x-terminal-emulator -e ".."/usr/bin/su-to-root -c /usr/sbin/iptraf"},
	{"jnettop", "x-terminal-emulator -e ".."/usr/bin/su-to-root -c /usr/sbin/jnettop"},
}
Debian_menu["Debian_Applications_Network_Web_Browsing"] = {
	{"Epiphany web browser","/usr/bin/epiphany-browser"},
	{"Links 2","/usr/bin/links2 -g","/usr/share/pixmaps/links2.xpm"},
	{"Links 2 (text)", "x-terminal-emulator -e ".."/usr/bin/links2","/usr/share/pixmaps/links2.xpm"},
	{"Lynx-cur", "x-terminal-emulator -e ".."lynx"},
}
Debian_menu["Debian_Applications_Network_Web_News"] = {
	{"Liferea","/usr/bin/liferea","/usr/share/liferea/pixmaps/liferea.xpm"},
}
Debian_menu["Debian_Applications_Network"] = {
	{ "Communication", Debian_menu["Debian_Applications_Network_Communication"] },
	{ "File Transfer", Debian_menu["Debian_Applications_Network_File_Transfer"] },
	{ "Monitoring", Debian_menu["Debian_Applications_Network_Monitoring"] },
	{ "Web Browsing", Debian_menu["Debian_Applications_Network_Web_Browsing"] },
	{ "Web News", Debian_menu["Debian_Applications_Network_Web_News"] },
}
Debian_menu["Debian_Applications_Office"] = {
	{"AbiWord Word Processor","/usr/bin/abiword","/usr/share/pixmaps/abiword.xpm"},
	{"FreeMind","/usr/bin/freemind","/usr/share/pixmaps/FreeMindWindowIcon.xpm"},
	{"gnumeric","/usr/bin/gnumeric","/usr/share/pixmaps/gnome-gnumeric.xpm"},
	{"LibreOffice Calc","/usr/bin/libreoffice --calc","/usr/share/icons/hicolor/32x32/apps/libreoffice-calc.xpm"},
	{"LibreOffice Impress","/usr/bin/libreoffice --impress","/usr/share/icons/hicolor/32x32/apps/libreoffice-impress.xpm"},
	{"LibreOffice Writer","/usr/bin/libreoffice --writer","/usr/share/icons/hicolor/32x32/apps/libreoffice-writer.xpm"},
	{"LyX Document Processor","lyx","/usr/share/pixmaps/lyx-32x32.xpm"},
}
Debian_menu["Debian_Applications_Programming"] = {
	{"anjuta","/usr/bin/anjuta","/usr/share/pixmaps/anjuta.xpm"},
	{"BeanShell (text)", "x-terminal-emulator -e ".."/usr/bin/bsh"},
	{"BeanShell (windowed)","/usr/bin/xbsh"},
	{"CMake curses GUI (ccmake)", "x-terminal-emulator -e ".."/usr/bin/ccmake","/usr/share/pixmaps/cmake.xpm"},
	{"CMake Qt4 GUI (cmake-gui)","/usr/bin/cmake-gui","/usr/share/pixmaps/cmake.xpm"},
	{"DevHelp","/usr/bin/devhelp","/usr/share/pixmaps/devhelp-debian.xpm"},
	{"Eclipse","eclipse"},
	{"eric","/usr/bin/eric","/usr/share/pixmaps/eric.xpm"},
	{"Erlang Shell", "x-terminal-emulator -e ".."/usr/bin/erl","/usr/share/pixmaps/erlang.xpm"},
	{"GDB", "x-terminal-emulator -e ".."/usr/bin/gdb"},
	{"Geany","/usr/bin/geany","/usr/share/pixmaps/geany.xpm"},
	{"Glade 3","/usr/bin/glade","/usr/share/pixmaps/glade.xpm"},
	{"Guile 2.0", "x-terminal-emulator -e ".."/usr/bin/guile-2.0"},
	{"Jython", "x-terminal-emulator -e ".."/usr/bin/jython"},
	{"Meld","/usr/bin/meld"},
	{"Ocaml", "x-terminal-emulator -e ".."/usr/bin/ocaml","/usr/share/pixmaps/ocaml.xpm"},
	{"Python (v2.7)", "x-terminal-emulator -e ".."/usr/bin/python2.7","/usr/share/pixmaps/python2.7.xpm"},
	{"Python (v3.4)", "x-terminal-emulator -e ".."/usr/bin/python3.4","/usr/share/pixmaps/python3.4.xpm"},
	{"Qt4 Assistant","/usr/lib/*/qt4/bin/assistant"},
	{"Qt4 Designer","/usr/lib/*/qt4/bin/designer"},
	{"Qt4 Linguist","/usr/lib/*/qt4/bin/linguist"},
	{"Ruby (irb1.9.1)", "x-terminal-emulator -e ".."/usr/bin/irb1.9.1"},
	{"spyder","/usr/bin/spyder"},
	{"SWI-Prolog", "x-terminal-emulator -e ".."/usr/bin/swipl"},
	{"SWI-Prolog (with XPCE)", "x-terminal-emulator -e ".."/usr/bin/xpce"},
	{"Tclsh8.5", "x-terminal-emulator -e ".."/usr/bin/tclsh8.5"},
	{"Tclsh8.6", "x-terminal-emulator -e ".."/usr/bin/tclsh8.6"},
	{"TkWish8.5","x-terminal-emulator -e /usr/bin/wish8.5"},
	{"TkWish8.6","x-terminal-emulator -e /usr/bin/wish8.6"},
}
Debian_menu["Debian_Applications_Science_Chemistry"] = {
	{"PyMOL","/usr/bin/pymol","/usr/share/pixmaps/pymol.xpm"},
}
Debian_menu["Debian_Applications_Science_Data_Analysis"] = {
	{"GNU R", "x-terminal-emulator -e ".."/usr/bin/R"},
}
Debian_menu["Debian_Applications_Science_Engineering"] = {
	{"Dia","/usr/bin/dia","/usr/share/pixmaps/dia_menu.xpm"},
}
Debian_menu["Debian_Applications_Science_Mathematics"] = {
	{"Bc", "x-terminal-emulator -e ".."/usr/bin/bc"},
	{"Dc", "x-terminal-emulator -e ".."/usr/bin/dc"},
	{"Gnuplot", "x-terminal-emulator -e ".."/usr/bin/gnuplot"},
	{"LibreOffice Math","/usr/bin/libreoffice --math","/usr/share/icons/hicolor/32x32/apps/libreoffice-math.xpm"},
	{"Octave", "x-terminal-emulator -e ".."/usr/bin/octave"},
	{"Xcalc","xcalc"},
}
Debian_menu["Debian_Applications_Science"] = {
	{ "Chemistry", Debian_menu["Debian_Applications_Science_Chemistry"] },
	{ "Data Analysis", Debian_menu["Debian_Applications_Science_Data_Analysis"] },
	{ "Engineering", Debian_menu["Debian_Applications_Science_Engineering"] },
	{ "Mathematics", Debian_menu["Debian_Applications_Science_Mathematics"] },
}
Debian_menu["Debian_Applications_Shells"] = {
	{"Bash", "x-terminal-emulator -e ".."/bin/bash --login"},
	{"Csh", "x-terminal-emulator -e ".."/bin/bsd-csh -l"},
	{"Dash", "x-terminal-emulator -e ".."/bin/dash -i"},
	{"Ksh", "x-terminal-emulator -e ".."/bin/ksh93"},
	{"Sh", "x-terminal-emulator -e ".."/bin/sh --login"},
	{"tcsh", "x-terminal-emulator -e ".."/bin/tcsh"},
	{"Zsh", "x-terminal-emulator -e ".."/bin/zsh5"},
}
Debian_menu["Debian_Applications_Sound"] = {
	{"Amarok","/usr/bin/amarok"},
	{"Audacious","/usr/bin/audacious"},
	{"Audacity","/usr/bin/audacity","/usr/share/pixmaps/audacity32.xpm"},
	{"aumix", "x-terminal-emulator -e ".."/usr/bin/aumix","/usr/share/pixmaps/aumix.xpm"},
	{"GNOME ALSA Mixer","/usr/bin/gnome-alsamixer","/usr/share/pixmaps/gnome-alsamixer/gnome-alsamixer-icon.xpm"},
	{"grecord (GNOME 2.0 Recorder)","/usr/bin/gnome-sound-recorder","/usr/share/pixmaps/gnome-grecord.xpm"},
	{"Rhythmbox","/usr/bin/rhythmbox","/usr/share/pixmaps/rhythmbox-small.xpm"},
}
Debian_menu["Debian_Applications_System_Administration"] = {
	{"Debian Task selector", "x-terminal-emulator -e ".."su-to-root -c tasksel"},
	{"Editres","editres"},
	{"Gnome Control Center","/usr/bin/gnome-control-center",},
	{"TeXconfig", "x-terminal-emulator -e ".."/usr/bin/texconfig"},
	{"Xclipboard","xclipboard"},
	{"Xfontsel","xfontsel"},
	{"Xkill","xkill"},
	{"Xrefresh","xrefresh"},
}
Debian_menu["Debian_Applications_System_Hardware"] = {
	{"Xvidtune","xvidtune"},
}
Debian_menu["Debian_Applications_System_Language_Environment"] = {
	{"Input Method Configuration", "x-terminal-emulator -e ".."/usr/bin/im-config"},
}
Debian_menu["Debian_Applications_System_Monitoring"] = {
	{"GNOME system monitor","/usr/bin/gnome-system-monitor"},
	{"htop", "x-terminal-emulator -e ".."/usr/bin/htop"},
	{"iptstate", "x-terminal-emulator -e ".."/usr/bin/su-to-root -c /usr/sbin/iptstate"},
	{"Pstree", "x-terminal-emulator -e ".."/usr/bin/pstree.x11","/usr/share/pixmaps/pstree16.xpm"},
	{"Top", "x-terminal-emulator -e ".."/usr/bin/top"},
	{"Xconsole","xconsole -file /dev/xconsole"},
	{"Xev","x-terminal-emulator -e xev"},
	{"Xload","xload"},
	{"Xosview","/usr/bin/xosview","/usr/share/pixmaps/xosview.xpm"},
}
Debian_menu["Debian_Applications_System_Package_Management"] = {
	{"Aptitude Package Manager (text)", "x-terminal-emulator -e ".."/usr/bin/aptitude-curses"},
}
Debian_menu["Debian_Applications_System_Security"] = {
	{"Seahorse","/usr/bin/seahorse","/usr/share/pixmaps/seahorse.xpm"},
}
Debian_menu["Debian_Applications_System"] = {
	{ "Administration", Debian_menu["Debian_Applications_System_Administration"] },
	{ "Hardware", Debian_menu["Debian_Applications_System_Hardware"] },
	{ "Language Environment", Debian_menu["Debian_Applications_System_Language_Environment"] },
	{ "Monitoring", Debian_menu["Debian_Applications_System_Monitoring"] },
	{ "Package Management", Debian_menu["Debian_Applications_System_Package_Management"] },
	{ "Security", Debian_menu["Debian_Applications_System_Security"] },
}
Debian_menu["Debian_Applications_Terminal_Emulators"] = {
	{"Aterm","/usr/bin/aterm-xterm"},
	{"Eterm","/usr/bin/Eterm"},
	{"Gnome Terminal","/usr/bin/gnome-terminal","/usr/share/pixmaps/gnome-terminal.xpm"},
	{"Rxvt-Unicode","urxvt","/usr/share/pixmaps/urxvt.xpm"},
	{"Rxvt-Unicode (Black, Xft)","urxvt -fn \"xft:Mono\" -rv","/usr/share/pixmaps/urxvt.xpm"},
	{"X-Terminal as root (GKsu)","/usr/bin/gksu -u root /usr/bin/x-terminal-emulator","/usr/share/pixmaps/gksu-debian.xpm"},
	{"XTerm","xterm","/usr/share/pixmaps/xterm-color_32x32.xpm"},
	{"XTerm (Unicode)","uxterm","/usr/share/pixmaps/xterm-color_32x32.xpm"},
}
Debian_menu["Debian_Applications_Text"] = {
	{"Character map","/usr/bin/gucharmap"},
	{"WordNet","/usr/bin/wnb","/usr/share/wordnet/pixmaps/micro-wn.xpm"},
}
Debian_menu["Debian_Applications_Video"] = {
	{"Totem","/usr/bin/totem","/usr/share/pixmaps/totem.xpm"},
	{"VLC media player","/usr/bin/qvlc","/usr/share/icons/hicolor/32x32/apps/vlc.xpm"},
}
Debian_menu["Debian_Applications_Viewers"] = {
	{"digikam","/usr/bin/digikam"},
	{"DjView4","/usr/bin/djview4","/usr/share/icons/hicolor/32x32/apps/djvulibre-djview4.xpm"},
	{"Evince","/usr/bin/evince","/usr/share/pixmaps/evince.xpm"},
	{"Eye of GNOME","/usr/bin/eog","/usr/share/pixmaps/gnome-eog.xpm"},
	{"gliv","/usr/bin/gliv","/usr/share/pixmaps/gliv.xpm"},
	{"GraphicsMagick","/usr/bin/gm display logo:"},
	{"GV","/usr/bin/gv","/usr/share/pixmaps/mini-gv.xpm"},
	{"Shotwell","/usr/bin/shotwell"},
	{"Wordview","/usr/bin/wordview"},
	{"Xditview","xditview"},
	{"XDvi","/usr/bin/xdvi"},
	{"Xpdf","/usr/bin/xpdf","/usr/share/pixmaps/xpdf.xpm"},
}
Debian_menu["Debian_Applications"] = {
	{ "Accessibility", Debian_menu["Debian_Applications_Accessibility"] },
	{ "Data Management", Debian_menu["Debian_Applications_Data_Management"] },
	{ "Editors", Debian_menu["Debian_Applications_Editors"] },
	{ "File Management", Debian_menu["Debian_Applications_File_Management"] },
	{ "Graphics", Debian_menu["Debian_Applications_Graphics"] },
	{ "Network", Debian_menu["Debian_Applications_Network"] },
	{ "Office", Debian_menu["Debian_Applications_Office"] },
	{ "Programming", Debian_menu["Debian_Applications_Programming"] },
	{ "Science", Debian_menu["Debian_Applications_Science"] },
	{ "Shells", Debian_menu["Debian_Applications_Shells"] },
	{ "Sound", Debian_menu["Debian_Applications_Sound"] },
	{ "System", Debian_menu["Debian_Applications_System"] },
	{ "Terminal Emulators", Debian_menu["Debian_Applications_Terminal_Emulators"] },
	{ "Text", Debian_menu["Debian_Applications_Text"] },
	{ "Video", Debian_menu["Debian_Applications_Video"] },
	{ "Viewers", Debian_menu["Debian_Applications_Viewers"] },
}
Debian_menu["Debian_Games_Action"] = {
	{"Granatier","/usr/games/granatier"},
	{"Kapman","/usr/games/kapman"},
	{"KBreakout","/usr/games/kbreakout"},
	{"KDE Bounce Ball Game","/usr/games/kbounce"},
	{"KDE SpaceDuel","/usr/games/kspaceduel"},
	{"KGoldrunner","/usr/games/kgoldrunner"},
	{"Kollision","/usr/games/kollision"},
}
Debian_menu["Debian_Games_Adventure"] = {
	{"NetHack (No GUI)", "x-terminal-emulator -e ".."/usr/games/nethack-console","/usr/share/pixmaps/nethack.xpm"},
	{"X NetHack","/usr/games/xnethack","/usr/share/pixmaps/nethack.xpm"},
}
Debian_menu["Debian_Games_Blocks"] = {
	{"KBlocks","/usr/games/kblocks"},
	{"Netris", "x-terminal-emulator -e ".."/usr/games/netris"},
}
Debian_menu["Debian_Games_Board"] = {
	{"Bovo","/usr/games/bovo"},
	{"GNU Go", "x-terminal-emulator -e ".."/usr/games/gnugo"},
	{"KDE Reversi","/usr/games/kreversi"},
	{"KDE Shisen-Sho","/usr/games/kshisen"},
	{"KFourInLine","/usr/games/kfourinline"},
	{"KiGo","/usr/games/kigo"},
	{"Kiriki","/usr/games/kiriki"},
	{"KLines","/usr/games/klines"},
	{"KMahjongg","/usr/games/kmahjongg"},
	{"KSquares","/usr/games/ksquares"},
}
Debian_menu["Debian_Games_Card"] = {
	{"Gnome Solitaire Games","/usr/games/sol","/usr/share/pixmaps/aisleriot.xpm"},
	{"KDE Lieutnant Skat","/usr/games/lskat"},
	{"KDE Patience","/usr/games/kpat"},
	{"X Solitaire","/usr/games/xsol","/usr/share/pixmaps/xsol.xpm"},
}
Debian_menu["Debian_Games_Puzzles"] = {
	{"Blinken","/usr/games/blinken"},
	{"KBlackBox","/usr/games/kblackbox"},
	{"KDE Atomic Entertainment","/usr/games/katomic"},
	{"KDE Klickety","/usr/games/klickety"},
	{"KDE Sudoku","/usr/games/ksudoku"},
	{"KDiamond","/usr/games/kdiamond"},
	{"KJumpingCube","/usr/games/kjumpingcube"},
	{"Kmines","/usr/games/kmines"},
	{"KNetwalk","/usr/games/knetwalk"},
	{"kubrick","/usr/games/kubrick"},
	{"Palapeli","/usr/games/palapeli"},
	{"picmi","/usr/games/picmi"},
}
Debian_menu["Debian_Games_Simulation"] = {
	{"KDE Miniature Golf","/usr/games/kolf"},
}
Debian_menu["Debian_Games_Strategy"] = {
	{"killbots","/usr/games/killbots"},
	{"Konquest","/usr/games/konquest"},
	{"KSirK","/usr/games/ksirk"},
}
Debian_menu["Debian_Games_Toys"] = {
	{"ASclock","/usr/bin/asclock"},
	{"KDE Potato Guy","/usr/games/ktuberling"},
	{"Oclock","oclock"},
	{"Xclock (analog)","xclock -analog"},
	{"Xclock (digital)","xclock -digital -update 1"},
	{"Xeyes","xeyes"},
	{"Xlogo","xlogo"},
}
Debian_menu["Debian_Games"] = {
	{ "Action", Debian_menu["Debian_Games_Action"] },
	{ "Adventure", Debian_menu["Debian_Games_Adventure"] },
	{ "Blocks", Debian_menu["Debian_Games_Blocks"] },
	{ "Board", Debian_menu["Debian_Games_Board"] },
	{ "Card", Debian_menu["Debian_Games_Card"] },
	{ "Puzzles", Debian_menu["Debian_Games_Puzzles"] },
	{ "Simulation", Debian_menu["Debian_Games_Simulation"] },
	{ "Strategy", Debian_menu["Debian_Games_Strategy"] },
	{ "Toys", Debian_menu["Debian_Games_Toys"] },
}
Debian_menu["Debian_Help"] = {
	{"TeXdoctk","/usr/bin/texdoctk"},
	{"Xman","xman"},
	{"yelp","/usr/bin/yelp"},
}
Debian_menu["Debian_Screen_Locking"] = {
	{"Lock Screen (XScreenSaver)","/usr/bin/xscreensaver-command -lock"},
}
Debian_menu["Debian_Screen_Saving"] = {
	{"Activate ScreenSaver (Next)","/usr/bin/xscreensaver-command -next"},
	{"Activate ScreenSaver (Previous)","/usr/bin/xscreensaver-command -prev"},
	{"Activate ScreenSaver (Random)","/usr/bin/xscreensaver-command -activate"},
	{"Demo Screen Hacks","/usr/bin/xscreensaver-command -demo"},
	{"Disable XScreenSaver","/usr/bin/xscreensaver-command -exit"},
	{"Enable XScreenSaver","/usr/bin/xscreensaver"},
	{"Reinitialize XScreenSaver","/usr/bin/xscreensaver-command -restart"},
	{"ScreenSaver Preferences","/usr/bin/xscreensaver-command -prefs"},
}
Debian_menu["Debian_Screen"] = {
	{ "Locking", Debian_menu["Debian_Screen_Locking"] },
	{ "Saving", Debian_menu["Debian_Screen_Saving"] },
}
Debian_menu["Debian"] = {
	{ "Applications", Debian_menu["Debian_Applications"] },
	{ "Games", Debian_menu["Debian_Games"] },
	{ "Help", Debian_menu["Debian_Help"] },
	{ "Screen", Debian_menu["Debian_Screen"] },
}
