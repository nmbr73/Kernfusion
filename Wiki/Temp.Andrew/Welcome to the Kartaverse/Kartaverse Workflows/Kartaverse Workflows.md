Title: Welcome to the Kartaverse  
Author:

Kartaverse Workflows \| Creating Volumetric NeRFs

Created 2022-05-09 Last Updated 2022-05-20 07.50 PM UTC -4

By [Andrew Hazelden \<andrew@andrewhazelden.com\>](mailto:andrew@andrewhazelden.com)

Overview

The motivation for writing this content is to illustrate and describe approaches that can be used to create volumetric NeRF representations of environments. NeRF stands for a neural radiance field which is an alternative way to describe a scene compared to datatypes like meshes, point clouds, voxels, lightfields, or MultiSphere/MultiPlane media.

This year NVIDIA released a project called Instant NGP (Neural Graphics Primitives). Among other achievements it dramatically speeds up the process of training a NeRF scene by several orders of magnitude compared to prior techniques developed between 2020-2021. 

Previously this NeRF performance bottleneck issue was a significant blockage for the further adoption and refinements of NeRF concepts from both a technical and creative perspective.

![][image15]

NeRF Video Snapshots

Here are several short video clips that give an impression of what it's like to explore a NeRF scene using the Instant NGP repository's TestBed program.

NeRF Instant NGP \| TestBed \| Lion Orbit

This video shows an orbit of the camera around a lion sculpture.

<https://www.youtube.com/watch?v=1ZSDicjkfEU>

NeRF Instant NGP \| TestBed \| 3D Cropping

This video shows the effect of the "Crop aabb" control. It allows you to perform 3D bounding box region cropping operations of the NeRF scene.

<https://www.youtube.com/watch?v=GTcMiNRqo94>

NeRF Instant NGP \| TestBed \| Cloudy Neural Foam Artifacts on Scene Boundary

When you zoom out to the edge boundary zone of a NeRF scene you start to see floaty blobs that look a bit like fluffy/cloudy artifacts. Although it's not an officially used NeRF term, as far as I know, I like to call these glitches "Neural Foam" artifacts.

<https://youtu.be/hrljDbeGjBE>

NeRF Instant NGP \| TestBed \| Model Training

The NVIDIA Instant NGP library is very fast at performing NeRF model training and refinement. This clip captures the viewport from the moment the TestBed program is launched until the lion sample scene is refined to a point that is enjoyable to explore interactively in 3D.

<https://youtu.be/QIjBP-DEtZU>

Equipment Needed to Explore Instant NGP

Hardware Required

* Windows or Linux based PC
* 64 GB+ System RAM
* NVIDIA RTX 2000 or 3000 Series GPU

Software Required

To run NeRF based workflows on your system you will need the following tools:

