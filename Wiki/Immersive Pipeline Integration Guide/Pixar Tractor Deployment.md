---
tags: [export, export-scrivener, revise]
prev: AWS Deadline Deployment
next: Installing Common Utilities
---

Pixar's Tractor render management tool is often installed and used alongside Pixar's RenderMan production renderer on Linux based headless render nodes.

<https://renderman.pixar.com/tractor>

A tractor license entitlement is often provided with RenderMan commercial licenses. This is defined as a "FeatureInfo" block in your Pixar.license file:

\<FeatureInfo\>

\<FeatureName\>Tractor\</FeatureName\>

\<FeatureVersion\>2.000\</FeatureVersion\>

\<ExpirationDate\>22-jul-2023\</ExpirationDate\>

\<FeatureCount\>10\</FeatureCount\>

\<FeatureCode\>...\</FeatureCode\>

\<ExtraData\>\</ExtraData\>

\</FeatureInfo\>

Tractor is also available separately as a standalone offering which can be purchased with maintenance from the Pixar RenderMan team sales staff.

### Controlling Tractor

Controlling Tractor

Tractor can be controlled from a WebUI, as well as from a terminal based command-line session, or Python scripting.

![[image147.png]]

### Tractor and macOS Port Ranges

Tractor and macOS Port Ranges

When running Tractor Blade on macOS systems it is important to change the default port number from trying to open a new connection to port 80. A popular alternative port number to use is 8080.

For compatibility reasons, a higher port range number has to be defined manually in the Tractor preference files to avoid Tractor communication messages being blocked by the macOS network rules.

The command-line syntax to start a Tractor Blade engine on port 8080 is:

\# Start Tractor Blade

/opt/pixar/Tractor-2.4/bin/tractor-blade --engine=tractor-engine:8080 &