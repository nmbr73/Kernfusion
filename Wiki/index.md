
# Welcome to total ConFusion
*Everything VFx and such.*

> [!hint] Status
> **Current status** is: Not much in here yet, but already a total mess.
> **Long term goal** is: To shred it all in favor of a better solution.



## Quickstart Guide


### Clone the repository

Working on the Wiki is currently coordinated and version controlled using Git. Get your own full copy by cloning [the repository](https://github.com/nmbr73/Kernfusion):

=== "gh"
	```bash
	gh repo clone nmbr73/Kernfusion
	```
=== "git"
	```bash
	git clone https://github.com/nmbr73/Kernfusion
	```

Or you may want to fork it on GitHub first ... that's if you are considering to contribute ... and you really should consider to contribute!


### Install [Obsidian.md](https://obsidian.md)

Obsidian is a cross platform note taking app, that behind the scenes works with Markdown. This makes it an okay choice for editing the Wiki content.

=== "macOS (Homebrew)"
	```bash
	brew install --cask obsidian
	```
=== "macOS/Windows/Linux"
	Download and run the Installer from [Obsidian.md](https://obsidian.md).

Open the `Wiki/` folder as a so called "Vault" in Obsidian.
Use ++cmd+e++ (on a Mac) or ??? (on Windows) to switch between edit/preview mode.
Note that not all Markdown features used for the Wiki are supported in Obsidian.


### Get MkDocs up and running

MkDocs creates static HTML pages out of the Markdown files - and in the end that exactly is what you see when you open [confusion.nmbr73.net](http://confusion.nmbr73.net/)

=== "macOS"
	```bash
	cd Kernfusion
	chmod +x ./mk
	python3 -m venv venv
	source venv/bin/activate
	pip install -r requirements.txt
	```
=== "Windows"
	Curious to hear if someone was brave enough to try to run th following it via MINGW64 / Git Bash, WSL2, or whatever.
	```bash
	cd Kernfusion
	chmod +x ./mk
	python3 -m venv venv
	source venv/bin/activate
	pip install -r requirements.txt
	```
	... good luck!
=== "Linux"
	In theory it should be the same as for macOS:
	```bash
	cd Kernfusion
	chmod +x ./mk
	python3 -m venv venv
	source venv/bin/activate
	pip install -r requirements.txt
	```
	... let me know if it works!

Now you can run `./mk docs serve` to locally check the MkDocs output of your working copy.
Whenever you make a change to the Wiki you want to inspect, do a `./mk docs create` in another terminal window.


<!--

# Welcome to the Kernfusion (yet not a) Wiki!

Yet nothing usable to be found here ... still nothing more than my personal notebook / scribbling pad. ...

* [[Event-Functions]]
* [[AddControlPage]]
* [[MultiButtonControl]]
* [[WebGL to DCTL|WebGL to DCTL]]

-->

