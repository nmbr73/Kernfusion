---
author: Andrew Hazelden
tags:
  - Kartaverse
  - .scrivener-export
---



> [!wiki-todo]- Scrivener Export - Reformatting Needed!
> This article is an export of a Scrivener document. It will definitely need at least some reformatting to work in Obsidian and MkDocs. Delete this note once the article's formatting  has been fixed to some extent.

An effective content creation pipeline is able to support a wide range of tools to allow artists to work effectively. Below is an ever-expanding list of popular design tools with detailed installation, software configuration, and automation/scripting notes being added over time.

### Install Blender 3 on Linux

Install Blender 3 on Linux

Blender is a free open-source GPL licensed 3D package that features integrated modeling, texturing, animation, simulation, rendering, video editing, and compositing tools.

<http://blender.org/>

    # Add Blender v3
    sudo dnf install blender -y

### Autodesk Maya on Linux

Autodesk Maya on Linux

Maya Installation

![[Kartaverse/Immersive Pipeline Integration Guide/img/image178.png]]

    # GUI Install of Maya
    ./Setup

    # CLI Maya Install
    cd Packages
    sudo rpm -ivh Maya2020*.rpm adlmapps*.rpm adsklicensing*.rpm adlmflex*.rpm

    # Force the install with -f
    sudo rpm -ivhf --force  *.rpm

    # Add the extra stuff
    sudo dnf install libpng15 compat-openssl10 -y

    sudo dnf install mesa-libGLw libXp gamin audiofile audiofile-devel compat-openssl10 libpng15 libnsl python2 xorg-x11-fonts-ISO8859-1-100dpi xorg-x11-fonts-ISO8859-1-75dpi -y

    # Run Maya
    /usr/autodesk/maya2022/bin/maya

### Common Maya Preferences

Common Maya Preferences

-   • Interface \> Devices \> Mouse scroll wheel \> \[x\] Enable
-   Display \> Performance \> Max res. for swatches "4k x 4k"
-   Display \> View \> (x) Background Gradient
-   Settings \> Rendering \> Preferred Renderer \> V-Ray
-   Settings \> Rendering \> Preferred Render Setup System \> Legacy Render Layers

### Maya.env File Settings

Maya.env File Settings

A Maya.env file is used to hold environment variable settings for a specific Maya release version.

The initial Maya.env file can be created on Linux using:

    sudo mkdir -p $HOME/maya/2023/
    sudo chmod -R 777 $HOME/maya/
    nano $HOME/maya/2023/Maya.env

When editing this file you can paste in:

    # Suppress Arnold not found error message:
    MAYA_NO_WARNING_FOR_MISSING_DEFAULT_RENDERER=1

    # Set the CIP disable flag:
    MAYA_DISABLE_CIP=1

### Running Maya Batch from the Linux Command-Line

Running Maya Batch from the Linux Command-Line

The batch version of Maya can be run on render node systems using:

    maya -batch --help

    Render -help
    Usage: Render [options] filename
           where "filename" is a Maya ASCII or a Maya binary file.

    Common options:
      -help              Print help
      -test              Print Mel commands but do not execute them
      -verb              Print Mel commands before they are executed
      -keepMel           Keep the temporary Mel file
      -listRenderers     List all available renderers
      -renderer string   Use this specific renderer
      -r string          Same as -renderer
      -proj string       Use this Maya project to load the file
      -log string        Save output into the given file
      -rendersetuptemplate string Apply a render setup template to your scene before command line rendering.  Only templates exported via File > Export All in the Render Setup editor are supported.  Render setting presets and AOVs are imported from the template.  Render settings and AOVs are reloaded after the template if the -rsp and -rsa flags are used in conjunction with this flag.
      -rst string        Same as -rendersetuptemplate
      -rendersettingspreset string Apply the scene Render Settings from this template file before command line rendering.  This is equivalent to performing File > Import Scene Render Settings in the Render Setup editor, then batch rendering.
      -rsp string        Same as -rendersettingspreset
      -rendersettingsaov string Import the AOVs from this json file before command line rendering.
      -rsa string        Same as -rendersettingsaov

    Specify a valid -r option to get a more detailed help about a renderer.
    For example: Render -help -r sw

To check the current Maya version you can run:

    maya -batch -v
    # Maya 2020, Cut Number 202011110415

You can verify that Maya has been registered and activated by a network or log-in license using the following command-line licensing utility:

    /opt/Autodesk/AdskLicensing/9.2.1.2399/helper/AdskLicensingInstHelper list

If successful, Maya should appear in the list of products returned by the Adsk Licensing Inst Helper utility. A sample output from running the executable looks like this:

    [
      {
        "feature_id": "MAYA",
        "def_prod_key": "657L1",
        "def_prod_ver": "2020.0.0.F",
        "sel_prod_key": "657L1",
        "sel_prod_ver": "2020.0.0.F",
        "supported_lic_methods": [
          2,
          1,
          4
        ],
        "lic_servers": [
          ""
        ],
        "serial_number_sa": "...",
        "serial_number_nw": "...",
        "def_prod_code": "MAYA",
        "sel_prod_code": "MAYA"
      }
    ]

Manually creating a License.env file

    sudo nano /usr/autodesk/maya2020/bin/License.env

Used a text editor to add your network licensing details to the License.env file

    MAYA_LICENSE=657L1
    MAYA_LICENSE_METHOD=network

Manually creating a maya.lic license file

    sudo nano /var/flexlm/maya.lic

Add your floating license server details to the maya.lic text file:

    SERVER R1 0
     USE_SERVER

At this point you should add "`/opt/Autodesk/Adlm/R17/lib64/`" directory temporarily to the "`LD_LIBRARY_PATH`" environment variables to set your shared libraries for this session.

For example, you can run the following command in a BASH shell:

    export LD_LIBRARY_PATH=/opt/Autodesk/Adlm/R17/lib64/

It is a good idea to backup the old Maya licensing .pit file:

    sudo mv /var/opt/Autodesk/Adlm/Maya2020/MayaConfig.pit /var/opt/Autodesk/Adlm/Maya2020/MayaConfig.pit.bak
    sudo rm -rf /var/opt/Autodesk/Adlm/Maya2020/MayaConfig.pit

Now you can run the following commands to register Maya with the Autodesk licensing app:

In the following example the serial number is represented as `<...>` for a snipped out value to be replaced with your own code.

An example Maya product key is 657L1 (which is used for Maya 2020).

    {
    cd /usr/autodesk/maya2020/bin

    /usr/autodesk/maya2020/bin/adlmreg -i N 657L1 657L1 2020.0.0.F <...> /var/opt/Autodesk/Adlm/Maya2020/MayaConfig.pit
    }