* ![][image82] [Python 3.10.4](https://www.python.org/downloads/release/python-3104/)
* ![][image84] [Microsoft Visual Studio 2019 Community Edition](https://visualstudio.microsoft.com/vs/older-downloads/)
* ![][image35] [Git Client](https://git-scm.com/downloads)
* ![][image22] [NVIDIA GPU Driver](https://www.nvidia.com/Download/index.aspx?lang=en-us)
* ![][image22-1] [NVIDIA CUDA Toolkit 11.6](https://developer.nvidia.com/cuda-downloads?target_os=Windows&target_arch=x86_64&target_version=10&target_type=exe_local)
* ![][image22-2] [NVIDA OptiX 7.3](https://developer.nvidia.com/designworks/optix/download)
* ![][image22-3] [NVIDIA Instant NGP](https://github.com/NVlabs/instant-ngp)
* ![][image62] [CMake v3.23.1](https://cmake.org/download/)
* ![][image1][Colmap 3.7](https://colmap.github.io/)
* ![][image80][openCV-Python](https://pypi.org/project/opencv-python/)
* ![][image106][Numpy](https://pypi.org/project/numpy/)
* ![][image63] [OpenEXR](https://www.openexr.com/)
* ![][image113][NotePad++](https://notepad-plus-plus.org/)
* ![][image72] [FFMpeg](https://ffmpeg.org/)

Note: I'm avoiding discussing the topic of virtual environments like [Conda](https://docs.conda.io/en/latest/) in this guide in an effort to keep things focused primarily on the NeRF centric steps required. If you are comfortable with Conda or other virtual environments like [Rez](https://github.com/nerdvegas/rez), feel free to bring that knowledge to play when you follow along at home. 😀

Example NeRF Instant NGP Dataset

Lion Sculpture @ Sir Sandford Fleming Park, Nova Scotia aka. "The Dingle" Park

[Nerf_instant_ngp_lion.zip](https://www.andrewhazelden.com/projects/kartaverse/downloads/nerf_instant_ngp_lion.zip) (118 MB / 36 images)

![][image99]

Build Environment

Step 1. Install Python

Download and install the 64-bit version of [Python 3.10.4](https://www.python.org/downloads/release/python-3104/) by clicking on the "Windows Installer (64-bit) link on the Python Release page.

![][image114]

To make things simpler for command prompt usage, in the Python installer, enable the checkbox to add Python to the system PATH.

![][image87]

We also want to override the install folder so Python is installed to C:\\Python310\\. This is achieved by changing the "Customize install location" text field contents to "C:\\Python310\\".

Click the "Install" button to complete the Python install process.

![][image5]

After Python 3.10.4 is installed, open a new Windows Command Prompt in administrator mode. 

This is done by clicking on the start menu. Then start typing in the word "command" and autocomplete should filter the list of programs down to Command Prompt. Select the "Run as administrator" entry on the right side of this view.

![][image50]

In the command prompt window run the Python 3 version of the pip installer to add Numpy and OpenCV support. 

Numpy is installed using the command prompt window by typing in:

pip3 install numpy

![][image100]

Then OpenCV is installed using the command prompt window by typing in:

pip3 install opencv-python

![][image100-1]

Command Prompt Tip: If you have copied a line of text you want to run into your clipboard copy buffer, in Windows 10, you can paste that text directly into the Command Prompt window by right-clicking in that view. 

Press enter to run the recently pasted in shell command.

In order to use OpenEXR formatted images with Python and the testbed program we need to add the OpenEXR library.

Download and install the OpenEXR supporting libraries for Python from:

[https://www.lfd.uci.edu/\~gohlke/pythonlibs/\#openexr](https://www.lfd.uci.edu/~gohlke/pythonlibs/#openexr)

Since we are using Python 3.10.4 we want to select the OpenEXR library that has "CP310" in the filename: "OpenEXR-1.3.2-cp310-cp310-win\_amd64.whl". 

We can cut down the amount of time needed to scroll through that long webpage by copying the text "OpenEXR-1.3.2-cp310-cp310-win\_amd64" into your clipboard. 

Then hit the Control+F shortcut to open your web-browser's "Find" dialog. 

Paste in the text from your clipboard and the webpage view will be paged down directly to that line. Click on that highlighted .whl file to download it.

![][image37]

Python PIP Tip: A .whl file is known as a Python "Wheel" package. This format is a convenient way to install extra Python libraries.

The .whl file can be installed by changing the Command Prompt's current working directory to your user account's "Downloads" folder. 

Then we run the pip installer command with the filename of the local .whl package file specified:

cd %HOMEPATH%\\Downloads

pip3 install OpenEXR-1.3.2-cp310-cp310-win\_amd64.whl

![][image76]

Step 2. Install Visual Studio + CMake 

Download [Microsoft Visual Studio 2019 Community Edition](https://visualstudio.microsoft.com/vs/older-downloads/). This is a C++ development environment that lets us compile programs. The community edition release is free to download and use at home.

To access the 2019 release of Visual Studio, expand the "2019" heading on the left side of the webpage. Then click the "Download" button.

![][image36]

Because Visual Studio is made by Microsoft, you will need to login to the site with a Microsoft/Skype ID credential to access this download. This page will likely want to use 2-factor authentication if you aren't already logged in beforehand.

![][image83]

The exact version of the download is currently listed as "Visual Studio Community 2019 (version 16.11)" as of 2022-05-12. We are going for an x64 (64-bit) .exe download of a Multi Language release. 

Clicking the "Download" button will download a 1.4 MB sized web-installer program that is named "vs\_Community.exe".

![][image78]

When the vs\_Community installer launches you will be presented with a dialog that lists Microsoft's license terms. Click the "Continue" button to proceed.

![][image104]

The installer will then download a list of available Visual Studio packages you can add to your system. This takes a few moments to complete on a fast internet connection.

![][image31]

We only need to choose one option in this screen for our project today. In the main part of the view click on the large tile on the lower right area that is labelled "Desktop development with C++". The default installation entries that are pre-selected are fine for our needs. Click the "Install" button to continue.

![][image64]

This Visual Studio Community 2019 install is estimated to use about 8 GB of disk space. It will take a while to finish. At this point in the tutorial you can take a short break while the progress bar is working its way across the screen towards 100% completion.

![][image13]

When this dialog appears on your screen you'll know that Visual Studio 2019 is fully installed.

![][image97]

A Microsoft login prompt window will appear which allows you to launch Visual Studio and keep it up-to-date. This dialog is asking for your Microsoft / Skype login credentials to go to the next step.

![][image56]

After you click the "Sign In" button a 2-factor login dialog will appear. Click the "Send code" button to have a numerical 2-factor code sent automatically to your registered email address.

![][image102]

The single-use code should arrive in your email inbox in a few seconds.

![][image33]

With all of that taken care of we are now brought to the Visual Studio 2019 landing page view for the program. Click on the top-right corner of the window's "X" icon to close the view. This should quit Visual Studio and let us carry on further with the next step.

![][image105]

With Visual Studio installed, the next stage of the compiling software puzzle is to add a free utility called CMake.The CMake tool helps create "makefiles" which are used to prepare the computer-specific parameters for each of the supporting resources and libraries that a compiler requires to convert source code into executable software.

Go to the [CMake](https://cmake.org/download/) website and download v3.212.1 (or the current newest release). The CMake installer we want to use for a 64-bit version of Windows comes in an .msi format which is a self-running installer package format.

To access this file, scroll down on the CMake Download page to the heading "Latest Release". Click to download the Binary distribution of the Windows x64 installer.

The current file (as of 2022-05-12) is named "[cmake-3.23.1-windows-x86_64.msi](https://github.com/Kitware/CMake/releases/download/v3.23.1/cmake-3.23.1-windows-x86_64.msi)". The installer file is 27.9 MB in size.

![][image34]

Run the CMake installer. On the first screen click the "Next" button to continue.

![][image23]

On the "End-User License Agreement" screen you need to enable the "\[x\] I accept the terms in the License Agreement" checkbox. Click the "Next" button to continue.

  
![][image9]

On the "Install Options" screen if your computer is used by a single user, then you likely want to select the "(x) Add CMake to the system PATH for the current user" entry. Click the "Next" button to continue.

![][image14]

On the "Ready to install CMake" screen, click the "Install" button.

![][image60] 

When the installer finishes we can exit it by clicking the "Finish" button.

![][image86]

The CMake installer provides a command line program, along with a visual user interface that can be launched from the start menu called "CMake (cmake-gui)".

Step 3. Install NVIDIA CUDA Toolkit and OptiX

Next we need to download the [NVIDIA CUDA Toolkit 11.6](https://developer.nvidia.com/cuda-downloads?target_os=Windows&target_arch=x86_64&target_version=10&target_type=exe_local) and [NVIDA OptiX 7.3](https://developer.nvidia.com/designworks/optix/download) installers. You will need to register for a free NVIDIA Developer Program account to download the Optix library.

The CUDA Toolkit is used to create compiled software that is able to take advantage of NVIDIA CUDA based GPU acceleration. 

On the CUDA Toolkit 11.7 Downloads page, set the "Operating System" to "Windows". Then pick the default "x86-64" architecture. The "Version" control relates to your Windows OS version which in my case is Windows 10 so I would select "10". The "Installer Type" should be "exe (local)" for most users needs.

Finally in the "Download Installer for Windows 10 x86-64" section of the page, scroll down to the "Base Installer" heading and click on the "Download (2.5 GB)" button. 

The file I downloaded was named "cuda\_11.7.0\_516.01\_windows.exe". The specific version number will change over time. The installer download might take a few minutes to complete since it is 2.5 GB in size.

![][image107]

When you run the NVIDIA CUDA Toolkit installer you need to agree to the license terms to continue.

![][image88]

For most users the "Express (Recommended)" install option is the best choice. Click "Next" to continue. 

Note: The "Express (Recommended)" setting will also change the current NVIDIA display driver version. If you need to preserve your current display driver version then you might want to explore the "Custom (Advanced)" install option.

![][image16]

The  NVIDIA CUDA Toolkit installation will start after a few moments.

![][image68]

A NVIDIA Nsight Visual Studio Edition Summary screen will appear. Clicking the "Next" button will advance the installer to the final screen.

![][image89]

At this point the NVIDIA CUDA Toolkit installer is finished and you can exit the program by clicking the "Close" button.

![][image7]

The OptiX library is used to allow the Visual Studio compiler to support building source code that relies on NVIDIA RTX GPU driven raytracing and interactive image denoising.

On the "NVIDIA OptiX Downloads" page, scroll down to the "Optix SDK 7.4.0 - (Windows, Linux, and ARM)" section. Click on the green "Windows 10, 64-bit Accept & Download" button to continue.

![][image47]

As mentioned previously, you will need to register for a free NVIDIA Developer Program account to download the Optix library. This takes only a few moments to complete.

![][image94]

If you need to register for a new account click the "Join Now" button. Otherwise, if you have an existing account click the "Login" button to continue. NVIDIA uses a 2-factor login system for this site so you will have to check your email for the login code and click the "Verify Email Address" button to proceed.

The OptiX installer file "NVIDIA-OptiX-SDK-7.4.0-win64.exe" was a 53.5 MB download.

On the first screen of the installer you need to click the "Next" button to continue.

![][image27]

On the "License Agreement" screen you need to click "I Agree" to continue.

![][image59]

The next few screens just require you to keep on clicking "Next" unless you feel the need to customize the settings.

![][image25]

To start the installation process click the "Install" button. 

![][image103]

When the OptiX SDK installation process completes you can exit the installer by clicking on the "Finish" button.

![][image65]

Step 4. Clone the Instant NGP Repository

[Git](https://en.wikipedia.org/wiki/Git) is a technology that is frequently used to interface with online source code repositories like GitHub and GitLab. Git based software tools help with essential version control tasks during software development which is something that allows a team of programmers to work together effectively on the same project.

This step in the tutorial assumes you don't already have a favourite git client like [Git-Tower](https://www.git-tower.com/windows), or [GitKraken](https://www.gitkraken.com/), etc. installed on your system. 

We are now going to install a free open-source, command prompt based, git program by downloading and installing the [Git Client](https://git-scm.com/downloads) tools. On the Git-SCM website's Download page, select the "Windows" option.

![][image57]

We are interested in downloading the Standalone Installer called "64-bit Git for Windows Setup". The installer is 47.3 MB in size and currently has the filename of "Git-2.36.1-64-bit.exe".

![][image38]

On the Git installer's "Information" screen you have to accept the GNU GPL license terms by hitting the "Next" button.

![][image108]

Most of the subsequent screens in the git installer can be navigated through without too much attention by leaving things pretty much at their default values and clicking the "Next" button each time.

![][image49]

You have the option of customizing the installed components.

![][image111]

You are able to configure the default text editor that is used by git. There are several options you can choose from the list.

![][image92]

As previously mentioned the default settings that are pre-selected for most of these screens are fine for the average user just getting started with git.

![][image74]

Since we want to be able to use the command line git utility from the Command Prompt window it is a good idea to select either the 2nd or 3rd options in the "Adjusting your PATH environment" screen.

Personally, I think the 2nd option of "(x) Git from the command line and also from 3rd party software" is the most balanced and flexible choice for new users.

![][image41]

You can click the "Next" button on all remaining git installer screens to complete the process.

Let's try out the git program for the first time! We are now ready to launch a Windows "Command Prompt" window with administrative permissions using the start menu. 

![][image50-1]

With the command prompt window open, lets type in:

cd \\

git clone --recursive https://github.com/nvlabs/instant-ngp

cd instant-ngp

dir /w

These commands will launch the git utility and it should automatically download the current version of the [NVIDIA Instant NGP (Neural graphics primitives)](https://github.com/nvlabs/instant-ngp) source code from the GitHub website and save it to the root folder on the C:\\ drive at the folder path of "C:\\instant-ngp\\".

![][image28]

![][image93]

Git Usage Note: You have the freedom to customize this git cloning download path but for convenience the shorter the filepath, the easier it is to access from a command prompt session when you go to run the testbed program later on. Also keep in mind that there is a limit to the length of a typical folder path on a default Windows system so if you download the files into a custom location of your own choosing and it happens to be a deeply nested hierarchy, you might be causing yourself trouble later on.

Git Troubleshooting Tip: If you see an error message about git not being found in your system's PATH variable, you can double check things by typing the following text into the command prompt window. This will list the current contents of the PATH environment variable:

echo %PATH%

Hopefully in this long list of folders that is separated by semi-colon characters you will spot an entry for "C:\\Program Files\\Git\\cmd"

Git Troubleshooting Tip: We needed to use the Command Prompt with Administrative permissions in order to be able to download the Instant NGP files into the root folder on the C:\\ drive. If you do not have administrator permissions you could still follow this tutorial but instead would have to download the files to a location like a folder inside your user account's home folder.

With the git downloading phase complete you should be able to navigate using the Windows Explore folder browsing view to open up the instant-npg folder. The path we installed the files to by default was "C:\\instant-ngp\\".

![][image77]

Step 5. Building Instant NGP

Install COLMAP

[COLMAP](https://colmap.github.io/) is a free cross-platform open-source camera alignment and photogrammetry (image based modelling) toolset. COLMAP is used by the Instant NGP python scripts to prepare the NeRF camera data before the training task is started.

![][image8]

Download [Colmap 3.7](https://github.com/colmap/colmap/releases) from the GitHub releases page as a pre-compiled Windows binary that has NVIDIA CUDA GPU acceleration enabled. This download is currently named "COLMAP-3.7-windows-cuda.zip" and is 129 MB in size.

![][image24]

Expand the zip archive and copy the expanded COLMAP folder to the root of your hard disk. Let's rename the COLMAP folder at the same time for easier command line usage. Change the folder name from "C:\\COLMAP-3.7-windows-cuda\\" to a shorter and simpler version by reducing the folder name down to merely "C:\\COLMAP-3.7\\".

![][image70]

***Make sure to avoid installing COLMAP to a folder that has a space in the filepath or the Colmap unit tests will fail. This will occur if you placed COLMAP inside your home folder and your user account name has spaces between your first and last name. I repeat, spaces in the path will cause you headaches if you ignore this suggestion!***

Next we are going to add COLMAP's "bin" and "lib" folders to the system PATH environment variable using the Windows based System Control Panel.

Power User Tip: It is worth mentioning now that if your Windows computer has complex dependencies caused by having several different versions of large DCC programs / development tools installed at the same time, along with several different Python versions installed concurrently too, and you use virtual environments as well, please feel free to customize this process to meet your needs.

Click on the Windows Start menu. Then begin typing in the words "View advanced system settings" in the search dialog's text input area. By the time you've typed in the 2nd word the Start menu will likely have finished auto-completing the full text. 

Click the "Open" text based link on the right-side of the view to launch this Control Panel.

![][image42]

In the System Properties window click on the "Environment Variables..." button. This dialog is where custom environment variables like the system PATH are configured. 

![][image18]

In the "Environment Variables" window click on the "System Variables \> Path" entry. Then click the "Edit" button. This will allow us to customize a version of the PATH variable that is used for all user accounts and background system processes, too.

![][image52]

In the "Edit environment variable" window click the "New" button to add an additional entry. Type in "C:\\COLMAP-3.7\\bin\\". 

Click the "New" button again and add a "C:\\COLMAP-3.7\\lib\\" entry as well. This will add the COLMAP .dll library files to the system PATH as well.

This process will make the executables and libraries used by the COLMAP program easier to run from the command prompt without having to type in the full absolute path to each .exe file each time. 

If you wanted to get fancy one could spend more time down the road and customize other parameters like a QT\_PLUGIN\_PATH environment variable, too... but for our needs right now it is not required.

Click the "OK" button to close this window. Then close the subsequent other Control Panel windows by clicking their "OK" buttons as well.

![][image20]

Environment Variables Tip 1: The "PATH" variable, which is written as %PATH% when accessed from the command prompt window, is used for several purposes. One of those use cases is to define which executable programs on your computer  (.exe, .bat, etc files) can be run from a terminal session simply by typing in the program's base filename name without having to always write in the full folder path to the program. This saves a lot of time when a user frequently navigates a filesystem hierarchy in a text based command prompt/terminal window and runs a series of command line tools.

Environment Variables Tip 2: An environment variable can be thought of as a system wide preference that any program that is started is able to read. An environment variable is a technique that system administrators will often use to customize the operating environment that software runs inside of on a workstation or render node. This concept of customizing environment variables allows you to pass a common set of preferences to multiple executable programs in a consistent way. It helps inform software of the custom values you might want to define system wide and avoids using hard-coded fixed settings in each application. It is possible to read environment variables inside of just about every general purpose programming language or scripting language like C, C++, C\#, Python, Lua, Perl, PHP, Batch, and BASH/ZSH, etc.

Build the TestBed Program

Instant NGP uses a visual interface called TestBed to allow you to create scenes using NeRF (neural radiance field) rendering techniques. We need to compile thisTestBed program and at the same time adjust the CUDA parameters used at compile time to match the capabilities of our currently installed NVIDIA CUDA based GPU.

Step 1. Start by opening a Visual Studio "Developer Command Prompt". This window will have the compiler specific environment variables tuned for using Visual Studio 2019's development tools.

We do this step by clicking on the Start menu. Begin typing in the words "Developer Command Prompt for VS 2019". The rest of the text will be auto-completed for you.

Click on the "Run as administrator" link.

![][image66]

Step 2. It is important to define the CUDA architecture before you build the testbed program. This will affect the maximum "aabb\_scale" number you will be able to run in your transform.json file. For an RTX Series 3000 GPU the environment variable can be defined in the "Command Prompt" window using:

set TCNN\_CUDA\_ARCHITECTURES=86

The result of setting this environment variable value can be verified by typing in:

echo %TCNN\_CUDA\_ARCHITECTURES%

![][image53]

The echo command prints out the currently defined value for the environment variable you specify inside a pair of percent signs "%" which in the case of my screenshot is a value of "86".

Further information on how to find the best "TCNN\_CUDA\_ARCHITECTURES" setting for your GPU can be read on the [Instant NGP GitHub issues page here](https://github.com/NVlabs/instant-ngp/issues/219#issuecomment-1055141789) and by following that text's suggestion along to land on the [Wikipedia link from that specific GitHub issue](https://en.wikipedia.org/wiki/CUDA#GPUs_supported) post.

Step 3. When compiling software you can adjust how many CPU cores are used for the task. Set the "-j 64" entry below to match the number of CPU cores you want used during the compiling process. The number 64 in this case refers to 64 cores which works well for AMD Threadripper systems. If you have an Intel PC with 8 CPU cores you would use a value of "-j 8".

The code below uses the CMake utility to create a new makefile for Instant NGP. This will add in the computer specific settings in the makefile so they match the file paths for the supporting resources and libraries you've already installed. After the makefile is created the source code is compiled.

cd C:\\instant-ngp

cmake . -B build

cmake --build build --config RelWithDebInfo -j 64

If this task is completed successfully, you should now have a ready-to-run copy of the NeRF testbed program after a few minutes of compiling.🥳🎉🎁

![][image58]

![][image67]

![][image73]

![][image81]

Congratulations if by some miracle you have managed to make it this far in the tutorial in a single reading session. Bonus points if you followed along with all the steps in your first run through of this document. Needless to say, I'm impressed!

If the fates have smiled favourably on your freshly prepared compiler toolchain you should be able to peek inside the folder "C:\\instant-ngp\\build". If things worked out well you will see the new executable that you just compiled on your own home computer/workstation system. The exe file is named "testbed.exe". Yay.

![][image98]

Using Instant NGP

Instant NGP is launched from the command line. It is possible to see a list of the available parameters by running the program with the "help" flag added from the command prompt which is done with the addition of "-h":

C:\\instant-ngp\\build\\testbed.exe -h

![][image71]

TestBed Command-Line Syntax

	C:\instant-ngp\build\testbed {OPTIONS}

		neural graphics primitives
		version 1.0dev

	  OPTIONS:

	  	-h, --help                    	Display this help menu.
	  	-m[MODE], --mode=[MODE]       	Mode can be 'nerf', 'sdf', or 'image' or
	                                    	'volume'. Inferred from the scene if
	                                    	unspecified.
	  	-n[CONFIG], -c[CONFIG],
	  	--network=[CONFIG],
	  	--config=[CONFIG]             	Path to the network config. Uses the
	                                    	scene's default if unspecified.
	  	--no-gui                      	Disables the GUI and instead reports
	                                    	training progress on the command line.
	  	--no-train                    	Disables training on startup.
	  	-s[SCENE], --scene=[SCENE]    	The scene to load. Can be NeRF dataset,
	                                    	a *.obj mesh for training a SDF, an
	                                    	image, or a *.nvdb volume.
	  	--snapshot=[SNAPSHOT]         	Optional snapshot to load upon startup.
	  	--width=[WIDTH]               	Resolution width of the GUI.
	  	--height=[HEIGHT]             	Resolution height of the GUI.
	  	-v, --version                 	Display the version of neural graphics
	                                    	primitives.

Explore the Built-in Demo Scenes

cd C:\\instant-ngp\\

The first scene that every new Instant NGP user needs to try out if this is their first time exploring realtime NeRF rendered visuals has to be the "fox demo".

Fox Scene

![][image75]

A scene of an old taxidermy style stuffed fox can be viewed as a NeRF using:

C:\\instant-ngp\\build\\testbed --scene data/nerf/fox

In only a few moments the testbed program will launch.

![][image91]

A visual IMGUI based immediate mode user interface will appear and you can start panning the view to explore the 3D scene while the training process is carried out.

![][image96]

If you want to peek inside the fox scene's "images" folder to see the individual camera views that were used to train the testbed player in only a few moments, navigate using the Windows Explorer folder browsing view to:

C:\\instant-ngp\\data\\nerf\\fox\\images

You will find 50 JPEG format photos that were photographed in a vertical portrait mode at 1080 x 1920 px resolution.

Armadillo Model

![][image12]

A Wavefront OBJ format polygon model of an armadillo character is calculated as an [SDF (Signed Distance Function)](https://en.wikipedia.org/wiki/Signed_distance_function) that can be viewed as a NeRF using:

C:\\instant-ngp\\build\\testbed --scene data/sdf/armadillo.obj

Uprezzed Photo

![][image55]

An uprezzed version of an old black and white Albert Einstein photo can be viewed as a NeRF using:

C:\\instant-ngp\\build\\testbed --scene data/image/albert.exr

When you pan in and then zoom around in the NeRF rendered photo, the testbed window will display a view that looks like this:

![][image43]

This example uses an EXR format image as the source media so you had to install the Python centric OpenEXR library files in the earlier steps to be able to load this image successfully.

Prepare your first Instant NGP Scene

Troubleshooting Image Filenames: A handy tip when creating your own NeRF scenes is to use simple filenames for your imagery. It is best to avoid complex long filenames as it will reduce the occurrence of frustrating issues later on.

Step 1. Download the "[Nerf_instant_ngp_lion.zip](https://www.andrewhazelden.com/projects/kartaverse/downloads/nerf_instant_ngp_lion.zip)" example project near the top of this guide.

Extract the "lion" folder from this zip archive and copy it to "C:\\instant-ngp\\data\\nerf\\lion\\".

![][image40]

Step 2. Run COLMAP using the included "colmap2nerf.py" script. After a few minutes this script will generate a ready to use camera alignment JSON file.

cd C:\\instant-ngp\\

python C:\\instant-ngp\\scripts\\colmap2nerf.py --colmap\_matcher exhaustive --run\_colmap --aabb\_scale 16 --images data\\nerf\\lion\\images

You will be asked a yes/no question when the COLMAP script starts. Press the letter "Y" to continue:

warning! folders 'colmap\_sparse' and 'colmap\_text' will be deleted/replaced. continue? (Y/n) Y

![][image85]

You will see screens and screens of progress text scroll continuously in the Command Prompt window as each image is aligned and registered by the COLMAP program:

![][image101]

![][image44]

If everything worked out you should see a final line in the command prompt window that mentions "writing transforms.json". This means success was had.


Troubleshooting Tip 1: If you skipped adding COLMAP's bin and lib folders to your system's PATH environment variable in the earlier steps, you will see the following error message when launching COLMAP: 

Colmap.exe - System Error dialog:

The code execution cannot proceed because

boost\_filesystem-vc143-mt-x64-1\_77.dll was not found. Reinstalling this program may fix this problem.

If the COLMAP lib folder was not added to the PATH environment variable, you would also likely see subsequent messages about "glew32.dll was not found" and "glog.dll was not found".

Troubleshooting Tip 2: If the Python OpenCV library was not installed you will see the following error message:

Traceback (most recent call last):

File "C:\\instant-ngp\\scripts\\colmap2nerf.py", line 19, in \<module\>

import cv2

ModuleNotFoundError: No module named 'cv2'

Troubleshooting Tip 3: If the Python Numpy library was not installed you will see the following error message:

Traceback (most recent call last):

File "C:\\instant-ngp\\scripts\\colmap2nerf.py", line 15, in \<module\>

import numpy as np

ModuleNotFoundError: No module named 'numpy'

Step 3. Copy the COLMAP generated "Transform.json" file from inside the "C:\\instant-ngp\\" folder into "C:\\instant-ngp\\data\\nerf\\lion\\" folder. 

![][image10]

This places the json document side-by-side in the current project, next to the individual NeRF scene's "images" folder.

![][image45]

Step 4. Open the document in a programmer's text editing tool like [NotePad++](https://notepad-plus-plus.org/). 

We need to edit the "Transform.json" text file to remove any filepath prefixes that might have been entered in the JSON document for each image resource. This edit can be carried out using a plain old-fashion "Find & Replace" text substitution approach.

![][image2]

Open the Find & Replace dialog using the Control+F hotkey.

Switch at the top of the dialog to the "Replace " tab. Make sure to set the Notepad++ "Search Mode" setting to "Normal" to avoid having to worry about escaping the slash characters.

Using the Find & Replace dialog, set the "Find what:" field to:

./data\\\\nerf\\\\lion\\\\

Then in the "Replace with:" text field, clear it out so it contains nothing ("") at all and is blank. This setting will allow us to delete the extra folder paths from the start of each image entry in the JSON file.

Press the "Replace All" button to carry out this editing task.

![][image17]

The final relative filepath, after editing, should look like this for an individual image in the JSON file:

"file\_path": "images/lion.0001.jpg",

![][image79]

COLMAP JSON Troubleshooting: If you forget to edit the Transforms.json file to make the image path relative you will likely see the following error when you carry on down to the next step and run the lion test scene in the testbed program:

![][image110]

Really, you should get Notepad++ Installed ASAP!

If you only have Microsoft's Notepad or Wordpad text editing programs installed on your Windows based PC, it is seriously worth mentioning that the free Notepad++ program does a great job at this type of JSON editing task. 

Don't hesitate to go and install [NotePad++](https://notepad-plus-plus.org/) now. Few other programmer centric text editors are as lean, simple, fast, and minimalist to use. I tend to think of Notepad++ as "the Firefox" of text editors.

If you want to experience a really nicely optimized & very refined version of Notepad++... and you happen to already use the Blackmagic Resolve/Fusion software, I'd encourage you to check out the Reactor Package Manager's "Bin" category. This version of "Notepad++ for Fusion" has all of the nice little thoughtful improvements you didn't know you were living without and missing in your life:

![][image21]

Check Your Camera Transforms for NaNs

When you are looking at the JSON file, do take a moment to page down visually through the transform matrix entries in the text file. You want to see if any floating point "[NaN](https://en.wikipedia.org/wiki/NaN)" values are present. 

In this situation a NaN number represents an invalid value similar to infinity being stored in the camera placement fields. If this exists in the JSON document it typically means the camera alignment task carried out in COLMAP generated invalid data on the output.

You will likely have to remove source images that are causing issues, or re-photograph the scene again if the images are all fully planar without sufficient parallax between the camera views to be accurately aligned.

Assuming there are no NaN values present in the JSON file, carry on to the next step.

Step 5. The COLMAP camera locator based lion NeRF scene can be viewed using the testbed executable with the following command prompt based entries:

cd C:\\instant-ngp\\

C:\\instant-ngp\\build\\testbed --scene data/nerf/lion --mode=nerf

![][image29]

At this point you should be experiencing a lion sculpture in NeRF like style! After several seconds of training and refinement the view will become clearer. You can rotate the camera view around in the scene within limits and see the different angles on the sculpture.

![][image69]

TestBed Troubleshooting Tip: If you get an error message when launching the TestBed program that says:

Could not free memory: C:\\instant-ngp\\dependencies\\tiny-cuda-nn\\include\\tiny-cuda-nn/gpu\_memory.h:454 cudaDeviceSynchronize() failed with error operation not permitted when stream is capturing

This error typically indicates that you needed to adjust the "TCNN\_CUDA\_ARCHITECTURES" environment variable back in the earlier "Step 5.2 Building Instant NGP" step of this guide.

If you've done this process already and still get the error you can open the "Transform.json" document up in your text editor and lower the  "aabb\_scale" value which acts like a NeRF scene resolution parameter. 

Valid settings for the "aabb\_scale" parameter are base 2 numbers such as 16, 8, 4, or 2. In this situation 16 is the best quality you can define at this time, and 2 is a much lower detail representation of the scene that might work on your GPU if you have less GPU VRAM available.

Using the TestBed Program

The TestBed UI is an immediate mode GUI that allows interactive control over the NeRF scene training and rendering process.

Camera Path

The camera path controls allow you to keyframe animate a motion path through the scene. This data can be saved to disk and used to create a high quality command-line rendered animation of the NeRF scene.

![][image32]

After you click the "Add from Cam" button you can start to make an animated camera.

![][image19]

Training

The training section allows you to keep an eye on the scene's training progress.

![][image48]

Rendering

![][image46]

Render Mode

The "Render Mode" control allows you to toggle the type of render element you are viewing. 

The "Shade" control gives a regular RGB color rendered version of the scene that is photorealistic.

![][image90]

The "AO" control gives an ambient occlusion pass rendered version of the scene. AO is used to approximate the effects of indirect lighting in a CG scene. This is conceptually similar to the lighting conditions of an overcast day that has no direct lighting from the sun, which would otherwise cast hard shadows.

![][image109]

The "Depth" control gives a z-depth pass rendered version of the scene. The near-clipping plane distance is shaded as black (0 distance from the camera), and the far-clipping plane distance is shaded as while.

![][image6]


The "Tonemap curve" allows you to perform HDRI like image range remapping. This can allow you to compress the highlights and shadows in the scene.

The "Exposure" control allows you to adjust the overall scene brightness.

Crop aabb

The Crop controls allow you to define a 3D scene bounding-box that is used to clip off outside data. This can be used to isolate a cubic region around a model and remove all distracting data outside this region.

![][image26]

This is what it looks like if you crop the scene down to just a single object using a combination of the crop size and crop aabb controls:

![][image54]

Camera

The "Depth of field" control is used to simulate lens defocus blur. This out of focus region effect is also called "[bokeh blur](https://en.wikipedia.org/wiki/Bokeh)" in photographic terms.

The "Field of view" control is used to adjust the angle of view of the camera lens model.

The "Zoom" control defaults to a value of 1.0. If you change this control it feels just like you are using a zoom lens attached to the camera.

![][image11]

Snapshot

The snapshot controls allow you to export to disk the fully trained scene in its current state. You can also re-import training data from a prior session.

![][image61]

Marching Cubes Mesh Output

This section of controls allows you to create a polygon mesh representation of the NeRF scene density.

![][image39]

The polygon formatted model output quality is not quite refined yet from the testbed NeRF program to satisfy the most demanding of users with a professional VFX/animation/games background. In many ways the meshing algorithms used at the moment are still lacking in refinements compared to traditional high-quality photogrammetry generated meshes. 

On the flip side though, pure NeRF display mode rendered visuals like plant vegetation already have the capacity to look a lot better than most photogrammetry captured vegetation like dense leaves on a tree, or grass. So there is some balance between the two techniques already.

![][image112]

![][image4]

Meshing Tip: If you increase the "Res" setting to a value higher than your GPU's VRAM can support then the current testbed session will likely exit abruptly. You will then be returned back to the Command Prompt session with the following error message:

![][image51]

History of trainable encoding parameters

This control is a diagnostic element you can learn more about as you go deeper into exploring the testbed utility on more scenes.

![][image30]

Instant NGP Web Resources

The following web pages were of great help as I prepared this guide. 

TBH, if you get stuck on anything shown in this tutorial, you will likely find the answers you need to solve the problem branched off from the content on the following webpages:

[YouTube \| NVIDIA Instant NeRF: NVIDIA Research Turns 2D Photos Into 3D Scenes in the Blink of an AI](https://www.youtube.com/watch?v=DJ2hcC1orc4)

<https://blogs.nvidia.com/blog/2022/03/25/instant-nerf-research-3d-ai/>

<https://nvlabs.github.io/instant-ngp/>

<https://github.com/NVlabs/instant-ngp>

<https://github.com/NVlabs/instant-ngp/issues/455>

[https://github.com/NVlabs/instant-ngp/issues/219\#issuecomment-1055141789](https://github.com/NVlabs/instant-ngp/issues/219#issuecomment-1055141789)

<https://github.com/bycloudai/instant-ngp-Windows>







KartaVR Workflows \| Creating ST Maps

Created 2021-12-20 Last Updated 2022-01-03 12.06 PM UTC -4

By [Andrew Hazelden \<andrew@andrewhazelden.com\>](mailto:andrew@andrewhazelden.com)

Overview

The motivation for writing this content is to illustrate and describe approaches that can be used to perform high-speed panoramic warping with the existing software tools you likely already have access to on your workstation, today. 

If you need to quickly stitch a lot of high-resolution footage, one way to affordably approach this challenge is to use pre-computed warping templates created using an "ST Map" which is also called UV pass warping.

![][image8-1]

An ST Map is a high dynamic range image that stores the X/Y coordinate values for a lens distortion calculation in the red and green channels of an RGB image. If you look at the starting image you will see a horizontal and a vertical gradient stored in a linear gamma 1.0 color based image. 

![][image10-1]

*Note: Depending on your coordinate system, you might want to have the horizontal gradient start with black on the left side, and transition to white on the right side of the frame. This can also be achieved with the flip control on the UV Gradient generator.*

Any warping effects performed on the ST Map gradient starting image can be "replayed" quickly and efficiently on any footage you run through this workflow. This can be a time-saver if you need to do on-set 360VR stitching previews using a program like [TouchDesigner](https://derivative.ca/download) with an HDMI/SDI/USB/NDI based video capture device.

[After Effects](https://www.adobe.com/products/aftereffects.html) (with the RE:Vision Effects RE:Map plugin), [Resolve](https://www.blackmagicdesign.com/products/davinciresolve/)/[Fusion](https://www.blackmagicdesign.com/products/fusion/), [NukeX](https://www.foundry.com/products/nuke-family/nukex), and many other tools can all work with ST Map based lens distortion images in a way that gives consistent and identical pixel matched results.

Software Required

To carry out an ST Map based 360VR video stitching workflow you need to have at least two of the following programs installed. (KartaVR is an optional item to add if you are using BMD software like Resolve/Fusion.)

* ![][image58-1] [KartaVR](http://www.andrewhazelden.com/projects/kartavr/docs/)
* ![][image50-2][PTGui Pro v12](https://www.ptgui.com/download.html)
* ![][image25-1] Derivative [TouchDesigner](https://derivative.ca/download)
* ![][image65-1]BMD [Resolve](https://www.blackmagicdesign.com/products/davinciresolve/) (Free) / [Resolve Studio](https://www.blackmagicdesign.com/products/davinciresolve/)
* ![][image53-1]BMD [Fusion Studio](https://www.blackmagicdesign.com/products/fusion/)
* ![][image47-1]Foundry [NukeX](https://www.foundry.com/products/nuke-family/nuke) + [Occula](https://www.foundry.com/products/ocula)
* ![][image44-1] Autodesk [Flame](https://www.autodesk.com/products/flame/overview)
* ![][image19-1]Adobe [Photoshop](https://www.adobe.com/products/photoshop.html) + [The Domemaster Photoshop Actions Pack](https://github.com/AndrewHazelden/Domemaster-Photoshop-Actions-Pack)
* ![][image13-1] Adobe [After Effects](https://www.adobe.com/products/aftereffects.html) + [RE:Vision Effects RE:Map](https://revisionfx.com/products/remap/after-effects/) Plugin
* ![][image70-1] [Blender Compositor](https://docs.blender.org/manual/en/latest/editors/compositor.html) (Free)
* ![][image23-1][Natron Compositor](https://natrongithub.github.io/) (Free)
* ![][image34-1]  [Imagemagick](https://imagemagick.org/index.php) (Free) + ![][image1-1] [FFMpeg](https://ffmpeg.org/) (Free) Command-Line Tools

PTGui Pro Workflow

Step 1. Rename the PTGui Project File

![][image30-1]

Start by opening up an existing PTGui Pro v12 .pts project file. Use the "File \> Save Project As..." menu entry to save a copy of the current stitching project to disk as "stmap.pts".

*Note: If your immersive content production pipeline needs to manage multiple concurrent stitching shots, in parallel, for a full-length VR or fulldome film, you could also add more details to the saved filename with values like "\<Project\>\_\<Shot\>\_\<Version\>\_stmap.pts"*

For the rest of the steps in this tutorial, it is assumed that you have clicked to enable "Advanced" GUI mode, at the bottom of the left-hand sidebar region in the PTGui window.

![][image45-1]

Step 2. Change the Exposure

Click on the "Exposure / HDR" tab on the left side of the PTGui window.

![][image37-1]

An ST Map based warping requires very precise color values. In this type of workflow, each pixel in the rendered ST map template image represents a final pre-computed warping LUT (Look Up Table) X/Y position. This data is used to carry out panoramic image projection transforms or lens distortion corrections.

Any of the color matching done per-camera view, vignetting correction, or camera response curve modifications that would typically be desirable in a color panoramic stitching workflow, need to be disabled when generating an ST Map template output. 

This is due to the ST map source data holding a pure horizontal and vertical gradient, not photographic content.

Looking at the "Vignetting curve", and the "Camera response curve" charts below, we can see they are not linear "straight lines" but instead have a graceful, curved shape.

![][image54-1]

Change the "**Precision**" setting to "Float". This gives 32 bit-per channel processing support.

Then click on the "Automatic exposure and color adjustment" section's "Reset" button. This will flatten out the "Vignetting curve" yellow-colored  line plot so it is perfectly horizontal.

![][image55-1]

Step 3. Changing the Camera Curve

On the left side of the PTGui user interface is a series of sidebar "tabs". Click on the tab labelled "Image Parameters". 

![][image39-1]

The Image Parameters tab displays a list of all the footage loaded in the current PTGui project file in a spreadsheet-like grid layout.

![][image18-1]

When viewing the Image Parameters tab, if you scroll horizontally or expand the window's width larger, you will notice a far right-hand column labelled "Camera Curve".

When using PTGui, most sRGB based color photos have a gamma value of 2.2. This is a typical setting for 8 bit per-channel PNG, JPG, and PSD formatted images.

In order to turn the .pts file into an ST Map based warping template we need to set all color options to use a linear color managed workflow. A gamma value of 1.0 needs to be assigned to all OpenEXR .exr formatted images used in ST map warping processes.

To do this, select all of the images in the Image Parameters tab by pressing the Ctrl+A  (Windows) hotkey on your keyboard.

![][image35-1]

Now right-click on the small triangle in the Camera Curve column's first entry labelled "Global camera curve". Change this value to "Linear". Since all of the images were selected at the same time, this change is applied to multiple images at once. Nice!

![][image56-1]

Step 4. Change the Camera Response Curve

Click on the "Exposure / HDR" tab again on the left side of the PTGui window. Then look at the "Camera response curve" section on the lower right side of the window. 

![][image12-1]

Move your cursor over the "Trash Can" icon in this toolbar. The tooltip for this button says "Remove camera response curve". This option is available since we previously used the "Image Parameters" tab to change the Camera curve to "Linear".

![][image2-1]

Click the "Trash Can" button.

The "Exposure / HDR" tab's "automatic exposure and color adjustment" settings should now look like this:

![][image64-1]

For good measure, click on the "automatic exposure and color adjustment" section's "Settings" button. A small dialog window will appear.

![][image20-1]

We need to make sure the following options are configured:

Optimize Brightness: **Disabled**

Optimize white balance: **Disabled**

Optimize lens flare: **Disabled**

Global \> Optimize Vignetting: **Disabled**

Once these customizations are locked in, click the "OK" button to close the dialog. When the dialog closes, you may be asked in an additional dialog window if you would like to optimize the panorama using these settings.

Step 5. Open the Panorama Editor

Open the Panorama Editor window using the "Tools \> Panorama Editor" menu entry. The hotkey for quickly displaying the Panorama Editor view is Ctrl+E (Windows). 

![][image43-1]

The PTGui "Panorama Editor" window lets you see a quick preview of the current stitching settings.

![][image36-1]

A helpful diagnostic option to enable in the Panorama editor window is the "Show image numbers" button found in the toolbar at the top of the view.

![][image46-1]

The Panorama Editor has a lot of UI controls hidden under a small "triangle" button icon found at the top right corner of the window. It can be easy to miss this feature when you are just getting started with PTGui v12.

![][image9-1]

If you hover your cursor over the triangle-shaped button, an entirely new set of UI controls slide into the frame and are visible.

![][image22-4]

Expand the "Blending" section and un-check the "Exposure Compensation" option. It's a good idea to un-check the "Fill holes" option too.

![][image4-1]

Expand the "Tone mapping" section. Un-check the "Apply tone mapping" option. This control adjusts the way shadows and highlight regions in a high dynamic range image are compressed to fit inside a low dynamic range output.

![][image5-1]

Expand the "Exposure fusion" section. Un-check the "Apply Exposure Fusion" option. This control is relevant to HDR bracket merging operations, which is not something an ST mapping workflow needs to perform when you are performing warping using an ST Map template.

![][image29-1]

Finally, expand the "Post Process" section. The "Toning curve" graph image shows that a gamma 2.2 style output is generated by default. 

![][image62-1]

This curve shape would do bad things to the precision of the ST map templates numerical values stored in the LUT (Look Up Table) so we need to disable the effect of the toning curve.

Change the "Shape" to **0**.

Change the "Shift" to **0**.

Make sure the "Saturation" is at **100%**.

Once these changes are made, we should see a yellow-colored straight line running diagonally at a 45% angle in the chart, instead of a rolling "S" shaped curve with a slope.

At this point, the color intensity values for each pixel are mapped in a linear style going from 0 (black) to 1.0 (white) in a floating point-based color range.

![][image41-1]

You can now close the Panorama Editor window.

Save the revised PTGui project file to disk, using the "File \> Save Project" menu item, or the Ctrl+S (Windows) hotkey.

Step 6. Open the Create Panorama tab.

The essential settings in the Create Panorama tab include:

**Output**: \[x\] Individual HDR layers 

This setting tells PTGui that each source image in the panorama needs to be exported to a separate warped image result, and left un-blended, when the final panoramic output is rendered to disk by the "Create Panorama" button.

**HDR file format**: OpenEXR (.exr) (with alpha float)

Un-check the \[\] **use default** checkbox next to the Output file prefix text field.

**Output file prefix**: "Render\\stmap" 

The "Output file prefix" setting specified will create a new "Render" sub-folder on disk at the same folder hierarchy level where the PTGui .pts file is located. Also, the rendered images will all have the initial filename of "stmap" used before the image view number, and file extension is appended to the filename.

**Advanced \> Interpolator**: Nearest Neighbor

**Advanced \> Output color space**: Linear sRGB IEC619660-2.1

(Optionally) you can enable the "\[x\] Use source image color space if possible" checkbox.

![][image15-1]

Once these settings are locked into the Create Panorama tab, it's time to click the "**Settings:**" button to the right of the **HDR file format** control. The "Settings:" button causes PTGui to display a dialog that lets you customize the image format parameters used when the image file is written to disk.

In the "**EXR Options**" dialog, you should change the controls to:

**Alpha Channel (transparency)**: With alpha channel

**Bit depth**: Float (32 bits per channel)

**Compression**: ZIPS

It is super important to avoid using any lossy (destructive) image compression codecs in an ST Map as that choice will result in PTGui "shredding" the quality of the final output which gives unexpected artifacts.

![][image48-1]

Step 7. Swap out the photos for an ST Map gradient image.

Switch to the "Source Images" tab. 

![][image16-1]

The "Source Images" view provides a quick way to see each of the photos that are loaded into the PTGui project file. A thumbnail preview image is shown along with the image file name, and the width / height of the photo.

![][image66-1]

If you right-click on a photo, in the contextual pop-up menu there is a "Replace..." option that lets you swap the current image out for another document you can select from your hard disk.

![][image27-1]

We need to replace the photos with a common red/green colored ST Map "initial" gradient image using the right-click "Replace..." contextual menu item several times.

![][image26-1]

Save the PTGui Project file to disk.

Editing PTGui JSON Project Files

It is worth noting that it is fully possible to use a programmer's text editor like Notepad++ for Fusion (Windows) or BBEdit (macOS) to open up an existing PTGui .pts file and manually use a regular expression based "Find & Replace" approach to swap out the images. A PTGui v11 and v12 .pts file is saved as a JSON format document. This makes it pretty easy to edit since JSON is a standard format that many editing tools are familiar with.

![][image57-1]

This screenshot shows the "[Notepad++ for Fusion](https://gitlab.com/WeSuckLess/Reactor/-/blob/master/Atoms/com.wesuckless.NotepadPlusPlus/Windows/Docs/com.wesuckless.NotepadPlusPlus.md)" atom package in Reactor being used to edit and relink the photos in a .pts file. By combining a JSON based syntax highlighting mode in your text editor, along with file differencing based comparisons, and a JSON hierarchy browser, you'll have assembled something that approximates a fancy PTGui project based text editing IDE.

![][image49-1]

Step 8. Render the PTGui Project

Now that we've got a PTGui .pts file that is fully tuned for ST Map based template generation, we can render the individual warped views to disk.

Switch to the "Create Panorama" tab.

![][image52-1]

Click the "Create Panorama" button.

![][image61-1]

After a few seconds, you will see the PTGui progress bar complete the rendering stage.

![][image67-1]

Take a moment to look in the Explorer (Windows) or Finder (macOS) desktop folder browsing view, and navigate inside the folder where the .pts file is saved on disk. 

There should be a new "Render" sub-folder that holds each of the warped ST map template images we just created.

The images are currently named:

stmap\_layer\_0.exr

stmap\_layer\_1.exr

stmap\_layer\_2.exr

stmap\_layer\_3.exr

stmap\_layer\_4.exr

stmap\_layer\_5.exr

...

As a pro-tip, it's very handy to rename the final ST Map template images to a simpler "sequentially named" format like:

stmap01.0000.exr

stmap02.0000.exr

stmap03.0000.exr

stmap04.0000.exr

stmap05.0000.exr

...

Note: You **really do** want to add the "dummy" frame numbers, in a 4-digit leading zero-padded nature, to the end of each image's file name so you've got a "name.\#\#\#\#.ext" formatted "image sequence" based filename.

If we do this step, we avoid having the set of multi-view ST Map images automatically loaded as one single unified animated ST Map sequence. This is not how we want to use the maps as we want to have each ST Map loaded in as a separate composite branch, alongside the source footage.

Step 10. Creating an ST Map Gradient

In this part of the workflow guide several different approaches for tackling the ST Map "initial" gradient creation task will be explored. 

The goal is to try and keep this step as software-agnostic as possible since the starting point ST Map image is made up of a horizontal and vertical gradient, which is hopefully, not too complex of a task to ask a professional imaging tool to carry out.

Blackmagic Resolve/Fusion

KartaVR UVGradientMap Macro

If you have access to a copy of the Fusion compositing environment provided by Resolve's Fusion page, or from Fusion Studio, you can take advantage of KartaVR's provided "UVGradientMap" macro.

![][image69-1]

The "UVGradientMap" macro allows you to quickly specify the width, height, and bit-depth for your new ST Map initial gradient template image.

If needed, you can also set options for flipping the image horizontally or vertically.

![][image24-1]

In the Fusion "Nodes" view, you would wire the image output from the KartaVR provided "UVGradientMap" macro into a Saver node. The Saver node needs to be configured to use an EXR image format, with ZIPS compression, and a "float32" 32 bit floating-point image bitdepth.

![][image21-1]

Fusion CustomTool Node

If you are a compositing TD (Technical Director) who is comfortable with expressions and formulas, you could also explore the Fusion built-in CustomTool node as a way to generate an ST Map in a super precise fashion.

To use this workflow, connect a Background node to the CustomTool node. The Background node generates the canvas size by defining the image width, image height, and initial bit depth. Then the CustomTool creates the vertical and horizontal direction based red/green gradient effect needed for the starting point of an STMap template.

![][image63-1]

Since the CustomTool works with normalized coordinates, running from 0 - 1 for the frame size, which are inherently resolution independent, you can make a new ST Map simply by typing in the values "X" and "Y" for the Red and Green channels. 

![][image14-1]

As a small tip, if you need to flip the ST Map gradient horizontally, you can start with a value of one in the field, then subtract the current X axis value, using a CustomTool expression like "1 - X". Nice!

![][image3]

Adobe Photoshop

If you are a die-hard Adobe Photoshop fan, the (free) [Domemaster Photoshop Actions Pack](https://github.com/AndrewHazelden/Domemaster-Photoshop-Actions-Pack) toolset includes handy parametric UV pass (ST Map) creation actions. 

With this toolset, the red-green colored horizontal/vertical ST Map gradient pattern is created as a smart object so it maintains its re-editable nature and vector-like resizability.

One step you need to do is to resize the Photoshop document to match your original "source" photo's image width/height. This is done immediately after you use the Domemaster Photoshop Actions Pack to add the new ST Map gradient to the photoshop layer stack.

UV Pass Actions

* UV Rectangle Gradient Landscape Layout
* UV Rectangle Gradient Portrait Layout
* UV Equirectangular to Angular Gradient
* UV Equirectangular to Domemaster Gradient
* Horizontal Offset 960px
* Vertical Offset 960px
* Rotate 90 Degrees
* Rotate 180 Degrees
* Rotate 270 Degrees
* Flip Vertical
* Flop Horizontal
* Gamma 2.2 to 1.0 Repair
* Gamma 1.0 to 2.2 Repair

The Interconnected Nature of Framebuffer Bit-depths and ST Map Resolution

ST Map gradient images need to be stored in a high dynamic range image format to function correctly, and the image should be at the exact frame size (width and height) as the original photo, too.

If you save an ST Map as an 8 bit per-channel JPEG or PNG format image, the maximum size of the output resolution you can have from the process is only 256px width by 256px height. This is due to the way an ST map uses the color range (of an 8 bit, 10 bit, 12 bit, 16 bit, or 32 bit per channel image) as the driver of the X and Y pixel plotting location for the warping process.

An 8 bit per-channel image provides a color range of 0-255, which can be described as 256 unique values that can be used for the warping LUT (Look Up Table). The 256 color values are calculated as [2\^8](https://duckduckgo.com/?t=ffab&q=2%5E8&ia=calculator) if you are a math geek.

![][image51-1]

By comparison, an unsigned 16 bit per channel integer image supports a color range of 0-65535 which can be calculated as [2\^16](https://duckduckgo.com/?q=2%5E16&t=ffab&ia=calculator).

![][image11-1]

This gives a lot more resolution to work with. In this case the ST map warping precision could potentially exceed the capability of a 32K x 32K resolution image on the output side of things, which is great.

General speaking, for most ST map generation needs, a 32-bit per-channel floating-point image in many ways is better to use than a 16 bit half-float or 16 bit integer image, due to the standardization of that floating-point format's use as the best / highest specification option available in photo editors, composting packages, game engines, and in OpenCL/CUDA/Metal based GPU framebuffers.

Step 11. Stitching Immersive Media with ST Maps

After Effects ST Map Based 360VR Video Stitching

[RE:Vision Effects has a "RE:Map"](https://revisionfx.com/products/remap/) plugin that is available for many compositing software packages including After Effects. If you buy one RE:Map license it will run with the same license, on the same host workstation, in just about every comp tool made.

![][image32-1]

Fusion ST Map Based 360VR Video Stitching

In Fusion you have several nodes you can use to perform ST map based stitching:

Fusion Texture Node

There is a built-in "Texture" node in Fusion. The main downside is that it cannot pass an alpha channel through the warping process.

![][image28-1]

RE:Map Plugin

[RE:Vision Effects has a "RE:Map"](https://revisionfx.com/products/remap/) plugin that is available for many compositing software packages including Resolve/Fusion. If you buy one RE:Map license it will run with the same license, on the same host workstation, in just about every comp tool made.

![][image7-1]

Fusion STMapper Fuse

Jacob Dannell from Emberlight released a very fast and high-quality "[ST Mapper](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=34453#p34453)" DCTL fuse that can be added to Resolve/Fusion v16-17.4.3+ via the Steakunderwater forum's Reactor package manager. It is quick and supports alpha channels. 

After I add an ST Mapper node to my comp, the first thing I tend to change in the Inspector window is the "Crop: STMap Frame" combo box menu item, and I enable the "\[x\] Flip V" checkbox. One could right-click in the nodes view, and save those options as a default setting for the node if they wanted to.

![][image42-1]

There is a KartaVR provided variation of the STMapper fuse called "STMapper Inline". It is unique in that it is capable of running in the Resolve Edit page timeline environment via a technique called an Effects Template macro.

![][image17-1]

Pro Tip: Instance Your Fusion Nodes

When adding several ST map based warping nodes to a Fusion comp, you can manage the setting more efficiently through the use of "instanced nodes". This will keep the ST Map warping settings in the Inspector window synced up across each of the camera views you process. 

Instanced nodes can be added to a Fusion comp by copying the first node into your clipboard copy/paste buffer. Then you right-click in the Nodes views, and from the contextual menu select the "Paste Instance" menu item, or use the Ctrl+Shift+V (Windows) hotkey.

![][image33-1]

This will add the extra warping nodes in a way that all controls are linked back to the first node. When two nodes are instanced together in the Nodes view, there is a thin green line that connects them together visually so you can see the instanced relationship.

![][image60-1]

If you later need to customize a few individual UI controls on instanced nodes, you can right-click in the Inspector window on a specific attribute and then select the "Deinstance" item from the contextual menu. 

![][image38-1]

This instancing of nodes approach is useful for cases where you need to perform subtle per-view changes on multi-view 360VR camera rig based compositing operations.

Fusion Lens Distort Node

If you want to use ST Maps to correct for lens distortion in live-action plate footage used in VFX workflows, Resolve/Fusion includes a LensDistort node that can be used to manually calibrate and process checkerboard lens alignment grids. 

![][image31-1]

The LensDistort node supports several camera lens models including the output from the PFTrack, and 3D Equalizer match-moving software.

Interestingly, the 3D Equalizer options include a fisheye lens model called "3DE4 Radial - Fisheye, Degree 8" which is a perfect fit for fulldome, VR180, and 360VR video stitching needs if you have to un-distort and linearize the f-theta warping present in footage shot on a circular fisheye lens based camera array.

The output from the LensDistort node can be either a lens corrected RGBA image, or an ST Map which is produced by turning on the "\[x\] **Output Distortion Map**" checkbox at the top of the Inspector view.

NukeX ST Map Workflows

The Foundry NukeX documentation includes a [guide on STMap template creation using an Expressions node](https://support.foundry.com/hc/en-us/articles/360000184919-Q100448-Creating-a-custom-STMap-image-in-Nuke). 

Once you have generated the required ST Map template image, it can be used to distort the footage in your NukeX composite with the aptly named [STMap node](https://learn.foundry.com/nuke/13.1/content/reference_guide/transform_nodes/stmap.html). To help artists get started, there is a [Working With STMaps](https://learn.foundry.com/nuke/content/comp_environment/lens_distortion/working_with_stmaps.html) guide.

NukeX ships with a [LensDistort node](https://learn.foundry.com/nuke/13.1/content/reference_guide/transform_nodes/lensdistortion.html) that can be used to process checkerboard lens alignment grids where the output is typically an ST Map style image. More details about lens distortion techniques in NukeX are covered in the [Working with Lens Distortion](https://learn.foundry.com/nuke/13.1/content/comp_environment/lens_distortion/adding_removing_lens_distortion.html) guide.

Blender Compositor ST Map Workflows

Blender's built-in compositing environment includes a [MapUV node](https://docs.blender.org/manual/en/latest/compositing/types/distort/map_uv.html). This node, while very minimal in the controls presented to the end user, allows artists to perform ST Map (UV pass retexturing) techniques.

![][image59-1]

TouchDesigner ST Map Based Real-Time 360VR Video Stitching

More information to be added shortly. 😀

![][image68-1]

Closing Notes

Thanks for reading this workflow guide on ST Map-based techniques. I'm sure it took a long time to slog through this lengthy technical content. I hope this guide will help cement new ideas in your mind on lens distortion correction techniques.

The motivation for writing this new content was to illustrate and describe approaches that can be used to perform high-speed panoramic warping with the existing software tools you likely already have access to on your workstation, today.

After writing this ST Map guide, and chatting with a stereo panoramic photographer friend, Antonio... I'd like to boldly and seriously put forward a term to be used for describing the color shading of ST Map initial templates in a colloquial sense: An immersive content creator uses a "Mango Map" to perform "Mango Warping".


![][image40-1]

Essentially, if you look at the specific shading of a freshly made red/green channel-based ST Map "initial lens distortion" template, it looks a heck of a lot like the outside color of a peeled mango.🥭

![][image6-1]

Render Fusion Comps in Houdini TOPs

Created 2021-11-12 Last Updated 2022-08-01 10.47 PM UTC -4

By [Andrew Hazelden \<andrew@andrewhazelden.com\>](mailto:andrew@andrewhazelden.com)

Overview

The following guide lists the essential steps required to set up a new [Houdini TOPs](https://www.sidefx.com/products/pdg/) "Task" that renders a folder of Fusion .comp files. This rendering process is done using command-line approaches that rely on Blackmagic Design's Fusion Studio and the included Fusion Render Node executable.

Houdini [TOPs](https://www.sidefx.com/docs/houdini/tops/intro.html) based node graphs provide an exciting new way to tame complex workflows that require multiple linked dependent tasks. This approach has the potential to be the ultimate workflow automation "glue" to unify post-production tasks for processes running across  artist workstations, local render farms, cloud computing systems, and even for assisting with general purpose task scheduling.

Software Required

To follow along with this workflow you need to have the following programs installed:

* ![][image36-2]SideFX Houdini (Apprentice/Indie/Core/FX)



* ![][image30-2]BMD Fusion Studio/Fusion Render Node

TOPs Workflow

Part 2

Overview

Part 2 will expand on the initial concepts presented, and explain at an overview level, how it is possible to create several more TOPs nodes that will remotely control a Fusion Studio compositing session using FuScript and the "fusion:DoAction()" and "comp:DoAction()" functions. This is an interesting concept as it allows you to run Fusion actions external to the app.

![][image20-2]

The TOP nodes in this example use a Fusion Studio GUI session to create a new Fusion comp, add a NyanCat macro (provided by the Reactor package manager), add a Saver node and define the Clip Filename, then the .comp file is saved to disk.

Next the composite is rendered in the background using the Fusion Render Node executable from the command-line via a Generic Generator TOPs node.

![][image32-2]

Nodes, Connections, and Attributes

To make this process happen, first a Comp\_New action is run to create the new empty Fusion composite session.

This was created like all of the other "DoAction" TOPs described below via a custom subnet. The subnet exposes two elements in the GUI that an artist/TD can interact with called "Action Name" and "Action Parameters".

This specific subnet was customized to use "fusion:DoAction()" so it ran the Comp\_New command in the Fusion wide scope, instead of targeting a comp specific scope like the other action based subnets do below.

![][image2-2]

To run an action inside of Fusion Studio the following custom TOPs subnet was created using a combination of an "[Attribute Create](https://www.sidefx.com/docs/houdini/nodes/top/attributecreate.html)" node to define our own set of ActionName and ActionParams attributes, along with a "[Generic Generator](https://www.sidefx.com/docs/houdini/nodes/top/genericgenerator.html)" node that makes use of these attributes when talking with Fusion Studio:

![][image24-2]

The "Generic Generator" node is used to pass the previously defined \`@ActionName\` and \`@ActionParams\` attributes into the command-line based [FuScript executable session](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=11964#p11964).

[FuScript allows you to bind](https://www.steakunderwater.com/wesuckless/viewtopic.php?f=6&t=1411&p=11498#p11498) locally, or over a LAN network connection to BMD tools like Fusion Studio, Fusion Render Node, Fusion Render Manager, Resolve, and Generation.

![][image3-1]

The AddSetting action was used to specify the name of a Fusion Macro .setting file that will be added to the current Fusion Studio session. PathMaps can be used in the Filename attribute here and they will be expanded by Fusion automatically to the full filepath required. 

![][image18-2]

📝**Note:** Using Pathmaps, where possible, makes Fusion scripting tasks cross-platform compatible with low effort.

📝**Note:** Enter the following text into the Generic Generator node's Command text-field:

**Command (for Windows):**

"C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\fuscript.exe" -x "fusion = bmd.scriptapp(\[\[Fusion\]\], \[\[localhost\]\]);if fusion \~= nil then fu = fusion;app = fu;composition = fu.CurrentComp;comp = composition;SetActiveComp(comp);comp:DoAction(\[\[\`@ActionName\`\]\], \{\`@ActionParams\`\}) else print('\[FuScript Error\] Please open up the Fusion Studio GUI before cooking this node.') end"

**Command (for macOS):**

"/Applications/Blackmagic Fusion 17 Render Node/Fusion Render Node.app/Contents/MacOS/fuscript" -x "fusion = bmd.scriptapp(\[\[Fusion\]\], \[\[localhost\]\]);if fusion \~= nil then fu = fusion;app = fu;composition = fu.CurrentComp;comp = composition;SetActiveComp(comp);comp:DoAction(\[\[\`@ActionName\`\]\], \{\`@ActionParams\`\}) else print('\[FuScript Error\] Please open up the Fusion Studio GUI before cooking this node.') end"

**Command (for Linux):**

"/opt/BlackmagicDesign/FusionRenderNode17/fuscript" -x "fusion = bmd.scriptapp(\[\[Fusion\]\], \[\[localhost\]\]);if fusion \~= nil then fu = fusion;app = fu;composition = fu.CurrentComp;comp = composition;SetActiveComp(comp);comp:DoAction(\[\[\`@ActionName\`\]\], \{\`@ActionParams\`\}) else print('\[FuScript Error\] Please open up the Fusion Studio GUI before cooking this node.') end"

In the next step, the selected node is loaded into Fusion Studio's Viewer 1 context using the Tool\_ViewOn action.

In this case the NyanCat macro will be shown on screen.

![][image17-2]

Next the Execute action will be used to lock the comp viewer session so file dialogs won't be shown by running a snippet of Lua code inside of Fusion Studio. One small detail is that you need to grab the current comp context when using the Execute action or you will otherwise see an error printed out in the results.

![][image11-2]

The AddTool action is used to add a Saver node to the comp. The previous step locked the viewer window so the Saver node's empty Filename field won't spawn a file dialog that would need direct user interaction to occur.

![][image26-2]

Now the viewer window is unlocked with another Execute action. This allows Fusion's file dialogs to work as expected during the rest of the compositing session. This will make the Fusion GUI session easier to use when testing and debugging code you are running.

![][image7-2]

Finally an Execute action is used to rename the Filename attribute for the currently selected node, which in this case is the Saver node. 

📝**Note:** With the Create Attribute node it's possible to use Houdini environment variables and have them expanded automatically when they are evaluated and passed over to Fusion Studio via FuScript.

In this case the \`$HIP\` token dynamically gives us the base Houdini project folder path on disk, which can be combined as a string with the "render" folder name, where Fusion will save the comp's rendered imagery too.

![][image1-2]

We are using the \`$HIP\` environment variable again to tell Fusion Studio where the current foreground Fusion .comp file should be saved to. 

This composite saving task is done using the Comp\_Save action along with manually defining the name parameter.

![][image6-2]

In this next step, we are reusing the FusionRenderNode based command-line TOPs rendering approach that was first shown in Part 1 of the "Render Fusion Comps in Houdini TOPs" guide. 

The only major difference here from what was shown in Part 1, is that these nodes were put into a subnet, and the File Pattern node's "Value" parameter was exposed in the Houdini UI. 

These exposed controls make it easier to interact with the FusionRenderNode subnet in a more modular fashion.

![][image5-2]

A final "Wait for All" TOPs node was used at the end of the TOPs node graph to keep the ordering of the work unit tasks tidy.

![][image23-2]

This is a cropped view of what the final TOPs node graph looks like after it is cooked (rendered). If the process was successful, then green check-marks are shown next to each stage.

![][image22-5]

Well, that was something of an interesting, yet geeky, ride through the world of TOPs network creation and interconnecting Fusion into the mix. 

Resolve Studio FuScript Linking Tips

📝**Note:** The same base concepts presented here to control Fusion Studio centric workflows can also be used to automate Resolve Studio workflows from Houdini TOPs via FuScript too.

This can be done by specifying the Resolve SubType when connecting to the app using FuScript, which also provides a way to have direct access to the built-in Resolve API functions via Lua or Python scripting.

📝**Note:** If you want to configure a "Generic Generator" TOP node so it connects to a Resolve Studio instance to access Resolve API functions, while being able to send "DoAction" tasks to the Resolve Fusion page, then the following text should be used as a starting point for your learning efforts. Enter one of the strings below into the Generic Generator node's Command text-field:

**Command (for Windows):**

"C:\\Program Files\\Blackmagic Design\\DaVinci Resolve\\fuscript.exe" -x "resolve = bmd.scriptapp(\[\[Resolve\]\], \[\[localhost\]\]);if resolve \~= nil then res = resolve;else print('\[FuScript Error\] Please open up the Resolve Studio GUI before cooking this node.') end;fusion = bmd.scriptapp(\[\[Fusion\]\], \[\[localhost\]\], 0.0, 0, \[\[Resolve\]\]);if fusion \~= nil then fu = fusion;app = fu;composition = fu.CurrentComp;comp = composition;SetActiveComp(comp);comp:DoAction(\[\[\`@ActionName\`\]\], \{\`@ActionParams\`\}) else print('\[FuScript Error\] Please open up the Resolve Studio GUI before cooking this node.') end;"

**Command (for macOS):**

"/Applications/DaVinci Resolve/DaVinci Resolve.app/Contents/Libraries/Fusion/fuscript" -x "resolve = bmd.scriptapp(\[\[Resolve\]\], \[\[localhost\]\]);if resolve \~= nil then res = resolve;else print('\[FuScript Error\] Please open up the Resolve Studio GUI before cooking this node.') end;fusion = bmd.scriptapp(\[\[Fusion\]\], \[\[localhost\]\], 0.0, 0, \[\[Resolve\]\]);if fusion \~= nil then fu = fusion;app = fu;composition = fu.CurrentComp;comp = composition;SetActiveComp(comp);comp:DoAction(\[\[\`@ActionName\`\]\], \{\`@ActionParams\`\}) else print('\[FuScript Error\] Please open up the Resolve Studio GUI before cooking this node.') end;"

**Command (for Linux):**

"/opt/BlackmagicDesign/FusionRenderNode17/fuscript" -x "resolve = bmd.scriptapp(\[\[Resolve\]\], \[\[localhost\]\]);if resolve \~= nil then res = resolve;else print('\[FuScript Error\] Please open up the Resolve Studio GUI before cooking this node.') end;fusion = bmd.scriptapp(\[\[Fusion\]\], \[\[localhost\]\], 0.0, 0, \[\[Resolve\]\]);if fusion \~= nil then fu = fusion;app = fu;composition = fu.CurrentComp;comp = composition;SetActiveComp(comp);comp:DoAction(\[\[\`@ActionName\`\]\], \{\`@ActionParams\`\}) else print('\[FuScript Error\] Please open up the Resolve Studio GUI before cooking this node.') end;"

\*If you explore this approach IRL, at some point you may have to peek into the "[Fusion Comp Link](https://gitlab.com/WeSuckLess/Reactor/-/blob/master/Atoms/com.AndrewHazelden.FusionCompLink/Scripts/Comp/Andrew%20Hazelden/Fusion%20Comp%20Link.lua)" Lua script for more [FuScript SubType](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=20828#p20828) parameter insight for an Interactive vs Fusion vs Resolve session. You can also specify a timeout value, a unique UUID value for the copy of Resolve/Fusion that is running, and even a remote host's IP address to connect to, if the other Resolve/Fusion system is connected on your local LAN network, too.

📝**Note:** You also have to make sure that you are running a copy of Resolve Studio, as a copy of Resolve Free doesn't provide command-line access to FuScript and the Resolve process. The next step is to verify that you adjusted the "Resolve Preferences \> System \> General \> External scripting using" preference so it is set to the "Network" option. 

(By default external scripting access is disabled on a fresh Resolve install... which typically results in a lot of wasted time spent troubleshooting issues when you first start to explore command-line based Resolve automation techniques.)

![][image35-2]



Fusion Action/Event Scripting Resources

📝**Note:** The [Action Listener](https://gitlab.com/WeSuckLess/Reactor/-/blob/master/Atoms/com.AndrewHazelden.UIManagerLuaExamples/Scripts/Comp/UI%20Manager/Action%20Listener.lua) script provided by the Reactor Package manager's "UI Manager Lua & Python Examples" atom package for Fusion/Resolve is a great way to see actions at work from inside of your compositing application.

It's possible to print out a list of the actions present inside of Fusion with the handy "[Action Printout](https://gitlab.com/WeSuckLess/Reactor/-/blob/master/Atoms/com.AndrewHazelden.UIManagerLuaExamples/Scripts/Comp/UI%20Manager/Action%20Printout.lua)" script.

You can also learn a lot about the Fusion API from the "[Fusion Script Help Browser](https://gitlab.com/WeSuckLess/Reactor/-/blob/master/Atoms/com.AndrewHazelden.UIManagerLuaExamples/Scripts/Comp/UI%20Manager/FusionScript%20Help%20Browser.lua)" example. Additionally, Roger Magnusson's "[Class Browser](https://gitlab.com/WeSuckLess/Reactor/-/blob/master/Atoms/com.RogerMagnusson.ClassBrowser/Scripts/Comp/Roger%20Magnusson/Class%20Browser.lua)" is another essential scripting tool for Fusion/Resolve.

📝**Note:** If you want to peek into the Actions that are connected to the default hotkeys in Fusion take a look at the "[The Ultimate Listicle of Actions and Hotkeys](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=39238&fbclid=IwAR0X6aVCmAgTo2DGKef07Pzi7aVBJDbKcgEwSGo25XUvEObetcBeNCYJwRo#p39238)" post on the WSL forum.

📝**Note:** A general introduction to Actions and Events can be found on the following WSL forum scripting posts:

* [Events/Callbacks in Python](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=25533#p25533)
* [Running Python Code in an Event](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=25577#p25577)
* [Common Variables Found in a .fu Event Execute Scope](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=25596#p25596)
* [Using AddNotify() in Fusion to Respond to Actions](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=11029#p11029)
* [FusionCompEvents.fu](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=13820#p13820)
* [RandomizeNodeColors.fu Event Example](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=12443#p12443)
* [Automatically Display the Selected Node in the Viewer Window](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=17494#p17494)
* [.fu Based Contextual Menus - Python Print Attributes](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=25590#p25590)
* [Using a Script to Add Macros to a Comp](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=17822#p17822)
* [Resolve Scripting Essentials](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=15578#p15578)
* [Python Script Snippets for Fusion TDs](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=11955#p11955)
* [Running Python Scripts in FuScript](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=11964#p11964)
* [Running UI Manager GUIs from a Terminal FuScript Session](https://www.steakunderwater.com/wesuckless/viewtopic.php?f=6&t=1411&p=11498#p11498)
* [Menu configuration in Fusion 8.1](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=11921#p11921)
* [FuScript Subtype Essentials](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=20828#p20828)
* [Fusion Comp Link Atom](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=16996#p16996)
* [Hypertext Compositor - An Interactive Documentation & Walkthrough Tool for Compers](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=23827#p23827)





Step 1.

Create a new Houdini project folder.

![][image15-2]

Step 2. 

Place several Fusion .comp files inside the Houdini project folder's "comp" sub-folder. For this example I've created two comp files in Fusion Studio that are named "Fusion1.comp" and "Fusion2.comp".

![][image13-2]

📝**Note:** Don't forget to customize your Fusion .comp files so the Saver nodes will render the media into the current Houdini project folder's "render" sub-folder.

Step 3.

Create a new Houdini .hip/.hiplc/.hipnc file for this exercise.

Use the Houdini desktop manager menu item (found at the top of the Houdini UI next to the menu bar) to change the desktop mode to "TOPs". This will modify the view layout for a TOPs optimized working environment.

![][image28-2]

Step 4.

Press the **Tab** key in the Tasks context, and start typing the node name. A list of the [TOP nodes](https://www.sidefx.com/docs/houdini/nodes/top/index.html) that are available will be displayed.

![][image33-2]

For this project you will need to individually create each of the following TOP nodes listed below. The required parameters that have to be customized are also listed below, too.

After you add the nodes, you will need to connect each node to the subsequent node that follows immediately after it. Doing this will create a single vertical branch of nodes. This node graph represents your first Fusion-centric Houdini TOP network.

![][image14-2]

Add the Node: [File Pattern](https://www.sidefx.com/docs/houdini/nodes/top/filepattern.html) (Rename it to: ListComps)

![][image29-2]

**File Types:**

Files Only

**Pattern:**

$HIP/comp/\*.comp

**Work Item:**

\[ **\] Include Extension in Filename Attribute**

**\[x\] Split Files into separate items**

**\[x\] Output File Tag:**

filename

📝**Note:** The "filename" tag we defined here can be accessed in downstream nodes by adding the parameter name \`@filename\` to any text field.

📝**Note:** We unchecked the "Include Extension in Filename Attribute" so the individual .comp files would be listed without the file extension. This made it easier to write out a per-task render log file with a customized filename in the Generic Generator node.

Add the Node: [Environment Edit](https://www.sidefx.com/docs/houdini/nodes/top/environmentedit.html) (Rename it to: NoPy)

![][image21-2]

\[x\] **Variable Name:**

PYTHONHOME

**Variable Type:**

String

**Existing Name:**

Replace Existing Variable

**Value:**

(Leave this field blank with nothing typed in the text field.)

\[x\] **Variable Name:**

PYTHONPATH

**Variable Type:**

String

**Existing Name:**

Replace Existing Variable

**Value:**

(Leave this field blank with nothing typed in the text field.)

📝**Note:** The EnvironmentEdit node is useful for clearing out the pre-existing Python 2.7 based Hython shell env variables so the FusionRenderNode process will be happy. 

If you don't add an EnvironmentEdit node before the Generic Generator, you would need to prefix the Fusion Render Node launching Generic Generator command string with: set PYTHONHOME= & set PYTHONHOME= &


Add the Node: [Generic Generator](https://www.sidefx.com/docs/houdini/nodes/top/genericgenerator.html) (Rename it to: FusionRenderNode)

![][image27-2]

\[x\] **Sequential**

**Item Count:**

1

**Specify Using:**

Custom String

**Command (for Windows):**

"C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\FusionRenderNode.exe" "$HIP/comp/\`@filename\`.comp" /render /log "$HIP/comp/\`@filename\`\_log.txt" /cleanlog /verbose /status /quit

**Command (for macOS):**

"/Applications/Blackmagic Fusion 17 Render Node/Fusion Render Node.app/Contents/MacOS/Fusion Render Node" "$HIP/comp/\`@filename\`.comp" -render -log "$HIP/comp/\`@filename\`\_log.txt" -cleanlog -verbose -status -quit

**Command (for Linux):**

"/opt/BlackmagicDesign/FusionRenderNode17/FusionRenderNode" "$HIP/comp/\`@filename\`.comp" -render -log "$HIP/comp/\`@filename\`\_log.txt" -cleanlog -verbose -status -quit

\[x\] **Run Command in System Shell**

📝**Note:** It looks like the "Run Command in System Shell" checkbox needs to be enabled if you want the "@filename" parameter to be parsed correctly inside the Command string.

📝**Note:** You can limit a render to a specific frame range using "start" and "end" flags when launching the Fusion Render Node executable. This is done by appending this text to the middle of your Command string:

**Render a single frame:**

/render /start 0 /end 0 

**Render a 144 frame long sequence:**

/render /start 1 /end 144 

📝**Note:** Fusion Render Node supports the following command line flags:

(*On Windows the flags are defined with slashes, while on Linux and macOS you can use dashes in place of the slashes for each flag you specify.*)

![][image16-2]

Add the Node: [Environment Edit](https://www.sidefx.com/docs/houdini/nodes/top/environmentedit.html) (Rename it to: ResetPy)

![][image31-2]

\[x\] **Reset Environment**

📝**Note:** This node is used to restore the default environment variable settings. 

In the previous step, we had overridden the PYTHONHOME and PYTHONHOME entries to blank them out. This node will help us revert the values of those modified environment variables back to their standard setting.

Add the Node: [Wait For All](https://www.sidefx.com/docs/houdini/nodes/top/waitforall.html)

![][image19-2]

📝**Note:** This node is useful as it will pause any additional downstream tasks until all of the Fusion comps are rendered to disk.

Step 5.

Enable the orange colored "Output" parameter which is on the right side of the "Wait For All" node shape. The "Output" parameter makes this node the final output stage for the current Tasks rendering process.

![][image12-2]

At the top of the tasks view, there is a triangle-shaped "play" button with a little orange colored block next to it. Press that button to cook (render) the current TOPs node graph. This will batch render the node tree you have created.

![][image34-2]

Alternatively, you can right-click on a node and select the "**Dirty and Cook This Node**" menu item to re-process it. This action has a keyboard shortcut of **Shift+V**.

![][image9-2]

Once the TOPs network has been generated and cooked, the Task Graph Table will show diagnostics information about the whole rendering process. The Task Graph Table is visible at the bottom right of the TOPs view layout.

![][image25-2]

Step 6.

In the Task Graph Table you can double-click on the "Cooked" heading entry in the tree list to see debugging information about each node's output. This can help you diagnose issues and see the individual pieces of information, like the Generic Generator node's command-line feedback results in the log section.

![][image8-2]


Also, if you click the small green circles shown on any TOPs node in the topnet graph, it will filter the results displayed in the Task Graph Table to show you the output for a specific work unit.

![][image4-2]

Step 7.

Since we have cooked the TOPs graph, and each of the specified Fusion comps have been rendered to disk, we can now review the Fusion Render Node verbose logging information saved for each comp file.

![][image10-2]

This information was exported to disk because the Generic Generator node had the following flags present as part of the Command string:

/log "$HIP/comp/\`@filename\`\_log.txt" /cleanlog /verbose

This logging flag results in two text files being created for our Fusion comps:

$HIP/comp/Fusion1\_log.txt

$HIP/comp/Fusion2\_log.txt

An example copy of the log file output is included below. This logging information can help you spot issues like Fusion plugins not loading, GPU rendering headaches, or other error states which could cause a render to fail.

---------------------------------------------------

Starting Fusion Render Node 17.4.1 at 12/Nov/21 13:53:02

C:/Program Files/Blackmagic Design/Fusion Render Node 17\\FusionRenderNode.exe

---------------------------------------------------

Loading Plugins

Creating GPU context on CUDA device: GeForce RTX 3090

Creating GPU context on CUDA device: GeForce RTX 3090

Creating GPU context on CUDA device: GeForce RTX 3090

Creating GPU context on CUDA device: GeForce RTX 3090

Loading plugin C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\fusionoperators.dll

Loading plugin C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\fusionformats.dll

Loading plugin C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\Plugins\\Blackmagic\\CinemaRaw\\cinemaraw.plugin

Loading plugin C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\Plugins\\Blackmagic\\alembic.plugin

Loading plugin C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\Plugins\\Blackmagic\\directshow.plugin

Loading plugin C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\Plugins\\Blackmagic\\dimension.plugin

Loading plugin C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\Plugins\\Blackmagic\\dds.plugin

Loading plugin C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\Plugins\\Blackmagic\\bins.plugin

Loading plugin C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\Plugins\\Blackmagic\\3d.plugin

Loading plugin C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\Plugins\\Blackmagic\\fbx.plugin

Loading plugin C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\Plugins\\Blackmagic\\mxf.plugin

Loading plugin C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\Plugins\\Blackmagic\\fuses.plugin

Loading plugin C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\Plugins\\Blackmagic\\paint.plugin

Loading plugin C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\Plugins\\Blackmagic\\opencolorio.plugin

Loading plugin C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\Plugins\\Blackmagic\\openfx.plugin

Loading plugin C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\Plugins\\Blackmagic\\particles.plugin

Loading plugin C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\Plugins\\Blackmagic\\quicktime.plugin

Loading plugin C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\Plugins\\Blackmagic\\text.plugin

Loading plugin C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\Plugins\\Blackmagic\\utilities.plugin

Checking for licenses...

Adding Global App Events

Initialising all geometry caches

Initialising GLTools

Initialising Texture Manager

Starting GraphicsThread

Loading Comp at E:\\Projects\\Houdini\_TOP\\comp\\Fusion1.comp

Rendering Comp, frames 0, step 1

Showing Status

Render started at Fri 1:53PM  (Range: 0.0 to 0.0)

Rendered frame 0 (1 of 1), took 0.270316 secs

Render completed successfully at Fri 1:53PM - Total Time: 0h 0m 0.27s, Average: 3.70 frames/second

Auto-exiting with errcode 0

Cleanup licenses

Process Complete

Congrats for making it this far into the tutorial! This topic can be intimidating for artists new to Houdini TOPs usage but with a little practice you can come up with novel use cases for a hybrid Houdini + Fusion centric workflow.

Example workflows you could explore with TOPs approaches might include using Houdini to automatically slice and render a voxel based VDB volumetric dataset into a "contact sheet" like tiled grid image layout which can then be used inside Fusion's VolumeFog node.

Part 2

Overview

Part 2 will expand on the initial concepts presented, and explain at an overview level, how it is possible to create several more TOPs nodes that will remotely control a Fusion Studio compositing session using FuScript and the "fusion:DoAction()" and "comp:DoAction()" functions. This is an interesting concept as it allows you to run Fusion actions external to the app.

![][image20-3]

The TOP nodes in this example use a Fusion Studio GUI session to create a new Fusion comp, add a NyanCat macro (provided by the Reactor package manager), add a Saver node and define the Clip Filename, then the .comp file is saved to disk.

Next the composite is rendered in the background using the Fusion Render Node executable from the command-line via a Generic Generator TOPs node.

![][image32-3]

Nodes, Connections, and Attributes

To make this process happen, first a Comp\_New action is run to create the new empty Fusion composite session.

This was created like all of the other "DoAction" TOPs described below via a custom subnet. The subnet exposes two elements in the GUI that an artist/TD can interact with called "Action Name" and "Action Parameters".

This specific subnet was customized to use "fusion:DoAction()" so it ran the Comp\_New command in the Fusion wide scope, instead of targeting a comp specific scope like the other action based subnets do below.

![][image2-3]

To run an action inside of Fusion Studio the following custom TOPs subnet was created using a combination of an "[Attribute Create](https://www.sidefx.com/docs/houdini/nodes/top/attributecreate.html)" node to define our own set of ActionName and ActionParams attributes, along with a "[Generic Generator](https://www.sidefx.com/docs/houdini/nodes/top/genericgenerator.html)" node that makes use of these attributes when talking with Fusion Studio:

![][image24-3]

The "Generic Generator" node is used to pass the previously defined \`@ActionName\` and \`@ActionParams\` attributes into the command-line based [FuScript executable session](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=11964#p11964).

[FuScript allows you to bind](https://www.steakunderwater.com/wesuckless/viewtopic.php?f=6&t=1411&p=11498#p11498) locally, or over a LAN network connection to BMD tools like Fusion Studio, Fusion Render Node, Fusion Render Manager, Resolve, and Generation.

![][image3-2]

The AddSetting action was used to specify the name of a Fusion Macro .setting file that will be added to the current Fusion Studio session. PathMaps can be used in the Filename attribute here and they will be expanded by Fusion automatically to the full filepath required. 

![][image18-3]

📝**Note:** Using Pathmaps, where possible, makes Fusion scripting tasks cross-platform compatible with low effort.

📝**Note:** Enter the following text into the Generic Generator node's Command text-field:

**Command (for Windows):**

"C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\fuscript.exe" -x "fusion = bmd.scriptapp(\[\[Fusion\]\], \[\[localhost\]\]);if fusion \~= nil then fu = fusion;app = fu;composition = fu.CurrentComp;comp = composition;SetActiveComp(comp);comp:DoAction(\[\[\`@ActionName\`\]\], \{\`@ActionParams\`\}) else print('\[FuScript Error\] Please open up the Fusion Studio GUI before cooking this node.') end"

**Command (for macOS):**

"/Applications/Blackmagic Fusion 17 Render Node/Fusion Render Node.app/Contents/MacOS/fuscript" -x "fusion = bmd.scriptapp(\[\[Fusion\]\], \[\[localhost\]\]);if fusion \~= nil then fu = fusion;app = fu;composition = fu.CurrentComp;comp = composition;SetActiveComp(comp);comp:DoAction(\[\[\`@ActionName\`\]\], \{\`@ActionParams\`\}) else print('\[FuScript Error\] Please open up the Fusion Studio GUI before cooking this node.') end"

**Command (for Linux):**

"/opt/BlackmagicDesign/FusionRenderNode17/fuscript" -x "fusion = bmd.scriptapp(\[\[Fusion\]\], \[\[localhost\]\]);if fusion \~= nil then fu = fusion;app = fu;composition = fu.CurrentComp;comp = composition;SetActiveComp(comp);comp:DoAction(\[\[\`@ActionName\`\]\], \{\`@ActionParams\`\}) else print('\[FuScript Error\] Please open up the Fusion Studio GUI before cooking this node.') end"

In the next step, the selected node is loaded into Fusion Studio's Viewer 1 context using the Tool\_ViewOn action.

In this case the NyanCat macro will be shown on screen.

![][image17-3]

Next the Execute action will be used to lock the comp viewer session so file dialogs won't be shown by running a snippet of Lua code inside of Fusion Studio. One small detail is that you need to grab the current comp context when using the Execute action or you will otherwise see an error printed out in the results.

![][image11-3]

The AddTool action is used to add a Saver node to the comp. The previous step locked the viewer window so the Saver node's empty Filename field won't spawn a file dialog that would need direct user interaction to occur.

![][image26-3]

Now the viewer window is unlocked with another Execute action. This allows Fusion's file dialogs to work as expected during the rest of the compositing session. This will make the Fusion GUI session easier to use when testing and debugging code you are running.

![][image7-3]

Finally an Execute action is used to rename the Filename attribute for the currently selected node, which in this case is the Saver node. 

📝**Note:** With the Create Attribute node it's possible to use Houdini environment variables and have them expanded automatically when they are evaluated and passed over to Fusion Studio via FuScript.

In this case the \`$HIP\` token dynamically gives us the base Houdini project folder path on disk, which can be combined as a string with the "render" folder name, where Fusion will save the comp's rendered imagery too.

![][image1-3]

We are using the \`$HIP\` environment variable again to tell Fusion Studio where the current foreground Fusion .comp file should be saved to. 

This composite saving task is done using the Comp\_Save action along with manually defining the name parameter.

![][image6-3]

In this next step, we are reusing the FusionRenderNode based command-line TOPs rendering approach that was first shown in Part 1 of the "Render Fusion Comps in Houdini TOPs" guide. 

The only major difference here from what was shown in Part 1, is that these nodes were put into a subnet, and the File Pattern node's "Value" parameter was exposed in the Houdini UI. 

These exposed controls make it easier to interact with the FusionRenderNode subnet in a more modular fashion.

![][image5-3]

A final "Wait for All" TOPs node was used at the end of the TOPs node graph to keep the ordering of the work unit tasks tidy.

![][image23-3]

This is a cropped view of what the final TOPs node graph looks like after it is cooked (rendered). If the process was successful, then green check-marks are shown next to each stage.

![][image22-6]

Well, that was something of an interesting, yet geeky, ride through the world of TOPs network creation and interconnecting Fusion into the mix.

Resolve Studio FuScript Linking Tips

📝**Note:** The same base concepts presented here to control Fusion Studio centric workflows can also be used to automate Resolve Studio workflows from Houdini TOPs via FuScript too.

This can be done by specifying the Resolve SubType when connecting to the app using FuScript, which also provides a way to have direct access to the built-in Resolve API functions via Lua or Python scripting.

📝**Note:** If you want to configure a "Generic Generator" TOP node so it connects to a Resolve Studio instance to access Resolve API functions, while being able to send "DoAction" tasks to the Resolve Fusion page, then the following text should be used as a starting point for your learning efforts. Enter one of the strings below into the Generic Generator node's Command text-field:

**Command (for Windows):**

"C:\\Program Files\\Blackmagic Design\\DaVinci Resolve\\fuscript.exe" -x "resolve = bmd.scriptapp(\[\[Resolve\]\], \[\[localhost\]\]);if resolve \~= nil then res = resolve;else print('\[FuScript Error\] Please open up the Resolve Studio GUI before cooking this node.') end;fusion = bmd.scriptapp(\[\[Fusion\]\], \[\[localhost\]\], 0.0, 0, \[\[Resolve\]\]);if fusion \~= nil then fu = fusion;app = fu;composition = fu.CurrentComp;comp = composition;SetActiveComp(comp);comp:DoAction(\[\[\`@ActionName\`\]\], \{\`@ActionParams\`\}) else print('\[FuScript Error\] Please open up the Resolve Studio GUI before cooking this node.') end;"

**Command (for macOS):**

"/Applications/DaVinci Resolve/DaVinci Resolve.app/Contents/Libraries/Fusion/fuscript" -x "resolve = bmd.scriptapp(\[\[Resolve\]\], \[\[localhost\]\]);if resolve \~= nil then res = resolve;else print('\[FuScript Error\] Please open up the Resolve Studio GUI before cooking this node.') end;fusion = bmd.scriptapp(\[\[Fusion\]\], \[\[localhost\]\], 0.0, 0, \[\[Resolve\]\]);if fusion \~= nil then fu = fusion;app = fu;composition = fu.CurrentComp;comp = composition;SetActiveComp(comp);comp:DoAction(\[\[\`@ActionName\`\]\], \{\`@ActionParams\`\}) else print('\[FuScript Error\] Please open up the Resolve Studio GUI before cooking this node.') end;"

**Command (for Linux):**

"/opt/BlackmagicDesign/FusionRenderNode17/fuscript" -x "resolve = bmd.scriptapp(\[\[Resolve\]\], \[\[localhost\]\]);if resolve \~= nil then res = resolve;else print('\[FuScript Error\] Please open up the Resolve Studio GUI before cooking this node.') end;fusion = bmd.scriptapp(\[\[Fusion\]\], \[\[localhost\]\], 0.0, 0, \[\[Resolve\]\]);if fusion \~= nil then fu = fusion;app = fu;composition = fu.CurrentComp;comp = composition;SetActiveComp(comp);comp:DoAction(\[\[\`@ActionName\`\]\], \{\`@ActionParams\`\}) else print('\[FuScript Error\] Please open up the Resolve Studio GUI before cooking this node.') end;"

\*If you explore this approach IRL, at some point you may have to peek into the "[Fusion Comp Link](https://gitlab.com/WeSuckLess/Reactor/-/blob/master/Atoms/com.AndrewHazelden.FusionCompLink/Scripts/Comp/Andrew%20Hazelden/Fusion%20Comp%20Link.lua)" Lua script for more [FuScript SubType](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=20828#p20828) parameter insight for an Interactive vs Fusion vs Resolve session. You can also specify a timeout value, a unique UUID value for the copy of Resolve/Fusion that is running, and even a remote host's IP address to connect to, if the other Resolve/Fusion system is connected on your local LAN network, too.

📝**Note:** You also have to make sure that you are running a copy of Resolve Studio, as a copy of Resolve Free doesn't provide command-line access to FuScript and the Resolve process. The next step is to verify that you adjusted the "Resolve Preferences \> System \> General \> External scripting using" preference so it is set to the "Network" option. 

(By default external scripting access is disabled on a fresh Resolve install... which typically results in a lot of wasted time spent troubleshooting issues when you first start to explore command-line based Resolve automation techniques.)

![][image35-3]

Fusion Action/Event Scripting Resources

📝**Note:** The [Action Listener](https://gitlab.com/WeSuckLess/Reactor/-/blob/master/Atoms/com.AndrewHazelden.UIManagerLuaExamples/Scripts/Comp/UI%20Manager/Action%20Listener.lua) script provided by the Reactor Package manager's "UI Manager Lua & Python Examples" atom package for Fusion/Resolve is a great way to see actions at work from inside of your compositing application.

It's possible to print out a list of the actions present inside of Fusion with the handy "[Action Printout](https://gitlab.com/WeSuckLess/Reactor/-/blob/master/Atoms/com.AndrewHazelden.UIManagerLuaExamples/Scripts/Comp/UI%20Manager/Action%20Printout.lua)" script.

You can also learn a lot about the Fusion API from the "[Fusion Script Help Browser](https://gitlab.com/WeSuckLess/Reactor/-/blob/master/Atoms/com.AndrewHazelden.UIManagerLuaExamples/Scripts/Comp/UI%20Manager/FusionScript%20Help%20Browser.lua)" example. Additionally, Roger Magnusson's "[Class Browser](https://gitlab.com/WeSuckLess/Reactor/-/blob/master/Atoms/com.RogerMagnusson.ClassBrowser/Scripts/Comp/Roger%20Magnusson/Class%20Browser.lua)" is another essential scripting tool for Fusion/Resolve.

📝**Note:** If you want to peek into the Actions that are connected to the default hotkeys in Fusion take a look at the "[The Ultimate Listicle of Actions and Hotkeys](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=39238&fbclid=IwAR0X6aVCmAgTo2DGKef07Pzi7aVBJDbKcgEwSGo25XUvEObetcBeNCYJwRo#p39238)" post on the WSL forum.

📝**Note:** A general introduction to Actions and Events can be found on the following WSL forum scripting posts:

* [Events/Callbacks in Python](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=25533#p25533)
* [Running Python Code in an Event](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=25577#p25577)
* [Common Variables Found in a .fu Event Execute Scope](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=25596#p25596)
* [Using AddNotify() in Fusion to Respond to Actions](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=11029#p11029)
* [FusionCompEvents.fu](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=13820#p13820)
* [RandomizeNodeColors.fu Event Example](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=12443#p12443)
* [Automatically Display the Selected Node in the Viewer Window](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=17494#p17494)
* [.fu Based Contextual Menus - Python Print Attributes](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=25590#p25590)
* [Using a Script to Add Macros to a Comp](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=17822#p17822)
* [Resolve Scripting Essentials](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=15578#p15578)
* [Python Script Snippets for Fusion TDs](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=11955#p11955)
* [Running Python Scripts in FuScript](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=11964#p11964)
* [Running UI Manager GUIs from a Terminal FuScript Session](https://www.steakunderwater.com/wesuckless/viewtopic.php?f=6&t=1411&p=11498#p11498)
* [Menu configuration in Fusion 8.1](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=11921#p11921)
* [FuScript Subtype Essentials](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=20828#p20828)
* [Fusion Comp Link Atom](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=16996#p16996)
* [Hypertext Compositor - An Interactive Documentation & Walkthrough Tool for Compers](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=23827#p23827)





# SketchFab in VR Via QuestLink

If you have a SketchFab 3D scene you want to explore in VR, you might need to use your PC to do the actual rendering. In this case, the free Oculus Link drivers for Windows 10/11 allows you to connect your PC to a Meta Quest HMD via WiFi or a long USB-C cable.

**YouTube \| Explore the Cave-verse via QuestLink**

<https://youtu.be/QI9f_PrWK_A>

Install the Oculus Drivers for Windows

Start by going to the [Meta2 Website](https://www.meta.com/ca/quest/setup/). Click the blue "Download Software" button part way down the webpage.

![][image17-4]

After you download the "OculusSetup.exe" program, run the installer.

![][image18-4]

You can use either a Facebook or Instagram account for signing into your Oculus account on Windows. I went with my existing Facebook account.

![][image5-4]

The Facebook website then offers to set up a "Meta" account.

![][image9-3]

After the Meta account was configured the webpage offers to pass those credentials over to the Oculus application running on your PC.

![][image15-3]

The rest of the Quest install process is done by clicking continue a few more times.

![][image7-4]

You need to select the model of Meta/Oclus HMD you are using. This will typically be a Quest 2 HMD or a Quest 1 HMD.

![][image19-3]

Then you can choose to connect from the PC via a long USB-C Cable "Link" or via WIFI v6 connection using "AirLink (Wireless)".

![][image6-4]

The setup program will now exit.

![][image16-3]

Configure OpenXR on Windows

You now need to enable the OpenXR runtime which allows desktop PC programs to use the VR HMD. This can be done by clicking on the header bar at the top of the window.

![][image13-3]

Next to the heading "OpenXR Runtime" click "Set Oculus as active".

![][image8-3]

Pair your Quest HMD

Now you can start pairing the HMD to your PC.

![][image1-4]

On the Meta Quest HMD open the "Settings" button. You can toggle between AirLink (Wifi) and a USB-C cable connection if you need to in the "Experimental" tab.

![][image11-4]![][image3-3]

Enabling AirLink on the Quest

The Quest's control panel view has a handy "AirLink" button on the right side of the window.

![][image12-3]

With AirLink you can connect via a fast WiFi v6 link to Windows PCs on your local network that are running the Oculus Link software.

![][image2-4]

Connect in VR to your Desktop PC

On the HMD you can press the "Desktop" icon in the toolbar to see a live screenshot of your PC monitor. This makes it easier to load the SketchFab website in Google Chrome using your Quest hand controllers to click the buttons.

![][image4-3]

With Google Chrome open, you can now press the "VR" button on a 3D model and beam that content directly to your Quest HMD. This is possible due to the magic of OpenXR running in a web browser session.

![][image14-3]

The first time you view a webpage in VR with the HMD connected, you may be asked to allow VR devices to work with Chrome. Click "Allow" to continue.

![][image10-3]

Wander Around in your VR Scenes

Now you can roam around in SketchFab 3D scenes using VR on your Quest. The native Quest head tracking feature still works in "Room-scale" 6DoF VR with AirLink, and it even supports the use of your hand-controllers as an input device to teleport your character controller around the environment.

Since you are using your desktop PC to render the 3D content when AirLink is active, you can load far larger scenes using your PC's GPU and its many gigabytes of onboard VRAM to do the heavy lifting.

![][image20-4]

I hope this guide allows you to have fun exploring vast virtual worlds that are streamed from the web.

**SketchFab \| Las Cabras Cave 3D Scene**

<https://sketchfab.com/3d-models/las-cabras-cave-mobile-edition-d15457a4df734093953eb470259d640c>




# Troubleshooting Guide for Fusion Studio Freeze Ups

What follows is a handy set of tips that can be used by a comp TD to find the root cause of issues when a Fusion Studio .comp file crashes all the time. It can also help you track down if a GPU glitch is responsible for your Fusion freezes, etc...

Adding the Custom Hidden Environment Variable

If Fusion is crashing unexpectedly, you can add a custom environment variable to your Windows system called "FUSION\_EXCEPTION\_HANDLER=true". 

When this undocumented environment variable is active, if Fusion crashes, it automatically produces a diagnostic report listing the source of the problem.

**Step 1.**  Environment variables are added to your Windows PC using the "System" Control Panel.

![][image2-5]

 

With the System Control Panel visible, on the top left of the window is the clickable text "Advanced system settings". 

 

In the Advanced System settings window, you can click the "Environment Variables" button on the lower right of the window to show the "Environment Variables" dialog.

 

At the bottom of the "Environment Variable" window is a "System Variables" section. Clicking the "New..." button will display a "New System Variable" dialog.

(FYI The next image shows the new environment variable in the Systems Variable section. This only exists after you add it, manually, by yourself to the environment variable window...)

![][image4-4]

Step 2. In the "New System Variable" dialog enter the "Variable name:" as "FUSION\_EXCEPTION\_HANDLER". Then enter the "Variable value:" as "true". Click the "OK" button to save this new environment variable entry.

![][image5-5]

Step 3. It's now time to restart your Windows system for the newly added environment variable to be active.

Step 4. After rebooting your system, you can check if the "FUSION\_EXCEPTION\_HANDLER" environment variable is present and active by opening the Command Prompt and entering:

 

echo %FUSION\_EXCEPTION\_HANDLER%

 

The result should be:

true

![][image7-5]

Step 5 Now when you start up Fusion Studio, if the program crashes a crash dump report is generated on the Windows platform, and is written automatically to the %temp% folder. This path is represented on disk as:

 

C:\\Users\\\<User Account\>\\AppData\\Local\\Temp

  

The following Fusion crash dump report files are written to disk each time:

"**crash.dmp**"

"**crash.log**"

"**crashdump\_x64\_YYYY-MM-DD\_HH-MM-SS.zip**"

 

The last crash log has the date and time code is expanded as a filename like this:

"**crashdump\_x64\_2020-07-11\_18-45-10.zip**"

 

![][image1-5]

Step 6. Do **\*\*\*NOT\*\*\*** submit these undocumented Fusion API based crash reports to BMD. They would arrive at a currently-unmonitored development email address.

Generating a Crash State in Fusion

 

When a crash state happens in Fusion, with the undocumented environment variable active, a crash dump log is saved to disk.

 

These log files are special in that it saves all of the required debugging information, from the current Fusion artists session to disk, along with a full memory dump that allows a programmer to find out the source cause of the Fusion program freeze up.

Forcing a crash log from Fusion Console:

 

Step 7. You can also use the Fusion Console window and run the following Lua command if the Fusion left or right viewer windows fail to update your 3D or 2D view contexts... but the rest of the Fusion program still functions:

 

**fu:Crash()**

![][image3-4]

 

Step 8. In the crash dialog **ALWAYS** select the "No" option. Never EVER select the "Yes" option or your crash log will end up in a Fusion developer's email inbox.... 🙄

 

![][image6-5]

Forcing a crash log from the Command Prompt Window:

Step 9. If the Fusion UI is locked and unresponsive it is also possible to use Fusion's CLI (command-line) interface to force a crash state and a log file to be written to disk.

 

First navigate in the command prompt window into the Fusion Studio folder using this folder:

 

**cd "C:\\Program Files\\Blackmagic Design\\Fusion 18\\"**

Step 10. Then look in the Task Manager to find the Fusion Studio Process ID(PID) aka "Process number" code.

Finally, using FuScript, (the Fusion scripting API that runs inside the Command Prompt window), you can dump the active Fusion GUI process state using:

 

**FuScript.exe -d \<process num\>**



# YouTube 360 to Equirectangular Conversions

KartaVR has several different workflow paths that can be used to convert panoramic image projections. This guide will cover a technique called a "MeshUV" based conversion that relies on a Wavefront ".obj" based polygon mesh and UV layout to define the image projection transform.

Optionally you could use a YouTube 360 monoscopic 2D centric "direct" image projection conversion macro called "[YouTubeCubemap3x22Equirectangular](https://www.andrewhazelden.com/projects/kartavr/docs/macros-guide-conversions.html#YouTubeCubemap3x22Equirectangular)" if you want to avoid using a MeshUV approach.

Also, it's worth mentioning that KartaVR supports "MacroLUTs" that can be loaded into the Fusion Standalone "LUTs" viewer window control. These specialized LUTs provide an interactive preview of the image projection conversion on any media loaded into that viewer window context on-the-fly. For more information about LUT based approaches, check out the [KartaVR MacroLUTs documentation](https://www.andrewhazelden.com/projects/kartavr/docs/luts.html).

![][image3-5]

YouTube 360 Image Projections

When you use a video downloading tool to save a local copy of a YouTube 360 video, you will likely come across a video file that is stored in one of the following "cubic view" based image projection layouts. KartaVR can be used to translate these cubic image projections back into an equirectangular format.

YouTube 3x2 Cubic Face Layout - Monoscopic 2D

(Macros:/KartaVR/Images/youtube\_cubemap3x2.jpg)

![][image22-7]

YouTube 2x3 Cubic Face Layout - Stereo 3D Side By Side

(Macros:/KartaVR/Images/youtube\_cubemap2x3.jpg)

![][image21-3]

KartaVR Conversion OBJ Meshes

KartaVR includes two MeshUV centric conversion meshes. These polygon models can be loaded into your Fusion composite using the "FBX File" control on the "[MeshUV2Equirectangular](https://www.andrewhazelden.com/projects/kartavr/docs/macros-guide-conversions.html#MeshUV2Equirectangular)" and "[MeshUV2EquirectangularStereo](https://www.andrewhazelden.com/projects/kartavr/docs/macros-guide-conversions.html#MeshUV2EquirectangularStereo)" macros.

The OBJ meshes are located on disk using the following Fusion based PathMap:

* Macros:/KartaVR/Images/youtube\_cubemap2x3.obj
* Macros:/KartaVR/Images/youtube\_cubemap3x2.obj

KartaVR Built-In Example Comps

The following three example comps show a few different ways to rework panoramic imagery. These comps are located inside the "Reactor:\\Deploy\\Comps\\KartaVR" PathMap based folder:

* [MeshUV Conversions.comp](https://www.andrewhazelden.com/projects/kartavr/docs/examples.html#meshuv-conversions)
* YouTube Cubemap3x2.comp
* YouTube180 Conversions.comp

Macro Documentation

* [MeshUV2Equirectangular](https://www.andrewhazelden.com/projects/kartavr/docs/macros-guide-conversions.html#MeshUV2Equirectangular)
* [MeshUV2EquirectangularStereo](https://www.andrewhazelden.com/projects/kartavr/docs/macros-guide-conversions.html#MeshUV2EquirectangularStereo)
* [YouTubeCubemap3x22CubicFaces](https://www.andrewhazelden.com/projects/kartavr/docs/macros-guide-conversions.html#YouTubeCubemap3x22CubicFaces)
* [YouTubeCubemap3x22Equirectangular](https://www.andrewhazelden.com/projects/kartavr/docs/macros-guide-conversions.html#YouTubeCubemap3x22Equirectangular)

MeshUV2Equirectangular Macro Usage

Note: This macro node expects you to link in an OBJ or FBX formatted polygon mesh using the "FBX File" control in the Inspector view.

**Step 1.** Create a new Fusion composite.

![][image20-5]

**Step 2.** Add a YouTube 360 downloaded video file to your Fusion composite using either a *Loader* Node (in Fusion Studio), or a *MediaIn* node (in Resolve's Fusion Page). 

![][image12-4]


**Sample Media**

KartaVR provides a YouTube 360 "Monoscopic 2D" based still image that you can use to test the image projection conversion process out. You can paste in the following KartaVR PathMap based file path into a Loader node's *Filename* control:

Macros:/KartaVR/Images/youtube\_cubemap3x2.jpg

![][image16-4]

When you view this node's output in the left viewer window you will see the following output that has an arrangement of 3 horizontal cubemap faces by two vertical cubemap faces. This is often shortened down to being called a *3x2* (three by two) cubic face layout. The cubic faces are laid out in the order of Left, Front, Right, Bottom, Back, Top.

![][image22-8]

**Step 3.** With the Fusion Nodes view active in the foreground, press the "Shift + Space" hotkey on your keyboard.

![][image14-4]

This hotkey will display the "Select Tool" dialog that is used to quickly add nodes to your composite. Start typing the words "[MeshUV2Equirectangular](https://www.andrewhazelden.com/projects/kartavr/docs/macros-guide-conversions.html#MeshUV2Equirectangular)" into the Select Tool dialog until the macro is selected in the list. Then press the "Add" button. 

At this point, a new node has been added to the Fusion composite. 

A file browsing window will appear automatically as soon as a new "[MeshUV2Equirectangular](https://www.andrewhazelden.com/projects/kartavr/docs/macros-guide-conversions.html#MeshUV2Equirectangular)" node is placed in the comp. This dialog is used to select the mesh that will be used for the conversion. The OBJ or FBX formatted polygon model you select will then be entered in the "FBX File" control in the Inspector view.

Let's select the "youtube\_cubemap3x2.obj" mesh file in this folder. This mesh is used for monoscopic 2D footage saved from YouTube 360.

![][image13-4]

You can manually browse to the folder that holds the KartaVR sample images and MeshUV models by navigating to the following Pathmap folder:

Macros:/KartaVR/Images/

That PathMap folder location translates automatically into the following absolute filepath based locations on your system:

(Note: The C:\\ProgramData\\ folder might be set to be invisible on a default Windows OS install. That setting can be adjusted in the Explorer window's properties in the ribbon toolbar.)

Fusion Standalone Paths

Windows Reactor Path:

C:\\ProgramData\\Blackmagic Design\\Fusion\\Reactor\\Deploy\\Macros\\KartaVR\\Images\\

Mac Reactor Path:

/Library/Application Support/Blackmagic Design/Fusion/Reactor/Deploy/Macros/KartaVR/Images/

Linux Reactor Path:

/var/BlackmagicDesign/Fusion/Reactor/Deploy/Macros/KartaVR/Images/

Resolve Paths

Windows Reactor Path:

C:\\ProgramData\\Blackmagic Design\\DaVinci Resolve\\Fusion\\Reactor\\Deploy\\Macros\\KartaVR\\Images\\

Mac Reactor Path:

/Library/Application Support/Blackmagic Design/DaVinci Resolve/Fusion/Reactor/Deploy/Macros/KartaVR/Images/

Linux Reactor Path:

/var/BlackmagicDesign/DaVinci Resolve/Fusion/Reactor/Deploy/Macros/KartaVR/Images/

If you click on the "[MeshUV2Equirectangular](https://www.andrewhazelden.com/projects/kartavr/docs/macros-guide-conversions.html#MeshUV2Equirectangular)" node and load its controls in the Inspector view the controls should look like this:

![][image18-5]

**Step 4.** In the Fusion Nodes view you need to connect your YouTube 360 footage's *MediaIn*/*Loader* node output connection to the "[MeshUV2Equirectangular](https://www.andrewhazelden.com/projects/kartavr/docs/macros-guide-conversions.html#MeshUV2Equirectangular)" node's input connection.

![][image1-6]

This node connection allows the RGBA image data from the *MediaIn*/*Loader* node to flow into the "[MeshUV2Equirectangular](https://www.andrewhazelden.com/projects/kartavr/docs/macros-guide-conversions.html#MeshUV2Equirectangular)" node.

Now we can view the output from the "[MeshUV2Equirectangular](https://www.andrewhazelden.com/projects/kartavr/docs/macros-guide-conversions.html#MeshUV2Equirectangular)" node on the right viewer window. 

Looking at the screenshot below we can see how the YouTube 3x2 cubic face media was loaded into Fusion, the media was then reformatted into an Equirectangular format, and the result was then displayed on the right viewer window.

![][image6-6]

**Step 5.** You can render this footage back to an image sequence or movie file on disk using either a MediaOut node (in Resolve), or a Saver node (in Fusion Standalone).

![][image8-4]

![][image4-5]

MeshUV2EquirectangularStereo Macro Usage

A stereoscopic 3D based MeshUV conversion node is available in KartaVR and it is called [MeshUV2EquirectangularStereo](https://www.andrewhazelden.com/projects/kartavr/docs/macros-guide-conversions.html#MeshUV2EquirectangularStereo). The macro node can be used to convert YouTube 360 footage that is stereoscopic 3D into an Equirectangular Over-Under or Side-By-Side Stereoscopic 3D format.

This node also uses an FBX or OBJ formatted mesh to control the panoramic image conversion via the "FBX File" control in the inspector window just like the previous "[MeshUV2Equirectangular](https://www.andrewhazelden.com/projects/kartavr/docs/macros-guide-conversions.html#MeshUV2Equirectangular)" node.

**Step 1.** Create a new Fusion composite.

![][image20-6]

**Step 2.** Add a YouTube 360 Stereoscopic 3D downloaded video file to your Fusion composite using either a *Loader* Node (in Fusion Studio), or a *MediaIn* node (in Resolve's Fusion Page). 

![][image7-6]

**Sample Media**

KartaVR provides a YouTube 360 "Stereoscopic 3D" based still image that you can use to test the image projection conversion process out. You can paste in the following KartaVR PathMap based file path into a Loader node's *Filename* control:

Macros:/KartaVR/Images/KartaVR/Images/youtube\_cubemap2x3\_stereo.jpg

![][image9-4]

When you view this node's output in the left viewer window you will see the following output that has a Side-By-Side stereoscopic 3D frame arrangement of 2 horizontal cubemap faces by three vertical cubemap faces (per eye view).

This view layout is often shortened down to being called a *2x3* stereo SBS (two by three stereo side-by-side) cubic face layout. The cubic faces are laid out in the order of Right, Top, Front, Back, Left, Bottom.

![][image21-4]

**Step 3.** With the Fusion Nodes view active in the foreground, press the "Shift + Space" hotkey on your keyboard. 

![][image15-4]

This hotkey will display the "Select Tool" dialog that is used to quickly add nodes to your composite. Start typing the words "[MeshUV2EquirectangularStereo](https://www.andrewhazelden.com/projects/kartavr/docs/macros-guide-conversions.html#MeshUV2EquirectangularStereo)" into the Select Tool dialog until the macro is selected in the list. Then press the "Add" button. 

At this point, a new node has been added to the Fusion composite. 

A file browsing window will appear automatically as soon as a new "[MeshUV2EquirectangularStereo](https://www.andrewhazelden.com/projects/kartavr/docs/macros-guide-conversions.html#MeshUV2EquirectangularStereo)" node is placed in the comp. This dialog is used to select the mesh that will be used for the conversion. The OBJ or FBX formatted polygon model you select will then be entered in the "FBX File" control in the Inspector view.

Let's select the "youtube\_cubemap2x3.obj" mesh file in this folder. This mesh is used for stereoscopic footage saved from YouTube 360.

![][image5-6]

You can manually browse to the folder that holds the KartaVR sample images and MeshUV models by navigating to the following Pathmap folder:

Macros:/KartaVR/Images/

That PathMap folder location translates automatically into the following absolute filepath based locations on your system:

(Note: The C:\\ProgramData\\ folder might be set to be invisible on a default Windows OS install. That setting can be adjusted in the Explorer window's properties in the ribbon toolbar.)

Fusion Standalone Paths

Windows Reactor Path:

C:\\ProgramData\\Blackmagic Design\\Fusion\\Reactor\\Deploy\\Macros\\KartaVR\\Images\\

Mac Reactor Path:

/Library/Application Support/Blackmagic Design/Fusion/Reactor/Deploy/Macros/KartaVR/Images/

Linux Reactor Path:

/var/BlackmagicDesign/Fusion/Reactor/Deploy/Macros/KartaVR/Images/

Resolve Paths

Windows Reactor Path:

C:\\ProgramData\\Blackmagic Design\\DaVinci Resolve\\Fusion\\Reactor\\Deploy\\Macros\\KartaVR\\Images\\

Mac Reactor Path:

/Library/Application Support/Blackmagic Design/DaVinci Resolve/Fusion/Reactor/Deploy/Macros/KartaVR/Images/

Linux Reactor Path:

/var/BlackmagicDesign/DaVinci Resolve/Fusion/Reactor/Deploy/Macros/KartaVR/Images/

If you click on the "[MeshUV2EquirectangularStereo](https://www.andrewhazelden.com/projects/kartavr/docs/macros-guide-conversions.html#MeshUV2EquirectangularStereo)" node and load its controls in the Inspector view the controls should look like this:

![][image2-6]

**Step 4.** In the Fusion Nodes view you need to connect your YouTube 360 footage's *MediaIn*/*Loader* node output connection to the "[MeshUV2EquirectangularStereo](https://www.andrewhazelden.com/projects/kartavr/docs/macros-guide-conversions.html#MeshUV2EquirectangularStereo)" node's input connection.

![][image10-4]

This node connection allows the RGBA image data from the *MediaIn*/*Loader* node to flow into the "[MeshUV2EquirectangularStereo](https://www.andrewhazelden.com/projects/kartavr/docs/macros-guide-conversions.html#MeshUV2EquirectangularStereo)" node.

Now we can view the output from the "[MeshUV2EquirectangularStereo](https://www.andrewhazelden.com/projects/kartavr/docs/macros-guide-conversions.html#MeshUV2EquirectangularStereo)" node on the right viewer window. 

Looking at the screenshot below we can see how the YouTube 3x2 cubic face media was loaded into Fusion, the media was then reformatted into an Equirectangular format, and the result was then displayed on the right viewer window.

![][image19-4]

**Step 5.** You can render this footage back to an image sequence or movie file on disk using either a MediaOut node (in Resolve), or a Saver node (in Fusion Standalone).

![][image11-5]

![][image17-5]




Jupyter Notebook for Resolve/Fusion

Created 2022-09-14 Last Updated 2022-09-14 09.11 PM UTC -4

By [Andrew Hazelden \<andrew@andrewhazelden.com\>](mailto:andrew@andrewhazelden.com)

![][image6-7]

Overview

This guide is designed to help you set up a virtual environment to run [Jupyter Notebook](https://jupyter.org) + Resolve/Fusion.

This combination can be used to take post-production workflow automation to the next level, and allows computer vision, machine learning, data science, and other tasks to be done as part of a video creation process.

It is expected that you have Resolve Studio or Fusion Studio v18 installed, along with a 64-bit version of Python ranging from v3.6 - v3.10. On Windows, when you install Python3 x64, you need to enable the option to add Python to your System PATH environment variable.

![][image5-7]

For this WIP experiment we are importing and using the Python "imp" module to access the "Fusionscript.dll" library. In Python v3.12+ we will eventually need to switch over to using "importlib" instead of "imp" for compatibility.

As a troubleshooting step, make sure you've temporarily quit the Fusion Render Node program on your workstation. Also you need to ensure you have either Resolve Studio or Fusion Studio open but not both of them at the same time.

An important detail that you need to avoid glossing over when reading this guide is that external scripting via Python is a "paid feature" in the BMD ecosystem that requires Resolve Studio or Fusion Studio. This means you won't be able to follow along with this guide if you only have Resolve (Free) installed.

Install Python3's virtual environment library

Let's add the Python virtualenv module to our systems.

In a Terminal/Command Prompt session run:

pip3 install virtualenv

Create the JupyterFusion environment

A virtual environment lets you tinker with libraries and content without affecting the rest of your computer's settings. This is a handy feature to have access to when installing Python based modules and other resources.

We are going to create a new virtual environment called "JupyterFusion" that is placed at the root of our user account folder.

From a macOS / Linux Terminal session run:

cd $HOME/

virtualenv JupyterFusion

From a Windows Command Prompt session run:

cd %USERPROFILE%\\

virtualenv JupyterFusion

Activate the Environment

The next step in using virtual environments is to navigate to the new folder and to activate it. This will modify the currently active environment variables.

From a macOS / Linux Terminal session run:

cd $HOME/JupyterFusion/

source bin/activate

From a Windows Command Prompt session run:

cd %USERPROFILE%\\JupyterFusion\\

Scripts\\activate.bat

Install Jupyter

Now we are ready to install Jupyter Notebook in our new virtual environment.

In a Terminal/Command Prompt session run:

pip3 install jupyter

Start Jupyter Notebook

Let's start up Jupyter for the first time. Jupyter has a web-based GUI that works by running a small webserver on your local system at port 8888.

From a macOS / Linux Terminal session run:

mkdir -p $HOME/JupyterFusion/notebooks

cd $HOME/JupyterFusion/notebooks

jupyter notebook

From a Windows Command Prompt session run:

mkdir %USERPROFILE%\\JupyterFusion\\notebooks

cd %USERPROFILE%\\JupyterFusion\\notebooks

jupyter notebook

Open your local web browser to:

<http://localhost:8888/notebooks/>

To run Jupyter Notebook again:

The next time you want to access Jupyter you can type in the following syntax:

From a macOS / Linux Terminal session run:

source $HOME/JupyterFusion/bin/activate

cd $HOME/JupyterFusion/notebooks

jupyter notebook

From a Windows Command Prompt session run:

%USERPROFILE%\\JupyterFusion\\Scripts\\activate.bat

cd %USERPROFILE%\\JupyterFusion\\notebooks

jupyter notebook

Let's create a new notebook

In Jupyter Notebook's web based interface, click on the "New" button and select "Python 3 (ipykernel)". This will add a notebook we can use for Python3 scripting in Resolve/Fusion v18.

![][image9-5]

Click on the heading at the top left of the webpage labelled "Untitled".

![][image8-5]

This will display a Rename Notebook dialog that will allow us to rename the Jupyter notebook to "JupyterFusion".

![][image7-7]

Note: The toolbar pop-up menu item labelled "Code" can be changed to other options like "Markdown" to allow you to customize what can be added to the individual blocks of code.

Add the Python Code

Let's paste the following content below into the individual Jupyter Notebook cells we create.

Click in the first cell. Change the cell type from "Code" to "Markdown". Markdown is a documentation formatting system for making notes that have styled text.

![][image3-6]

Markdown Cell Content:

\# Jupyter Fusion v0.1 2022-09-12

A WIP example that shows how to connect a Jupyter Notebook session to Resolve Studio 18 or Fusion Studio 18.

\*\*Tip:\*\* If you are running Resolve Studio, make sure to quit the "Fusion Studio" and "Fusion Render Node" processes on this workstation to avoid binding to those external applications.

Now we are going to use the "Insert \> Insert Cell Below" menu item each time we add another block of Python code.

![][image1-7]

The remaining cells of text are all "code" type content.

![][image4-6]

Code Cell Content:

import sys, os

from pprint import pprint

try:

import imp

except DeprecationWarning:

\# Python 3.12+ requires the use of importlib instead of imp

;

def FuScriptLib():

lib\_path = ""

if sys.platform.startswith("darwin"):

lib\_path = "/Applications/DaVinci Resolve/DaVinci Resolve.app/Contents/Libraries/Fusion/fusionscript.so"

\#lib\_path = "/Applications/Blackmagic Fusion 18/Fusion.app/Contents/MacOS/fusionscript.so"

\#lib\_path = /Applications/Blackmagic Fusion 18 Render Node/Fusion Render Node.app/Contents/MacOS/fusionscript.so

elif sys.platform.startswith("win"):

lib\_path = "C:\\\\Program Files\\\\Blackmagic Design\\\\DaVinci Resolve\\\\fusionscript.dll"

\#lib\_path = "C:\\\\Program Files\\\\Blackmagic Design\\\\Fusion 18\\\\fusionscript.dll"

\#lib\_path = "C:\\\\Program Files\\\\Blackmagic Design\\\\Fusion Render Node 18\\\\fusionscript.dll"

elif sys.platform.startswith("linux"):

lib\_path = "/opt/resolve/libs/Fusion/fusionscript.so"

\#lib\_path = "/opt/BlackmagicDesign/Fusion18/fusionscript.so"

\#lib\_path = "/opt/BlackmagicDesign/FusionRenderNode18/fusionscript.so"

if not os.path.isfile(lib\_path):

print("\[Fusion\] \[Library Does Not Exist on Disk\]", lib\_path)

try:

bmd = imp.load\_dynamic("fusionscript", lib\_path)

except DeprecationWarning:

\# Python 3.12+ requires the use of importlib instead of imp

;

if bmd:

sys.modules\[\_\_name\_\_\] = bmd

else:

raise ImportError("\[Fusion\] Could not locate module dependencies")

return bmd

  

def Resolve():

app = FuScriptLib().scriptapp("Resolve")

return app

def Fusion():

app = FuScriptLib().scriptapp("Fusion")

return app

\# Get the Resolve and Fusion objects

\# res = Resolve()

fu = Fusion()

bmd = FuScriptLib()

if fu is not None:

\# Get the current comp object

comp = fu.GetCurrentComp()

else:

print("\[Fusion\] Please open a comp and then run this script again.")

Code Cell Content:

\# Display the fusion and comp object info

print("\\n\\n\[FusionScript\]")

pprint(bmd)

print("\\n\\n\[Fusion\]")

if fu is not None:

pprint(fu.GetAttrs())

print("\\n\\n\[Current Comp\]")

if comp is not None:

pprint(comp.GetAttrs())

else:

print("\[Fusion\] Please open a comp and then run this script again.")

Code Cell Content:

if comp is not None:

\# Stop Loader/Saver node file dialogs from showing

comp.Lock()

\# Add a node to the comp

ldr = comp.AddTool("Loader")

ldr.Clip\[1\] = "Fusion:/Brushes/smile.tga"

\# Allow Loader/Saver node file dialogs to show up again

comp.Unlock()

Code Cell Content:

if comp is not None:

\# Display the Loader node details

print(ldr.Name, "=", ldr.Clip\[1\])

\# Display the Loader node contents in the left viewer window

comp.GetPreviewList()\["LeftView"\].ViewOn(ldr, 1)

 

Let's press the "Save" button on the far left side of the Jupyter Notebook toolbar.

![][image2-7]

 

After pasting the code into the individual Jupyter Notebook cells, you will be able to run it by pressing the "Run" button in the toolbar. Each time you press the "Run" button a new block of code is highlighted and then executed. The console output results are listed below the cell. 

This is the output result I see on my macOS system:

\[FusionScript\]

\<module 'fusionscript' (/Applications/Blackmagic Fusion 18/Fusion.app/Contents/MacOS/fusionscript.so)\>


\[Fusion\]

\{'FUSIONB\_IsManager': False,

'FUSIONB\_IsRenderNode': False,

'FUSIONB\_IsResolve': False,

'FUSIONH\_CurrentComp': \<BlackmagicFusion.PyRemoteObject object at 0x111af3990\>,

'FUSIONI\_NumProcessors': 8,

'FUSIONI\_PhysicalRAMFreeMB': 5867,

'FUSIONI\_PhysicalRAMTotalMB': 16384,

'FUSIONI\_SerialHi': \<snip\>,

'FUSIONI\_SerialLo': 0,

'FUSIONI\_VersionHi': 1179648,

'FUSIONI\_VersionLo': 65543,

'FUSIONI\_VirtualRAMTotalMB': 16839,

'FUSIONI\_VirtualRAMUsedMB': 10971,

'FUSIONS\_FileName': '/Applications/Blackmagic Fusion '

'18/Fusion.app/Contents/MacOS/Fusion',

'FUSIONS\_GLDevice': 'AMD Radeon R9 M370X OpenGL Engine',

'FUSIONS\_GLVendor': 'ATI Technologies Inc.',

'FUSIONS\_GLVersion': '2.1 ATI-4.8.101',

'FUSIONS\_MachineType': 'IA32',

'FUSIONS\_Version': '18.0.1'\}


\[Current Comp\]

\{'COMPB\_HiQ': True,

'COMPB\_Locked': False,

'COMPB\_LoopPlay': True,

'COMPB\_Modified': True,

'COMPB\_MotionBlur': True,

'COMPB\_Proxy': False,

'COMPB\_Rendering': False,

'COMPH\_ActiveTool': None,

'COMPI\_RenderFlags': 131072,

'COMPI\_RenderStep': 1,

'COMPN\_AudioOffset': 0.0,

'COMPN\_AverageFrameTime': 0.0,

'COMPN\_CurrentTime': 0.0,

'COMPN\_ElapsedTime': 0.0,

'COMPN\_GlobalEnd': 1000.0,

'COMPN\_GlobalStart': 0.0,

'COMPN\_LastFrameRendered': -2000000000.0,

'COMPN\_LastFrameTime': 0.0,

'COMPN\_RenderEnd': 1000.0,

'COMPN\_RenderEndTime': 1000.0,

'COMPN\_RenderStart': 0.0,

'COMPN\_RenderStartTime': 0.0,

'COMPN\_TimeRemaining': 0.0,

'COMPS\_FileName': '',

'COMPS\_LoopMode': 'loop',

'COMPS\_Name': 'Composition1'\}


Loader1 = Fusion:/Brushes/smile.tga

After running the Notebook, your Fusion compositing session should now look like this:

![][image10-5]

At this point you will be able to start modifying the Python code in the Notebook and customizing Jupyter to run your own scripts.

Feel free to customize the "lib\_path" variable at the top of the Python code to point to the actual installed location of the fusionscript library on your computer, if required. This would be relevant if you modified the installation path for Resolve Studio or Fusion Studio.

Good Luck and Happy Coding!



**Domemaster Photoshop Actions Pack**

**Version 2.5** - Released March 16, 2017  
by Andrew Hazelden

Email: [andrew@andrewhazelden.com](mailto:andrew@andrewhazelden.com)  
Blog: <http://www.andrewhazelden.com>

GitHub Page:

* <https://github.com/AndrewHazelden/Domemaster-Photoshop-Actions-Pack>

**About the Software**

The Domemaster Photoshop Actions Pack is a collection of custom Adobe Photoshop actions that were designed to speed up the fulldome content creation workflow.

The actions provide tools for converting images from several common panoramic formats such as angular fisheye, equirectangular, and cube map panoramas, and general utilities for fulldome production.

[![DomemasterPhotoshopActionsPackOverview.png](DomemasterPhotoshopActionsPackOverview.png)](https://www.youtube.com/watch?v=VcfHzyIuR4E)

*The Domemaster Photoshop Actions Pack is distributed under the GPL v3 license.*

![][photoshop-actions-list]

**Version History**

**Version 2.5 - 2017-03-16**

* Fixed a Photoshop CS6 compatibility issue with the "2:1 Equirectangular to Domemaster 180°" action.

**Version 2.4 - 2017-01-21**

* Added support for the new Autodesk Revit Vertical Strip and Horizontal Strip panoramic image projections.
* Added a new experimental set of "UV Pass" actions allow you to prepare UV pass maps that are used for pre-computed panoramic image transforms. This approach is commonly used in compositing to correct for lens distortion.

	Another term for a UV pass map if you are a Foundry NukeX user is an "ST map". A UV pass image template is made using a 16 bit integer red/green gradient image that is then distorted using a program like PTGui Pro and the Domemaster Fusion Macros.

	Note: It is very important that you load and save a UV pass map using an sRGB linear gamma 1.0 color space in Photoshop or you will have distortions in your image template from the non-linear shading of the generated gradients.

**Version 2.3 - 2015-12-18**

* Added more sample panoramic images examples to illustrate the different image projection formats.

**Version 2.2 - 2015-11-23**

* Added a "Cube Map to Gear VR Mono" and "Gear VR Mono to Cube Map" set of actions. The "Cube Map to Gear VR Mono" action creates a 6:1 aspect ratio horizontal strip cubemap and the other action can extract that imagery back into a set of 6 cube map layers.
* Added a "Stereo Side by Side Extract" and a "Stereo Over Under Extract" macro for processing stereo imagery.
* Updated the "Cube Map to X" actions to fix an error that would happen if the File \> New... dialog had a transparent background selected, and there was no background layer present in the new document.

**Version 2.1 - 2015-11-21**

* Improved the Photoshop compatibility of the "2:1 Equirectangular to 180° Domemaster" action.

**Version 2 - 2015-11-20**

* Expanded the **General Utilities** section to include "1x1 Guide Grid", "1x2 Guide Grid", "2x1 Guide Grid", "6x2 Guide Grid", and "12x1 Guide Grid".
* Expanded the **Transforms** section to include "200% Vertical Canvas Expand", and "200% Horizontal Canvas Expand".

**Action List**

**Transforms:**

1:1 to 2:1 Aspect Ratio Expand  
2:1 to 1:1 Aspect Ratio Reduce  
50% Scale  
200% Scale  
200% Vertical Canvas Expand  
200% Horizontal Canvas Expand  
Rotate 90 Degrees  
Rotate 180 Degrees  
Rotate 270 Degrees  
Flip Vertical  
Flop Horizontal  
Horizontal Offset 1024 pixels   
Vertical Offset 1024 pixels  
Horizontal and Vertical Offset 1024 pixels

**Conversions**

Inverse Angular Fisheye  
Angular Fisheye to Equirectangular  
Angular Fisheye to 2:1 Equirectangular  
180° Domemaster to 2:1 Equirectangular  
Equirectangular to Angular Fisheye  
2:1 Equirectangular to Angular Fisheye  
2:1 Equirectangular to 180° Domemaster   
3x2 Cube Map to Cube Map  
Vertical Cross to Cube Map  
Horizontal Cross to Cube Map  
Vertical Tee to Cube Map  
Horizontal Tee to Cube Map  
Vertical Strip to Cube Map  
Horizontal Strip to Cube Map  
Mental Ray Horizontal Strip to Cube Map  
Gear VR Mono to Cube Map  
Revit Horizontal Strip to Cube Map  
Revit Horizontal Strip Stereo to Cube Map Stereo  
Revit Vertical Strip to Cube Map  
Cube Map to 3x2 Cube Map   
Cube Map to Vertical Cross  
Cube Map to Horizontal Cross  
Cube Map to Vertical Tee  
Cube Map to Horizontal Tee  
Cube Map to Vertical Strip  
Cube Map to Horizontal Strip  
Cube Map to Mental Ray Horizontal Strip  
Cube Map to Revit Horizontal Strip  
Cube Map to Revit Vertical Strip  
Cube Map to Gear VR Mono  
Cube Map to New Cube Map  
Cube Map Rotate X:+90 Degrees  
Cube Map Rotate Y:+90 Degrees  
Cube Map Rotate Z:+90 Degrees  
Stereo Side by Side Extract  
Stereo Over Under Extract

**Masking and Selection:**

Crop to Selection  
Select All  
Save Selection  
Load Selection  
Color Range Selection  
Inside Circular 50% Mask  
Outside Circular 50% Mask  
Fisheye Alpha Channel  
Fisheye Layer Mask  
Layer Mask from Selection  
Layer Mask from Inverse Selection  
Enable Layer Mask  
Disable Layer Mask  
Delete Layer Mask  
Black Matting BG

**General Utilities:**

1x1 Guide Grid  
1x2 Guide Grid  
1x6 Guide Grid  
2x1 Guide Grid  
2x2 Guide Grid  
3x2 Guide Grid  
3x4 Guide Grid  
4x3 Guide Grid  
4x4 Guide Grid  
6x1 Guide Grid  
6x2 Guide Grid  
12x1 Guide Grid  
Clear Guides  
Invert Colors  
Background to Layer  
Merge Visible  
Flatten Image

**UV Pass**

UV Rectangle Gradient Landscape Layout  
UV Rectangle Gradient Portrait Layout  
UV Equirectangular to Angular Gradient  
UV Equirectangular to Domemaster Gradient  
Horizontal Offset 960px  
Vertical Offset 960px  
Rotate 90 Degrees  
Rotate 180 Degrees  
Rotate 270 Degrees  
Flip Vertical  
Flop Horizontal  
Gamma 2.2 to 1.0 Repair  
Gamma 1.0 to 2.2 Repair

**Installation Instructions**

The Domemaster Photoshop Actions Pack is compatible with Photoshop CS3 to CC on both macOS and Windows.

**Step 1. Open the Actions Tab**

Start by opening Adobe Photoshop. Navigate to the "Window" menu, and select the "Actions" menu item.

![][1install-window-actions-menu-item]

**Step 2. Load the actions.**

Click on the Actions tab pop-up menu located at the top right of the actions tab.

Select the "Load Actions" menu item.

![][2load-actions-menu-item]

In the Load dialogue window select the action files "Conversions.atn", "General Utilties.atn", "Masking and Selection.atn", "Transforms.atn", and "UV Pass.atn".

Click the Load button to open the action files.

![][3load-actions-dialogue]

The Domemaster Photoshop Actions Pack files will be loaded into the Actions Tab.

![][4actions-loaded]

**Step 3. Switch to Button Mode**

If you want to make it easier to run the actions you can switch the Actions tab to "Button Mode". This will make each action item a clickable button.

Click on the Actions tab pop-up menu located at the top right of the actions tab.

Select the first item in the menu labeled "Button Mode". Your view will switch from a long list into a colorful grid of labeled buttons.

![][5switch-to-button-mode]

To make it easier to find things, the actions groups are color coded:

The "Conversions" actions are blue.

The "General Utilities" actions are violet.

The "Masking and Selection" actions are green.

The "Transforms" actions are yellow.

The "UV Pass" actions are red.

**Tool Descriptions**

Transforms

**1:1 to 2:1 Aspect Ratio Expand**

This action will convert a 1:1 square aspect ratio image into a 2:1 aspect ratio image by scaling the document 200% larger horizontally.

**2:1 to 1:1 Aspect Ratio Reduce**

This action will convert a 2:1 square aspect ratio image into a 1:1 aspect ratio image by scaling the document 50% smaller horizontally.

**50% Scale**

This action will scale the image 50% smaller using bicubic interpolation.

**200% Scale**

This action will scale the image 200% larger using bicubic interpolation.

**200% Vertical Canvas Expand**

This action will double the height of the image which is helpful for preparing over under format stereo images. A guide line is added at the edge of the expanded area which makes snapping easier.

**200% Horizontal Canvas Expand**

This action will double the width of the image which is helpful for preparing side by side format stereo images. A guide line is added at the edge of the expanded area which makes snapping easier.

**Rotate 90 Degrees**

This action will rotate the Photoshop document by 90 degrees. This is useful for changing the orientation of the angular fisheye and equirectangular images prior to the conversion.

![][Rotate-90-Degrees-Action]

![][Rotate-90-Degrees-Action2]

**Rotate 180 Degrees**

This action will rotate the Photoshop document by 180 degrees. This is useful for changing the up orientation of the angular fisheye and equirectangular images prior to the conversion.

![][Rotate-180-Degrees-Action]

![][Rotate-180-Degrees-Action2]

**Rotate 270 Degrees**

This action will rotate the Photoshop document by 270 degrees. This is useful for changing the up orientation of the angular fisheye and equirectangular images prior to the conversion.

**Flip Vertical**

This flips the image upside down.

**Flop Horizontal**

This flops the image left and right.

**Horizontal Offset 1024 Pixels**

This action slides the image 1024 pixels to the right and wraps the right side of the image around to the left side.

This is useful for changing the content in the center of an equirectangular image. This is also useful for fixing image seams and preparing tiling textures

![][Horizontal-Offset-1024-Pixels-Action]

![][Horizontal-Offset-1024-Pixels-Action2]

**Vertical Offset 1024 Pixels**

This action slides the image upwards by 1024 pixels and wraps the top side of the image around to the bottom side. This is useful for fixing image seams and preparing tiling textures.

![][Vertical-Offset-1024-Pixels-Action]

![][Vertical-Offset-1024-Pixels-Action2]

**Horizontal and Vertical Offset 1024 Pixels**

This action slides the image upwards and to the right by 1024 pixels and wraps the top and right side of the image around to the bottom side. This is useful for fixing image seams and preparing tiling textures.

If you are running this action on a 2K square resolution image it will shift the seams on an image's border to the center of the document. After you have finished your cloning or touch-up work you can run the action a 2nd time so the image border will be reset to its original position.

On a 4K square or 8K square resolution image you will need to run the action multiple time until the seam is shifted into the center of the document.

![][Horizontal-and-Vertical-Offset-1024-Pixels]

Conversions

**Inverse Angular Fisheye**

This action will allow you to inverse an angular fisheye image. This is the effect "rolling" the inside of the fisheye image to the outside of the frame. This effect works best with a 360° degree fisheye image.

The action can be used to quickly turn a regular angular fisheye image into a "tiny planet" style image.

The inverted fisheye effect is achieved by taking your angular fisheye image and doing a polar to rectangular conversion. Then the action rotates the image 180 degrees. The final step is to convert the image from rectangular coordinates back into polar coordinates.

The latest version of Photoshop CC (14.2.1+) has added support for 16-bit per channel and 32-bit per channel imagery in the Polar Coordinates filter. If you are using an older version of Photoshop, the action will not work on 16-bit per channel and 32-bit per channel images due to limitations in Photoshop's "Polar to Rectangular" image filter.

*Note:* It is also possible to use the "Inverse Angular Fisheye" action a 2nd time to convert a "tiny planet" image back into a normal fisheye image.

![][Inverse-Angular-Fisheye]

**Angular Fisheye to Equirectangular**

This action converts a full frame fisheye image into a 360° x 180° spherical panorama with a ratio of 1:1. This means a fulldome image with a 2048x2048 resolution will be converted to a 2048x2048 resolution lat/long image. This is done with the help of the Photoshop polar to rectangular coordinates filter.

This action can also be used on individual alpha channels by selecting the alpha channel in the Channels tab and then clicking the button for the action.

The latest version of Photoshop CC (14.2.1+) has added support for 16-bit per channel and 32-bit per channel imagery in the Polar Coordinates filter. If you are using an older version of Photoshop, the action will not work on 16-bit per channel and 32-bit per channel images due to limitations in Photoshop's "Polar to Rectangular" image filter.

Tip: If you see a visible seam artifact at the 0° mark after converting to/from an angular fisheye format you can try flattening the image before performing the conversions.

![][Angular-Fisheye-to-Equirectangular-Action]

**Angular Fisheye to 2:1 Equirectangular**

This action converts a full frame fisheye image into a 360° x 180° spherical panorama with a ratio of 2:1. This means a fulldome image with a 2048x2048 resolution will be converted to a 4096x2048 resolution lat/long image. This is done with the help of the Photoshop polar to rectangular coordinates filter.

This action can also be used on individual alpha channels by selecting the alpha channel in the Channels tab and then clicking the button for the action.

The latest version of Photoshop CC (14.2.1+) has added support for 16-bit per channel and 32-bit per channel imagery in the Polar Coordinates filter. If you are using an older version of Photoshop, the action will not work on 16-bit per channel and 32-bit per channel images due to limitations in Photoshop's "Polar to Rectangular" image filter.

Tip: If you see a visible seam artifact at the 0° mark after converting to/from an angular fisheye format you can try flattening the image before performing the conversions.

![][Angular-Fisheye-to-2to1-Equirectangular-Action]

**180° Domemaster to 2:1 Equirectangular**

This action converts a 180° Domemaster angular fisheye image into a 360° x 180° spherical panorama with a ratio of 2:1.

Since a domemaster frame only has a vertical coverage area of 90 degrees when converted into a spherical format, this image will have the bottom / empty half of the spherical frame filled with a black background color.

![][180-Domemaster-to-2to1-Equirectangular-Action]

**Equirectangular to Angular Fisheye**

This action converts a 360° x 180° spherical panorama into a full frame fisheye image. This means a lat/long image with a 1:1 aspect ratio like 2048x2048 pixels will be converted to a 2048x2048 angular fisheye image. This is done with the help of the Photoshop rectangular to polar coordinates filter.

This action can also be used on individual alpha channels by selecting the alpha channel in the Channels tab and then clicking the button for the action.

The latest version of Photoshop CC (14.2.1+) has added support for 16-bit per channel and 32-bit per channel imagery in the Polar Coordinates filter. If you are using an older version of Photoshop, the action will not work on 16-bit per channel and 32-bit per channel images due to limitations in Photoshop's "Polar to Rectangular" image filter.

Tip: If you see a visible seam artifact at the 0° mark after converting to/from an angular fisheye format you can try flattening the image before performing the conversions.

![][Equirectangular-to-Angular-Fisheye-Action]

**2:1 Equirectangular to Angular Fisheye**

This action converts a 360° x 180° spherical panorama into a full frame fisheye image. This means a lat/long image with a 2:1 aspect ratio like 4096x2048 pixels will be converted to a 2048x2048 angular fisheye image. This is done with the help of the Photoshop rectangular to polar coordinates filter.

This action can also be used on individual alpha channels by selecting the alpha channel in the Channels tab and then clicking the button for the action.

The latest version of Photoshop CC (14.2.1+) has added support for 16-bit per channel and 32-bit per channel imagery in the Polar Coordinates filter. If you are using an older version of Photoshop, the action will not work on 16-bit per channel and 32-bit per channel images due to limitations in Photoshop's "Polar to Rectangular" image filter.

Tip: If you see a visible seam artifact at the 0° mark after converting to/from an angular fisheye format you can try flattening the image before performing the conversions.

![][Equirectangular-to-Angular-Fisheye-Action-1]

**2:1 Equirectangular to 180° Domemaster**

This action converts a 360° x 180° spherical panorama into a 180° domemaster formatted angular fisheye image. This means a lat/long image with a 2:1 aspect ratio will be converted to a domemaster formatted image with a black circular fisheye mask applied around the frame.

This is done with the help of the Photoshop rectangular to polar coordinates filter.

![][2to1-Equirectangular-to-180-Domemaster-Action]

**3x2 Cube Map to Cube Map**

This converts a 3x2 cube map format image into the cubic layer map panorama format.

The converted cubic map faces are named:

| front |
| :----- |
| right |
| back |
| left |
| top |
| bottom |

![][3x2-cubemap-action]

**Vertical Cross to Cube Map**

This converts a vertical cross format panorama into the cubic map panorama format.

The converted cubic map faces are named:

| front |
| :----- |
| right |
| back |
| left |
| top |
| bottom |

![][vertical-cross-cubemap-action]

**Horizontal Cross to Cube Map**

This converts a horizontal cross format panorama into the cubic map panorama format.

The converted cubic map faces are named:

| front |
| :----- |
| right |
| back |
| left |
| top |
| bottom |

![][horizontal-cross-cubemap-action]

**Vertical Tee to Cube Map**

This converts a vertical tee format panorama into the cubic map panorama format.

The converted cubic map faces are named:

| front |
| :----- |
| right |
| back |
| left |
| top |
| bottom |

![][vertical-tee-cubemap-action]

**Horizontal Tee to Cube Map**

This converts a horizontal tee format panorama into the cubic map panorama format.

The converted cubic map faces are named:

| front |
| :----- |
| right |
| back |
| left |
| top |
| bottom |

![][horizontal-tee-cubemap-action]

**Vertical Strip to Cube Map**

This converts a vertical strip format panorama into the cubic map panorama format.

The input image is expected to be in a aspect 1:6 ratio. If the input image is 1024x6,144 pixel image the output will be a 1024x1024 pixel layered Photoshop image.

The converted cubic map faces are named:

| front |
| :----- |
| right |
| back |
| left |
| top |
| bottom |

![][vertical-strip-cubemap-action]

**Horizontal Strip to Cube Map**

This converts a horizontal strip format panorama into the cubic map panorama format.

The input image is expected to be in a aspect 6:1 ratio. If the input image is 6,144x1024 pixel image the output will be a 1024x1024 pixel layered Photoshop image.

The converted cubic map faces are named:

| front |
| :----- |
| right |
| back |
| left |
| top |
| bottom |

![][horizontal-strip-cubemap-action]

**Mental Ray Horizontal Strip to Cube Map**

This converts a mental ray mib\_lookup\_cube1 horizontal strip format panorama into the cubic map panorama format.

The input image is expected to be in a aspect 6:1 ratio in the mental ray cubic frame layout. If the input image is 6,144x1024 pixel image the output will be a 1024x1024 pixel layered Photoshop image.

The input image is in the mental ray mib\_lookup\_cube1 horizontal strip image format:

| left |
| :----- |
| right |
| bottom |
| top (flipped vertically) |
| back |
| front |

The output from this action is a layered Photoshop document with cubic faces named:

| front |
| :----- |
| right |
| back |
| left |
| top |
| bottom |

![][mr-horizontal-strip-to-cubemap-action]

**Gear VR Mono to Cube Map**

This converts a Gear VR / Octange Render monoscopic horizontal strip format panorama into the cubic map panorama format.

The input image is expected to be in a aspect 6:1 ratio. If the input image is 6,144x1024 pixel image the output will be a 1024x1024 pixel layered Photoshop image.

The converted cubic map faces are named:

| front |
| :----- |
| right |
| back |
| left |
| top |
| bottom |

![][gearvr-horizontal-strip-to-cubemap-action]

**Revit Vertical Strip to Cube Map**

This converts an Autodesk Revit cloud rendered vertical strip format panorama into the cubic map panorama format.

The input image is expected to be in a aspect 1:6 ratio. If the input image is 1536x9216 pixel image the output will be a 1536x1536 pixel layered Photoshop image.

The converted cubic map faces are named:

| right |
| :----- |
| left |
| top |
| bottom |
| back |
| front |

**Revit Horizontal Strip to Cube Map**

This converts an Autodesk Revit cloud rendered horizontal strip format panorama into the cubic map panorama format.

The input image is expected to be in a aspect 6:1 ratio. If the input image is 9216x1536 pixel image the output will be a 1536x1536 pixel layered Photoshop image.

The converted cubic map faces are named:

| front |
| :----- |
| right |
| back |
| left |
| bottom (rotate 90° CCW) |
| top (rotate -90° CW) |

**Revit Horizontal Strip Stereo to Cube Map Stereo**

This converts an Autodesk Revit cloud rendered stereoscopic 3D horizontal strip format panorama into a pair of left and right view cubic map panoramas.

The input image is expected to be in an over/under stereo Revit Horizontal Strip panoramic format. For the over/under stereo image layout the right view is placed ontop of the left view.

If the input image is 9216x3072 pixel image the output will be two 1536x1536 pixel layered Photoshop images.

Note: If you want to apply an additional image editing panoramic transform like a "Cube Map to Horizontal Cross" action to the left and right camera cube map documents, you need to drag the active image's filename tab in Photoshop to the farthest to the right side of the open document tabs.

The converted cubic map faces are named:

| front |
| :----- |
| right |
| back |
| left |
| bottom (rotate 90° CCW) |
| top (rotate -90° CW) |

**Cube Map to 3x2 Cube Map**

This converts a cube map format image into the 3x2 panorama format.

![][cubemap-3x2-cube-action]

**Cube Map to Vertical Cross**

This converts a cube map format image into the vertical cross panorama format.

The converted vertical cross faces are located in the format:

| blank | top | blank |
| :----- | :----- | :----- |
| left | front | right |
| blank | bottom | blank |
| blank | back (rotated 180°) | blank |

![][cubemap-vertical-cross-action]

**Cube Map to Horizontal Cross**

This converts a cube map format image into the horizontal cross panorama format.

The converted horizontal cross faces are located in the format:

| blank | top | blank | blank |
| :----- | :----- | :----- | :----- |
| left | front | right | back |
| blank | bottom | blank | blank |

![][cubemap-horizontal-cross-action]

**Cube Map to Vertical Tee**

This converts a cube map format image into the vertical tee panorama format.

The converted vertical tee faces are located in the format:

| left | front | right |
| :----- | :----- | :----- |
| blank | bottom | blank |
| blank | back (rotated 180°) | blank |
| blank | top | blank |

![][cubemap-vertical-tee-action]

**Cube Map to Horizontal Tee**

This converts a cube map format image into the horizontal tee panorama format.

The converted horizontal tee faces are located in the format:

| blank | top | blank | blank |
| :----- | :----- | :----- | :----- |
| front | right | back | left |
| blank | bottom | blank | blank |

![][cubemap-horizontal-tee-action]

**Cube Map to Vertical Strip**

This converts a cube map format image into a single column panorama format.

The vertical strip faces are located in the format:

| front |
| :----- |
| right |
| back |
| left |
| top |
| bottom |

![][cubemap-vertical-strip-action]

**Cube Map to Horizontal Strip**

This converts a cube map format image into a single row panorama format.

The horizontal strip faces are located in the format:

| :----- | :----- | :----- | :----- | :----- | :----- |
| front | right | back | left | top | bottom |

![][cubemap-horizontal-strip-action]

**Cube Map to Revit Horizontal Strip**

This converts a cube map format image into a single row panorama format that is used by Autodesk Revit's cloud rendering VR Panorama products.

The Revit horizontal strip faces are located in the format:

| :----- | :----- | :----- | :----- | :----- | :----- |
| front | right | back | left | bottom (rotate 90° CCW) | top (rotate -90° CW) |

**Cube Map to Revit Vertical Strip**

This converts a cube map format image into a single column vertical panorama format that is used by Autodesk Revit's cloud rendering VR Panorama products.

The Revit vertical strip faces are located in the format:

| right |
| :----- |
| left |
| top |
| bottom |
| back |
| front |

**Cube Map to Mental Ray Horizontal Strip**

This converts a cube map format image into a single row panorama format.

This converts a layered cubic map Photoshop document into a mental ray mib\_lookup\_cube1 horizontal strip format panorama.

The input image is expected to be in a 1:1 aspect ratio. If the input image is a layered 1024x1024 pixel image the output will be a 6,144x1024 pixel image with a 6:1 aspect ratio.

The input for this action is a layered Photoshop document with cubic faces named:

| front |
| :----- |
| right |
| back |
| left |
| top |
| bottom |

The output image is in the mental ray mib\_lookup\_cube1 horizontal strip image layout with the following cubic map face order:

| left |
| :----- |
| right |
| bottom |
| top (flipped vertically) |
| back |
| front |

![][cubemap-to-mr-horizontal-strip-action]

**Cube Map to Gear VR Mono**

This converts a cube map format image into the Gear VR / Octane Render ORBX 6:1 aspect ratio horizontal strip cubic panorama format.

The converted horizontal strip faces are located in the format:

| :----- | :----- | :----- | :----- | :----- | :----- |
| Left | Right | Top (rotated 180) | Bottom (rotated 180) | Back | Front |

![][cubemap-to-gearvr-horizontal-strip-action]

**Cube Map to New Cube Map**

This action will copy the cube map "front", "right", "back", "left", "top", and "bottom" layers from your current Photoshop document into a new Photoshop document.

**Cube Map Rotate X:+90 Degrees**

This action will rotate the cube map panorama by 90 degrees on the X-axis. This has the effect of turning the front "view" upwards towards the sky.

Tip: If you want to rotate a cross style, tee style, 3x2 cubic map, or strip style pano you need to convert them to the layered "cube map" format first using the actions in the Conversions Actions tab group.

![][cubemap-rotate-x90-action]

![][cubemap-rotate-x90-layers]

**Cube Map Rotate Y:+90 Degrees**

This action will rotate the cube map panorama by 90 degrees on the Y-axis. The has the effect of turning the front "view" towards the left.

Tip: If you want to rotate a cross style, tee style, 3x2 cubic map, or strip style pano you need to convert them to the layered "cube map" format first using the actions in the Conversions Actions tab group.

![][cubemap-rotate-y90-action]

![][cubemap-rotate-y90-layers]

**Cube Map Rotate Z:+90 Degrees**

This action will rotate the cube map panorama by 90 degrees on the Z-axis. This has the effect of rotating the front "view" 90 degrees clockwise to the right.

Tip: If you want to rotate a cross style, tee style, 3x2 cubic map, or strip style pano you need to convert them to the layered "cube map" format first using the actions in the Conversions Actions tab group.

![][cubemap-rotate-z90-action]

![][cubemap-rotate-z90-layers]

**Stereo Side by Side Extract**

This action will copy the left and right stereo views out of a side by side stereo format image.

A new image will be created and then two layers will be added with the layer names of "left" and "right".

The source image should have the stereo image layout of:

| :----- | :----- |
| left | right |

**Stereo Over Under Extract**

This action will copy the left and right stereo views out of an over under stereo format image.

A new image will be created and then two layers will be added with the layer names of "left" and "right".

The source image should have the stereo image layout of:

| left |
| :----- |
| right |

Masking and Selection

**Crop to Selection**

This action will crop the Photoshop document smaller based upon the currently selected area. The crop command will reduce the image size based upon a square cropping rectangle drawn around the current selection shape.

**Select All**

This action will select all of the pixels on the current image layer.

![][Select-All-Action]

**Save Selection**

This action will save the current selection to a new alpha channel.

**Load Selection**

This action will open the "Load Selection" dialogue. You can choose to load either a layer mask, transparency channel, or an alpha channel into the current selection region.

There are several advanced options in the the "Load Selection" dialogue that will let you do differencing operations ( new, add, subtract, intersect, or invert) your current selection.

For example of you were painting a layer mask you could change your current selection region by subtracting the shape of a mask or alpha channel from another layer or image.

**Color Range Selection**

This action will load the "Color Range" dialogue. This dialogue is useful for using a color / luma keying approach to generate a new selection region.

You can preview the effects of the selection region in the dialogue or use the "Selection Preview" pop-up menu to view the results in the main Photoshop window.

**Inside Circular 50% Mask**

This action creates a circular layer mask that hides the area inside a circular region in the center of the current layer.

![][Inside-Circular-50-Percent-Mask-Action]

**Outside Circular 50% Mask**

This action creates a circular layer mask that hides the area outside a circular region in the center of the current layer.

![][Outside-Circular-50-Percent-Mask-Action]

**Fisheye Alpha Channel**

This action creates a full frame circular alpha channel.

A common use is to create a single circular alpha channel and then use the "load selection" action to repetitively make circular domemaster shaped boundary selections.

![][Fisheye-Alpha-Channel-Action]

**Fisheye Layer Mask**

This action creates a full frame circular layer mask on the currently select layer.

To use this action you must convert all flattened background layers into floating layers. You can do this using the "Background to Layer" action.

![][Fisheye-Layer-Mask-Action]

**Layer Mask From Selection**

This action applies a new raster layer mask based upon the current selection. To use this action you must remove any existing "raster" layer masks from the current layer.

Layer masks are a quick and easy way to temporarily hide content on an image layer.

![][Layer-Mask-From-Selection-Action]

![][Layer-Mask-From-Selection-Action2]

After you create a new layer mask you can edit the layer mask by opening the layers tab and clicking on the mask icon to the right of the layer icon. When the layer mask is selected you can paint the mask using the brush tool.

**Layer Mask Editing Tips**

When editing a layer mask you can paint regions of the layer visible or invisible by changing the brush color to either white or black.

You can create transparent areas on the layer by using a shade of gray as the brush color when painting the layer mask.

If you adjust the brush hardness to 100% you can paint a crisp hard-edged matte. For a nice soft matte edge set the brush hardness to a value between 0 to 80%.

You can view the contents of a single layer mask full-screen by holding down the option key on Mac OS X or the alt key on Windows, and clicking on a layer mask thumbnail image in the Layers Tab.

To exit the full-screen layer mask view you need to click back on the layer's color thumbnail image in the Layers Tab.

You can invert a layer mask by selecting the layer mask thumbnail icon and clicking the "Invert Colors" action button. This will reverse the visible and hidden areas in the layer mask.

**Layer Mask From Inverse Selection**

This action creates a new layer mask based upon inverting the current selection. To use this action you must remove any existing "raster" layer masks from the current layer.

![][Layer-Mask-From-Inverse-Selection-Action]

![][Layer-Mask-From-Inverse-Selection-Action2]

**Enable Layer Mask**

This action will enable the layer mask on the current layer. This is useful for comparing the effects of transparency on the current layer.

![][Enable-Layer-Mask-Action]

**Disable Layer Mask**

This action temporarily disables the layer mask on the current layer. This is useful for comparing the effects of transparency on the current layer.

![][Disable-Layer-Mask-Action]

**Delete Layer Mask**

This action deletes the layer mask on the current layer.

![][Delete-Layer-Mask-Action]

**Black Matting BG**

This action creates a new shape layer with a black background color.

If the current image layer is a floating layer, the black BG shape layer will be placed behind it. If the current image layer is a flattened background layer, the Black BG shape layer will be placed on top of it.

General Utilities

**1x1 Guide Grid**

This creates a guide layout that forms a basic outline of the image frame. This grid is extremely useful for making accurate selections in the image when the "Snap to Guides" command is turned on.

**1x2 Guide Grid**

This creates an over under stereo format guide grid. This grid is extremely useful for making accurate selections in the image when the "Snap to Guides" command is turned on.

**1x6 Guide Grid**

This creates a vertical strip style 1x6 alignment guide layout. This grid is extremely useful for making accurate selections in the image when the "Snap to Guides" command is turned on.

**2x1 Guide Grid**

This creates a side by side stereo format guide grid. This grid is extremely useful for making accurate selections in the image when the "Snap to Guides" command is turned on.

**2x2 Guide Grid**

This creates a 2x2 guide grid that divides the image into quarters. This grid is extremely useful for making accurate selections in the image when the "Snap to Guides" command is turned on.

**3x2 Guide Grid**

This creates a 3x2 cube map style alignment guide layout. This grid is extremely useful for making accurate selections in the image when the "Snap to Guides" command is turned on.

**3x4 Guide Grid**

This creates a vertical cross or vertical tee style 3x4 alignment guide layout. This grid is extremely useful for making accurate selections in the image when the "Snap to Guides" command is turned on.

**4x3 Guide Grid**

This creates a horizontal cross or horizontal tee style 4x3 alignment guide layout. This grid is extremely useful for making accurate selections in the image when the "Snap to Guides" command is turned on.

**4x4 Grid Guide**

This action creates a 4x4 style alignment guide layout. This grid is extremely useful for making accurate selections in the image when the "Snap to Guides" command is turned on. You can use the grid to make sure the nadir point in the fulldome image is perfect centered.

![][4-x-4-Grid-Guide-Action]

![][4-x-4-Grid-Guide-Action2]

**6x1 Guide Grid**

This creates a horizontal strip style 6x1 alignment guide layout. This grid is extremely useful for making accurate selections in the image when the "Snap to Guides" command is turned on.

**6x2 Guide Grid**

This creates a 2 image high, over under stereo format, horizontal strip style 6x1 alignment guide layout. This grid is extremely useful for making accurate selections in the image when the "Snap to Guides" command is turned on.

**12x1 Guide Grid**

This creates a side by side stereo format horizontal strip style 6x1 alignment guide layout. This grid is extremely useful for making accurate selections in the image when the "Snap to Guides" command is turned on.

**Clear Guides**

This action will remove all of the guides from the current Photoshop document.

![][Clear-Guides-Action]

**Invert Colors**

This action will invert the image colors of the currently selected layer. This action can be used on color images, layer masks, and alpha channels.

![][Invert-Colors-Action]

My favorite use of this filter is to invert a grayscale layer mask. This will reverse the visible and hidden parts of the layer mask.

This action can be used on individual alpha channels by selecting the alpha channel in the Channels tab and then clicking the button for the action. The action can also used on a layer mask by selecting the layer mask's thumbnail icon in the layers tab and then clicking the button for the action.

**Background to Layer**

This action will convert a flattened image from the background layer mode into a floating layer that supports features like layer masks.

The most common use for this action is to prepare an imported picture like a flat JPEG .jpg or Targa .tga file for custom layer masks.

![][Background-to-Layer-Action]

**Merge Visible**

This action will merge all of the visible layers into a single layer.

This action is different than the flatten image command in that it will ignore any hidden layers. You can use the merge visible command to selectively flatten layers by hiding the other layers, elements, and groups you want to keep.

This version of Merge Visible can merge a single layer and bake the layer mask and layer style effects into the final image.

**Flatten Image**

This action will merge all of the layers in the current Photoshop document. This is useful for removing transparency from an image, merging layer style effects, vector shapes, and editable text layers into a single raster image.

When an image is flattened, all of the transparent background areas in the image will be filled with a solid color.

*Note:* You really want to have saved a backup of your Photoshop document before you flatten the image because all of your layers are permanently merged into a single element!

UV Pass

The "UV Pass" actions allow you to prepare UV pass maps that are used for pre-computed panoramic image transforms. This approach is commonly used in compositing to correct for lens distortion. Another term for a UV pass map if you are a Foundry NukeX user is an "ST map".

A UV pass image template is made using a 16 bit integer red/green gradient image that is then distorted using a program like PTGui Pro and KartaVR.

Note: It is very important that you load and save a UV pass map using an sRGB linear gamma 1.0 color space in Photoshop or you will have distortions in your image template from the non-linear shading of the generated gradients.

**OpenDisplayXR VDD (Virtual Device Driver)**

*"A Simulated OpenVR/OpenXR-Based Virtual Hardware Device"*

First Draft

Created: 2022-12-02 Last Updated 2022-12-08 12:10 PM (UTC -4)

Project Objectives

Create a working group to develop a cross-platform compatible, hybrid [OpenVR](https://en.wikipedia.org/wiki/OpenVR)/[OpenXR](https://en.m.wikipedia.org/wiki/OpenXR) API-based virtual display driver solution for arbitrary multi-view display, and video projection hardware. 

When completed, the "OpenDisplayXR VDD (Virtual Device Driver)" toolset works as a simulated OpenVR/OpenXR-based virtual hardware device. 

The VDD software powers the visual output that is sent in real-time to multiple displays in parallel. The VDD SDK allows you to transform-VR optimised graphics rendering API calls into a pipeline for arbitrary multi-view stereo media creation.

The final-frame pixels can be rendered on any number of local-region hosted Amazon AWS EC2 instances, or the full process can run 100% locally on-prem with a GPU-equipped laptop, desktop, workstation, rack-mounted server, or a virtualized VIRSH/QEMU compute instance with hardware accelerated PCIe passthrough support.

The modular codebase that the OpenDisplayXR project is creating, right now, is covered by a 100% free, open-source "license mix" based Apache/NVIDIA source code license terms, based upon the individual VDD microservices you install.

A virtual device driver rendering approach allows existing [DCC](https://en.m.wikipedia.org/wiki/Content_creation) (Digital Content Creation) software, that supports conventional [VR HMDs](https://en.m.wikipedia.org/wiki/HMD) (Head Mounted Displays), to automatically work interactively with arbitrary 3rd party immersive display systems used for [stereoscopic](https://en.m.wikipedia.org/wiki/Stereoscopy), [360VR](https://en.m.wikipedia.org/wiki/VR_photography), [180VR](https://www.usa.canon.com/shop/p/rf5-2mm-f2-8-l-dual-fisheye?color=Black&type=New&cjevent=850c55ae26be11ec8103d19b0a82b82c), [iDome](http://paulbourke.net/dome/iDome/), [SfM](https://en.m.wikipedia.org/wiki/Structure_from_motion), lightfield, and [multi-view](https://en.m.wikipedia.org/wiki/3D_reconstruction) applications. 

This user-programmable image generation bridge layer offers more flexibility, that enables use cases like the ability to drive in real-time [passive 3D stereo-monitor](https://www.schneider-digital.com/de/produkte/passive-3d-stereo-monitore/#highlights) display solutions, immersive [caves](https://en.wikipedia.org/wiki/Cave_automatic_virtual_environment), [fulldome theatres](https://www.cosm.com/what-we-do/screens/), [projection mapping](https://www.barco.com/en/solutions/Projection-mapping), [virtual production LED stages](https://www.darkmatters.one) with composting-created [live-action stitched 360VR cylindrical video](https://www.youtube.com/watch?v=IAy_WXqRMX0) and [2D/2.5D/3D digital matte paintings](https://vimeo.com/71148018).

Modular VDD Microservices

A foundational, key design aspect of the "OpenDisplayXR VDD (Virtual Device Driver)" SDK rollout, is the consistent use of a [microservices architecture](https://en.wikipedia.org/wiki/Microservices). The use of microservices is applied equally to internal core operators and external user-added microservice features. All microservice plugins get bare-metal direct access to the rendering hardware and VDD-API-provided functions.

The OpenDisplayXR VDD operator nodes are designed to be chained together in novel ways by the end user. This process is streamlined, with the help of a powerful preset system, visual macro-building tools, and support for deeply nested, externally referenced flowcharts. 

When the node graph is evaluated (cooked) during real-time playback, a node-based concatenation approach is used by the VDD node's chosen [JIT](https://en.wikipedia.org/wiki/Just-in-time_compilation) (Just in Time) compiler that is designed to optimize the rendering performance. Memory management is improved by the JIT compiler's ability to dynamically flatten a series of "chained operations" at render time if the nodes have matching class types.

Background: The VDD API design choice to rely on [node-based](https://en.wikipedia.org/wiki/Node_graph_architecture) microservices comes from experiences learned during the development of the open-source Vonk Data Node project. Vonk includes 329 fuses. 

A fuse is created as a plain-text-based [LuaJIT](https://en.wikipedia.org/wiki/LuaJIT) plugin. Data nodes are interconnected in a [DAG](https://en.wikipedia.org/wiki/Directed_acyclic_graph) (Directed Acyclic Graph) like nodal environment, through the use of a wide range of node-based input and output connection data types that can be converted (and [typecasted](https://en.wikipedia.org/wiki/Type_conversion) on the fly) as needed.

Nodal Operator Types

The node-based content that defines a specific VDD setup, is exported to disk via a DOM (Document Object Model) approach into either a plain-text encoded JSON file, or a CompX-flavored OpenUSD ASCII (.usda) file.

End users can extend any of the operators available inside the micro-services architecture via the installation of plain-text-based JIT-evaluated plugins, or compiled [C++](https://en.m.wikipedia.org/wiki/C%2B%2B) based plugins. 

Full source-code access is provided for all internal VDD micro-service operators, which allows the core features to be customized and extended by the end user on an as-needed basis.

The core operator types used in a typical multi-view OpenXR-OpenVR driven VDD project include:

* HID Input
* Output Driver
* Fragment Shaders
* Data Nodes
* Scripting
* Network Transport

End users are free to implement support for new class types in their own microservice plugins. Through the use of a JIT architecture, VDD supports the creation and use of arbitrary "data node" based input and output data types on-the-fly.

Microservices Package Manager

OpenDisplayXR has a custom LuaJIT-based package manager that is under development.

To streamline deployments, the package manager will allow administrators to perform "network broadcast based" syncing of custom microservice plugins across a local subnet of GPU-based worker nodes. 

Newly added microservices that are code-signed, and approved for use by a sysadmin, will be re-initialized in only a few moments by the VDD controller process. This allows deployments to occur in a transparent "system wide" fashion that works seamlessly across a large GPU clutter that runs across several different operating systems and CPU/GPU architectures.

Microservice updates happen in a low-friction fashion, without requiring the end-user to quit a VDD integration plugin's host process, or requiring someone to re-launch a CLI worker's executable or needing a reboot of the system. This feature dramatically minimizes downtime and keeps the real-time distributed rendering system online, and ready for use in a high-availability state.

The design concepts of the VDD package manager implementation are inspired by the success of the [Steakunderwater forum](https://www.steakunderwater.com/wesuckless/viewtopic.php?f=32&t=1814) hosted Blackmagic Resolve/Fusion community project called the "[Reactor Package Manager](https://gitlab.com/WeSuckLess/Reactor)". 

Reactor uses a modular .atom formatted Lua table structure to define installation bundles that are sourced from any number of user-configured, public or private GitLab/GitHub repos, or local/NAS based disk storage location.

Build a 6DoF RT Previsualization Station

Previsualization supervisors will enjoy the way VDD assists workstation-based previsualization tasks, like time-consuming "[techviz](https://en.wikipedia.org/wiki/Previsualization)". The Viz operational steps are accelerated by an order of magnitude by OpenDisplayXR. This efficiency is achieved, in-part through the removal of disk-based intermediate video/image files, media transcoding, which has the added bonus of reducing file server I/O operations, and significantly cuts down on unnecessary network bandwidth consumption.

The VDD interface has a unique capability to dramatically simplify the process of connecting a HDR "video texture" pixel stream output, from a best-in-class NLE video timeline, or a colourist suite, directly to an external real-time 3D engine based visualisation tool. By doing this process, OpenDisplayXR supports 6DoF room-scale previsualization approaches of arbitrary image projection based media with assistance provided by a system's native OpenVR and OpenXR APIs. 

For in-office design review tasks, it is very effective to let OpenDisplayXR manage the visual image generating pipeline. A VDD can send multi-view media in a transparent fashion to large format passive stereo 3D monitoring solutions, like a [3D PluraView monitor](https://www.schneider-digital.com/de/produkte/passive-3d-stereo-monitore/). This class of passive display hardware makes it possible for 3 co-workers to wear light-weight polarizer glasses, at the same time, to collaborate and provide direct feedback on creative design or engineering tasks.

Plain-Text JSON-Based Settings

A single .json-based configuration file automatically configures all relevant parameters required to define a new hardware display product DCC integration. This makes it possible to rapidly test and iterate on new hardware setups without requiring the end user/integrator to maintain a complex build toolchain.

User Input

Optionally, any of the connected [HID](https://en.wikipedia.org/wiki/USB_human_interface_device_class) (Human Interface Devices) could be activated in the virtual device driver preferences so they are passed through the virtual VR/XR bridge interface to the host DCC package. This makes it possible for the HID hardware to appear as an emulated [VR controller](https://www.meta.com/quest/accessories/quest-touch-pro-controllers-and-charging-dock/) style of input device. 

When the alternative input device is configured as a simulated VR controller, input remapping techniques can change the nature of the input data stream, to establish constraints and range of motion limits, or to perform [3D coordinate system-based transforms](https://en.wikipedia.org/wiki/Anamorphosis) for planar 2D motion-based input devices like [graphics tablets](https://www.wacom.com/en-us) or mice.

Output Driver

An extensible "output driver" based plugin system allows live-rendered framebuffer data to pass with ultra-low latency from the virtual device driver interface into a post-processing stack that supports external libraries, and fragment shaders. 

The Output Driver is GPU accelerated via common cross-platform compatible rendering APIs ([CUDA](https://en.m.wikipedia.org/wiki/CUDA), [DirectX DXR](https://en.m.wikipedia.org/wiki/DirectX_Raytracing), [OpenCL](https://en.m.wikipedia.org/wiki/OpenCL), [Metal](https://en.m.wikipedia.org/wiki/Metal_(API)), [OpenGL](https://en.m.wikipedia.org/wiki/OpenGL)). The VRAM based framebuffer in the output driver supports layering ML ([Machine Learning](https://en.m.wikipedia.org/wiki/Machine_learning)) [neural style transfer effects](https://en.m.wikipedia.org/wiki/Neural_style_transfer), [deep dream effects](https://www.tensorflow.org/tutorials/generative/deepdream), and [Hugging Face](https://huggingface.co) transformer models.

When running at a reduced frame rate, deferred rendering of [Stable Diffusion 2.0](https://stability.ai/blog/stable-diffusion-v2-release) "img2img" generators are possible with [latent space](https://en.m.wikipedia.org/wiki/Latent_space) support, including the use of multiple [raster ](https://en.wikipedia.org/wiki/Raster_graphics)or [vector-shape](https://en.wikipedia.org/wiki/Non-uniform_rational_B-spline) based alpha masks for effects like ML-driven content-aware fill, [seamless blending](https://en.m.wikipedia.org/wiki/Enblend), and in/out painting.

An "output driver" concept enables a wide range of customer-created solutions to be achieved such as; Applying [WarpMesh](http://paulbourke.net/dome/warpingfisheye/) techniques for iDome projection, using [RTSP](https://en.wikipedia.org/wiki/Real_Time_Streaming_Protocol)/[HLS streaming video](https://en.wikipedia.org/wiki/HTTP_Live_Streaming) encoders, passing media to [NDI-based](https://en.wikipedia.org/wiki/Network_Device_Interface) IP video streaming connections, working with a frame server solution such as [Syphon](https://syphon.info/) or [Spout](https://spout.zeal.co) FFGL that utilise shared video memory techniques for [VJing](https://en.m.wikipedia.org/wiki/VJing) applications.

Temporal Feedback Loop Buffer

Customizable in-memory visual feedback loops can be used inside the VDD output driver module. This is a wonderful feature if you need to create MVS compatible "onion-skinning" animation overlays, or to generate temporally delayed fadeable motion trail "visual echos" effects with a subtractive luminance decay. A feedback loop  is also interesting when used with highly-stylized audio-reactive multi-pass image distortion effects used in immersive VJing.

The feedback system has a [FIFO](https://en.m.wikipedia.org/wiki/FIFO) 4D frame buffer duration parameter to support time-offsets. 

The multi-view VRAM stored FIFO frame buffer is also helpful when animating or retraining ML transformer models to build up the visual appearance of ML synthesized "[emergent design behaviours](https://en.m.wikipedia.org/wiki/Emergent_Design)". 

A good starting point is to try the visual feedback loop feature out, with a [ShaderToy](https://www.shadertoy.com) sourced fragment shader (like pixel sorting) applied in the VDD output driver stack.

This combination of ML and fragment shader effects will very often result in the creation of artistically unique evolving 4D pipe-dream-esque imagery.

Live 360VR Media Reframing

For in-context immersive media review tasks, such as [LED fulldome](https://en.m.wikipedia.org/wiki/MSG_Sphere_at_The_Venetian) show [QA checks](https://en.m.wikipedia.org/wiki/QA/QC), it is helpful to pass the raw multi-view media directly to the external process via shared memory, or with the use of pixel streaming to an external 360VR immersive media playback tool.

Virtual Environment Simulation

Complex "nested-visual simulation" workflows can be satisfied using the generated pixel-streaming framebuffer content as a 2D texture map that is reapplied to a mesh within a game-engine centric [virtual production LED stage](https://en.m.wikipedia.org/wiki/On-set_virtual_production) techviz toolset. The 3rd party previz/techviz tools would apply the generated pixel-streamed data on the fly to a textured "screen surface" that is part of a 1:1 3D scale model of a simulated [sound stage](https://en.m.wikipedia.org/wiki/Sound_stage)/ LED dome theatre environment.

Scripted Actions & Callback Events

[Lua scripting](https://luajit.org/luajit.html) could be used in the virtual device driver HID settings to configure and apply scripted actions or replay pre-recorded "input motion" clips that are passed through as simulated HID control input data with [absolute coordinates](https://en.wikipedia.org/wiki/Cartesian_coordinate_system) or relative coordinate system offsets. The scripted action system could be triggered by any of the mappable Aux (Auxiliary) input controls on HID devices, or via OSC ([Open Sound Control](https://en.wikipedia.org/wiki/Open_Sound_Control)) based protocol signals via tools like [TouchOSC](https://hexler.net/touchosc) or [MIDI](https://en.wikipedia.org/wiki/MIDI) hardware.

Initial R&D Team

Developers

* [Andrew Hazelden](https://www.linkedin.com/in/andrewhazelden/) ([Dover Studios](https://github.com/AndrewHazelden) and [Kartaverse](https://docs.google.com/document/d/1tewIaHZh8mWI8x5BzlpZBkF8eXhK2b_XhTWiU_93HBA/edit?usp=sharing)), Canada, Principal Researcher
* [Paul Bourke](http://www.paulbourke.net), Australia, Digital capture and processing for immersive displays

Creative

* [Antonio Victor Garcia-Serrano](https://www.linkedin.com/in/antoniovictorgarciaserrano/) ([Zakato360](https://www.zakato.com)), Spain, Creative Advisor
* [Alexandre Regeffe](https://www.linkedin.com/in/alexandreregeffe/), France, Creative Advisor
* [Frederic Fermon](https://www.linkedin.com/in/frederic-fermon-19709576/) ([CST - Commission Supérieure Technique](https://www.cst.fr)), France, Creative Advisor 
* [Hogan Burrows](https://www.linkedin.com/in/hogan-burrows-177ab821/) ([Untitled Project](https://untitledproject.sg)), Singapore, Creative Advisor
* [Jared Sandrew](https://www.imdb.com/name/nm1150826/), USA, Creative Advisor
* [Joergen Geerds](https://www.facebook.com/jgeerds) ([KonceptVR](https://www.konceptvr.com)), USA, Creative Advisor

Technical

* [Alexis Haggar ](https://www.linkedin.com/in/lexhag/)(LexhagVFX), UK, Technical Advisor
* [Alexey Bogomolov](https://www.imdb.com/name/nm11741875/?ref_=fn_al_nm_1), Technical Advisor
* [Marc-Antoine Desjardins](https://ca.linkedin.com/in/marc-antoine-desjardins-8132464), Canada, Technical Advisor
* [Peregrine Mc Cafferty](https://www.imdb.com/name/nm1657221/), UK, Technical Advisor

Fulldome

* [Allen Rose](https://www.linkedin.com/in/allen-rose/), USA, Technical Advisor
* [Dario Tiveron](https://www.fddb.org/author/dariotiveron/) ([FDDB](https://www.fddb.org)), Italy, Creative Advisor
* [Greg Downing](https://www.imdb.com/name/nm1598682/) ([Hyperacuity](https://hyperacuity.com)), USA, Creative Advisor
* Matthew Dougherty ([NOAA](http://www.noaa.gov)), USA, Lead Technical Advisor
* [Paul Mowbray](https://www.imdb.com/name/nm4638232/) ([NSC Creative](https://www.linkedin.com/company/nsc-creative/)), UK, Creative Advisor
* [Peter Morse](https://www.petermorse.com.au/about/), Tasmania, Creative Advisor

Virtual Production

* [Aurore de Blois](https://www.imdb.com/name/nm2642629/) ([Drengr Bilder](https://www.imdb.com/title/tt19622596/fullcredits/)), UK, Creative Advisor
* [Tobias Falk](https://www.linkedin.com/in/tobiasfalk/) ([Cinegrace](https://www.cinegrace.com/biography)), Sweden, Technical Advisor
* [Tomas Wall](https://www.linkedin.com/in/tomaswall/) ([Cinegrace](https://www.cinegrace.com/biography)), Sweden, Technical Advisor
* [Kino Gil](https://www.linkedin.com/in/joaquin-kino-gil-9072a67/) (Kino Digital), USA, Creative Advisor

Industry Partners

* [Josef J. Schneider](https://www.linkedin.com/company/schneider-digital-josef-j-schneider-e-k-/), ([Schneider Digital](https://www.schneider-digital.com/de/)), Germany, Display Hardware Vendor
* [Lutz Moehr](https://www.linkedin.com/in/lutz-moehr-63a41b7/), ([Schneider Digital](https://www.schneider-digital.com/de/) and [3D-CC](http://3dcc.eu/introduction.html) / DNS Consult), Germany, Consultant / Networker / Event organizer

Software Interface

The virtual device driver is bound to the external DCC package using the conventional OpenVR/OpenXR support in the host toolset.

The following screenshot shows Blackmagic Design's [Fusion Studio](https://www.blackmagicdesign.com/products/fusion/) compositing software. The "VR Headset" preference is used to define "OpenVR" as the active API. This single control is the only setting required to allow a 3rd party [OpenVR](https://partner.steamgames.com/doc/features/steamvr/openvr)/[OpenXR](https://www.openxrforum.org) virtual device driver to be enabled on the DCC package side of things.

Blackmagic Design's [DaVinci Resolve Studio](https://www.blackmagicdesign.com/products/davinciresolve/) video editing and color correction software uses the same style of HMD connectivity settings as are present in the Fusion page.

![][image3-7]![][image5-8]

Node Based Workflows

![][image1-8]

This Blackmagic Design DaVinci Resolve v18.1 Fusion page node graph shows an initial proof-of-concept "OpenDisplayXR VDD" workflow. The comp imports Kartaverse Z360 (Color + depth) equirectangular image projection media as a Fusion 3D system processed content via the Renderer3D node. The WIP logic for the OpenDisplayXR VDD node was implemented via Vonk Data Nodes, and a custom Fuse that is capable of rendering DCTL fragment shaders, and returns the output to a C++ bridge shared library implemented with LuaJIT's FFI feature.

**Demo Apps**

# NeuralFoam for SynthEyes Pro

Andersson Technologies production-proven "[SynthEyes Pro](https://www.ssontech.com/synsumm.html)" matchmoving software is now able to export directly to a NeuralFoam flavoured [OpenUSD ASCII](https://graphics.pixar.com/usd/release/usdfaq.html#so-what-file-formats-does-usd-support) (.usda) format for faster, more precise, and reliable, NeRF camera 4x4 transform matrix alignment.

This unique, SynthEyes powered, multi-view camera tracking and neural rendering based workflow allows NVIDIA InstantNGP based NeRF scenes to be created more efficiently. 

SynthEyes already has an efficient UI that provides access to manual and supervised trackers, fine-grained editing of camera paths via spline editing controls, and the ability to intuitively control the scene origin, scale, and world Up-axis coordinate system. 

![][image6-8]

SynthEyes is able to export a non-NeRF based output for use  in all common DCC programs, as well as in [NLE packages like Resolve](https://www.youtube.com/watch?v=KIBeSmKekQ0). 

The following YouTube video, by Russ Andersson, explores what is possible with [SynthEyes Pro's USD (Universal Scene Description) format capabilities.](https://youtu.be/_vHHYXptZpA) 

Exporting a NeuralFoam ready camera transform matrix from SynthEyes Pro is as easy as selecting the "File \> Export \> Virtual Production \> NeuralFoam nVP Calibrated OpenUSD" menu item. A Universal Scene Description ASCII encoded file is exported to disk with a unique "CompX" schema embedded that makes multi-view and volumetric content creation workflows friendlier.

Having both NeRF and conventional match moving/photogrammetry export paths in SynthEyes Pro allows the creation of a hybrid volumetric scene with point clouds, meshes, multi-view 3D camera locators, stand-in geometry, and 3D locators. 

A pre-existing [SynthEyes + Resolve based workflow tutorial](https://www.youtube.com/watch?v=KIBeSmKekQ0), by one of the VDD developers, is available. The video shows how quickly an aerial scene shot on a drone can be camera tracked, and then loaded directly as a node-based 3D composite in the Fusion page.

The OpenDisplayXR SDK provided sizzle scripts are installed to:

	/Applications/SynthEyes/scripts/Virtual Production/neuralfoam.szl (macOS)
	C:\Program Files\Andersson Technologies LLC\SynthEyes\scripts\Virtual Production\neuralfoam.szl (Win)

# NeuralFoam OFX Plugin

A C++ based [OFX plugin](http://openeffects.org) named "NeuralFoam Engine for Resolve" will be included with the finished OpenXR/OpenVR compatible Virtual Device Driver SDK. 

![][image2-8]

The OpenFX node is a port of the [NVIDIA InstantNGP TestBed](https://docs.google.com/document/d/1vouz5gYpIw7bUBAGfAvPNcvNQoAfY_E7BhUJOGtV2cw/edit) executable with [OpenXR SDK support ](https://github.com/KhronosGroup/OpenXR-SDK)included for direct 6DoF HMD connectivity.

Check out the guide "[Kartaverse Workflows \| Creating Volumetric NeRFs](https://docs.google.com/document/d/1vouz5gYpIw7bUBAGfAvPNcvNQoAfY_E7BhUJOGtV2cw/edit)" for more information about live-action based NeRF capture workflows, and how to build InstantNGP from source. A next-gen nVP workflow guide is available that acts as a semi-official overview of nVP concepts for LED volume creation. The document is titled "[Kartaverse Workflows \| Building an Effective nVP (Neural Virtual Production) Sound Stage](https://docs.google.com/document/d/1O2EmlJpP6y2zTzX750Ld-TxO0x9u06SfJbrr-mHs0rs/edit?usp=sharing)".

# NeuralFoam Worker CLI

Additionally, a standalone CLI launched "NeuralFoam Worker Node" will be included with the OpenDisplayXR VDD SDK when it is released.

This neural rendering client is a direct adaptation of [Thomas Müller & Alex Evans](https://github.com/NVlabs/instant-ngp/graphs/contributors)' NeRF testbed executable. The testbed code is available publicly from NVIDIA's GitHub page for InstantNGP under an [NVIDIA Source Code License](https://github.com/NVlabs/instant-ngp/blob/master/LICENSE.txt). 

The ported open-source code was redesigned by the VDD developers to better handle HPC workloads, with load balancing, task scheduling, and [XML-RPC](https://en.wikipedia.org/wiki/XML-RPC) socket support. The worker supports dynamic GPU performance tuning with support for temperature sensing, and automatic GPU fan speed control. When extreme performance is required, user-controlled tweaks can be defined for GPU parameters like core voltage (mV), core clock (MHz), memory clock (MHz), power limits, and temperature limits.

The NeuralFoam worker runs its rendering process in a 100% real-time fashion with an immediate mode UX overlay for advanced cluster rendering diagnostics. Pixel streaming techniques are used to either pass image tiles back to the "NeuralFoam Engine" controller host software package (like Resolve) where the buckets are re-assembled into a unified image, or the tiles can be batched together into larger regions, recombined, and then routed via Ethernet, NDI, or SDI, so the image data arrives at a predefined LED processor device that is connected to a specific LED panel on the LED sound stage video wall. 

The NeRF generated render bucket tasks are distributed across a GPU cluster using a form of [tile-based](https://en.wikipedia.org/wiki/Tiled_rendering) distributed rendering acceleration. The buckets are responsive and intelligent in that each render thread controls a dynamically sized multi-channel HDRI framebuffer. The pixel data is tunnelled over a conventional network using a parallel I/O approach that passes data through a series of high-speed low-latency pixel streaming connections.

The NeuralFoam Worker executable is capable of running affordably with a rack-mounted NVIDIA RTX GPU enabled server that hosts an [NVLink bridge](https://en.m.wikipedia.org/wiki/NVLink) connected pair of 3090/3090 TI graphics cards. 

A local cluster of GPU powered worker nodes are synced to a line-level accurate [genlock](https://en.m.wikipedia.org/wiki/Genlock) unit. The active Workers perform the real-time distributed rendering of large NeRF scenes with the assistance of [camera Frustum](https://en.wikipedia.org/wiki/Frustum)-defined DoD (Domain of Definition) 3D region cropping.

An OpenDisplayXR VDD hardware certified NeRF render node is useful in virtual production LED stage environments where large-scale neural radiance fields provide a compelling alternative to traditional "[machinima](https://en.m.wikipedia.org/wiki/Machinima)" style OpenGL/DirectX based graphics.

# NeRF NTB (Neural Texture Baker)

A sample NeRF-based NTB (Neural Texture Baker) tool is planned for release with the official Open DisplayXR SDK. 

[NeRF scene graphs](https://blogs.nvidia.com/blog/2022/03/25/instant-nerf-research-3d-ai/) are interesting for immersive media content creators, and [nVP](https://docs.google.com/document/d/1O2EmlJpP6y2zTzX750Ld-TxO0x9u06SfJbrr-mHs0rs/edit?usp=sharing) (Neural Virtual Production) usage, as they allow a neural encoded representation of photorealistic lighting, shading, transparency, reflections, refractions, [Beer's law colour-absorption](https://en.wikipedia.org/wiki/Beer%E2%80%93Lambert_law), [polarized lighting](https://en.wikipedia.org/wiki/Polarization_(waves)), and [SSS ](https://en.wikipedia.org/wiki/Subsurface_scattering)(Subsurface Scattering).

The NeRF NTB executable generates temporally stable animated texture maps that can be used on mesh sequence and point cloud sequence outputs. This is an excellent choice for workflows that need both NeRF flythrough renders, while also creating mobile-friendly [AR .usdz-based assets](https://developer.apple.com/augmented-reality/quick-look/) that work efficiently on iPhones and iPad tablets as well as desktop systems for use in AAA quality [USDZ](https://graphics.pixar.com/usd/release/wp_usdz.html) encoded AR/MR/XR experiences. 

The provided source code and project files for NTB performs a unique [MVS ](https://en.wikipedia.org/wiki/3D_reconstruction_from_multiple_images)(multi-view stereo) centric version of geometry-defined texture baking operations. The supported output data formats are [OpenUSD Clips](https://j-cube.jp/solutions/multiverse/docs/usage/sequenceclip.html), and [e57](http://libe57.org) sequence-based dense point clouds. 

The final baked texture maps are exported as a [multi-view](https://openexr.readthedocs.io/en/latest/MultiViewOpenEXR.html) encoded multi-part EXR image sequence with an [anisotropic filtered](https://en.wikipedia.org/wiki/Anisotropic_filtering), [MIP-Mapped](https://en.wikipedia.org/wiki/Mipmap) tiled encoding, using either None, ZIPS, or DWAA image compression. 

The NTB executable connects to an OpenDisplayXR .json preference file to access the transform matrix data for each of the multi-view definitions. These locator positions drive the positional values used for transferring NeRF shading information in a view-dependent fashion into a [PTEX](https://github.com/wdas/ptex) or [UDIM](https://learn.foundry.com/modo/901/content/help/pages/uving/udim_workflow.html)-based [UV layout](https://en.wikipedia.org/wiki/UV_mapping) on the polygon model. 

Creased Sub-D ([Catmull-Clark subdivision surfaces](https://graphics.pixar.com/library/Geri/paper.pdf)) meshes with [full-character rig skeletons](https://graphics.pixar.com/usd/dev/api/usd_skel_page_front.html) are supported correctly with the texture transfer operation, however interactive performance is reduced.

[OpenUSD variants](https://graphics.pixar.com/usd/docs/Authoring-Variants.html) allow for the use of multi-resolution [LOD](https://en.wikipedia.org/wiki/Level_of_detail_(computer_graphics)#:~:text=In%20computer%20graphics%2C%20level%20of,viewpoint%2Drelative%20speed%20or%20position.) (Level-of-Detail) sets on the imported models. The NTB texture transfer operation is effectively repeated for each LOD level present in a model and is accessed typically via [USD VariantSet](https://graphics.pixar.com/usd/release/glossary.html#usdglossary-variantset).

OpenUSD [.usdc (binary encoded) or .usda (ASCII encoded) scenes](https://graphics.pixar.com/usd/release/tut_converting_between_layer_formats.html?highlight=usda) that use [USD composition ](https://graphics.pixar.com/usd/release/glossary.html#composition)features often take advantage of [reference layers](https://graphics.pixar.com/usd/release/tut_referencing_layers.html)  and [point instances](https://github.com/PixarAnimationStudios/USD/wiki/PointInstancer-Object-Model). These scene-graph hierarchies are correctly evaluated when the texture baking occurs. Pixar's OpenUSD team provides additional information on [OpenUSD terminology](https://graphics.pixar.com/usd/release/glossary.html) which can be handy for new users.

A powerful token-based approach is offered to control the texture map output file naming syntax, and the EXR multi-part/multi-channel layer names. Per-frame-based OpenDisplayXR VDD metadata records can be encoded into each model and texture map if desired. This metadata system is compatible with node-based tools that support powerful "[data node](https://docs.google.com/document/d/1U9WfdHlE1AZHdU6_ZQCB1I2nSa5I7TyHG2vKMi2I7v8/edit)" workflows during post-production.

The content production pipeline-friendly [metadata passthrough](https://openexr.readthedocs.io/en/latest/OpenEXRCoreAPI.html?highlight=metadata) feature includes support for retaining the original VDD-captured [HID input data](https://en.wikipedia.org/wiki/USB_human_interface_device_class), a [DOM](https://en.wikipedia.org/wiki/Document_Object_Model)-encoded version of the current VDD [.json](https://en.wikipedia.org/wiki/JSON) settings and external side-car file metadata that holds values like [YAML](https://en.wikipedia.org/wiki/YAML)-encoded lens information from protocols like[ Cooke /i Technology](https://cookeoptics.com/i-technology/) lenses, or [camera tracking](http://docs.vizrt.com/tracking-hub-guide/1.0/protocol.html) information.

JSON Config File

A [JSON-based](https://en.wikipedia.org/wiki/JSON) configuration file is used to define the display parameters for the connected output video streams.

This is an early proof-of-concept JSON file to express the display device/input device centric syntax needed for a passive stereo 3D display that has three frame buffers: a left view, a centre view (monoscopic 2D), and a right eye view.

![][image4-7]




The Ultimate Guide to OpenUSD Pipeline Development


Overview

This guide is a companion resource for the OpenDisplayXR VDD (Virtual Device Driver) and Kartaverse "KartaVP" open-source immersive content production pipeline projects. 

This document explains how to approach Pixar OpenUSD asset-based best practices, and how to use those concepts to help drive large-scale nVP (Neural Virtual Production) workflows in an efficient and performant fashion.







Part 1 - Compiling your own OpenUSD Plugins

**Note:** For this post, CentOS 7.x and the YUM package manager are going to be used for all the BASH CLI (command-line) shell examples.

Compiling USD from source is the first step a TD needs to start with on the long journey towards being able to use the Fusion SDK C++ files to try and create USDC (Binary Crate)/USDA (ASCII) centric USDMesh3D and USDExporter nodes that would run inside of Fusion v16. 

![][filephp]

# It's USD Compile Time!

Before we do any compiling we need to clone a copy of the [PIXAR OpenUSD GitHub repo](https://github.com/PixarAnimationStudios/USD) and save it in our $HOME/usd/ folder.

Step 1. It helps to have a full "Gnome Desktop" based group install present on the system used to compile OpenUSD if you want to get going faster.

# YumGroupInstall.bsh

**sudo** **yum** -y groupinstall "GNOME Desktop" 

**Note:** Compiling USD on a headless computer, and running with a CentOS minimal install can be frustrating to set up as it is initially missing a lot of libraries needed to compile a functioning copy of usdview.

**Step 2.** Add the required supporting libraries to your Redhat/CentOS distro using [Yum](https://en.wikipedia.org/wiki/Yum_%28software%29):

# YumInstallPackages.bsh

\# *YUM with devel files*

**sudo** **yum install** -y alembic alembic-devel boost boost-devel boost-filesystem boost-system boost-thread **bzip2** bzip2-devel cmake curl glew glew-devel glfw glfw-devel hdf5 hdf5-devel jemalloc jemalloc-devel libpng libpng-devel libtiff libtiff-devel OpenColorIO OpenColorIO-devel OpenEXR OpenEXR-devel OpenImageIO OpenImageIO-devel PyOpenGL python-devel python-jinja2 python-pip qt-devel tbb tbb-devel **gcc** doxygen graphviz

**Step 3.** Upgrade your copy of [Python PIP](https://pypi.org/project/pip/). Then use PIP to add [PySide](https://pyside.github.io/docs/pyside/) which is required by the PIXAR usdview program's UI.

# PIPupgrade.bsh

\# *PIP*

**sudo** pip **install** --upgrade pip

**sudo** pip **install** pyside

**Step 4.** To help simplify the OpenUSD compiling process, let's define a set of environment variables that tell the compiler where to find the supporting libraries needed.

This BASH shell example assumes you also want to compile a build of the OpenUSD plugins for Maya 2019, Katana v3.2, and RenderMan 22 on your system, and that you have the shipping version of Houdini installed.

# AddEnvVars.bsh

* *Add these as temporary env vars*
**\{**
1. ALEMBIC\_INCLUDE\_DIR=**/**usr**/**include
2. ALEMBIC\_LIBRARIES=**/**usr**/**lib64**/**libAlembic.so
3. ALEMBIC\_LIBRARY\_DIR=**/**usr**/**lib64
4. BOOST\_LIBRARYDIR=**/**usr**/**lib64
5. DOXYGEN\_EXECUTABLE=**/**usr**/**bin**/**doxygen
6. DOT\_EXECUTABLE=**/**usr**/**bin**/**dot
7. EMBREE\_LIBRARY=**/**usr**/**lib64
8. EMBREE\_INCLUDE\_DIR=**/**usr**/**include
9. OIIO\_INCLUDE\_DIR=**/**usr**/**include
10. OIIO\_LIBRARIES=**/**usr**/**lib64**/**libOpenImageIO.so
11. OPENEXR\_Half\_LIBRARY=**/**usr**/**lib64**/**libHalf.so
12. OPENEXR\_INCLUDE\_DIR=**/**usr**/**include
13. OPENEXR\_LIB=**/**usr**/**lib**/**
14. OPENEXR\_LIBRARY\_DIR=**/**usr**/**lib
15. OPENSUBDIV\_INCLUDE\_DIR=**/**usr**/**include
16. PXR\_BUILD\_ALEMBIC\_PLUGIN=TRUE
17. PXR\_ENABLE\_PTEX\_SUPPORT=FALSE
18. PXR\_MALLOC\_LIBRARY=**/**usr**/**lib64**/**libjemalloc.so
19. TBB\_ROOT\_DIR=**/**usr**/**include**/**
20. DEVKIT\_LOCATION=$HOME**/**devkitBase
21. MAYA\_LOCATION=**/**usr**/**autodesk**/**maya2019
22. HOUDINI\_ROOT=**/**opt**/**hfs17.5.229
23. HOUDINI\_BASE\_DIR=**/**opt**/**hfs17.5.229
24. HOUDINI\_INCLUDE\_DIRS=**/**opt**/**hfs17.5.229**/**toolkit**/**include
25. HOUDINI\_LIB\_DIRS=**/**opt**/**hfs17.5.229**/**dsolib
26. HOUDINI\_VERSION=17.5.229
27. KATANA\_API\_LOCATION=**/**opt**/**Katana3.2v1
28. KATANA\_API\_INCLUDE\_DIR=**/**opt**/**Katana3.2v1**/**plugin\_apis**/**include
29. KATANA\_API\_SOURCE\_DIR=**/**opt**/**Katana3.2v1**/**plugin\_apis**/**src
30. *RENDERMAN\_LOCATION=/opt/pixar/RenderManProServer-22.6*
31. RENDERMAN\_LOCATION=$RMANTREE
32. PXR\_ENABLE\_OSL\_SUPPORT=FALSE
**\}**

This snippet is handy if you want to print the active envrionment variables in your terminal session, and sort them alphabetically at the same time when you display the results:

# ListEnvVars.bsh

**env** **\|** **sort**

**Note:**We will leave the Houdini OpenUSD compiling process up to the makefiles that ship alongside of Houdini v17.5 or v18.

This is due to "Hython" dependency hell that can occur when you naively intermix an OpenUSD library compile (or add to the $PATH env variable) parts of Hython and your operating system's version of Python.

Below is a snippet of BASH terminal session output that documents what happens if you compiled and then added the PIXAR OpenUSD public repository's "raw" library files to your Houdini.env entry and started up Houdini.

**Short Summary:** You do need to use the Hython modified/custom patched version of the OpenUSD makefiles that come with Houdini's installer to avoid making Houdini unhappy...

# Houdini.env

\# *USD for Houdini*

HOUDINI\_PATH=**/**opt**/**r\_usd**/**third\_party**/**houdini:**&**

HOUDINI\_DSO\_ERROR=1

*\#HOUDINI\_DSO\_PATH=@/plugin:/opt/r\_usd/plugin:&*

HOUDINI\_DSO\_PATH=**@/**plugin:**&**

HOUDINI\_SCRIPT\_PATH=**@/**scripts:**/**opt**/**r\_usd**/**lib:**&**

HOUDINI\_PYTHON\_LIB=**/**usr**/**lib64**/**libpython2.7.so

 

**\[**vfx**@**R01 \~**\]**$ houdini

------------------------ 'houdini-bin' is dying 

------------------------

houdini-bin crashed. FATAL ERROR: **\[**TF\_DEBUG\_ENVIRONMENT\_SYMBOL**\]** multiple symbol definitions.  This is usually due to software misconfiguration.  Contact the build team **for** assistance. **(**duplicate 'TF\_SCRIPT\_MODULE\_LOADER'**)**

**in** \_Add at line 96 of **/**home**/**prisms**/**builder-new**/**WeeklyDevToolsHEAD**/**dev\_tools**/**src**/**usd**/**usd-19.01**/**USD**/**pxr**/**base**/**lib**/**tf**/**debug.cpp

 

The stack can be found **in** R01:**/**var**/**tmp**/**st\_houdini-bin.12529

done.

 

------------------------------------------------------------------

**Step 5.** If you want to enable OSL support you need to have CMake v3.2.2+. By default, my copy of CentOS had CMake v2.8.12.2. 

You can download CMake from: <https://cmake.org/download/>

After you install CMake v3.2.2+, you need to override the standard built-in version of CMake. There are several ways you could handle this. I was lazy and did a CMake local install in my home folder and then added CMake to my $PATH environment variable via an edit to the $HOME/.bash\_profile/$HOME/.profile.

# CMakePATH.bsh

\# *Add CMake v3 to the $PATH*

**export** PATH=$HOME**/**cmake-3.15.3-Linux-x86\_64**/**bin:$PATH:$HOME**/**.local**/**bin:$HOME**/**bin

**Step 6.** Once you have the right version of CMake present, you can then compile OSL. 

Using OSL in your USDC and USDA files is exciting since you can see the results inside of usdview if you compiled in support for the PIXAR PRman renderer, too.

# AddOSL.bsh

\# *OSL for PRman in USDView*

\# *OSL requires OpenEXR v2.0 but CentOS has OpenEXR v1.6.1 by default*

**cd** $HOME**/**

**git clone** https:**//**github.com**/**imageworks**/**OpenShadingLanguage.git osl

**cd** $HOME**/**osl

**make**

**Step 7.** Clear out any of your old USD builds if you've done this process before, then re-create the build folder:

# ClearOldBuilds.bsh

*\# Clear the old build*

**sudo** **rm** -rf **/**opt**/**r\_usd**/**

\# *Create the output folder and make it writable during development*

**sudo** **mkdir** -p **/**opt**/**r\_usd**/**

**sudo** **chmod** 777 **/**opt**/**r\_usd**/**

**Step 8.** Run the PIXAR OpenUSD build script to create the exact deliverables you want:

RunBuildScript1.bsh

\# *Run the USD build script*

**cd** $HOME**/**usd**/**build\_scripts

 

\# *Create an initial USDView only build of OpenUSD (--prman enables RenderMan support)*

python build\_usd.py --no-tests --alembic --opencolorio --openimageio --python --usdview --prman **/**opt**/**r\_usd**/**

RunBuildScript2.bsh

\# *Run the USD build script*

**cd** $HOME**/**usd**/**build\_scripts

\# *Then create the Maya and Katana OpenUSD compiled plugins*

python build\_usd.py --no-tests --alembic --opencolorio --openimageio --python --maya --katana --usdview **/**opt**/**r\_usd**/**


RunBuildScript3.bsh

\# *Run the USD build script*

**cd** $HOME**/**usd**/**build\_scripts

 

\# *Optional create just the Katana OpenUSD compiled plugin:*

python build\_usd.py --katana --katana-api-location **/**opt**/**Katana3.2v1 **/**opt**/**r\_usd**/**


RunBuildScript4.bsh

\# *Run the USD build script*

**cd** $HOME**/**usd**/**build\_scripts

\# *Optional (but you don't want to do this yourself with the "raw" original makefiles found on the PIXAR OpenUSD Repo..) create the Houdini OpenUSD Compiled plugin*

python build\_usd.py --no-tests --alembic --opencolorio --openimageio --python --houdini --usdview **/**opt**/**r\_usd**/**


Note: We are skipping the OpenUSD compile options for the following build\_usd.py CLI (command-line) flag entries:

ExcludedBuildUSDFlags.bsh

1. --houdini
2. --docs
3. --embree
4. --ptex 
5. --hdf5


(hdf5 is the legacy Alembic format that was superseded by Alembic Ogawa.)

**Step 9.** If you plan to use your compiled copy of the OpenUSD plugins in a single-user artist/TD environment you could edit your $HOME/.bash\_profile to add entries like the example below.

An OpenUSD Centric .bash\_profile Example

![][filephp-1]

**.**bash\_profile

* *.bash\_profile*
 
* *Get the aliases and functions*
1. **\[** -f \~**/**.bashrc **\]**; **then**
* \~**/**.bashrc
**fi**
	 
* *User specific environment and startup programs*
1. PATH=$PATH:$HOME**/**.local**/**bin:$HOME**/**bin
	 
* *RenderMan 22.6*
* *export PATH="/opt/pixar/RenderManProServer-22.6/bin/:$PATH"*
1. RMANTREE="/opt/pixar/RenderManProServer-22.6/"
2. RMSTREE="/opt/pixar/RenderManForMaya-22.6/"
3. PIXAR\_LICENSE\_FILE=9010**@**localhost
* *RenderMan 22.6 for Katana 3.2*
1. DEFAULT\_RENDERER=prman
2. KATANA\_RESOURCES="/opt/pixar/RenderManForKatana-22.6-katana3.2/plugins/Resources/PRMan22/"
3. PATH="/opt/Katana3.2v1/:$PATH"
 
* *USD*
1. PATH=$PATH:**/**opt**/**r\_usd**/**bin
2. PYTHONPATH=**/**opt**/**r\_usd**/**lib**/**python
* *USD for Katana*
1. PYTHONPATH=$PYTHONPATH:**/**opt**/**r\_usd**/**lib**/**python
2. KATANA\_RESOURCES=$KATANA\_RESOURCES:**/**opt**/**r\_usd**/**third\_party**/**katana**/**plugin
3. KATANA\_POST\_PYTHONPATH=$KATANA\_RESOURCES:**/**opt**/**r\_usd**/**third\_party**/**katana**/**lib
* *Houdini 17.5.229*
1. */opt/hfs17.5*
2. *houdini\_setup*
3. *$HOME*

If you are working in a multi-user environment you might want to consider switching over to a [REZ based configuration, build, and deployment system](https://github.com/nerdvegas/rez). 

And humorously, by random coincidence, REZ's official slogan is "Resolve it with rez" which seems in line with a WSL user's goal of eventually running OpenUSD inside of Resolve (and Fusion Standalone). ![icon_lol.png](icon_lol.png) 

![][filephp-2]

**Step 10.** Next, you need to download the PIXAR "[Kitchen_set](http://graphics.pixar.com/usd/downloads.html)" example USD scene.

PIXAR USD \> Assets \> Download Kitchen Set

![][filephp-3]

After you expand the ZIP archive for the Kitchen\_set.zip" example, you can then browse the very efficiently nested hierarchy of USD composed models:


Exploring the Kitchen\_set Example Assets

![][filephp-4]

The USD scene is composed using the "Kitchen\_set.usd" file.

![][filephp-5]

The "Kitchen\_set.usd" file is a USDA (ASCII) file that can be viewed in a programmer's plain text editor. References to the placed OpenSubdiv based polygon model assets are visible in each of the "add references = @./assets/Blah/Blah.usd@" like sections in the USDA file.

![][filephp-6]

If you open up the "assets" folder, then open up the "Cheerio" folder you can inspect one of the OpenSubdiv based models in usdview to get an idea of the individual elements that are used in the scene.

[![][filephp-7]](https://www.steakunderwater.com/wesuckless/download/file.php?id=5530&mode=view)

The "Cheerio.usd" file is a USDA (ASCII) document that can be viewed in a programer's plain text editor. The "Cheerio.usd" file lists two model variants named "CheerioA" and "CheerioB". These variants are alternated between randomly when the bowl on the table in the full kitchen scene is filled via USD instancing of the cheerio model.

![][filephp-8]

After the Cheerio model is loaded in "usdview", you can enable the "View \> Shading Mode \> WireframeOnShaded" menu item based rendering method to see a preview of the finished model. It helps if you also enable the OpenSubdiv based realtime mesh smoothing feature using the "View \> Complexity \> Very High" menu item, too.

![][filephp-9]

Finally, we can view the "Kitchen\_set/Kitchen\_set.usd" file in our freshly compiled copy of usdview:

KitchenSetInUSDView.bsh

usdview '$HOME/Downloads/Kitchen\_set/Kitchen\_set.usd' 

This results in usdview launching and the OpenSubdiv based example scene being loaded:

Displaying the PIXAR USD "Kitchen\_set.usd" example in usdview

![][filephp-10]

**Step 11.** Setup the OpenUSD plugin in your Maya 2019 Maya.env file:

Maya.env

\# *Suppress Arnold not found error message*

MAYA\_NO\_WARNING\_FOR\_MISSING\_DEFAULT\_RENDERER=1

\# *Set the CIP disable flag*

MAYA\_DISABLE\_CIP=1

\# *USD for Maya*

MAYA\_PLUG\_IN\_PATH=$MAYA\_PLUG\_IN\_PATH:**/**opt**/**r\_usd**/**third\_party**/**maya**/**plugin

XBMLANGPATH=$XBMLANGPATH**/%**B:**/**opt**/**r\_usd**/**third\_party**/**maya**/**lib**/**usd**/**usdMaya**/**resources**/%**B

MAYA\_SCRIPT\_PATH=$MAYA\_SCRIPT\_PATH:**/**opt**/**r\_usd**/**third\_party**/**maya**/**lib**/**usd**/**usdMaya**/**resources**/**:**/**opt**/**r\_usd**/**third\_party**/**maya**/**plugin**/**pxrUsdPreviewSurface**/**resources

 

PYTHONPATH=$PYTHONPATH:**/**opt**/**r\_usd**/**lib**/**python

**Step 12.** Double-check your Katana environment variables to make sure they exist for your active session:

**.**profile

**export** PYTHONPATH=$PYTHONPATH:**/**opt**/**r\_usd**/**lib**/**python

**export** KATANA\_RESOURCES=$KATANA\_RESOURCES:**/**opt**/**r\_usd**/**third\_party**/**katana**/**plugin

**export** KATANA\_POST\_PYTHONPATH=$KATANA\_RESOURCES:**/**opt**/**r\_usd**/**third\_party**/**katana**/**lib


When you start using OpenUSD inside of RenderMan for Katana, you will typically interact with the PxrUsdIn node in the Katana Node graph as the primary way to load all models, textures, and lights.

Here are two screenshots that show Katana running with the PIXAR "Kitchen\_set" example scene:

![][filephp-11]

![][filephp-12]

**Step 13.** If you need them, here are the GitHub repo/webpage links for the main "extra" libraries you can compile when building your own full-featured PIXAR OpenUSD plugins.

OpenUSD:

<https://graphics.pixar.com/usd/docs/index.html>

<https://github.com/PixarAnimationStudios/USD>

Houdini OpenUSD:

[https://graphics.pixar.com/usd/docs/Hou ... ugins.html](https://graphics.pixar.com/usd/docs/Houdini-USD-Plugins.html)

Katana OpenUSD:

<http://openusd.org/docs/Katana-USD-Plugins.html>

Local Resource: /opt/Katana3.2v1/docs/dev\_guide/

Maya DevKit:

<http://openusd.org/docs/Maya-USD-Plugins.html>

[https://knowledge.autodesk.com/support/ ... evkit.html](https://knowledge.autodesk.com/support/maya/learn-explore/caas/sfdcarticles/sfdcarticles/Where-is-the-Maya-2016-devkit.html)

**Note:** Install the Maya devkit in the $HOME folder then set the two env vars "DEVKIT\_LOCATION" and "MAYA\_LOCATION".

OpenSubdiv:

<https://github.com/PixarAnimationStudios/OpenSubdiv>

PTEX:

<https://github.com/wdas/ptex/>

Alembic:

<https://github.com/alembic/alembic>

jemalloc:

<https://github.com/jemalloc/jemalloc>

Flex:

<https://github.com/westes/flex>

Bison:

<https://www.gnu.org/software/bison/>

Jinja2:

<http://jinja.pocoo.org/docs/dev/>

Argparse:

<https://docs.python.org/3/library/argparse.html>


Find RPMs:

<https://pkgs.org/>

<https://www.rpmfind.net/linux/RPM/index.html>

**Step 14.** Here are cmake CLI (command-line) BASH examples that can be used to build the common libraries you might add to OpenUSD:

**Pixar** [**OpenSubdiv**](https://github.com/PixarAnimationStudios/OpenSubdiv)

OpenSubdiv.bsh

*\# OpenSubdiv*

**mkdir** -p $HOME**/**OpenSubdiv**/**build

**cd** $HOME**/**

**git clone** https:**//**github.com**/**PixarAnimationStudios**/**OpenSubdiv

**cd** $HOME**/**OpenSubdiv**/**build

cmake -D NO\_PTEX=1 -D NO\_DOC=1 \\

\-D NO\_OMP=1 -D NO\_TBB=1 -D NO\_CUDA=1 -D NO\_OPENCL=1 -D NO\_CLEW=1 \\

\-D GLEW\_LOCATION="/usr/include/GL" \\

\-D GLFW\_LOCATION="/usr/include/GLFW" \\

..

**sudo** cmake --build . --target **install** -- -j 63

**Walt Disney Animation Studios** [**PTEX**](https://github.com/wdas/ptex/)

PTEX.bsh

*\#PTEX*

**git clone** https:**//**github.com**/**wdas**/**ptex**/**

**cd** $HOME**/**ptex

\# *...*

\# *...*

\# *...*


**Note:** If you don't have X11 installed you will likely get errors from: Q\_WS\_X11 LibXml2 LibXslt

**Intel** [**Embree**](https://github.com/embree/embree/)

Embree.bsh

\# *Embree*

**cd** $HOME

**wget** https:**//**github.com**/**embree**/**embree**/**releases**/**download**/**v3.5.2**/**embree-3.5.2.x86\_64.rpm.tar.gz

**tar** xzf embree-3.5.2.x86\_64.rpm.tar.gz

**sudo** rpm --install embree3-**\***.rpm

**Step 15.** It's a good idea to have a clear idea of the available flags you can specify in the CLI (command-line) when running the PIXAR OpenUSD build\_usd.py compiling process on your own.

**Code:** \[Select all\] \[Expand/Collapse\] [\[Download\]](https://www.steakunderwater.com/wesuckless/codeboxplus/download/26970-22) (build\_usd.bsh)

1. build\_scripts**\]**$ python build\_usd.py
2. build\_usd.py **\[**-h**\]** 
3. 
4. **\|** -q**\]** 
5. JOBS**\]** 
6. BUILD**\]**
7. **\[**BUILD\_ARGS **\[**BUILD\_ARGS ...**\]\]\]**
8. FORCE\_BUILD**\]**
**\[**--force-all**\]**
9. GENERATOR**\]**
10. SRC**\]**
11. INST**\]**
12. **\|** --build-monolithic**\]** **\[**--debug**\]**
13. **\|** --no-tests**\]**
14. **\|** --no-docs**\]**
15. **\|** --no-python**\]**
16. **\|** --usd-imaging **\|** --no-imaging**\]**
17. **\|** --no-ptex**\]**
18. **\|** --no-usdview**\]**
19. **\|** --no-embree**\]**
20. EMBREE\_LOCATION**\]**
21. **\|** --no-openimageio**\]**
22. **\|** --no-opencolorio**\]**
23. **\|** --no-alembic**\]** 
24. **\|** --no-hdf5**\]**
25. **\|** --no-materialx**\]**
26. **\|** --no-maya**\]**
27. MAYA\_LOCATION**\]** 
28. **\|** --no-katana**\]**
29. KATANA\_API\_LOCATION**\]**
30. **\|** --no-houdini**\]**
31. HOUDINI\_LOCATION**\]**
install\_dir

**Step 16.** After the build\_usd.py script has been used to create usdview and the 3rd party OpenUSD plugins are compiled successfully, you will see output like this in the terminal:

BuildResults.bsh

**\[**vfx**@**R01 build\_scripts**\]**$ python build\_usd.py **/**opt**/**r\_usd**/**

 

Building with settings:

USD **source** directory          **/**home**/**vfx**/**USD

USD **install** directory         **/**opt**/**r\_usd**/**

3rd-party **source** directory    **/**opt**/**r\_usd**/**src

3rd-party **install** directory   **/**opt**/**r\_usd**/**USD

Build directory               **/**opt**/**r\_usd**/**build

CMake generator               Default

Downloader                    curl

 

Building                      Shared libraries

Config                      Release

Imaging                     On

Ptex support:             Off

OpenImageIO support:      Off 

OpenColorIO support:      Off 

UsdImaging                  On

usdview:                  On

Python support              On

Documentation               Off

Tests                       Off

Alembic Plugin              Off

HDF5 support:             Off

MaterialX Plugin            Off

Maya Plugin                 Off

Katana Plugin               Off

Houdini Plugin              Off

Dependencies                boost, TBB, OpenEXR, GLEW, OpenSubdiv

STATUS: Installing boost...

STATUS: Installing TBB...

STATUS: Installing OpenEXR...

STATUS: Installing GLEW...

STATUS: Installing OpenSubdiv...

STATUS: Installing USD...

Success**!** To use USD, please ensure that you have:

The following **in** your PYTHONPATH environment variable:

**/**opt**/**r\_usd**/**lib**/**python

The following **in** your PATH environment variable:

**/**opt**/**r\_usd**/**bin

**Step 17**. With OpenUSD installed on your system the /opt/r\_usd/USD/bin/ folder will have the following USD tools you can run from the CLI (command-line):

![][filephp-13]


* cjpeg
* djpeg
* exrenvmap
* exrheader
* exrmakepreview
* exrmaketiled
* exrmultipart
* exrmultiview
* exrstdattr
* jpegtran
* libpng16-config
* libpng-config
* pngfix
* png-fix-itxt
* rdjpgcom
* sdfdump
* sdffilter
* stringify
* testusdview
* usdcat
* usdchecker
* usddiff
* usddumpcrate
* usdedit
* usdGenSchema
* usdresolve
* usdstitch
* usdstitchclips
* usdtree
* usdview
* usdzip
* wrjpgcom

You will also have the following Alembic tools you can use from the CLI (command-line), too:

* abcconvert
* abcdiff
* abcecho
* abcechobounds
* abcls
* abcstitcher
* Abctree

Stay tuned for part 2. More to follow. ![icon_e_smile.png](icon_e_smile.png)


Houdini v18 Released

Houdini v18 shipped today with support for Windows/Linux/macOS systems. Now anyone can [download Houdini Apprentice](https://www.sidefx.com/buy/) for free from SideFX and try out the Solaris integration. 

![][filephp-14]

# Screenshots

Here's a quick screenshot of the PIXAR "Kitchen\_set.usd" scene loaded up using a stock Houdini "File" node from inside a Geo node.

![][filephp-15]

And here's a quick view of the Houdini Solaris "Stage" environment:

![][filephp-16]

# Houdini Bundled USD CLI Tools

Houdini 18 ships with Hython compiled CLI (command-line) copies of the following core USD tools:

* usdcat
* usddiff
* usdedit
* usdresolve
* usdstitchclips
* usdview
* usdchecker
* usddumpcrate
* usdrecord
* usdstitch
* usdtree
* usdzip

On a macOS system running Houdini v18.0.287 these USD CLI tools are located in the folder:

	/Applications/Houdini/Houdini18.0.287/Frameworks/Houdini.framework/Versions/Current/Resources/bin/

On a Windows 10 system running Houdini v18.0.287 these USD CLI tools are located in the folder:

	C:\Program Files\Side Effects Software\Houdini 18.0.287\bin\

On a CentOS 7.x system running Houdini v18.0.287 these USD CLI tools are located in the folder:

	/opt/hfs18.0.287/bin/

You can source Houdini on Linux's environment variables using:

	cd /opt/hfs18.0.287/
	source houdini_setup

You can source Houdini on macOS's environment variables using:

	cd /Applications/Houdini/Houdini18.0.287/Frameworks/Houdini.framework/Versions/Current/Resources
	source houdini_setup

# Running Houdini's Provided Copy of USDVIEW

Houdini v18 provides a usdview.bat launching script on Windows 10 in the Houdini "bin" folder. Inside the bat file the script runs the code:

	hython %HFS%/bin/usdview %*

If you haven't loaded Houdini 18's bin folder into your %PATH% environment variable, from a fresh Command Prompt session you could launch usdview using:

	"C:\Program Files\Side Effects Software\Houdini 18.0.287\bin\hython2.7.exe" "C:\Program Files\Side Effects Software\Houdini 18.0.287\bin\usdview" Kitchen_set.usd

![][filephp-17]

![][filephp-18]



Part 3 - Fusion Studio

The KartaVR "[Export Point Cloud](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=27571#p27571)" script now supports Fusion PointCloud3D node data export to XYZ ASCII (.xyz), PLY ASCII (.ply), Maya ASCII (.ma), and PIXAR USDA ASCII (.usda) formats from Fusion. 

![][filephp-19]

# Translating Fusion 3D System Nodes into the USD ASCII Format

The current version of the "Export Point Cloud" script that is in Reactor's "KartaVR/Scripts" category in the "KartaVR Scripts \| Virtual Production" atom package can now do PointCloud3D node based exports to a lot of formats, and also a whole lot more, too. 

![][banana]

I'm excited about building out a more complete set of KartaVR based camera/point cloud/volumetric video/mesh sequence tools to help production artists start to embracing what PIXAR's USD technology can do for allowing seamless data interchange of both 3D scene graph information and volumetric assets. 

As a side bonus some of these tool creation efforts, things like the "Export Point Cloud" script might just become an essential addon for Fusion compositors that want to take on matchmoving, point cloud workflows, or push their matte painting and texture projection workflows further.

The most recent thing I've been exploring is how to support animated USD ASCII exporting of Fusion Camera3D node based cameras from the Fusion 3D system into a .usda file export. 

Here's a sample output from the "Export Point Cloud" script that is saves out a animated Camera3D node as USD formatted data using the timeSamples option to store per-frame keyframe data on the rotateXYZ and translate elements in the USDA file:

# Camera3D.usda

		#usda 1.0
	(
		defaultPrim = "AnimatedCamera3D"
		doc = """Generated from Composed Stage of root layer /Users/andrew/Downloads/FusionAnimatedCamera/AnimatedCamera.comp"""
		metersPerUnit = 0.01
		upAxis = "Y"
	)

	def Xform "AnimatedCamera3D" (
		kind = "assembly"
	)
	{
		float3 xformOp:rotateXYZ.timeSamples = {
			0: (-37, -16.200000762939, 0),
			1: (-36.618713450292, -16.415570938378, 0),
			2: (-36.237426900585, -16.631141113817, 0),
			3: (-35.856140350877, -16.846711289255, 0),
			4: (-35.47485380117, -17.062281464694, 0),
			5: (-35.093567251462, -17.277851640132, 0),
			6: (-34.712280701754, -17.493421815571, 0),
			7: (-34.330994152047, -17.70899199101, 0),
			8: (-33.949707602339, -17.924562166448, 0),
			9: (-33.568421052632, -18.140132341887, 0),
			10: (-33.187134502924, -18.355702517325, 0),
			11: (-32.805847953216, -18.571272692764, 0),
			12: (-32.424561403509, -18.786842868203, 0),
			13: (-32.043274853801, -19.002413043641, 0),
			14: (-31.661988304094, -19.21798321908, 0),
			15: (-31.280701754386, -19.433553394518, 0),
			16: (-30.899415204678, -19.649123569957, 0),
			17: (-30.518128654971, -19.864693745396, 0),
			18: (-30.136842105263, -20.080263920834, 0),
			19: (-29.755555555556, -20.295834096273, 0),
			20: (-29.374269005848, -20.511404271711, 0),
			21: (-28.99298245614, -20.72697444715, 0),
			22: (-28.611695906433, -20.942544622589, 0),
			23: (-28.230409356725, -21.158114798027, 0),
			24: (-27.849122807018, -21.373684973466, 0),
			25: (-27.46783625731, -21.589255148904, 0),
			26: (-27.086549707602, -21.804825324343, 0),
			27: (-26.705263157895, -22.020395499782, 0),
			28: (-26.323976608187, -22.23596567522, 0),
			29: (-25.94269005848, -22.451535850659, 0),
			30: (-25.561403508772, -22.667106026097, 0),
			31: (-25.180116959064, -22.882676201536, 0),
			32: (-24.798830409357, -23.098246376975, 0),
			33: (-24.417543859649, -23.313816552413, 0),
			34: (-24.036257309942, -23.529386727852, 0),
			35: (-23.654970760234, -23.74495690329, 0),
			36: (-23.273684210526, -23.960527078729, 0),
			37: (-22.892397660819, -24.176097254168, 0),
			38: (-22.511111111111, -24.391667429606, 0),
			39: (-22.129824561404, -24.607237605045, 0),
			40: (-21.748538011696, -24.822807780483, 0),
			41: (-21.367251461988, -25.038377955922, 0),
			42: (-20.985964912281, -25.253948131361, 0),
			43: (-20.604678362573, -25.469518306799, 0),
			44: (-20.223391812866, -25.685088482238, 0),
			45: (-19.842105263158, -25.900658657676, 0),
			46: (-19.46081871345, -26.116228833115, 0),
			47: (-19.079532163743, -26.331799008554, 0),
			48: (-18.698245614035, -26.547369183992, 0),
			49: (-18.316959064328, -26.762939359431, 0),
			50: (-17.93567251462, -26.978509534869, 0),
			51: (-17.554385964912, -27.194079710308, 0),
			52: (-17.173099415205, -27.409649885747, 0),
			53: (-16.791812865497, -27.625220061185, 0),
			54: (-16.41052631579, -27.840790236624, 0),
			55: (-16.029239766082, -28.056360412062, 0),
			56: (-15.647953216374, -28.271930587501, 0),
			57: (-15.266666666667, -28.48750076294, 0),
			58: (-15.261757105943, -27.989408675262, 0),
			59: (-15.25684754522, -27.491316587585, 0),
			60: (-15.251937984496, -26.993224499908, 0),
			61: (-15.247028423773, -26.495132412231, 0),
			62: (-15.242118863049, -25.997040324554, 0),
			63: (-15.237209302326, -25.498948236877, 0),
			64: (-15.232299741602, -25.0008561492, 0),
			65: (-15.227390180879, -24.502764061523, 0),
			66: (-15.222480620155, -24.004671973846, 0),
			67: (-15.217571059432, -23.506579886169, 0),
			68: (-15.212661498708, -23.008487798491, 0),
			69: (-15.207751937985, -22.510395710814, 0),
			70: (-15.202842377261, -22.012303623137, 0),
			71: (-15.197932816537, -21.51421153546, 0),
			72: (-15.193023255814, -21.016119447783, 0),
			73: (-15.18811369509, -20.518027360106, 0),
			74: (-15.183204134367, -20.019935272429, 0),
			75: (-15.178294573643, -19.521843184752, 0),
			76: (-15.17338501292, -19.023751097075, 0),
			77: (-15.168475452196, -18.525659009398, 0),
			78: (-15.163565891473, -18.027566921721, 0),
			79: (-15.158656330749, -17.529474834043, 0),
			80: (-15.153746770026, -17.031382746366, 0),
			81: (-15.148837209302, -16.533290658689, 0),
			82: (-15.143927648579, -16.035198571012, 0),
			83: (-15.139018087855, -15.537106483335, 0),
			84: (-15.134108527132, -15.039014395658, 0),
			85: (-15.129198966408, -14.540922307981, 0),
			86: (-15.124289405685, -14.042830220304, 0),
			87: (-15.119379844961, -13.544738132627, 0),
			88: (-15.114470284238, -13.04664604495, 0),
			89: (-15.109560723514, -12.548553957273, 0),
			90: (-15.104651162791, -12.050461869595, 0),
			91: (-15.099741602067, -11.552369781918, 0),
			92: (-15.094832041344, -11.054277694241, 0),
			93: (-15.08992248062, -10.556185606564, 0),
			94: (-15.085012919897, -10.058093518887, 0),
			95: (-15.080103359173, -9.56000143121, 0),
			96: (-15.07519379845, -9.0619093435329, 0),
			97: (-15.070284237726, -8.5638172558558, 0),
			98: (-15.065374677003, -8.0657251681787, 0),
			99: (-15.060465116279, -7.5676330805016, 0),
			100: (-15.055555555556, -7.0695409928245, 0),
			101: (-15.050645994832, -6.5714489051475, 0),
			102: (-15.045736434109, -6.0733568174704, 0),
			103: (-15.040826873385, -5.5752647297933, 0),
			104: (-15.035917312661, -5.0771726421162, 0),
			105: (-15.031007751938, -4.5790805544391, 0),
			106: (-15.026098191214, -4.080988466762, 0),
			107: (-15.021188630491, -3.5828963790849, 0),
			108: (-15.016279069767, -3.0848042914078, 0),
			109: (-15.011369509044, -2.5867122037307, 0),
			110: (-15.00645994832, -2.0886201160536, 0),
			111: (-15.001550387597, -1.5905280283765, 0),
			112: (-14.996640826873, -1.0924359406994, 0),
			113: (-14.99
		

The script has the ability to translate AlembicMesh3D node-based elements from your Fusion comp into Maya ASCII (.ma) "Reference Editor" based alembic references, and USDA formatted Xform assembly references which instance externally stored Alembic meshes in the USD scene:

# AlembicMesh3D.usda

	#usda 1.0
	(
	    **defaultPrim** = "SoccerAlembicMesh3D"
	    **doc** = """Generated from Composed Stage of root layer /Users/andrew/Downloads/FusionAnimatedCamera/AnimatedCamera.comp"""
	    metersPerUnit = 0.01
	    upAxis = "Y"
	)
	 
	**def** Xform "SoccerAlembicMesh3D" (
	**kind** = "assembly"
	)
	{
	   **def** Xform "SoccerAlembicMesh3DReferenceAssembly" (
	       **kind** = "assembly"
	      **prepend** **references** = @/Users/andrew/Downloads/FusionAnimatedCamera/Media/soccer_HDF5.abc@
	   )
	   {
	       float3 xformOp:rotateXYZ = (0, 0, 0)
	       double3 xformOp:translate = (0, 0, 0)
	       **uniform** token[] **xformOpOrder** = ["xformOp:translate", "xformOp:rotateXYZ"]
	  }
	}

# Example Fusion Comp Project

Here's a small Fusion example project you can use to explore the new PIXAR USD ASCII and Maya ASCII output options that are in the Reactor delivered "Export Point Cloud" script:

AnimatedCamera.comp

# Fusion Export Stage

![][filephp-20]

# Maya Import Stage

![][filephp-21]

Part 4 - CompX

I'm working on a slightly expanded scope for an OpenUSD integration effort for the Fusion Studio/Resolve Studio's Fusion page... It's a bit like going down a rabbit hole but the end result could help to radically improve data interchange of compositing node graphs for things like USD shots publishes that could be delivered to artists with an accompanying slap comp attached.

**GitHub \| CompX**

<https://github.com/AndrewHazelden/CompX>

An OpenUSD schema for representing nodal compositing operators. Optimized for VFX and virtual production workflows. The goal is to create an OpenUSD based CompX schema, alongside a reference implementation that ships with the essential DCC plugins, command-line utilities, and libraries to support compositing data interchange.

An OpenUSD schema for representing nodal compositing operators. Optimized for VFX and virtual production workflows.

# Project Status:

A new working group of VFX/animation/post-production/virtual production/game industry professionals is being assembled.

The goal is to create an OpenUSD based CompX schema, alongside a reference implementation that ships with the essential DCC plugins, command-line utilities, and libraries to support compositing data interchange.

Two (legacy) OpenUSD ASCII exporter scripts were added to the CompX repository recently to help with R&D tests as ongoing research is done during 2022 to move CompX from an idea, into a production-usable toolset.

# Open Source License:

Apache 2.0 License

# OpenUSD Reference Information:

[OpenUSD Glossary \| API Schema](https://graphics.pixar.com/usd/docs/USD-Glossary.html#USDGlossary-APISchema)

[OpenUSD \| Generating New Schema Classes](https://graphics.pixar.com/usd/docs/Generating-New-Schema-Classes.html)

**Kartaverse Workflows \| Building an Effective nVP (Neural Virtual Production) Sound Stage**

Kartaverse \| nVP On-set Solutions

First Draft

Created: 2022-12-07 Last Updated 2022-12-10 07:30 AM UTC -4

Overview

This guide is a companion resource for the OpenDisplayXR VDD (Virtual Device Driver) and Kartaverse "KartaVP" open-source immersive content production pipeline projects. This draft document explains how to approach driving large-scale nVP (Neural Virtual Production) workflows in an efficient and performant fashion. 

Included with the guide is a high-level discussion of the back-end hardware systems integration considerations a new nVP sound stage operator needs to consider when switching away from traditional "[machinima](https://en.m.wikipedia.org/wiki/Machinima)" style [OpenGL](https://en.wikipedia.org/wiki/OpenGL)/[DirectX](https://en.wikipedia.org/wiki/DirectX) based LED panel rendering workflows.

OpenGL Rasterization Rendering

[OpenGL](https://en.wikipedia.org/wiki/OpenGL) real-time rendering is still quite common, as of December 2022. OpenGL started out as [IrisGL on SGI IRIX](https://en.wikipedia.org/wiki/IRIS_GL) systems, and the descendant of that API is pretty much the number one option used in (legacy) [rectilinear lens](https://en.wikipedia.org/wiki/Rectilinear_lens) based [rasterizer](https://en.wikipedia.org/wiki/Rasterisation) VP pipeline architectures. 

The fact that OpenGL rasterization techniques have endured for decades is impressive. Many of the essential OpenGL API developer documentation resources pre-date the 1997 release of the [Nintendo64 GoldenEye 007 game](https://en.m.wikipedia.org/wiki/GoldenEye_007_(1997_video_game)). The N64 hardware performed photo-realistic rendering via OpenGL running on [SGI](https://en.wikipedia.org/wiki/Silicon_Graphics) (Silicon Graphics) derived graphics chips. It's a stunning technical and engineering accomplishment to keep the OpenGL API going in such a consistent fashion for so long, really! 👍

Neural VP Rendering

KartaVP and the OpenDisplayXR VDD provided "NeuralFoam Engine" renderer are developed as cross-platform compatible, free open-source tools. This is an intentional choice to help move forward the objective of modernizing existing VP workflows with ML driven neural rendering techniques.

With NeRF approaches, content creators can embrace recent advances in the state of the art technology used in volumetric video capture/playback. 

In 2023 the emergence of off-the-shelf nVP stage solutions will hopefully provide feature film-level [DOPs](https://en.m.wikipedia.org/wiki/Directors_of_Photography) (Director of Photography) with the chance to unlock exciting new potential for 100% real-time rendered digital environments. [NeRF has already demonstrated its potential](https://blogs.nvidia.com/blog/2022/08/05/instant-nerf-creators-siggraph/) to deliver levels of photorealism (and rendering features) never witnessed in conventional[ rasterized](https://en.wikipedia.org/wiki/Rasterisation)-based on-set virtual production systems deployed between 2015-2022.

Distributed NeRF Rendering for Live-Action Virtual Production Background Environments 

If you review the [OpenXR-VR Virtual Device Driver Google Docs file](https://docs.google.com/document/d/1RRnaui-QQ689v6xH30GK36Hhf1yCRGcBldFwapOakWo/edit?usp=sharing), you will see a "Demo Apps" section that has notes that cover a novel "distributed NeRF rendering" pipeline, and how that can be achieved in a modular fashion, (with relatively low design complexity), to power near-infinite LED video wall size, for an nVP stage setup that supports an arbitrary geometric screen surface shape.

![][image3-8]

This approach empowers the construction of highly-scalable virtual production workflows that use NeRF techniques on large-scale [LED display panel based cylindrical VP](https://en.wikipedia.org/wiki/On-set_virtual_production) [sound stages](https://en.wikipedia.org/wiki/Sound_stage).

The core aspect is the use of a conventional [10 Gb Ethernet](https://en.wikipedia.org/wiki/10_Gigabit_Ethernet) networked client/server method. This drives a genlock synced, GPU-powered, rack-mounted NeRF-based distributed rendering appliance.

The key aspect is that the individual NeRF "worker nodes'' are used as multi-view tile generators. Of special importance in the system design is to avoid the need of OpenGL [quad buffer](https://en.wikipedia.org/wiki/Multiple_buffering) rendering support in the worker node's GPUs.

One worker node is configured to direct-drive high-resolution 24Hz - 120 Hz output. The generated frame-buffer data is routed via an [NewTek NDI](https://www.aja.com/products/bridge-ndi-3g) IP video stream or a [fibre-encoded SDI](https://www.blackmagicdesign.com/products/blackmagicfiberconverters) cable and either an [ATEM switcher](https://www.blackmagicdesign.com/products) or [SmartVideo Hub](https://www.blackmagicdesign.com/products/smartvideohub) connection to either individual [LED display](https://www.roevisual.com/uploads/files/Product%20File/Ruby/ruby-brochure-1.5f1.9b-aug-10-2022.pdf) panel's [LED video processor](https://www.bromptontech.com/product/s8/) unit.


| ![][image5-9]AJA NDI to SDI Encoder  | ![][image4-8]BMD Smart Video Hub SDI Video Routing  ||
| :-----: | :-----: |
| ![][image1-9]Brompton Tessera S8 LED Processor  | ![][image2-9]Roe Visual LED panel  ||


I feel this NeRF distributed rendering workflow best mirrors the concepts that Disguise, [Unreal + nDisplay](https://www.unrealengine.com/en-US/tech-blog/explore-ndisplay-technology-limitless-scaling-of-real-time-content), [Assimilate LiveFX](https://www.assimilateinc.com/products/livefx/), [Notch](https://www.notch.one), and [TouchDesigner](https://derivative.ca/download) [TouchEngine](https://derivative.ca/UserGuide/TouchEngine) all support for [OpenGL](https://en.wikipedia.org/wiki/OpenGL)/[DirectX](https://en.wikipedia.org/wiki/DirectX) rendered real-time "Machinima" content today.

All [NVIDIA InstantNGP](https://github.com/NVlabs/instant-ngp) API based NeRF rendering implementations support a cropped 3D DoD (Domain of Definition) bounding box.To fully optimize the render pipeline, and efficiently extract all usable VRAM on the [NVLink bridge](https://en.wikipedia.org/wiki/NVLink) connected GPUs pairs; one needs to bind the active GPU worker node's "[nCam tracked](https://www.ncam-tech.com/real-time-camera-tracking-on-location/)" camera view frustum to the precise DoD region cropping control in NVIDIA's InstantNGP testbed program.

This DoD usage allows a VP production setup, that features an arbitrarily shaped LED panel based video wall, to handle voxel scene scales an order of magnitude larger than most people could ever conceivably imagine.




**KickAss ShaderZ for Fusion**

**Overview**

"KickAss ShaderZ" is a community supported repository of material shaders for the Fusion community by the Fusion community. Curated by Andromeda\_Girl and developed for Reactor by Andrew Hazelden.

WSL members can submit shaders to be added and watch the library grow.

![][image1-10]

**For More Information**

If you'd like to explore how the KickAss Shaders were created, simply expand the group to peek inside the shader.

KickAss ShaderZ is a project that is hosted on the WeSuckLess Fusion community forum. You can check out the Reactor GitLab Repository if you need direct access to the individual files via your web browser.

**Project Created by**

* andromeda\_girl (WSL Profile)
* Andrew Hazelden (WSL Profile)
* WSL Community

**Requirements**

* Blackmagic Fusion Studio or Resolve
* WSL Reactor Package Manager

**Installation**

The KickAss ShaderZ is installed using the Reactor package manager. Look for KickAss ShaderZ in the "Shaders" category on the left side of the Reactor window.


**Import PBR Metal Roughness Textures Script**

KickAss ShaderZ includes a handy "Substance PBR Import" script that reads the image from the selected Loader node and expands it to import the full set of related Substance PBR texture maps. 

The idea for this PBR texture map "splitter" script was directly inspired by the concept of how the "hos\_SplitEXR\_Ultra.lua" script works at breaking apart EXR channels. ![image1.png](image1.png)

**Nodes View Screenshot**

This is what a typical PBR material import looks like in the Nodes view area:

![][image2-10]

**File Import Menu Usage**

Step 1. If you have KickAss ShaderZ menus installed, then you have access in Fusion Studio to a "File \> Import \> PBR Textures..." menu item.

![][image3-9]

As a fallback option, there is a KickAss ShaderZ menu entry for this script as well. It can be accessed using the "KickAss Shaders \> Tools \> Substance PBR Import" menu item.

![][image4-9]

Step 2. A file browsing dialog is shown when either of the menu items are selected. In the file browsing dialog choose a PBR Metal Roughness texture map on disk.

![][image5-10]

An example KAS bundled PBR Metal Roughness set of texture maps you can try out can be found on-disk at the PathMap location of:

Reactor:/Deploy/Macros/KickAss ShaderZ/Assets/PreviewSphere\_Sphere\_BaseColor.png

A PBR Import dialog will appear with import options. Clicking the "Create PBR Material" button will auto-create a PBR material shading network in the Fusion comp by matching the corresponding texture filenames and PBR channel names.

![][image6-9]

**Tool Script Usage**

Step 1. Select a Loader node in the Flow view. 

![][image7-8]

Step 2. Right-click in the flow view and from the contextual menu select the "Script \> KickAss ShaderZ \> Substance PBR Import" menu item to launch the script. 

![][image8-6]

Step 3. Customize the settings in the dialog, then click the "Create PBR Material" button. 

![][image6-10]

**GUI Controls**

PBR Surface Material

The "PBR Surface Material" ComboBox allows you to choose either a "Cook Torrance/Reflect", or a "CustomShader3D (Alpha)" based material workflow. 

![][image9-6]

Note: You need to have the 3rd party "CustomShader3D" plugin installed in Fusion Studio v9 for Windows in order to use this option. 

Add Environment Map

The "Add Environment Map" checkbox allows you to have an HDRI panoramic image added to the node graph automatically. 

![][image10-6]

Add Shader Ball

The "Add Shader Ball" checkbox allows you to have a polygon mesh added to the node graph automatically for use as preview geometry for your surface materials. 

![][image11-6]

This is a preview of the KickAss ShaderZ "kas\_ShaderBall" node with PBR Materials applied to it. 

![][image12-5]

Add Note

The "Add Note" checkbox inserts a note node into the composite which summarizes the texture maps and settings used when the PBR materials were imported. 

![][image13-5]

This is a preview of the type of information that is automatically added to the Node node when the PBR Materials are imported. 

![][image14-5]

Reset to Defaults

The "Reset to Defaults" checkbox reverts the settings in the dialog back to their initial factory default values. 

![][image15-5]

? / Help

The "?" help button shows the built-in help documentation (which you are currently viewing now). 

![][image16-5]

Create PBR Material

The "Create PBR Material" button will process the current Loader node selection in the flow view to generate a full set of imported PBR maps connected to a Fusion surface material. 

![][image17-6]

Image Channels

A Substance "PBR Metal Rough" export workflow is expected by this script. That means you will have a set of texture maps with the following PBR map channels:

BaseColor

Roughness

Normal

Metallic

Height

Emissive

These maps will be named with a filename formatted like: 

image\_\<map\>.ext

Note: It would be possible to add PBR texture import support for additional naming conventions such as importing maps and building the shading network for the LearnNowFX AccuShader plugin, or loading in footage based upon the naming patterns of Disney Principal texture maps, or Pixar Surface texture maps if there was user interest.

Substance Material Export

In Substance Painter select the "File \>Export Textures..." menu item to prepare your final baked and flattened texture maps. 

![][image18-6]

In the "Export document..." dialog set the export location using the button at the top of the dialog. Then set the "Config" attribute to use the "PBR MetalRough" option to generate the correct texture maps. 

Finally, click the "Export" button to save out the textures.

![][image19-5]

**Content Browser**

![][image20-7]

The "Content Browser" window allows you to effortlessly navigate through the "Industrial", "Natural", "Utility", and "HDRI" categories of macros included in the KAS shader collection. This view is accessed using the "KickAss ShaderZ \> Content Browser..." menu item.

**KickAss ShaderZ Descriptions**

**Industrial**

kas\_Atomic

"kas\_Atomic" creates an irradiated material that is self-illuminated with an orange shade.

![][image21-5]

kas\_Chrome

"kas\_Chrome" creates a super shiny metallic surface.

![][image22-9]

kas\_CobaltBlueCarbonFibre

"kas\_CobaltBlueCarbonFibre" is great for futuristic hard surface modelled objects where you might want a procedurally textured lightly scuffed surface for added photorealism.

![][image23-4]

kas\_GlassDeepBlue

"kas\_GlassDeepBlue" is a semi-transparent glass material. A primitive attempt has been taken to simulate a faked blue color absorption effect on the material using a Falloff node.

![][image24-4]

kas\_GlassDeepRuby

"kas\_GlassRuby" is a semi-transparent glass material. A primitive attempt has been taken to simulate a faked red color absorption effect on the material using a Falloff node.

![][image25-3]

kas\_GlassDirty

"kas\_GlassDirty" creates a semi-transparent glass with a layer of grime coating the surface.

![][image26-4]

kas\_GlassQuartzScratched

"kas\_GlassQuartzScratched" is a semi-transparent glass material. A primitive attempt has been taken to simulate a faked purple color absorption effect on the material using a Falloff node.

![][image27-3]

kas\_Gold

"kas\_Gold" creates a stylized NPR metallic surface material that could be used for logos and titles. The lustre of the gold is highly dependent on the lighting angle. Make sure to enable the Fusion 3D workspace "3D Options \> Lighting" mode so you see an accurate preview of the material in the realtime viewport.

![][image28-3]

kas\_HeatShield

"kas\_HeatShield" generates a super-heated plasma-like fresnel shading effect that can be used to create earth atmosphere re-entry shading effects for spacecraft or meteorites. The material can also be modified to augment the look of tracer bullets, incendiary rounds, or futuristic ballistic weaponry that need a plasma like heat bubble that wraps around the projectile.

When you render the "kas\_HeatShield" surface material, don't forget to explore adding an exponential glow effect to the final frame to increase the incandescent luminoous feel of the material. The "TextureMap" input connection on the node supports images with alpha channels which can punch holes through the final material for a patch-work shading effect.

If you want to see the kas\_HeatShield material with the same look as the thumbnail has, open the provided kas\_HeatShield.comp file located at "Reactor:/Deploy/Comps/KickAss ShaderZ/kas\_HeatShield.comp". 

This composite has a customized Light Rotate XYZ value on the kas\_ShaderBall node.


![][image29-3]

kas\_MetalGalvanized

"kas\_MetalGalvanized" creates an industrial sheet metal material.

![][image30-3]

kas\_MetalScuzzy

"kas\_MetalScuzzy" is a metallic material that has become dulled by a thick layer of dirt and grime.

![][image31-3]

kas\_Radioactive

"kas\_Radioactive" creates an irradiated material that is self-illuminated with a strong violet shade.

![][image32-4]

kas\_RustyNail

"kas\_RustyNail" creates a worn, oxidized steel material.

![][image33-3]

kas\_Xray

"kas\_Xray" creates a stylized and colourful NPR rendering effect of a medical X-ray material.

![][image34-3]

**Natural**

kas\_DarkBlueIceShard

"kas\_DarkBlueIceShard" creates a frosted blue icy material.

![][image35-4]

kas\_GreenEctoplasm

"kas\_GreenEctoplasm" is perfect for organic effects like semi-transparent gloopy liquids, or otherworldly paranormal objects.

![][image36-3]

kas\_IridescentBlue

"kas\_IridescentBlue" creates a luminous material with a saturated blue sheen, and a fresnel edge shading effect.

![][image37-2]

kas\_MarbleStone

"kas\_MarbleStone" creates a glossy tiled floor material. You can choose to render this stone with a full surface displacement effect on the mesh.

To get the displacement effect out of this material you need to add a Displace3D node and connect its "SceneInput" input to a 3D model's "3DData" output connection. Then connect the "kas\_MarbleStoneDisplace" node's "DisplacementTextureOutput" connection to the Displace3D node's "Input"connection. 

The strength of the displacement effect is controlled on the Displace3D node's scale attribute with a good starting value of approximately 0.02.

![][image38-2]

kas\_MarbleStone Asset Licenses:

Freeware:  
kas\_MarbleStone PBR Textures

By:  
https://www.textures.com

Is licensed under:  
CG Textures Freeware

Creative Commons:  
St. Nicholaus Church Interior HDRI

By:  
https://hdrmaps.com

Is licensed under:  
CC BY 2.0

kas\_OrganicMote

"kas\_OrganicMote" is perfect for stylized NPR rendering needs such as bio-medical visualization. If you are assigning this material to animated elements that are floating around and drifting slowly in your scene, make sure to enable motion blur and DoF bokeh blur in your renderings for added realism.

![][image39-2]

kas\_Ocean

"kas\_Ocean" macro creates a multi-spectral ocean material that combines an HDRI environment map with a simulated sub-surface translucent like shading layer.

![][image40-2]

kas\_Ocean Asset Licenses:

Simon's Town Rocks, Cape Town, South Africa IBL

Creative Commons:  
Simon's Town Rocks

By:  
https://hdrihaven.com/

Is licensed under:  
CC0 (Public Domain)

Anonymous Water Template

The Anonymous Water Template is the actual Fusion 3D water setup as it was used on Roland Emmerich's Anonymous (2011) film, courtesy of Uncharted Territory.

**SIGGRAPH 2012 Presentation on Anonymous:**  
https://www.youtube.com/watch?v=mOpN6C3ZrjY

kas\_RedBloodCell

"kas\_RedBloodCell" is perfect for stylized NPR rendering needs such as bio-medical visualization of high detail blood cells flowing in a bloodstream. 

If you are assigning this material to animated blood cells that are floating around and drifting slowly in your scene, make sure to enable motion blur and DoF bokeh blur in your renderings for added realism.

![][image41-2]

kas\_StoneWall

"kas\_StoneWall" creates a rough wall from fieldstone and mortar. You can choose to render this stone with a bump map, or with a full surface displacement effect on the mesh.

To get the displacement effect out of this material you need to add a Displace3D node and connect its "SceneInput" input to a 3D model' s "3DData" output connection. Then connect the "kas\_StoneWall" material' s "DisplacementTextureOutput" connection to the Displace3D node' s "Input" connection. 

The strength of the displacement effect is controlled on the Displace3D node's scale attribute with a good starting value of approximately 0.2.

![][image42-2]

kas\_MarbleStone Asset Licenses:

Freeware:  
kas\_StoneWall PBR Textures (Castle Stone Wall)

By:  
https://quixel.com/megascans

Is licensed under:  
Quixel Megascans Freeware

kas\_VelvetyMoss

"kas\_VelvetyMoss" is perfect for stylized NPR rendering organic elements such as bio-medical visualization.

![][image43-2]

kas\_VolcanicMagma

"kas\_VolcanicMagma" creates a super hot molten rock material. When you render this material, consider attaching a 2D glow effect to highlight the surface cracks that are luminous.

To get the displacement effect out of this material you need to add a Displace3D node and connect its "SceneInput" input to a 3D model' s "3DData" output connection. Then connect the "kas\_VolcanicMagma" material' s "DisplacementTextureOutput" connection to the Displace3D node' s "Input" connection.

The strength of the displacement effect is controlled on the Displace3D node's scale attribute with a good starting value of approximately 0.2.

![][image44-2]

**Utility**

kas\_IconSaver

"kas\_IconSaver" renders a Fusion v9 Bin window 130x100 px BMP format icon to the Comp PathMap folder. If you have HiQ enabled simply viewing this node will write you new bin icon to disk. 

This node is supposed to be connected directly to the "kas\_ShaderBall.Output" node's output connection.

The kas\_IconSaver node includes an integrated copy of the GreyCheckerboard macro. GreyCheckerboard is based upon the "Checkerboard" macro from the Muse Tools Library by Joe Laude.

![][image45-2]

kas\_GreyCheckerboard

"kas\_GreyCheckerboard" renders a preview shader swatch with a baked in grey checker background.

GreyCheckerboard is based upon the "Checkerboard" macro from the Muse Tools Library by Joe Laude.

![][image46-2]

kas\_ShaderBall

"kas\_ShaderBall" adds a shader ball model to your Fusion 3D system scene. It is used to apply and preview the look of surface materials. Make sure to enable the Fusion 3D workspace "3D Options \> Lighting" mode so you see an accurate preview of the material in the realtime viewport.

This node's output is supposed to be connected directly to the "kas\_ShaderPreview" nodes input connection so you can see a high-quality preview of your surface material.

![][image47-2]

kas\_ShaderBallDragon

"kas\_ShaderBallDragon" adds a Stanford Dragon model shader ball to your Fusion 3D system scene. It is used to apply and preview the look of surface materials. Make sure to enable the Fusion 3D workspace "3D Options \> Lighting" mode so you see an accurate preview of the material in the realtime viewport.

This node's output is supposed to be connected directly to the "kas\_ShaderPreview" nodes input connection so you can see a high-quality preview of your surface material.

The "DragonUVMap3D" node inside the GroupOperator allows you to adjust the UV layout on the model and its perfect for tweaking how the texture map is placed on the mode.

![][image48-2]

kas\_ShaderBallDragon Asset License:

By:  
The Stanford 3D Scanning Repository

Is licensed under:  
Public Domain

kas\_ShaderPreview

"kas\_ShaderPreview" is has a Renderer3D node inside is that renders a preview shader swatch with a baked-in grey checker background.

This node is supposed to be connected directly to the "kas\_ShaderBall.Output" node's output connection.

The kas\_ShaderPreview node includes an integrated copy of the GreyCheckerboard macro. GreyCheckerboard is based upon the "Checkerboard" macro from the Muse Tools Library by Joe Laude.

![][image49-2]

**HDRI**

kas\_Parkland

"kas\_Parkland" is an HDRI image of Egg mountain in Gory Sowie, Poland. The foreground of the image has a grassy field with smooth rolling mountains stretching upwards in the distance.

![][image50-3]

kas\_SimonsTownRocks

"kas\_SimonsTownRocks" is an HDRI image of a rocky coastal shoreline in Simon's Town, Cape Town, South Africa.

![][image51-2]

kas\_StNicholasChurch

"kas\_StNicholasChurch" is an HDRI image of the interior of the Dominican order's St. Nicholas Church in Gdańsk, Poland. The church was originally erected in 1227. The interior of the church currently features a baroque altar design with a black and golden colored theme.

![][image52-2]

# Copyright Credits

kas\_Parkland

Creative Commons:  
Egg mountain at afternoon

By:  
https://hdrmaps.com

Is licensed under:  
CC BY 2.0

Simon's Town Rocks, Cape Town, South Africa IBL

Creative Commons:  
Simon's Town Rocks

By:  
https://hdrihaven.com/

Is licensed under:  
CC0 (Public Domain)

St. Nicholas Church, Gdansk, Poland IBL

Creative Commons:  
St. Nicolaus Church Interior HDRI

By:  
https://hdrmaps.com

Is licensed under:  
CC BY 2.0

kas\_StoneWall

Freeware:  
kas\_StoneWall PBR Textures (Castle Stone Wall)

By:  
https://quixel.com/megascans

Is licensed under:  
Quixel Megascans Freeware

kas\_MarbleStone

Freeware:  
kas\_MarbleStone PBR Textures

By:  
https://www.textures.com

Is licensed under:  
CG Textures Freeware

Anonymous Water Template

The Anonymous Water Template is the actual Fusion 3D water setup as it was used on Roland Emmerich's Anonymous (2011) film, courtesy of Uncharted Territory.

**SIGGRAPH 2012 Presentation on Anonymous:**  
https://www.youtube.com/watch?v=mOpN6C3ZrjY

GreyCheckerboard

GreyCheckerboard is based upon the "Checkerboard" macro from the Muse Tools Library by Joe Laude.

kas\_ShaderBallDragon Asset License:

By:  
The Stanford 3D Scanning Repository

Is licensed under:  
Public Domain

**ShaderZ Texture Inputs**

There are two image input connections on most of the ShaderZ material nodes named "TextureMap" and "EnvironmentMap".

The "TextureMap" input connection allows you to supply your own imagery that will be applied as the base texture map. The "EnvironmentMap" input connection allows you to supply your own spherical environment image that will be visible as the reflected environment for the material.

![][image53-2]

Note: When imagery is connected to these inputs they are automatically activated and used inside the material via a pair of SwitchElse.fuse nodes that are packed inside the shader. The second you disconnect your imagery from the input connections the surface material defaults back to the internal default texture maps.

**Fusion Effects Tab**

In Fusion Studio Standalone you can access the KickAss ShaderZ by open up the "Effects" Tab. Then expand the "Templates \> KickAss ShaderZ \> Native ShaderZ \>" section. You can now select between a "Industrial", "Natural", and "Utility" set of surface materials.

You can drag/drop any of the items in this Templates list into your Nodes view and they will be instantly added to your composite.

![][image54-2]

Note: Try to make sure to drag the nodes to an open space in the Nodes view so the new material's node-based content doesn't co-mingle with your existing node graph and cause the content to pile up in an unsightly "heap of nodes". If this issue ever happens to you, all you have to do to rectify the situation is to hit the "Edit \> Undo \> " menu item to remove the most recently added nodes from the comp.

**Fusion Select Tool**

Pressing the "Shift + Spacebar" hotkey when Fusion's Nodes view is in focus will display a "Select Tool" dialog. Typing in "kas\_" is a quick way to filter the list of available nodes down to the content provided by the "KickAss ShaderZ" collection.

![][image55-2]

**KickAss ShaderZ Menu**

The "KickAss ShaderZ" root level menu system in Fusion Studio provides a quick way to access the full shader collection and the shader tools.

![][image56-2]

The KAS menu layout consists of the following entries:

KickAss ShaderZ \>

* Native ShaderZ \>
    * HDRI \>
        * kas\_Parkland
        * kas\_SimonsTownRocks
        * kas\_StNicholasChurch
    * Natural \>
        * kas\_DarkBlueIceShard
        * kas\_GreenEctoplasm
        * kas\_IridescentBlue
        * kas\_MarbleStone
        * kas\_OrganicMote
        * kas\_Ocean
        * kas\_RedBloodCell
        * kas\_StoneWall
        * kas\_VelvetyMoss
        * kas\_VolcanicMagma
    * Industrial \>
        * kas\_Atomic
        * kas\_Chrome
        * kas\_CobaltBlueCarbonFibre
        * kas\_GlassDeepBlue
        * kas\_GlassDeepRuby
        * kas\_GlassDirty
        * kas\_GlassQuartzScratched
        * kas\_Gold
        * kas\_HeatShield
        * kas\_MetalGalvanized
        * kas\_MetalScuzzy
        * kas\_Radioactive
        * kas\_RustyNail
        * kas\_Xray
    * Production
        * ...
    * Utilty \>
        * kas\_IconSaver
        * kas\_GreyCheckerboard
        * kas\_ShaderBall
        * kas\_ShaderBallDragon
        * kas\_ShaderPreview
* CustomShader3D ShaderZ \>
    * Install the CustomShader3D Plugin
    * ...
* PBR ShaderZ \>
    * ...
* Tools \>
    * Show KAS Docs
    * Show KAS Macros Folder
    * Show KAS Comps Folder
    * Show KAS Config Folder
    * Save Selection to Macro
    * Package ShaderZ for Reactor...
* Resources \>
    * KAS Documentation
    * KAS WSL Discussion
* Content Browser...
* About KickAss ShaderZ...

**KAS Tools**

Save Selection to Macro

The "KickAss ShaderZ \> Tools \> Save Selection to Macro" menu item exports the active Nodes view selection to a new Fusion "Macros" PathMap based ".setting" file on disk. This makes it a lot easier for comp artists to create and save out their own macros with less effort.

![][image57-2]

When you run the "Save Selection to Macro" menu item, a file save dialog appears. You can then type in a name for your new macro ".setting" file and choose a folder location where you want the macro saved to.

![][image58-2]

Whatever nodes are selected in the Nodes view are then instantly exported and pushed out to this new macro .setting file. Your newly saved macro is then opened up in the external script editor that is defined in the Fusion Preferences "Global and Default Settings \> Script \> Editor Path" section.

By opening up the macro file in an external text editor like Notepad++ (Windows) / BBEdit (macOS) / gedit (Linux) it is possible to add the final polish like adding a CustomData HelpPage entry, or renaming the input and output connections.

![][image1-11]



[image15]: image15.png width=451px height=261px

[image82]: image82.png width=36px height=36px

[image84]: image84.png width=40px height=40px

[image35]: image35.png width=39px height=39px

[image22]: image22.png width=37px height=36px

[image22-1]: image22.png width=37px height=36px

[image22-2]: image22.png width=37px height=36px

[image22-3]: image22.png width=37px height=36px

[image62]: image62.png width=37px height=31px

[image1]: image1.png width=38px height=38px

[image80]: image80.png width=40px height=40px

[image106]: image106.png width=37px height=37px

[image63]: image63.png width=39px height=36px

[image113]: image113.png width=38px height=38px

[image72]: image72.png width=35px height=34px

[image99]: image99.png width=451px height=216px

[image114]: image114.png width=451px height=193px

[image87]: image87.png width=451px height=278px

[image5]: image5.png width=451px height=278px

[image50]: image50.png width=451px height=370px

[image100]: image100.png width=451px height=147px

[image100-1]: image100.png width=451px height=147px

[image37]: image37.png width=451px height=242px

[image76]: image76.png width=451px height=156px

[image36]: image36.png width=451px height=337px

[image83]: image83.png width=451px height=337px

[image78]: image78.png width=451px height=337px

[image104]: image104.png width=360px height=210px

[image31]: image31.png width=360px height=210px

[image64]: image64.png width=451px height=252px

[image13]: image13.png width=451px height=210px

[image97]: image97.png width=451px height=210px

[image56]: image56.png width=348px height=428px

[image102]: image102.png width=426px height=570px

[image33]: image33.png width=451px height=167px

[image105]: image105.png width=451px height=300px

[image34]: image34.png width=451px height=323px

[image23]: image23.png width=371px height=290px

[image9]: image9.png width=371px height=290px

[image14]: image14.png width=371px height=290px

[image60]: image60.png width=371px height=290px

[image86]: image86.png width=371px height=290px

[image107]: image107.png width=451px height=476px

[image88]: image88.png width=446px height=333px

[image16]: image16.png width=446px height=333px

[image68]: image68.png width=446px height=333px

[image89]: image89.png width=446px height=333px

[image7]: image7.png width=446px height=333px

[image47]: image47.png width=451px height=431px

[image94]: image94.png width=451px height=201px

[image27]: image27.png width=374px height=291px

[image59]: image59.png width=374px height=291px

[image25]: image25.png width=374px height=291px

[image103]: image103.png width=374px height=291px

[image65]: image65.png width=374px height=291px

[image57]: image57.png width=451px height=290px

[image38]: image38.png width=451px height=286px

[image108]: image108.png width=374px height=294px

[image49]: image49.png width=374px height=294px

[image111]: image111.png width=374px height=294px

[image92]: image92.png width=374px height=294px

[image74]: image74.png width=374px height=294px

[image41]: image41.png width=374px height=294px

[image50-1]: image50.png width=451px height=370px

[image28]: image28.png width=451px height=126px

[image93]: image93.png width=451px height=160px

[image77]: image77.png width=451px height=311px

[image8]: image8.png width=451px height=345px

[image24]: image24.png width=451px height=322px

[image70]: image70.png width=451px height=143px

[image42]: image42.png width=451px height=368px

[image18]: image18.png width=309px height=351px

[image52]: image52.png width=451px height=427px

[image20]: image20.png width=395px height=376px

[image66]: image66.png width=451px height=371px

[image53]: image53.png width=451px height=185px

[image58]: image58.png width=451px height=230px

[image67]: image67.png width=451px height=233px

[image73]: image73.png width=451px height=233px

[image81]: image81.png width=451px height=233px

[image98]: image98.png width=451px height=501px

[image71]: image71.png width=451px height=347px

[image75]: image75.jpg width=78px height=136px

[image91]: image91.png width=451px height=146px

[image96]: image96.png width=451px height=244px

[image12]: image12.png width=158px height=143px

[image55]: image55.png width=124px height=124px

[image43]: image43.png width=451px height=255px

[image40]: image40.png width=451px height=278px

[image85]: image85.png width=451px height=236px

[image101]: image101.png width=451px height=438px

[image44]: image44.png width=451px height=613px

[image10]: image10.png width=451px height=509px

[image45]: image45.png width=451px height=146px

[image2]: image2.png width=451px height=244px

[image17]: image17.png width=431px height=268px

[image79]: image79.png width=451px height=390px

[image110]: image110.png width=451px height=105px

[image21]: image21.png width=451px height=322px

[image29]: image29.png width=451px height=165px

[image69]: image69.png width=451px height=245px

[image32]: image32.png width=385px height=73px

[image19]: image19.png width=430px height=190px

[image48]: image48.png width=397px height=176px

[image46]: image46.png width=389px height=398px

[image90]: image90.png width=451px height=261px

[image109]: image109.png width=451px height=261px

[image6]: image6.png width=451px height=261px

[image26]: image26.png width=365px height=139px

[image54]: image54.png width=451px height=402px

[image11]: image11.png width=389px height=220px

[image61]: image61.png width=389px height=53px

[image39]: image39.png width=389px height=105px

[image112]: image112.png width=451px height=245px

[image4]: image4.png width=451px height=245px

[image51]: image51.png width=451px height=83px

[image30]: image30.png width=449px height=350px

[image8-1]: image8.png width=263px height=184px

[image10-1]: image10.png width=402px height=173px

[image58-1]: image58.png width=44px height=44px

[image50-2]: image50.png width=48px height=48px

[image25-1]: image25.png width=44px height=44px

[image65-1]: image65.png width=53px height=53px

[image53-1]: image53.png width=52px height=52px

[image47-1]: image47.png width=43px height=43px

[image44-1]: image44.png width=38px height=38px

[image19-1]: image19.png width=50px height=50px

[image13-1]: image13.png width=48px height=46px

[image70-1]: image70.png width=45px height=37px

[image23-1]: image23.png width=42px height=42px

[image34-1]: image34.png width=43px height=37px

[image1-1]: image1.png width=35px height=34px

[image30-1]: image30.png width=451px height=195px

[image45-1]: image45.png width=104px height=224px

[image37-1]: image37.png width=101px height=264px

[image54-1]: image54.png width=451px height=344px

[image55-1]: image55.png width=238px height=251px

[image39-1]: image39.png width=107px height=266px

[image18-1]: image18.png width=451px height=163px

[image35-1]: image35.png width=451px height=147px

[image56-1]: image56.png width=241px height=365px

[image12-1]: image12.png width=244px height=224px

[image2-1]: image2.png width=245px height=92px

[image64-1]: image64.png width=451px height=195px

[image20-1]: image20.png width=302px height=404px

[image43-1]: image43.png width=233px height=292px

[image36-1]: image36.png width=451px height=221px

[image46-1]: image46.png width=447px height=68px

[image9-1]: image9.png width=111px height=134px

[image22-4]: image22.png width=195px height=245px

[image4-1]: image4.png width=197px height=205px

[image5-1]: image5.png width=195px height=152px

[image29-1]: image29.png width=195px height=178px

[image62-1]: image62.png width=199px height=299px

[image41-1]: image41.png width=191px height=303px

[image15-1]: image15.png width=451px height=384px

[image48-1]: image48.png width=286px height=132px

[image16-1]: image16.png width=101px height=86px

[image66-1]: image66.png width=451px height=303px

[image27-1]: image27.png width=451px height=351px

[image26-1]: image26.png width=451px height=228px

[image57-1]: image57.png width=451px height=198px

[image49-1]: image49.png width=451px height=488px

[image52-1]: image52.png width=103px height=266px

[image61-1]: image61.png width=451px height=437px

[image67-1]: image67.png width=389px height=89px

[image69-1]: image69.png width=451px height=431px

[image24-1]: image24.png width=317px height=359px

[image21-1]: image21.png width=451px height=113px

[image63-1]: image63.png width=451px height=85px

[image14-1]: image14.png width=312px height=337px

[image3]: image3.png width=316px height=338px

[image51-1]: image51.png width=163px height=194px

[image11-1]: image11.png width=161px height=192px

[image32-1]: image32.png width=321px height=214px

[image28-1]: image28.png width=212px height=172px

[image7-1]: image7.png width=217px height=291px

[image42-1]: image42.png width=226px height=255px

[image17-1]: image17.png width=451px height=206px

[image33-1]: image33.png width=277px height=175px

[image60-1]: image60.png width=192px height=181px

[image38-1]: image38.png width=230px height=195px

[image31-1]: image31.png width=190px height=364px

[image59-1]: image59.png width=451px height=271px

[image68-1]: image68.png width=325px height=251px

[image40-1]: image40.png width=451px height=279px

[image6-1]: image6.png width=451px height=263px

[image36-2]: image36.png width=71px height=71px

[image30-2]: image30.png width=64px height=64px

[image20-2]: image20.png width=451px height=257px

[image32-2]: image32.png width=451px height=128px

[image2-2]: image2.png width=451px height=117px

[image24-2]: image24.png width=451px height=257px

[image3-1]: image3.png width=451px height=74px

[image18-2]: image18.png width=451px height=118px

[image17-2]: image17.png width=451px height=127px

[image11-2]: image11.png width=451px height=110px

[image26-2]: image26.png width=451px height=116px

[image7-2]: image7.png width=451px height=117px

[image1-2]: image1.png width=451px height=79px

[image6-2]: image6.png width=413px height=146px

[image5-2]: image5.png width=451px height=106px

[image23-2]: image23.png width=451px height=156px

[image22-5]: image22.png width=354px height=608px

[image35-2]: image35.png width=451px height=382px

[image15-2]: image15.png width=224px height=390px

[image13-2]: image13.png width=451px height=123px

[image28-2]: image28.png width=451px height=260px

[image33-2]: image33.png width=451px height=347px

[image14-2]: image14.png width=451px height=637px

[image29-2]: image29.png width=451px height=145px

[image21-2]: image21.png width=451px height=134px

[image27-2]: image27.png width=451px height=99px

[image16-2]: image16.png width=375px height=179px

[image31-2]: image31.png width=451px height=69px

[image19-2]: image19.png width=451px height=69px

[image12-2]: image12.png width=451px height=233px

[image34-2]: image34.png width=308px height=131px

[image9-2]: image9.png width=200px height=212px

[image25-2]: image25.png width=451px height=260px

[image8-2]: image8.png width=451px height=152px

[image4-2]: image4.png width=451px height=127px

[image10-2]: image10.png width=451px height=135px

[image20-3]: image20.png width=451px height=257px

[image32-3]: image32.png width=451px height=128px

[image2-3]: image2.png width=451px height=117px

[image24-3]: image24.png width=451px height=257px

[image3-2]: image3.png width=451px height=74px

[image18-3]: image18.png width=451px height=118px

[image17-3]: image17.png width=451px height=127px

[image11-3]: image11.png width=451px height=110px

[image26-3]: image26.png width=451px height=116px

[image7-3]: image7.png width=451px height=117px

[image1-3]: image1.png width=451px height=79px

[image6-3]: image6.png width=413px height=146px

[image5-3]: image5.png width=451px height=106px

[image23-3]: image23.png width=451px height=156px

[image22-6]: image22.png width=354px height=608px

[image35-3]: image35.png width=451px height=382px

[image17-4]: image17.png width=451px height=264px

[image18-4]: image18.png width=451px height=338px

[image5-4]: image5.png width=451px height=405px

[image9-3]: image9.png width=451px height=405px

[image15-3]: image15.png width=451px height=405px

[image7-4]: image7.png width=451px height=338px

[image19-3]: image19.png width=451px height=338px

[image6-4]: image6.png width=451px height=338px

[image16-3]: image16.png width=451px height=338px

[image13-3]: image13.png width=451px height=303px

[image8-3]: image8.png width=451px height=303px

[image1-4]: image1.png width=451px height=303px

[image11-4]: image11.jpg width=451px height=451px

[image3-3]: image3.jpg width=451px height=451px

[image12-3]: image12.jpg width=451px height=451px

[image2-4]: image2.jpg width=451px height=451px

[image4-3]: image4.jpg width=451px height=451px

[image14-3]: image14.jpg width=451px height=451px

[image10-3]: image10.png width=451px height=295px

[image20-4]: image20.jpg width=451px height=451px

[image2-5]: image2.png width=451px height=197px

[image4-4]: image4.png width=451px height=240px

[image5-5]: image5.png width=451px height=114px

[image7-5]: image7.png width=451px height=65px

[image1-5]: image1.png width=451px height=130px

[image3-4]: image3.png width=259px height=134px

[image6-5]: image6.png width=346px height=152px

[image3-5]: image3.png width=468px height=207px

[image22-7]: image22.png width=468px height=263px

[image21-3]: image21.png width=468px height=263px

[image20-5]: image20.png width=468px height=263px

[image12-4]: image12.png width=468px height=149px

[image16-4]: image16.png width=392px height=361px

[image22-8]: image22.png width=468px height=263px

[image14-4]: image14.png width=202px height=368px

[image13-4]: image13.png width=468px height=174px

[image18-5]: image18.png width=390px height=344px

[image1-6]: image1.png width=468px height=119px

[image6-6]: image6.png width=468px height=263px

[image8-4]: image8.png width=468px height=78px

[image4-5]: image4.png width=468px height=72px

[image20-6]: image20.png width=468px height=263px

[image7-6]: image7.png width=468px height=146px

[image9-4]: image9.png width=392px height=358px

[image21-4]: image21.png width=468px height=263px

[image15-4]: image15.png width=227px height=374px

[image5-6]: image5.png width=468px height=175px

[image2-6]: image2.png width=391px height=340px

[image10-4]: image10.png width=468px height=130px

[image19-4]: image19.png width=468px height=263px

[image11-5]: image11.png width=468px height=68px

[image17-5]: image17.png width=468px height=67px

[image6-7]: image6.png width=451px height=240px

[image5-7]: image5.png width=451px height=278px

[image9-5]: image9.png width=451px height=171px

[image8-5]: image8.png width=451px height=168px

[image7-7]: image7.png width=451px height=132px

[image3-6]: image3.png width=451px height=106px

[image1-7]: image1.png width=173px height=101px

[image4-6]: image4.png width=451px height=481px

[image2-7]: image2.png width=451px height=268px

[image10-5]: image10.png width=451px height=299px

[photoshop-actions-list]: photoshop-actions-list.png width=284px height=644px

[1install-window-actions-menu-item]: 1install-window-actions-menu-item.png

[2load-actions-menu-item]: 2load-actions-menu-item.png

[3load-actions-dialogue]: 3load-actions-dialogue.png

[4actions-loaded]: 4actions-loaded.png

[5switch-to-button-mode]: 5switch-to-button-mode.png

[Rotate-90-Degrees-Action]: Rotate-90-Degrees-Action.jpg

[Rotate-90-Degrees-Action2]: Rotate-90-Degrees-Action2.jpg

[Rotate-180-Degrees-Action]: Rotate-180-Degrees-Action.jpg

[Rotate-180-Degrees-Action2]: Rotate-180-Degrees-Action2.jpg

[Horizontal-Offset-1024-Pixels-Action]: Horizontal-Offset-1024-Pixels-Action.jpg

[Horizontal-Offset-1024-Pixels-Action2]: Horizontal-Offset-1024-Pixels-Action2.jpg

[Vertical-Offset-1024-Pixels-Action]: Vertical-Offset-1024-Pixels-Action.jpg

[Vertical-Offset-1024-Pixels-Action2]: Vertical-Offset-1024-Pixels-Action2.jpg

[Horizontal-and-Vertical-Offset-1024-Pixels]: Horizontal-and-Vertical-Offset-1024-Pixels.jpg

[Inverse-Angular-Fisheye]: Inverse-Angular-Fisheye.jpg

[Angular-Fisheye-to-Equirectangular-Action]: Angular-Fisheye-to-Equirectangular-Action.jpg

[Angular-Fisheye-to-2to1-Equirectangular-Action]: Angular-Fisheye-to-2to1-Equirectangular-Action.jpg

[180-Domemaster-to-2to1-Equirectangular-Action]: 180-Domemaster-to-2to1-Equirectangular-Action.jpg

[Equirectangular-to-Angular-Fisheye-Action]: Equirectangular-to-Angular-Fisheye-Action.jpg

[Equirectangular-to-Angular-Fisheye-Action-1]: Equirectangular-to-Angular-Fisheye-Action.jpg

[2to1-Equirectangular-to-180-Domemaster-Action]: 2to1-Equirectangular-to-180-Domemaster-Action.jpg

[3x2-cubemap-action]: 3x2-cubemap-action.jpg

[vertical-cross-cubemap-action]: vertical-cross-cubemap-action.jpg

[horizontal-cross-cubemap-action]: horizontal-cross-cubemap-action.jpg

[vertical-tee-cubemap-action]: vertical-tee-cubemap-action.jpg

[horizontal-tee-cubemap-action]: horizontal-tee-cubemap-action.jpg

[vertical-strip-cubemap-action]: vertical-strip-cubemap-action.jpg

[horizontal-strip-cubemap-action]: horizontal-strip-cubemap-action.jpg

[mr-horizontal-strip-to-cubemap-action]: mr-horizontal-strip-to-cubemap-action.jpg

[gearvr-horizontal-strip-to-cubemap-action]: gearvr-horizontal-strip-to-cubemap-action.jpg

[cubemap-3x2-cube-action]: cubemap-3x2-cube-action.jpg

[cubemap-vertical-cross-action]: cubemap-vertical-cross-action.jpg

[cubemap-horizontal-cross-action]: cubemap-horizontal-cross-action.jpg

[cubemap-vertical-tee-action]: cubemap-vertical-tee-action.jpg

[cubemap-horizontal-tee-action]: cubemap-horizontal-tee-action.jpg

[cubemap-vertical-strip-action]: cubemap-vertical-strip-action.jpg

[cubemap-horizontal-strip-action]: cubemap-horizontal-strip-action.jpg

[cubemap-to-mr-horizontal-strip-action]: cubemap-to-mr-horizontal-strip-action.jpg

[cubemap-to-gearvr-horizontal-strip-action]: cubemap-to-gearvr-horizontal-strip-action.jpg

[cubemap-rotate-x90-action]: cubemap-rotate-x90-action.jpg

[cubemap-rotate-x90-layers]: cubemap-rotate-x90-layers.jpg

[cubemap-rotate-y90-action]: cubemap-rotate-y90-action.jpg

[cubemap-rotate-y90-layers]: cubemap-rotate-y90-layers.jpg

[cubemap-rotate-z90-action]: cubemap-rotate-z90-action.jpg

[cubemap-rotate-z90-layers]: cubemap-rotate-z90-layers.jpg

[Select-All-Action]: Select-All-Action.jpg

[Inside-Circular-50-Percent-Mask-Action]: Inside-Circular-50-Percent-Mask-Action.jpg

[Outside-Circular-50-Percent-Mask-Action]: Outside-Circular-50-Percent-Mask-Action.jpg

[Fisheye-Alpha-Channel-Action]: Fisheye-Alpha-Channel-Action.jpg

[Fisheye-Layer-Mask-Action]: Fisheye-Layer-Mask-Action.jpg

[Layer-Mask-From-Selection-Action]: Layer-Mask-From-Selection-Action.jpg

[Layer-Mask-From-Selection-Action2]: Layer-Mask-From-Selection-Action2.jpg

[Layer-Mask-From-Inverse-Selection-Action]: Layer-Mask-From-Inverse-Selection-Action.jpg

[Layer-Mask-From-Inverse-Selection-Action2]: Layer-Mask-From-Inverse-Selection-Action2.jpg

[Enable-Layer-Mask-Action]: Enable-Layer-Mask-Action.jpg

[Disable-Layer-Mask-Action]: Disable-Layer-Mask-Action.jpg

[Delete-Layer-Mask-Action]: Delete-Layer-Mask-Action.jpg

[4-x-4-Grid-Guide-Action]: 4-x-4-Grid-Guide-Action.jpg

[4-x-4-Grid-Guide-Action2]: 4-x-4-Grid-Guide-Action2.jpg

[Clear-Guides-Action]: Clear-Guides-Action.jpg

[Invert-Colors-Action]: Invert-Colors-Action.jpg

[Background-to-Layer-Action]: Background-to-Layer-Action.jpg

[image3-7]: image3.png width=238px height=195px

[image5-8]: image5.png width=195px height=195px

[image1-8]: image1.png width=451px height=244px

[image6-8]: image6.png width=298px height=357px

[image2-8]: image2.png width=231px height=199px

[image4-7]: image4.png width=222px height=405px

[filephp]: filephp.png

[filephp-1]: filephp.png

[filephp-2]: filephp.png

[filephp-3]: filephp.png

[filephp-4]: filephp.png

[filephp-5]: filephp.png

[filephp-6]: filephp.png

[filephp-7]: filephp.png width=480px height=133px

[filephp-8]: filephp.png

[filephp-9]: filephp.png

[filephp-10]: filephp.png

[filephp-11]: filephp.png

[filephp-12]: filephp.png

[filephp-13]: filephp.png

[filephp-14]: filephp.png

[filephp-15]: filephp.png

[filephp-16]: filephp.png width=1440px height=763px

[filephp-17]: filephp.png width=805px height=134px

[filephp-18]: filephp.png width=860px height=545px

[filephp-19]: filephp.png

[banana]: banana.png

[filephp-20]: filephp.png

[filephp-21]: filephp.png

[image3-8]: image3.png width=451px height=520px

[image5-9]: image5.png width=193px height=84px

[image4-8]: image4.png width=214px height=41px

[image1-9]: image1.png width=193px height=73px

[image2-9]: image2.png width=131px height=116px

[image1-10]: image1.png width=468px height=218px

[image2-10]: image2.png width=451px height=167px

[image3-9]: image3.png width=451px height=331px

[image4-9]: image4.png width=451px height=144px

[image5-10]: image5.png width=451px height=201px

[image6-9]: image6.png width=269px height=155px

[image7-8]: image7.png width=130px height=35px

[image8-6]: image8.png width=385px height=121px

[image6-10]: image6.png width=269px height=155px

[image9-6]: image9.png width=264px height=47px

[image10-6]: image10.png width=264px height=19px

[image11-6]: image11.png width=264px height=20px

[image12-5]: image12.png width=289px height=233px

[image13-5]: image13.png width=264px height=18px

[image14-5]: image14.png width=387px height=132px

[image15-5]: image15.png width=264px height=19px

[image16-5]: image16.png width=23px height=23px

[image17-6]: image17.png width=236px height=23px

[image18-6]: image18.png width=304px height=284px

[image19-5]: image19.png width=451px height=196px

[image20-7]: image20.png width=468px height=162px

[image21-5]: image21.png

[image22-9]: image22.png

[image23-4]: image23.png

[image24-4]: image24.png

[image25-3]: image25.png

[image26-4]: image26.png

[image27-3]: image27.png

[image28-3]: image28.png

[image29-3]: image29.png

[image30-3]: image30.png

[image31-3]: image31.png

[image32-4]: image32.png

[image33-3]: image33.png

[image34-3]: image34.png

[image35-4]: image35.png

[image36-3]: image36.png

[image37-2]: image37.png

[image38-2]: image38.png

[image39-2]: image39.png

[image40-2]: image40.png

[image41-2]: image41.png

[image42-2]: image42.png

[image43-2]: image43.png

[image44-2]: image44.png

[image45-2]: image45.png

[image46-2]: image46.png

[image47-2]: image47.png

[image48-2]: image48.png

[image49-2]: image49.png

[image50-3]: image50.png

[image51-2]: image51.png

[image52-2]: image52.png

[image53-2]: image53.png

[image54-2]: image54.png width=468px height=215px

[image55-2]: image55.png

[image56-2]: image56.png width=468px height=191px

[image57-2]: image57.png width=468px height=234px

[image58-2]: image58.png width=468px height=202px

[image1-11]: image1.png width=477px height=495px