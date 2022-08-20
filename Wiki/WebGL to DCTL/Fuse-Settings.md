> This is specific to the Fuses in this repository!

<!--
- **FC_CATEGORY** is the 'Add tools...' submenu name and must correspond to the Fuse's subdirectory (BlobShader, AbstractShader, MiscShader, ObjectShader). _Set this to the Fuses subdirectory name._
- **FC_SHORTCUT** true, if a shortcut (e.g. DTD for DancyTreeDoodle) should be used as OpIconString; if such a shortcut does not exist or the FC_SHORTCUT is set to false, the Shadertoy ID is used as OpIconString.
- **FC_DEVEVELOP** set to 'true' to display reload/edit buttons in inspector; is replaced with 'false' by the installer to hide these buttons for users.
- **FC_INFOBTN** show button to open the project page -1 on top, 0 hide, 1 on bottom
- **FC_PREFIX** set to "ST"; is replaced by 'BETA' for user downloads and by "" if it goes officially into the reactor
- **FC_SCPREFIX** prefix that is prepended to the OpIconString. _Maybe best to just set this to FC_SCPREFIX=FC_PREFIX_
- **FC_SUBMENU** main menu item for the 'Add tools..' menu; you may want to prepend e.g. "Fuses\\" to not have the Shadertoys on your 'Add tool...' toplevel menu. _Advise is to set it to "Shadertoys" for the development version._

Todo ...

local shadertoy_name      = "FunWithMetaballs"
local shadertoy_author    = "fwilliams"
local shadertoy_id        = "MlyXWV"
local shadertoy_license   = ""
local dctlfuse_name       = "FunWithMetaballs"
local dctlfuse_author     = "JiPi"
local dctlfuse_authorurl  = "https://www.youtube.com/channel/UCItO4q_3JgMVV2MFIPDGQGg"
local dctlfuse_infourl    = "https://github.com/nmbr73/Shadertoys"
local dctlfuse_versionNo   = 1
local dctlfuse_versionDate = "23 Feb 2021"
-->


Trying to reorganize the settings to have ...
- as many values as possible equipped with defaults so that a minimum of information must be given for the dev version<br />
- the variable names are more consistent

All `FC_` variables are overwritten by the installer. That means they only take effect in development mode.


### Example

```Lua
-- MANDATORY ----------------------------------------------
local shadertoy_name       = "Favela"
local shadertoy_author     = "duvengar"
local shadertoy_id         = "ldGcDh"
local shadertoy_license    = "Favela by Julien Vergnaud @duvengar-2018 (CC BY-NC-SA 3.0)"
local dctlfuse_name        = shadertoy_name
local dctlfuse_category    = "AbstractShader"
local dctlfuse_author      = "nmbr73"
-- OPTIONAL -----------------------------------------------
local dctlfuse_authorurl   = "https://www.youtube.com/c/nmbr73"
local dctlfuse_versionNo   = 42
local dctlfuse_versionDate = "March 2020"
-- local dctlfuse_infourl     = "https://letmegooglethat.com/?q=Favela"
-- local dctlfuse_company     = "nmbr73"  -- defaults to dctlfuse_author
-- local dctlfuse_shortcut    = "FV"      -- unused
-- local dctlfuse_authorlogo = 'width="212" height="41" src="data:image/png;base64,..."'

```

### Mandatory Settings

#### shadertoy_name

Name of the shadertoy. Should be the original name if possible.

#### shadertoy_author

The shadertoy author's login name on shadretoy.com.

#### shadertoy_id

ID (end of the URL on Shadertoy.com) of the shadertoy.

#### shadertoy_license

License text according to the license information found in the shadertoy's source code. Set to "" to excplicitely indicate that no such information was provided in the original code (in this case it is set to 'CC BY-NC-SA 3.0' as this is the shadertoy.com's default).

#### dctlfuse_name

Advise is to set this to `shadertoy_name` if and only if the shadertoy name is suitable as a unique fuse identifier (such a fuse name may only contain alphanumeric characters and an underscore, must not start with a digit, and should not be all too long). Otherwise choose an appropriate fuse name here. Should correspont to the fuse's file name.

#### dctlfuse_category (overwritten by FC_CATEGORY)

Set this to the fuse's folder name. It's overwritten, but it's a must-have for the development version to work properly.

#### dctlfuse_author

Name of the developer who did the original port of this fuse.







### Optional Settings

Recommendation is:
- you should set `dctlfuse_authorurl`
- you could set `dctlfuse_versionNo` and `dctlfuse_versionDate`
- you must set `dctlfuse_infourl` if and only if needed

#### dctlfuse_authorurl

Some URL related to the author of he fuse. If not present, then this will just direct to the GitHub per default, but it is recommended that you set it to something more specific.