When deploying a new Linux based render node, if a Maya network license was not listed by the Adsk Licensing Inst Helper utility, you can manually register a license using a command line syntax that looks roughly like this:

    sudo /opt/Autodesk/AdskLicensing/9.2.1.2399/helper/AdskLicensingInstHelper register -pk 657L1 -pv 2020.0.0.F -el EN_US -cf /var/opt/Autodesk/Adlm/Maya2020/MayaConfig.pit

If the licensing service is not running, you can start it using the following command.

Note: When running a program with a service based approach, the executable will continue to run in the session.

    sudo /opt/Autodesk/AdskLicensing/9.2.1.2399/AdskLicensingService/AdskLicensingService --run

Verify the licensing service is running using:

    sudo systemctl status adsklicensing

    # ● adsklicensing.service - Autodesk Licensing Service
    #    Loaded: loaded (/usr/lib/systemd/system/adsklicensing.service; enabled; vendor preset: disabled)
    #    Active: active (running) since Fri 2021-04-23 14:40:20 ADT; 1min 5s ago
    #  Main PID: 26769 (AdskLicensingSe)
    #     Tasks: 33
    #    CGroup: /system.slice/adsklicensing.service
    #            └─26769 /usr/bin/AdskLicensingService --run
    #  Apr 23 14:40:20 Moonraker systemd[1]: Started Autodesk Licensing Service.

You should verify again if the service is running. If it is still not running, set up the licensing service manually:

    {
    sudo getent group adsklic &>/dev/null || sudo groupadd adsklic
    sudo id -u adsklic &>/dev/null || sudo useradd -M -r -g adsklic adsklic -d / -s /usr/sbin/nologin
    sudo ln -sf /opt/Autodesk/AdskLicensing/9.2.1.2399/AdskLicensingService/AdskLicensingService /usr/bin/AdskLicensingService
    sudo mkdir /usr/lib/systemd/system
    sudo cp -f /opt/Autodesk/AdskLicensing/9.2.1.2399/AdskLicensingService/adsklicensing.el7.service /usr/lib/systemd/system/adsklicensing.service
    sudo chmod 644 /usr/lib/systemd/system/adsklicensing.service
    sudo systemctl daemon-reload
    sudo systemctl enable adsklicensing
    sudo systemctl start adsklicensing
    }

Take a look at the Autodesk knowledge base for more information about installing configuring Maya on Linux:

