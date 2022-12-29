---
author: Andrew Hazelden
tags:
  - Kartaverse
  - .scrivener-export
---



> [!wiki-todo]- Scrivener Export - Reformatting Needed!
> This article is an export of a Scrivener document. It will definitely need at least some reformatting to work in Obsidian and MkDocs. Delete this note once the article's formatting  has been fixed to some extent.

It is important to customize the Fusion Render node program's PathMap settings if you would like your render farm to be able to access the same Reactor content that you have installed in Resolve/Fusion on your laptop/desktop/workstation. This is especially true after fuses are installed using the Reactor Package Manager.

If you rely on fuses, OFX plugins, or FusionSDK C++ compiled plugins, you need to pre-install the 3rd party addons on each render node in your render farm. If you send a Fusion composite to a render farm node that lacks a required plugin it will generate an error during the batch rendering process.

Something that can help reduce the pain of setting up and syncing Reactor content across a render farm is sharing the exact same Reactor content across a mapped SMB drive mount, or on a NFS shared mount point.

An extra step that can often be overlooked is the requirement to configure a custom "`LuaModules:`" PathMap entry in the Fusion Render Node app preferences to avoid Fusion Render Manager errors when batch rendering comps that use fuses like the Vonk data nodes or Cryptomatte.

Note: The example below shows the PathMaps used for locally installed Reactor content that was added to a Reactor default "AllData:" folder based install.

You can point the "`Reactor:`" PathMap at any folder path you need to as long as it is not a UNC path, and it doesn't have high-ASCII or Unicode multi-byte extended characters in the filepath.

Make sure to have a trailing slash on the final absolute filepath used to define the PathMap entry for your version of the "`From: Reactor:`'' and"`To: /Volumes/Some/Random/Pipeline/Folder/Path/Reactor/`" install location.