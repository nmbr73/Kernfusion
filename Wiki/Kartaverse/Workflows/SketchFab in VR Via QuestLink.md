---
author: Andrew Hazelden
tags:
  - Kartaverse
  - Workflow
  - .scrivener-export
---

> [!wiki-todo]- Scrivener Export - Reformatting Needed!
> This article is an export of a Scrivener document. It will definitely need at least some reformatting to work in Obsidian and MkDocs. Delete this note once the article's formatting  has been fixed to some extent.

# SketchFab in VR Via QuestLink

If you have a SketchFab 3D scene you want to explore in VR, you might need to use your PC to do the actual rendering. In this case, the free Oculus Link drivers for Windows 10/11 allows you to connect your PC to a Meta Quest HMD via WiFi or a long USB-C cable.

**YouTube \| Explore the Cave-verse via QuestLink**

<https://youtu.be/QI9f_PrWK_A>

### Install the Oculus Drivers for Windows

Install the Oculus Drivers for Windows

Start by going to the [Meta2 Website](https://www.meta.com/ca/quest/setup/). Click the blue "Download Software" button part way down the webpage.

![[image17__fix6.png]]

After you download the "`OculusSetup.exe`" program, run the installer.

![[image18__fix5.png]]

You can use either a Facebook or Instagram account for signing into your Oculus account on Windows. I went with my existing Facebook account.

![[image5__fix8.png]]

The Facebook website then offers to set up a "Meta" account.

![[image9__fix6.png]]

After the Meta account was configured the webpage offers to pass those credentials over to the Oculus application running on your PC.

![[image15__fix4.png]]

The rest of the Quest install process is done by clicking continue a few more times.

![[image7__fix7.png]]

You need to select the model of Meta/Oclus HMD you are using. This will typically be a Quest 2 HMD or a Quest 1 HMD.

![[image19__fix3.png]]

Then you can choose to connect from the PC via a long USB-C Cable "Link" or via WIFI v6 connection using "AirLink (Wireless)".

![[image6__fix7.png]]

The setup program will now exit.

![[image16__fix4.png]]

### Configure OpenXR on Windows

Configure OpenXR on Windows

You now need to enable the OpenXR runtime which allows desktop PC programs to use the VR HMD. This can be done by clicking on the header bar at the top of the window.

![[image13__fix5.png]]

Next to the heading "OpenXR Runtime" click "Set Oculus as active".

![[image8__fix6.png]]

### Pair your Quest HMD

Pair your Quest HMD

Now you can start pairing the HMD to your PC.

![[image1__fix10.png]]

On the Meta Quest HMD open the "Settings" button. You can toggle between AirLink (Wifi) and a USB-C cable connection if you need to in the "Experimental" tab.

![[image11.jpg]]![[image3.jpg]]

### Enabling AirLink on the Quest

Enabling AirLink on the Quest

The Quest's control panel view has a handy "AirLink" button on the right side of the window.

![[image12.jpg]]

With AirLink you can connect via a fast WiFi v6 link to Windows PCs on your local network that are running the Oculus Link software.

![[image2.jpg]]

### Connect in VR to your Desktop PC

Connect in VR to your Desktop PC

On the HMD you can press the "Desktop" icon in the toolbar to see a live screenshot of your PC monitor. This makes it easier to load the SketchFab website in Google Chrome using your Quest hand controllers to click the buttons.

![[image4.jpg]]

With Google Chrome open, you can now press the "VR" button on a 3D model and beam that content directly to your Quest HMD. This is possible due to the magic of OpenXR running in a web browser session.

![[image14.jpg]]

The first time you view a webpage in VR with the HMD connected, you may be asked to allow VR devices to work with Chrome. Click "Allow" to continue.

![[image10__fix4.png]]

### Wander Around in your VR Scenes

Wander Around in your VR Scenes

Now you can roam around in SketchFab 3D scenes using VR on your Quest. The native Quest head tracking feature still works in "Room-scale" 6DoF VR with AirLink, and it even supports the use of your hand-controllers as an input device to teleport your character controller around the environment.

Since you are using your desktop PC to render the 3D content when AirLink is active, you can load far larger scenes using your PC's GPU and its many gigabytes of onboard VRAM to do the heavy lifting.

![[image20.jpg]]

I hope this guide allows you to have fun exploring vast virtual worlds that are streamed from the web.

**SketchFab \| Las Cabras Cave 3D Scene**

<https://sketchfab.com/3d-models/las-cabras-cave-mobile-edition-d15457a4df734093953eb470259d640c>