-   [\<\$ScrKeepWithNext\>Autodesk \| Install Maya on Linux using the rpm package](https://knowledge.autodesk.com/support/maya/troubleshooting/caas/CloudHelp/cloudhelp/2022/ENU/Installation-Maya/files/GUID-E7E054E1-0E32-4B3C-88F9-BF820EB45BE5-htm.html?us_oa=akn-us&us_si=5a1aa406-06ec-422c-aefb-472c419b3d7d&us_st=maya%20linux%20install)
-   [Autodesk \| Additional information for Linux](https://knowledge.autodesk.com/support/maya/troubleshooting/caas/CloudHelp/cloudhelp/2022/ENU/Installation-Maya/files/GUID-3E0A3A36-B1C2-4B91-994B-731C672D9694-htm.html)
-   [Autodesk \| Additional required Linux libraries for Maya](https://knowledge.autodesk.com/support/maya/troubleshooting/caas/CloudHelp/cloudhelp/2022/ENU/Installation-Maya/files/GUID-D2B5433C-E0D2-421B-9BD8-24FED217FD7F-htm.html)

### Andersson Technologies SynthEyes Pro

Andersson Technologies SynthEyes Pro

SynthEyes Pro is high-quality, feature rich, cross-platform compatible MatchMoving software for the film & TV sector. It supports 360VR footage tracking, and stereo 3D camera rigs.

<https://www.ssontech.com>

For more information:

-   [YouTube \| SynthEyes \| Universal Scene Description (USD) Export, with Tricks](https://www.youtube.com/watch?v=_vHHYXptZpA)
-   [YouTube \| Using SynthEyes with Resolve](https://www.youtube.com/watch?v=KIBeSmKekQ0)

### Chaos Group V-Ray Renderer

Chaos Group V-Ray Renderer

Chaos Group makes a cross-platform compatible production renderer that runs efficiently on a CPU or a GPU.

V-Ray's render engine has very strong indirect illumination lighting features that make rendering artifact-free interior scenes of architecture easier and faster than ever.

<https://www.chaos.com/>

#### V-Ray Benchmark

V-Ray Benchmark

Installing V-Ray Benchmark on Linux

    # Add the extra libraries to support Electron GUI and GTK based apps
    sudo dnf install libpng15 compat-openssl10 -y

    # Fix a Vray Benchmark GUI error in the terminal window caused by a missing canberra GTK2 library module
    sudo dnf install libcanberra-gtk2 -y

V-Ray Benchmark Download

Go to the Chaos Group "Benchmark" webpage to download the most recent version.

<https://www.chaos.com/vray/benchmark>

Copy the downloaded V-Ray benchmark app to the opt folder

    sudo cp $HOME/Desktop/vray-benchmark-5.02.00 /opt/vray-benchmark-5.02.00

Run the benchmark utility

    cd /opt/
    /opt/vray-benchmark-5.02.00

Render Node Benchmarks

The reference system for Kartaverse v5 is an AMD TRX 40 based Threadripper 3990X based server that has high-performance CPU and GPU compute capabilities.

V-Ray CPU Test

68,232

V-Ray CUDA Test

7988

V-Ray RTX Test

11344

It's worth mentioning that the V-Ray benchmark program is Multi-GPU and Multi-CPU aware which is excellent when fine-tuning a new workstation build.

![[image224.jpg]]![[image318.jpg]]

#### Installing V-Ray Universal Render Node

Installing V-Ray Universal Render Node

Chaos Group sells monthly or annual V-Ray license subscriptions that provide access to a dedicated cross-platform "Universal" render node program.

This executable supports the creation of render farms that can process content coming from a wide range of host DCC (digital-content creation) packages. All that is needed is for the DCC program to use a V-Ray plugin to export standalone .vrscene files.

![[Kartaverse/Immersive Pipeline Integration Guide/img/image92.png]]

#### V-Ray Installer XML-Based Config Files

V-Ray Installer XML-Based Config Files

After you run the V-Ray installer program, you have the option of saving a config file to disk that holds all of your choices. This config file is exported using the XML file format.

The config file is particularly helpful when carrying out numerous V-Ray Universal Render Node deployment tasks on a render farm since the installer program allows you to run the executable from a text-based SSH shell session:

    sudo ./vray_adv_52003_maya2023_centos7 -configFile="/home/vfx/config_vray.xml" -ignoreErrors=1

#### V-Ray Licensing Preference File

V-Ray Licensing Preference File

When V-Ray is used with a network license checkout option, a file is created on-disk named:

    $HOME/.ChaosGroup/vrlclient.xml

Since the ".ChaosGroup" folder starts with a period character it is typically hidden on macOS and Linux filesystems by default.

A vrlclient.xml file that does a network license checkout will typically look like this document:

    <VRLClient>
        <LicServer>
            <Host>R1</Host>
            <Port>30304</Port>
            <Host1></Host1>
            <Port1>30304</Port1>
            <Host2></Host2>
            <Port2>30304</Port2>
            <User></User>
            <Pass></Pass>
        </LicServer>
    </VRLClient>

The Host field can hold either a hostname or IP address. This value can be customized visually by the V-Ray installer program to point to your LAN's V-Ray license server system.

#### V-Ray Environment Variables

V-Ray Environment Variables

Linux Standalone

    export VRAY_FOR_MAYA2023_MAIN=/usr/autodesk/maya2023/vray
    export VRAY_FOR_MAYA2023_PLUGINS=/usr/autodesk/maya2023/vray/vrayplugins
    export VRAY_OSL_PATH_MAYA2023=/usr/autodesk/Maya2023/opensl
    export VRAY_PATH=/usr/autodesk/maya2023/vray/bin
    export VRAY_SEND_FEEDBACK=1
    export VRAY_TOOLS_MAYA2023=/usr/autodesk/Maya2023/bin

Windows Standalone

    VRAY_FOR_MAYA2023_MAIN=C:\Program Files\Chaos Group\V-Ray\Standalone for x64\vray
    VRAY_FOR_MAYA2023_PLUGINS=C:\Program Files\Chaos Group\V-Ray\Standalone for x64\vray\vrayplugins
    VRAY_OSL_PATH_MAYA2023=C:\Program Files\Chaos Group\V-Ray\Maya 2023 for x64/opensl
    VRAY_SEND_FEEDBACK=1
    VRAY_TOOLS_MAYA2023=C:\Program Files\Chaos Group\V-Ray\Maya 2023 for x64/bin

macOS Standalone

    VRAY_FOR_MAYA2023_MAIN=/Applications/Autodesk/maya2023/vray
    VRAY_FOR_MAYA2023_PLUGINS=/Applications/ChaosGroup/V-Ray/Maya2023/VRay.app/Contents/MacOS/plugins
    VRAY_OSL_PATH_MAYA2023=/Applications/ChaosGroup/V-Ray/Maya2023/opensl
    VRAY_PATH=/Applications/Autodesk/maya2023/vray/bin
    VRAY_SEND_FEEDBACK=0
    VRAY_TOOLS_MAYA2023=/Applications/ChaosGroup/V-Ray/Maya2023/bin

#### Manually Starting V-Ray Server

Manually Starting V-Ray Server

If you need direct control over a V-Ray DR process you can manually start the vrayserver executable from a command-prompt/terminal session.

Here is a Linux based example:

    sudo /usr/ChaosGroup/V-Ray/Maya2023-x64/bin/vrayserver

Here is a Windows based example:

    cd /usr/ChaosGroup/V-Ray/Maya2023-x64/bin
    sudo ./registerVRayServerDaemon
    sudo ./startVRayServerDaemon

#### V-Ray DR Check

V-Ray DR Check

The V-Ray DR Check utility is available on all supported host operating systems. The tool lets you see the specifics for a running V-Ray Universal Render Node session. You need to specify the exact hostname or IP address for a render node system along with a port number. The default V-Ray DR port number is 20207.

    /usr/ChaosGroup/V-Ray/Maya2023-x64/bin/vraydr_check -host=10.20.30.2 -port=20207

On macOS and Linux systems it is possible to check if multiple concurrent V-Ray rendering processes are active, or stalled, on a render node using the terminal-based ps utility with the output piped into grep:

    echo "[List V-Ray Processes]"
    ps -edf | grep "vray\.bin"

#### V-Ray Distributed Rendering

V-Ray Distributed Rendering

When project deadlines are fast approaching, having a render farm with the V-Ray Universal Render Node program installed on multiple nodes is an excellent resource to use for V-Ray DR (Distributed Rendering). This V-Ray DR technique will dramatically accelerate the final-frame and interactive rendering performance of an artist's interactive GUI session.

With DR active in your V-Ray render sessions, artists have the option to access multiple render nodes concurrently, and will be able to use that hardware to perform faster interactive lighting and "look development" in programs that have a full-featured V-Ray integration plugin like Maya, Houdini, and 3DS Max.

This V-Ray distributed rendering approach is discussed in the following article:

[Master V-Ray Next for Maya with this 4-part practical guide](https://www.chaos.com/blog/master-v-ray-next-for-maya-with-this-4-part-practical-guide)

![[Kartaverse/Immersive Pipeline Integration Guide/img/image395.png]]

#### V-Ray Scene Render for Fusion Fuse

V-Ray Scene Render for Fusion Fuse

[WSL \[BETA\] kvrVraySceneRender Fuse Thread Post](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=40575#p40575)

Render V-Ray based .vrscene file assets interactively from the V-Ray VFB window, from within the comfort of a Resolve/Fusion GUI or Fusion Render Node session, via V-Ray Universal Render Node command-line interface bindings.

![[image375.jpg]]

GUI Controls

![[image386.jpg]]

The VRScene Filename control supports the use of PathMaps and %04d style frame padding characters.

The EXR Filename control supports the use of PathMaps and %04d style frame padding characters.

The "Static Frame" control allows you to load either a (static) single image, or an image sequence.

The "Interactive" control allows you to have the rendering launched during a Fusion Studio GUI artist session. When this control is unchecked, renderings are only carried out during batch renders.

The "Skip Rendering if image exists" checkbox allows you to make sure you aren't re-rendering the same frame again. This control will look for the expected image name on-disk and only launch a rendering of a new image if no image file is found.

Workflow Notes

This fuse works with Cryptomatte since a "Metadata.Filename" record is added automatically to the image output stream that is generated by the V-Ray Batch Render fuse. This metadata information allows Cryptomatte masking operations to work in Fusion if the VRScene file being rendered has the Cryptomatte render element enabled.

Dev Todo Sooner List

-   Error handling - missing V-Ray host program error is mis-identified as a missing scene
-   Drag and drop import .vrscene file into Fusion comp view
-   Parse the vrscene file on drag/drop import to look for scene filename token
-   "Open VRScene in Script Editor" Button - Open the file with the Script editor defined in the Fusion preferences
-   V-Ray Bin hosts on macOS/Win/Linux selector

Dev Todo Later List

-   Customize EXR Filename
-   Render Element Override controls
-   Figure out multi-rendering of same frame issue
-   Check-point auto-save image every N minutes
-   Get EXR image name from popen() result
-   Batch vs interactive rendering
-   VFB project workspace - save history tab path
-   Cryptomatte depth is not 32-bit - look at V-Ray frame buffer settings in Maya
-   EffectsMask input on VrayBatchRender sets bucket priority masking

Image Saved File Info

    [2021/Jul/8|06:41:39] [2117 MB] Successfully written image file "/Volumes/Projects/Yeti_Vray_Project/images/tmp/blue_fur.exr"

When drag/drop importing a vrsene file grab the name from the fields:

    img_file="sphere.exr";
    img_dir="/Users/vfx/Documents/maya/projects/default/images/tmp/";

A sample .vrscene code block:

    SettingsOutput vraySettingsOutput {
      img_width=1920;
      img_height=1080;
      img_pixelAspect=1;
      img_file="sphere.exr";
      img_dir="/Users/vfx/Documents/maya/projects/default/images/tmp/";
      img_file_needFrameNumber=0;
      img_separateAlpha=0;
      img_noAlpha=0;
      img_dontSaveRgbChannel=0;
      img_deepFile=0;
      img_rawFile=0;
      img_rawFileVFB=1;
      img_rawFileSaveColorCorrections=0;
      img_clearMode=0;
      anim_start=1;
      anim_end=1;
      anim_frame_padding=4;
      anim_renumber_on=0;
      anim_renumber_start=0;
      anim_renumber_step=1;
      anim_ren_frame_start=0;
      frame_start=1;
      frames_per_second=1;
      frames=ListInt(    1);
      rgn_left=0;
      rgn_width=1920;
      rgn_top=0;
      rgn_height=1080;
      bmp_width=1920;
      bmp_height=1080;
      r_left=0;
      r_width=1920;
      r_top=0;
      r_height=1080;
      relements_separateFolders=0;
      relements_separate_rgba=0;
      relements_divider=".";
      film_offset_x=0;
      film_offset_y=-0;
     }

### Pixar RenderMan

Pixar RenderMan

Pixar's RenderMan is the original production renderer used in the film industry for feature animation and visual effects. The native RenderMan scene description format is called a RenderMan Interface Bytestream (.rib) file.

<https://renderman.pixar.com/>

RenderMan Resources

-   [Download RenderMan Non-Commercial Edition](https://renderman.pixar.com/store) (free)
-   [Learn RenderMan](https://renderman.pixar.com/learn) (free)
-   [Art of RenderMan Volume 1 Training Video](https://renderman.pixar.com/the-art-of-renderman---vol-1) (free)

#### RenderMan for Fusion (TF31 Plugin)

RenderMan for Fusion (TF31 Plugin)

Marcel Gandriau (Tolosa Films) has a new RenderMan v24 for Fusion plugin that is under development for Resolve Studio and Fusion Studio. The plugin is able to work with RenderMan's paid and NC (Non-Commercial) editions.

This image shows the Eisko Louise character asset from the RenderMan learning page being used with the TF31 RenderMan for Fusion plugin:

![[Kartaverse/Immersive Pipeline Integration Guide/img/image64.png]]

This image shows a plush dragon model with alembic hair curves. The asset is from the RenderMan learning page and it is shown in a Fusion composite that uses the TF31 RenderMan for Fusion plugin:

![[Kartaverse/Immersive Pipeline Integration Guide/img/image187.png]]

This image shows the Cookies and Milk assets from the RenderMan learning page in a Fusion composite that uses the TF31 RenderMan for Fusion plugin:

![[Kartaverse/Immersive Pipeline Integration Guide/img/image57.png]]

The TF31 integration plugin provides Fusion-based artists with access to Pixar's RenderMan software which is a high-quality film-level production renderer that can be used to raytrace a detailed 2D scene with reflections, refractions, subsurface shading, advanced lighting including light-filters, and render-time procedural features like Xgen Hair.

This makes it possible to use Fusion's 3D workspace and node-graph to author native RenderMan .rib formatted scene description files. This RIB formatted content is exported to disk by a Renderer3D node, and rendered using RenderMan Pro Server.

There is a handy "RigExtractor" command-line utility included with the TF31 plugin. It is used to translate RenderMan for Maya, and RenderMan for Blender exported .rib files into Fusion node-graph based comps with underlays:

    RibExtractor <YourRenderManScene.rib> <directory>

An early-access version of the TF31 plugin runs today with Fusion Studio v18 on macOS (Intel x64) and Windows 10/11 systems. It is available in limited release as a beta version hosted on the Steakunderwater forum's [FusionSDK zone](https://www.steakunderwater.com/wesuckless/viewtopic.php?t=5552) (A WSL forum login with FusionSDK access permissions added is required to view this link).

#### RenderMan NC (Non-Commercial) Installer Download

RenderMan NC (Non-Commercial) Installer Download

The Pixar RenderMan learning website provides access to a [downloadable copy of RenderMan v24 NC (Non-Commercial)](https://renderman.pixar.com/store).

Click the "Free to Try" button to register for a free RenderMan account that allows you to download the RenderMan DCC plugin, RenderMan Pro Server, and LocalQueue.

![[Kartaverse/Immersive Pipeline Integration Guide/img/image288.png]]

The current (as of 2022-11-25) RenderMan NC v24.4 release for macOS has the filename of:

    RenderMan-InstallerNCR-24.4.0_2226589-osxMojave_clang10.x86_64.dmg

#### Fixing a PRMan Installer Disk Permissions Issue

Fixing a PRMan Installer Disk Permissions Issue

In order for the macOS based RenderMan NC installer to be able to write the files to disk it is a good idea to add the "RenderMan Installer.app" file to the "System Preferences \> Security & Privacy \> Privacy \> Full Disk Access" section. Make sure to enable the checkbox by that entry's name in the dialog.

Additionally, you can temporarily change the folder permissions on the Pixar folder to make installing files easier:

    sudo chmod -R 777 /Applications/Pixar/

Once these changes have been made you can run the "RenderMan Installer.app" program and the RPS (RenderMan Pro Server) and RFM (RenderMan for Maya) installs will complete successfully.

![[Kartaverse/Immersive Pipeline Integration Guide/img/image55.png]]

If you don't make the macOS disk permission changes, the first time the RenderMan installer is run it will generate and save the "pixar.license" license file to disk. Unfortunately the RenderMan installer will then report a disk permission write access issue on macOS Monterey which causes the installer to fail at the stage of creating the "RenderManProServer-24.4" and "RenderManForMaya-24.4" sub-folders in the Pixar directory. This error stage cancels the reset of the install process.

![[Kartaverse/Immersive Pipeline Integration Guide/img/image315.png]]![[Kartaverse/Immersive Pipeline Integration Guide/img/image301.png]]

#### Configuring RenderMan Environment Variables

Configuring RenderMan Environment Variables

If you want to use the RenderMan for Fusion (TF31) plugin, or RenderMan Pro Server, it helps to add several environment variables to your system.

macOS Environment Variables

Since macOS Monterey uses ZSH for the default terminal, I created a "\$HOME/.zshenv" file and added the following content to the text file:

    export RMSTREE=/Applications/Pixar/RenderManForMaya-24.4
    export RMANTREE=/Applications/Pixar/RenderManProServer-24.4
    export RFMTREE=/Applications/Pixar/RenderManForMaya-24.4
    export RFM_VERSION=24.4
    export RFM_MAYA_VERSION=2023
    export PIXAR_LICENSE_FILE=/Applications/Pixar/pixar.license

Windows Environment Variables

On Windows 10/11 you can use the System Control Panel to add the following environment variable entries. Some of these entries will be automatically added for you by the RenderMan installer.

    RMANTREE=C:\Program Files\Pixar\RenderManProServer-24.4\
    RFMTREE=C:\Program Files\Pixar\RenderManForMaya-24.4\
    RFM_VERSION=24.4
    RFM_MAYA_VERSION=2023
    PIXAR_LICENSE_FILE=C:\Program Files\Pixar\pixar.license
    PATH=C:\Program Files\Pixar\RenderManProServer-24.4\bin;C:\Program Files\Pixar\RenderManProServer-24.4\lib

#### Using the RenderMan for Fusion (TF31) Plugin

Using the RenderMan for Fusion (TF31) Plugin

Install The TF31 Plugin

Copy the TF31 plugin files into one of the Fusion "Plugins:/" PathMap supported folder locations on-disk.

On Windows you need to add the following RenderMan Pro Server library files to the Plugins folder:

-   libprman.dll (from Pixar/RenderManProServer-xx.x/lib/)
-   libpxrcore.dll (from Pixar/RenderManProServer-xx.x/bin/)
-   libstats.dll (from Pixar/RenderManProServer-xx.x/bin/)

The TF31 plugin bundled files include:

-   RibRendererMac.plugin or RibRendererWin.plugin
-   aovs.json
-   tf31.tif

The "tf31.tif" image is the default placeholder texture map that is applied to 3D models when they are viewed in the Fusion 3D workspace's viewer window context. The image shows a RenderMan "R" shaped logo:

![[Kartaverse/Immersive Pipeline Integration Guide/img/image295.png]]

Launch Fusion Studio

On macOS, if you defined your RenderMan environment variables using a \$HOME/.zshenv file you can start Fusion Studio v18 from a terminal session using:

    "/Applications/Blackmagic Fusion 18/Fusion.app/Contents/MacOS/Fusion" -verbose -clean -log "$HOME/Desktop/Fusion_log.txt"

On Windows, you can start Fusion Studio v18 from a command-prompt session using:

    "C:\Program Files\Blackmagic Design\Fusion 18\Fusion.exe" /verbose /clean /log "%USERPROFILE%\Desktop\Fusion_log.txt"

Launching Fusion Studio from a terminal/command-prompt window is useful for troubleshooting purposes as it lists detailed diagnostic logging information, and saves error messages to a log file on-disk as well, if there are any issues.

#### Check the TF31 Plugin Version

Check the TF31 Plugin Version

If you want to see what version of the TF31 plugin you have installed, select the "Fusion Studio \> About Fusion Studio" menu entry. This will open the "About Fusion Window".

Then click on one of the TF31 plugin's nodes, in the list on the lower left part of the window, to see the exact build date.

![[Kartaverse/Immersive Pipeline Integration Guide/img/image186.png]]

#### The Tools Menu

The Tools Menu

The RenderMan for Fusion nodes are accessible in Fusion Studio using the "Tools \> TF31 \> pxr \>" menus.

![[Kartaverse/Immersive Pipeline Integration Guide/img/image310.png]]

#### Fusion Preferences

Fusion Preferences

The plugin has its own Fusion preference page found at:

Global and Default Settings \> Rib

![[Kartaverse/Immersive Pipeline Integration Guide/img/image329.png]]

#### Creating RenderMan Node Graphs in Fusion

Creating RenderMan Node Graphs in Fusion

![[Kartaverse/Immersive Pipeline Integration Guide/img/image188.png]]

If you are building a new RenderMan scene in Fusion, the typical node-connections used with the TF31 plugin are:

    TF31PxrSurface -> TF31PxrSG
    TF31PxrSG -> Shape3D
    Shape3D -> Merge3D
    TF31PxrCamera -> Merge3D
    TF31PxrRectLight -> Merge3D
    Merge3D -> Renderer3D

The "TF31PxrSurface" node is the Pixar surface material node.

The "TF31PxrSG" node represents a typical Autodesk Maya style shading group.

The "TF31PxrCamera" node is used to add a Pixar camera to the scene.

The "TF31PxrRectLight" node is a rectangular area light.

#### Renderer3D Node

Renderer3D Node

The "Renderer3D" node is used to define the render-time output settings for a Fusion 3D scene graph.

When creating a new Fusion 3D comp, you need to change the Renderer3D node's "Render Type" setting from outputting the scene using a typical OpenGL or software rendering setting over to using the "Rib Renderer''. This allows a RenderMan .rib file to be generated.

![[Kartaverse/Immersive Pipeline Integration Guide/img/image8.png]]

The Renderer3D node has a "Preview" button that can be used to export a .rib file that holds the 3D scene graph information. When the Preview button is pressed an additional RenderMan Tractor Render Manager/LocalQueue based "Alfred" .alf job description file is created at the same time.

This "Alfred" .alf file streamlines the process of using RenderMan Pro Server to create renderings in the background without blocking a Fusion Studio GUI based artist session.

![[Kartaverse/Immersive Pipeline Integration Guide/img/image326.png]]

#### TF31PxrAlembic Node

TF31PxrAlembic Node

It is possible to bypass Fusion's AlembicMesh3D node and import Alembic data natively using a "TF31PxrAlembic" node. This native mesh loading node allows attributes like subdivision surface creases to be retained.

Surface Material Previews

Note: When RenderMan surface materials are displayed in the real-time Fusion 3D viewer window contexts you will see a place-holder texture map on the 3D models that features a repeating pattern of a small RenderMan "R" shaped logo on all of the surfaces.

![[Kartaverse/Immersive Pipeline Integration Guide/img/image358.png]]

#### Rendering Exported RIB Files Using RenderMan Pro Server

Rendering Exported RIB Files Using RenderMan Pro Server

After you export a .rib file to disk, you are able to render it directly from a terminal window on a macOS system using a shell command like:

    /Applications/Pixar/RenderManProServer-24.4/bin/prman "$HOME/Documents/Blackmagic Design/Fusion/test/ribs/test_000.rib"

The rib file will typically render an OpenEXR formatted image to disk with the .openexr file extension. You can view the image in the "IT.app" utility.

![[Kartaverse/Immersive Pipeline Integration Guide/img/image116.png]]

#### RenderMan Lacks ARM64 Native Support

RenderMan Lacks ARM64 Native Support

Note: At the current moment you cannot use the TF31 plugin on a macOS system with an Apple ARM64 architecture based CPU. You need to run the TF31 plugin on a native Intel x64 based macOS system or a Hackintosh.

This is due to the Pixar RenderMan SDK's lack of ARM64 compatible include/header/libraries in the currently shipping version of RenderMan Pro Server. Hopefully this ARM64 support issue will be fixed when Autodesk Maya ships with ARM64 native support, and the RenderMan for Maya plugin also ships with ARM64 support as well.

In the meantime you will see this error message on a macOS ARM64 system if you run the TF31 plugin inside of Fusion Studio.

![[Kartaverse/Immersive Pipeline Integration Guide/img/image341.png]]

#### What the heck is a Fusion Plugins Blocklist File?

What the heck is a Fusion Plugins Blocklist File?

If you have a Fusion 3rd party plugin loading issue during Fusion Studio's startup process you will typically see an error message that starts with the words "Unable to load plugin".

![[Kartaverse/Immersive Pipeline Integration Guide/img/image169.png]]

After the plugin fails to load an entry is added automatically to the file:

    %appdata%\Blackmagic Design\Fusion\Profiles\Default\Plugins17.blocklist

This blocklist file is used to stop recurring Fusion Studio startup error messages from being displayed in the future.

The blocklist file contents will typically look like this:

    {
        { "C:/ProgramData/Blackmagic Design/Fusion/Reactor/Deploy/Plugins/RibRenderer.plugin", 1666459470000 }
    }

After you correct the issue that caused the 3rd party plugin's error state to occur, you can remove the entry that was added in the Plugins17.blocklist file. This allows the plugin to be used in the future.

### ftrack / ftrack Connect Deployment

ftrack / ftrack Connect Deployment

<https://www.ftrack.com/en/connect>

ftrack Studio is a shot management, production tracking, and media review platform. ftrack Connect integrates the toolset with your creative apps. It allows you to optimize your pipeline, publish assets, launch tools, run integrations, and streamline daily workflows with custom processes unique to your studio.

This process allows the assignment of tasks to individual staff on a project, and streamlines version control which tracks revisions on individual shots, along with managing the media created.

The "ftrack connect" software is used to help interconnect the core ftrack program with the rest of your production pipeline.

-   [ftrack Connect Product Page](https://www.ftrack.com/en/connect)
-   [ftrack Connect Docs](http://ftrack-connect.rtd.ftrack.com/en/latest/about/index.html)
-   [ftrack Developer Hub](https://www.ftrack.com/en/developer)
-   [ftrack Integrations](https://www.ftrack.com/en/integrations)
-   [ftrack Python API](http://ftrack-python-api.rtd.ftrack.com/en/stable/index.html)
-   [ftrack Help \| Getting Started With the API](https://help.ftrack.com/en/articles/1054630-getting-started-with-the-api)
-   [ftrack Help \| Developing with ftrack](https://help.ftrack.com/en/collections/133732-developing-with-ftrack)
-   [ftrack Help \| Query Syntax](https://help.ftrack.com/en/articles/1040506-query-syntax)
-   [ftrack Help \| Publishing](https://help.ftrack.com/en/articles/1040441-publishing)

#### ftrack-fusion \| A Resolve/Fusion Integration for ftrack Connect

ftrack-fusion \| A Resolve/Fusion Integration for ftrack Connect

Development on a new community created ftrack integration for BMD Fusion Studio and Resolve Studio is underway. Please bookmark the following webpages to stay up-to-date on progress information:

<https://gitlab.com/AndrewHazelden/ftrack-fusion>

For more information:

-   [WSL \| \[DEV\] ftrack-fusion \| A Resolve/Fusion Integration for ftrack Connect](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=42471#p42471)
-   [GitHub \| Movalex ftrack Saver Node Python Script](https://github.com/movalex/fusion/tree/master/Scripts/Comp/DEV/ftrack)

### Re:Vision Effects

Re:Vision Effects

Re:Vision Effects creates a wide range of VFX plugins that help with tasks like image uprezzing, lens distortion correction, motion vector warping, multi-view stereo color matching, and ST Map based warping. The plugins work with just about every single editing and compositing package out there, including Resolve/Fusion.

<https://revisionfx.com/>

The Re:Vision Effects company is a USA based collaborator that is working with the Left Angle Autograph software's development team to help re-design and re-imagine what is possible in artist-friendly next-generation motion graphics and compositing workflows. The future is literally being made right now. 🚀

<https://www.left-angle.com/>

### CineSyncPlay Deployment

CineSyncPlay Deployment

Ftrack has a new [CineSyncPlay](https://www.ftrack.com/en/cinesync/download-cinesync-5) program that makes image sequence, movie, and 360VR media playback fast and easy. It is cross-platform compatible and runs on Windows, Linux, and macOS.

CineSyncPlay supports command line flags which allows it to be added to the Amazon AWS Thinkbox "Deadline" render manager's Monitor program as the default media viewer. Double-clicking on a completed job task in the Deadline Monitor window will then display the final rendered footage instantly for review and playback. This works really smoothly in an immersive pipeline.

### Backlight Ikonic Deployment

Backlight Ikonic Deployment

Ikonic is a cloud based media management solution. Ikonic is released by the same parent company that creates the ftrack software.

<https://www.iconik.io>

### Jupyter Notebook Deployment

Jupyter Notebook Deployment

![[Kartaverse/Immersive Pipeline Integration Guide/img/image10.png]]

Jupyter is used for interactive scripting with programming languages like Python. It is popular with machine learning, data science, and computer vision researchers.

More information about how to use Jupyter Notebook with Resolve/Fusion can be read here:

**Kartaverse Workflows \| Jupyter Notebook for Resolve/Fusion**

<https://docs.google.com/document/d/1Jza91fL7csYVOSgYCMsa17r3DMmaJdwXevieTh-tqWg/edit>

### SideFX Houdini 19.5 Install for Windows

SideFX Houdini 19.5 Install for Windows

Change Windows Env vars for HFS

\- Name = `HFS:`

\- Value = `C:\Program Files\Side Effects Software\Houdini 19.5.357`

#### Install Options

Install Options

        - Houdini
            Main Application
            File Associations
            Industry File Types
            SideFX Labs
            Desktop icon
            HQueue Client
            - C:\HQueueClient
            - Host = 10.20.30.1
            - Port = 5000

#### Houdini HKey

Houdini HKey

    Licensing Program

        C:\Program Files\Side Effects Software\Houdini 19.5.357\bin\hkey.exe  

    Licensing Settings
        - "File > Change License Server" Menu
        - Add Custom Server if required, or use web based licensing for Houdini Indie.

#### Houdini 19.5 Install for Linux

Houdini 19.5 Install for Linux

![[Kartaverse/Immersive Pipeline Integration Guide/img/image174.png]]

##### Linux Dependencies

Linux Dependencies

Required for libXss.so.1

        sudo dnf install -y libXScrnSaver

Required for ibnsl.so.1

        sudo dnf install -y libnsl

Note: Houdini 19.5 will not run on a Linux distro that has glibc 2.34 installed. This includes new Ubuntu Linux releases shipped after Jan 2021.

##### License Houdini on Linux

License Houdini on Linux

If you need to license Houdini on on a computer without a monitor connected (aka a headless Linux compute node), the licensing stage can be done by creating a text file on-disk at:

    $HOME/.sesi_licenses.pref

The text file contents should list the hostname that is acting as a Houdini floating license server:

    serverhost=10.20.30.1

##### Linux Network shares

Linux Network shares

You can connect a Houdini based Linux render node to an NFS based shared file server drive mount using BASH shell commands like:

        sudo mkdir -p  /Volumes/Farm
        sudo chmod -R 777 /Volumes/Farm

        sudo nano /etc/fstab

        R1:/Volumes/Farm /Volumes/Farm   nfs      auto,rw,async,noatime,nolock,bg,nfsvers=3,intr,tcp,actimeo=1800 0 0

        sudo mount -a
        df -h

##### Install Houdini + HQueue on Linux

Install Houdini + HQueue on Linux

It is possible to install Houdini from a terminal window or via a remote SSH session using the following BASH shell commands:

    cd $HOME/Downloads/Houdini/houdini-19.5.303-linux_x86_64_gcc9.3

    #  To fix an error "python3.9.tar.gz: Cannot open: Permission denied"
    sudo chmod -R 777 .

    sudo ./houdini.install

    Where do you want to install the HQueue Server? [/opt/hqueue] ==> 
    /opt/hqueue

    # Set the user account as "vfx" not "hqueue" in the installer dialog:
    Where do you want to install the HQueue Client? [/home/hquser/hqclient] ==> 
    /home/vfx/hqclient

    cd /opt/hfs19.5
    ./houdini_setup_bash

    sudo chmod -R 777 /opt/hfs19.5

    nano $HOME/.bash_profile

    # User specific environment and startup programs
    cd /opt/hfs19.5
    source /opt/hfs19.5/houdini_setup
    cd $HOME

    # Create the dummy HQ Shared root folder
    sudo mkdir -p /mnt/hq/

    # Start hqueue server
    cd /opt/hqueue/scripts
    sudo chmod -R 777 /opt/hqueue/
    ./hqserverd start

    # Start hqueue client
    cd $HOME/hqclient
    ./hqclientd start
    ./hqclientd restart

##### Uninstall Houdini on Linux

Uninstall Houdini on Linux

    cd /opt/hfs19.5
    sudo ./houdini.uninstall
    sudo rm -rf /opt/sidefx_packages/

    # Remove HQServer
    sudo rm -rf /opt/hqueue/

    # Remove HQclient in the hquser folder
    ssh hquser:hqpass@localhost
    or
    su - hquser
    # enter password "hqpass"

    rm -rf /home/hquser/hqclient

#### Houdini Viewport Customizations

Houdini Viewport Customizations

    d hotkey = display options
    Background = Dark (Applied to both the Obj and Stage contexts)
    Default desktop: Technical
    Global UI scale: 1.25

#### HQ Scheduler Notes

HQ Scheduler Notes

    Linux based Houdini TOPs - hqueuescheduler:  
    HFS > Python Executable: $HFS/bin/hython

#### Houdini Environment Variables

Houdini Environment Variables

If you need to keep a Houdini project file organized and make sure the asset filepaths are up-to-date, you can use the following tokens as placeholders in filename fields. The tokens will be evaluated automatically when the node graph is cooked at render time:

    $F4 = 4 digits of frame padding on the current frame number
    $HQHOSTS = The name of the current render node that is processing this frame chunk
    $HFS = The path to the Houdini program files folder where the houdini setup shell script is stored inside of
    $HIP = The path to the folder where the current Houdini .hip file is stored
    $HIPNAME = The name of the current Houdini .hip file

#### SideFX HQueue Render Manager

SideFX HQueue Render Manager

HQueue is a cross-platform compatible network render manager program with a Web-based user interface that comes from SideFX software. It is a license-free toolset that can be installed on an unlimited number of render nodes without requiring a Houdini license.

##### Step 1.

Step 1.

Modify the HQROOT entries from your HQServer "network_folders.ini" file's settings to a local dummy folder like:

    HQROOT
    C:\HQShared

Also create a Windows based system environment variable for:

    HQROOT = C:\HQShared  

Edit the "`C:\HQClient\hqnode.ini`" file so the server is set to:

    [main]
    server = 10.20.30.4
    port = 5000

    [job_environment]

##### Step 2.

Step 2.

In TOPs, clear out the pre-existing "PDG Path Map" fields.

Set the "topnet1" node to use a "Default Scheduler" entry like:

    localscheduler (local only jobs)

or

    hqueuescheduler1 (network jobs)

##### Step 3.

Step 3.

Inside the current task area set the "hqueuescheduler" node to use:

    HQueue Server:
    http://localhost:5000
    or
    http://10.20.30.4:5000

    HFS:
        [ ] Universal HFS (Clear out)
        Linux HFS Path: (Clear out)
        macOS HFS Path: (Clear out)
        Windows HFS Path: $HFS

Paths:

Load Item Data From: Temporary JSON File

Uncheck "\[ \] Compress work item data".

##### Step 4.

Step 4.

Press the "U" key in the nodes view area to navigate back to the top-level tasks view.

Select "topnet1" in the nodes view.

To launch a new batch network render, click on the "Dirty All" button to clear out any render progress information. Then click on "Cook Output Node".

##### Popular HQueue Errors

Popular HQueue Errors

    Error: localsharedroot path not found.

This happens if a dummy `$HQROOT` value is not entered.

Note: With "RPC Message Passing" the render job fails, so use JSON temp files instead.

Note: Don't use a fully expanded absolute filepath for the Windows SideFX Houdini folder in place of `$HFS`, or it will error the job.

##### Alembic ROP + HQueue in TOPs

Alembic ROP + HQueue in TOPs

Alembic files can be written to disk inside task-based node graph using an Alembic ROP node.

hqscheduler Node

Add an "hqscheduler" node in the TOPs context.

    HFS: $HFS
    Python: From HFS

ropalembic Node

Add a "ropalembic" node to the tasks context.

    ROP Alembic Tab

    Evaluate Using:
        Frame Range

    Alembic File:

        $HIP/geo/$HIPNAME/$OS.$F4.abc
        or
        $HIP/geo/$HIPNAME/$OS/$OS.$F4.abc

    Root Object:
        /obj/<Select the geo node to export>


    ROP Fetch Tab:
        Frames per Batch: 1


    OP Cook path:
        /tasks/topnet1/ropalembic1/ropnet1/alembic1

Waitforall Node

If you want to merge the execution branching in TOPS for multiple parallel tasks, add a "waitforall" node at the end of the node tree.

USD Render in TOPS

It is possible to export OpenUSD files from a task context. This is done with a ROP node approach.

    In tasks context

    ROP USD Output  
        - [x] use External LOP

    LOP Path: (need to define in new projects)
        /stage/output0

    Output file:
        $HIP/geo/$HIPNAME.$OS.usd

    Connected to:

    USD Render

    Source: 
        USD File - Upstream Output File

    Output:
        $HIP/render/$HIPNAME.$OS.<F4>.exr
    Stage
        Geometry
            > Camera
            > Render Settings (or RenderProduct if old school v18)
            > Output0

#### Render Fusion Comps in Houdini TOPs

Render Fusion Comps in Houdini TOPs

A Houdini TOPs based node graph can be used to create workflow automation projects in a visual interface. It is another way to control a task that would otherwise need to be run as a Deadline Render Manager based job using a custom submitter.

It is possible to use Houdini TOPs to control image processing workflows:

<https://docs.google.com/document/d/1l9L-LhCxTobZmRlinu3oKUM61EuqtZJmcf_Tv1VG-8Q/edit>

![[Kartaverse/Immersive Pipeline Integration Guide/img/image391.png]]

#### Distributing a Houdini TOPs Job With HQueue

Distributing a Houdini TOPs Job With HQueue

![[Kartaverse/Immersive Pipeline Integration Guide/img/image22.png]]

Shortly after you create your first TOPs job in Houdini, you will feel the need to speed up your render time and output volume through another layer of automation. This is where distributed compute techniques come into play.

Houdini includes the (free) HQueue render farm controller program that should likely be your first port-of-call in distributing a TOPs based task to render nodes.

If you eventually out-grow the features provided by the bundled HQueue render manager, you also have the option of distributing a TOPs job using Pixar's Tractor render manager, or the Amazon AWS Thinkbox Deadline render manager.

#### Configuring HQueue on Windows

Configuring HQueue on Windows

Here are a few tips to help you configure a fresh install of HQueue.

As a small observation, when working in a small render farm, the act of pointing the HQROOT path at your storage server's primary volume, tends to just cause headaches when you only have one shared hard disk for the whole file server.

Also, it helps to segment your HQueue Pools into separate groups per operating system. Don't mix and match them unless you have taken the time to set up and fully customize environment variables for use on any OS specific value you need to rely on in a TOPs job.

##### Step 1. {#ref1}

Step 1.

Modify the HQROOT entries from your HQServer "network_folders.ini" file's settings to a local dummy folder like:

    HQROOT
    C:\HQShared

Also create a Windows based system environment variable for:

    HQROOT = C:\HQShared

Edit the "`C:\HQClient\hqnode.ini`" file so the server is set to:

    [main]
    server = 10.20.30.2
    port = 5000

    [job_environment]

##### Step 2. {#ref2}

Step 2.

In TOPs, clear out the pre-existing "PDG Path Map" fields.

Set the "topnet1" node to use:

    Default Scheduler:
    localscheduler (local only jobs) 
    or
    hqueuescheduler1 (network jobs)

##### Step 3. {#ref3}

Step 3.

Then inside the current task area:

Set the "hqueuescheduler" node to use:

HQueue Server:

You can connect as localhost if HQueue is running on the same system as Houdini:

<http://localhost:5000>

Or you can enter the server's fixed IP v4 address like:

http://10.20.30.4:5000

    HFS:
    [ ] Universal HFS (Clear out)
    Linux HFS Path: (Clear out)
    macOS HFS Path: (Clear out)
    Windows HFS Path: $HFS

    Paths:
    Load Item Data From: Temporary JSON File
    Uncheck "[ ] Compress work item data".

##### Step 4. {#ref4}

Step 4.

Press the "U" key in the node view context to navigate back to the top level Tasks view.

Select "topnet1" in the nodes view.

To launch a new batch network render, click on the "Dirty All" button to clear out any render progress information. Then click on "Cook Output Node".

##### Popular HQueue Error Messages

Popular HQueue Error Messages

`Error: localsharedroot path not found.`

This happens if a dummy `$HQROOT` value is not entered.

Note: If you enabled the TOPs based parameter for "RPC Message Passing", and the render job fails each time it is run, a workaround is to switch over to using JSON temp files instead. JSON temp files on the small scale can be more reliable and easier to manage on a small farm.

Note: Don't try to manually enter a fully expanded absolute filepath that points to the Windows SideFX Houdini folder, in place of the \$HFS environment variable. Doing this will likely result in rendering errors when you cook a TOPs job.

##### HQueue Links

HQueue Links

mqserver

<https://www.sidefx.com/docs/houdini/ref/utils/mqserver.html>