> *just some first notes / copypasta*

An OpenFX package is placed in ...
Windows: `C:\Program Files (x86)\Common Files\OFX\Plugins`
macOS: `/Library/OFX/Plugins`
Linux: `/usr/OFX/Plugins`
... and is thereby available to all OpenFX aware applications (so called OFX hosts).

## macOS

```shell
cd '/Library/Application Support/Blackmagic Design/'
cd 'DaVinci Resolve/Developer/OpenFX'

less README.txt # for lots of information

sudo mkdir -p /Library/OFX/Plugins
sudo chmod a+w /Library/OFX/Plugins

# create the example 'Gain' plugin:
cd GainPlugin
make
make install

# now you shoud find "GainPlugin" in
# DaVinci Resolve 'Effects -> Open FX -> Filters'
```


See also:
- [The Open Effects Association](https://openeffects.org)
- [OFX Association](https://github.com/ofxa/) on GitHub
- [OpenFX documentation](https://openfx.readthedocs.io/en/doc/index.html)
- [Burning Question: What in the heck is OFX?](https://www.toolfarm.com/tutorial/burning_questions_what_in_the_heck_is_openfx/)
- ASWF [OpenFX - An Open Standard for Visual-Effects Plugins - Gary Oberbrunner, Dark Star Systems & Pierre Jasmin, RE:Vision Effects ](https://youtu.be/K1BXCk35uF8) on YouTube
- https://github.com/NatronGitHub/openfx-misc ... (!)
- https://www.steakunderwater.com/wesuckless/viewtopic.php?f=6&t=5787
- https://www.steakunderwater.com/wesuckless/viewtopic.php?t=4706

OpenGL in OpenFX:
- https://github.com/AcademySoftwareFoundation/openfx/blob/main/Examples/OpenGL/opengl.cpp
- https://forum.blackmagicdesign.com/viewtopic.php?t=62002&p=384511
- https://discuss.pixls.us/t/open-seperate-opengl-context-with-openfx/7974


