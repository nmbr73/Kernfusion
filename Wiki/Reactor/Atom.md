> [!SUMMARY] The Reactor package format
> If you are interested in [[Writing and publishing packages]] for [[Reactor]], than you need to know its Atom package format decribed here.

Source: [Atom Packages Documentation](https://www.steakunderwater.com/wesuckless/viewtopic.php?t=1799) WSL post on how to write a package description.

## Creating Atom Packages

An atom package is used to define a new installable item that is accessible in the Reactor package manager.   
  
This is a visual image of what a new atom package folder could look like:  
![[Reactor - example-atom-package.png]]
  
A Reactor atom package is arranged with a basic file hierarchy like this:

- 📂 com.YourCompanyName.YourPackageName (folder)
  - 📄 com.YourCompanyName.YourPackageName.atom (file)
  - 📂 Macros  (folder)
    - 📁 YourCompanyName (folder)
    - 📄 your-custom.bmp (file)
    - 📄 your-custom.setting (file)
  - 📂 Fuses (folder)
    - 📄 your-custom.fuse (file)
  - 📂 Scripts (folder)
    - 📂 Comp (folder)
    - 📁 YourCompanyName (folder)
    - 📄 your-script.lua (file)
 
 > [!TODO] What's the correct folder structure?!?
 > The folder structure given in the code block of [the original post]((https://www.steakunderwater.com/wesuckless/viewtopic.php?t=1799)) does not correspond to the structure shown in the image?!?

The `com.YourCompanyName.YourPackageName.atom` file contents would look like this:

```lua
Atom {
    Name = "YourPackageName",
    Category = "Tools",
    Author = "YourCompanyName",
    Version = 1.0,
    Date = {2017-11-18},
 
    Description = [[A minimal Reactor example atom package.]],
 
    Deploy = {
        "Macros/YourCompanyName/your-custom.setting",
        "Fuses/your-custom.fuse",
        "Scripts/Comp/YourCompanyName/your-script.lua",
    },
 
    Dependencies = {
        "com.wesuckless.Switch",
    },
}
```

You only need to add the intermediate folders required for the content your atom is installing. This means if you are creating an Atom package for delivering a Macro, you only need to add a "Macros/" folder and "Deploy" entry for the .setting file and its thumbnail bin icon.

## Adding a Description to an Atom Package

...

> [!TODO] Continue the copypasta
> Did this just to try out what sucn an WSL post would look like. But first it must be asked if and for which of these posts a permission to copy them can be given.