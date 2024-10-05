## Compiling Project
To compile premake project:

'''bash
./vendor/bin/premake/premake5 gmake2
after go to build folder than enter make config=debug/release
'''
---

### executable desktop app
create a .desktop file and edit via gedit etc.

'''bash
[Desktop Entry]
Version=1.0
Name=Test-App
Exec=konsole -e /bin/bash -c "/path/yourBuildedExecutableAppRoute"
Icon=utilities-terminal
Terminal=false
Type=Application
'''

in this desktop app, it uses konsole terminal app.
if you want to use standart gnome-terminal use that:

'''
Exec=gnome-terminal -- "/home/ahmetefe/Dev/Projects/Test/bin/Debug/Test-App"
'''