#### dctlfuse_versionNo (overwritten by FC_VERSIONNO)

The version number for this fuse. But it's maybe better to derive this automatically from the repository's commit log in future.

#### dctlfuse_versionDate (overwritten by FC_VERSIONDATE)

The date of the last major change on this fuse (corresponding to `dctlfuse_versionNo`). We may consider to incorporate it in future again. On the other hand, if it makes sense to mention the date, it could make more sense to just derive it from the commit log.

#### dctlfuse_infourl

If not present then the code combines the other (mandatory) information to build the GitHub Pages ULR for the fuse. It's recommended to set this variable if and only if this does not work - e.g. because the fuse name does not correspond to the filename. Or if you just want to see your very own page for this fuse instead of the GitHub.

#### dctlfuse_shortcut (unused)

This variable was previously defined, but is currently not used. It is kept in the code if present to not lose the information, but is are ignored for the time beeing. We may consider to incorporate it in future again.

#### dctlfuse_authorlogo (overwrites FC_AUTHORLOGO)

You can set `dctlfuse_authorlogo="width=\"212\" height=\"41\" src=\"data:image/png;base64,...\""` with `...` the base64 encoded image data and width and height set to the correct values to use a custom logo. Use `dctlfuse_authorlogo=""` to avoid that the installer inserts a logo here automatically.

#### dctlfuse_company

Only used in the fuse decription. Defaults to dctlfuse_author. But you can set a company name here if you want to have this instead of your name shown e.g. in Fusion's about dialog.






### Installer Settings

Don't set these variables! They have defaults suitable for 'dev' (so everything should work as expected when DaFusion uses the fuses for development straight out of the repository). And for the other cases they are all overwritten by the installer anyways. They are documented here just in caes you want to try out different settings - bit don't forget to remove the definitions and assignments before you run an installer or commit your changes! Some of these can be overwritten by 'Optional Settings' (see above).


#### FC_CATEGORY

Development: `dctlfuse_category`<br />
Installed: _based on folder name_<br />
Released: _based on folder name_<br />
Published: _based on folder name_

Defaults to `dctlfuse_category`. This is the 'Add tools...' submenu name and should correspond to the Fuse's subdirectory (BlobShader, AbstractShader, MiscShader, ObjectShader). Set to `''` to make the Fuse appear on the menu's top level (that is directly beneath the FC_SUBMENU menu item).

#### FC_SUBMENU

Development: "Shadertoys (dev)",<br />
Installed: "Shadertoys (alpha)", <br />
Released: "Shadertoys (beta)", <br />
Published: "Fuses\\Shadertoys"

Defaults to "Shadertoys (dev)" and is set by the installer. Idea is to have all the Fuses beneath "Shadertoy (dev)/" for development (therefore the default), to have all Fuses copied by the installer beneath "Shadertoys (beta)/" and to have them finally in "Fuses/Shadertoys/" when they come with the Reactor. It's not allowed to be empty and therefore becomes "Fuses", if you set it to "". You can set it to some string, e.g. "Fuses\\\\Shadertoys", but this has effect only for the dev version.

#### FC_DEVELOP

Development: true<br />
Installed: false<br />
Released: false<br />
Published: false

Defaults to `true`. Set to `false` to hide the fuse's 'Edit' and 'Reload' buttons.

#### FC_VERSIONNO (overwrites dctlfuse_versionNo; not implemented yet)

Defaults to `dctlfuse_versionNo`. Intention is to replace this some day with information comming from the git log.

#### FC_VERSIONDATE (overwrites dctlfuse_versionDate; not implemented yet)

Development: `dctlfuse_versionDate`<br />
Installed: _based on git log_ (resp. `dctlfuse_versionDate` unless implemented)<br />
Released: _based on git log_ (resp. `dctlfuse_versionDate` unless implemented)<br />
Published: _based on git log_ (resp. `dctlfuse_versionDate` unless implemented)

Defaults to `dctlfuse_versionDate`. Intention is to replace this some day with information comming from the git log.

#### FC_TILEPIC

Pfft.

#### FC_INFOBTNPOS

Show button to open the project page -1 on top, 0 hide, 1 on bottom of the Control pane, or 2 on a separate Info pane.

#### FC_INFOTXTPOS

Show fuse info text -1 on top, 0 hide, 1 on bottom of the Control pane, or 2 on a separate Info pane.

#### FC_AUTHIMGPOS

Show author logo -1 on top, 0 hide, 1 on bottom of the Control pane, or 2 on a separate Info pane.

#### FC_AUTHIMG (overtwritten by dctlfuse_authorlogo)

Set `dctlfuse_authorlogo`to `""` if you want to suppress any logo.

