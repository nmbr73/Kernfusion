---
author: Andrew Hazelden
tags:
  - Kartaverse
  - .scrivener-export
---



> [!wiki-todo]- Scrivener Export - Reformatting Needed!
> This article is an export of a Scrivener document. It will definitely need at least some reformatting to work in Obsidian and MkDocs. Delete this note once the article's formatting  has been fixed to some extent.

BBEdit is a very capable programmer's text editor on macOS that is quick to load, easy to customize, and minimalistic in its usage of screen space.

<http://www.barebones.com/products/bbedit/index.html>

For more information about BBEdit usage:

-   [FuScript Integration for BBEdit](https://github.com/AndrewHazelden/Fusion-Studio-FuScript-IDE-Tools-and-Pipeline-Scripts)
-   [More TextWrangler and BBEdit Color Schemes](https://github.com/AndrewHazelden/More-TextWrangler-and-BBEdit-Color-Schemes)
-   [BBEdit Syntax Highlighter Page](https://www.barebones.com/support/bbedit/plugin_library.html)
-   [Arnold Syntax Highlighter](https://github.com/AndrewHazelden/Arnold-Syntax-Highlighter/tree/master/BBEdit_and_Textwrangler)
-   [Vray Scene Syntax Highlighter](https://github.com/AndrewHazelden/Vray-Scene-Syntax-Highlighter)
-   [Mental Ray Syntax Highlighter and Apple Scripts](https://github.com/AndrewHazelden/Mental_Ray_Syntax_Highlighter)
-   [Softimage SPDL Codeless Language Module](https://github.com/AndrewHazelden/Softimage-SPDL-Syntax-Highlighter/tree/master/BBEdit_and_Textwrangler)
-   [Fabric Engine KL Codeless Language Module](https://github.com/AndrewHazelden/Fabric_Engine_KL_Syntax_Highlighter/tree/master/BBEdit_and_Textwrangler)
-   [DigitalSky Codeless Language Module](https://github.com/AndrewHazelden/DigitalSky_Syntax_Highlighter/tree/master/BBEdit_and_TextWrangler)
-   [IRIXBASIC Codeless Language Module](https://github.com/AndrewHazelden/IRIXBASIC-Language-Module-for-TextWrangler-and-BBEdit)

### Preview CSS

Preview CSS

It is possible to add your own Preview CSS document to the BBEdit preferences folder. This is used in the Markdown preview window to define the CSS tags for the HTML rendered content.

Here is an initial "\$HOME/Library/Application Support/BBEdit/Preview CSS/DefaultCSS_Markdown.css" file to get your development efforts underway:

    /* Stylesheet for MarkdownPad (http://markdownpad.com) */

    /* RESET
    =============================================================================*/

    html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video {
      margin: 0;
      padding: 0;
      border: 0;
    }

    /* BODY
    =============================================================================*/

    @font-face {
        font-family: 'Source Sans Pro';
        font-style: normal;
        font-weight: 300;
        src: url('fonts/SourceSansPro-Regular.ttf');
    }

    @font-face {
        font-family: 'Source Code Pro';
        font-style: normal;
        font-weight: 400;
        src: url('fonts/SourceCodePro-Regular.ttf');
    }

    @import url("fonts/font-awesome.min.css");

    body {
      font-family: "Source Sans Pro", Helvetica, arial, sans-serif;
      font-size: 14px;
      line-height: 1.6;
      color: #333;
      background-color: #1C1C1C;
      padding: 20px;
      max-width: 960px;
      margin: 0 auto;
    }

    body>*:first-child {
      margin-top: 0 !important;
    }

    body>*:last-child {
      margin-bottom: 0 !important;
    }

    /* BLOCKS
    =============================================================================*/

    p, blockquote, ul, ol, dl, table, pre {
      margin: 15px 0;
      color: #AAAAAA;
      /* color: #7D8686; */
    }

    /* HEADERS
    =============================================================================*/

    h1, h2, h3, h4, h5, h6 {
      margin: 20px 0 10px;
      padding: 0;
      font-weight: bold;
      -webkit-font-smoothing: antialiased;
    }

    h1 tt, h1 code, h2 tt, h2 code, h3 tt, h3 code, h4 tt, h4 code, h5 tt, h5 code, h6 tt, h6 code {
      font-size: inherit;
    }

    h1 {
      font-size: 28px;
      font-weight: 600;
      color: #FFFFFF;
    }

    h2 {
      font-size: 24px;
      font-weight: 500;
      border-bottom: 2px solid #D0D0D0;
      color: #D0D0D0;
    }

    h3 {
      font-size: 18px;
      font-weight: 400;
      color: #D0D0D0;
    }

    h4 {
      font-size: 16px;
      color: #D0D0D0;
    }

    h5 {
      font-size: 14px;
      color: #D0D0D0;
    }

    h6 {
      font-size: 14px;
      color: #D0D0D0;
    }

    h7 {
      font-size: 14px;
      color: #D0D0D0;
      /* color: #277BA5; */
    }

    body>h2:first-child, body>h1:first-child, body>h1:first-child+h2, body>h3:first-child, body>h4:first-child, body>h5:first-child, body>h6:first-child {
      margin-top: 0;
      padding-top: 0;
    }

    a:first-child h1, a:first-child h2, a:first-child h3, a:first-child h4, a:first-child h5, a:first-child h6 {
      margin-top: 0;
      padding-top: 0;
    }

    h1+p, h2+p, h3+p, h4+p, h5+p, h6+p {
      margin-top: 10px;
    }

    /* LINKS
    =============================================================================*/

    a {
      color: #4183C4;
      text-decoration: none;
    }

    a:hover {
      text-decoration: underline;
    }

    /* LISTS
    =============================================================================*/

    ul, ol {
      padding-left: 30px;
      color: #C4C4C4;
    }

    ul li > :first-child, 
    ol li > :first-child, 
    ul li ul:first-of-type, 
    ol li ol:first-of-type, 
    ul li ol:first-of-type, 
    ol li ul:first-of-type {
      margin-top: 0px;
    }

    ul ul, ul ol, ol ol, ol ul {
      margin-bottom: 0;
    }

    dl {
      padding: 0;
    }

    dl dt {
      font-size: 14px;
      font-weight: bold;
      font-style: italic;
      padding: 0;
      margin: 15px 0 5px;
    }

    dl dt:first-child {
      padding: 0;
    }

    dl dt>:first-child {
      margin-top: 0px;
    }

    dl dt>:last-child {
      margin-bottom: 0px;
    }

    dl dd {
      margin: 0 0 15px;
      padding: 0 15px;
    }

    dl dd>:first-child {
      margin-top: 0px;
    }

    dl dd>:last-child {
      margin-bottom: 0px;
    }

    /* CODE
    =============================================================================*/

    pre, code, tt {
      font-size: 12px;
      font-family: "Source Code Pro", monospace;
    }

    code, tt {
      margin: 0 0px;
      padding: 0px 0px;
      white-space: nowrap;
      border: 1px solid #262626;
      background-color: #363636;
      color: #D0D0D0;
      border-radius: 3px;
    }

    pre>code {
      margin: 0;
      padding: 0;
      white-space: pre;
      border: none;
      background: transparent;
    }

    pre {
      background-color: #363636;
      border: 1px solid #262626;
      font-size: 13px;
      line-height: 19px;
      overflow: auto;
      padding: 6px 10px;
      border-radius: 3px;
    }

    pre code, pre tt {
      background-color: transparent;
      border: none;
    }

    kbd {
        -moz-border-bottom-colors: none;
        -moz-border-left-colors: none;
        -moz-border-right-colors: none;
        -moz-border-top-colors: none;
        background-color: #DDDDDD;
        background-image: linear-gradient(#F1F1F1, #DDDDDD);
        background-repeat: repeat-x;
        border-color: #DDDDDD #CCCCCC #CCCCCC #DDDDDD;
        border-image: none;
        border-radius: 2px 2px 2px 2px;
        border-style: solid;
        border-width: 1px;
        font-family: "Source Sans Pro", Helvetica, arial, sans-serif;
        line-height: 10px;
        padding: 1px 4px;
    }

    /* QUOTES
    =============================================================================*/

    blockquote {
      border-left: 4px solid #DDD;
      padding: 0 15px;
      color: #777;
    }

    blockquote>:first-child {
      margin-top: 0px;
    }

    blockquote>:last-child {
      margin-bottom: 0px;
    }

    /* HORIZONTAL RULES
    =============================================================================*/

    hr {
      clear: both;
      margin: 15px 0;
      height: 0px;
      overflow: hidden;
      border: none;
      background: transparent;
      border-bottom: 4px solid #ddd;
      padding: 0;
    }

    /* TABLES
    =============================================================================*/

    table th {
      font-weight: bold;
    }

    table th, table td {
      /* border: 1px solid #ccc; */ 
      /* padding: 6px 13px; */ 
    }

    table tr {
      /* border-top: 1px solid #ccc; */
      /* background-color: #363636; */
      /* color: #D0D0D0; */
    }


    /* IMAGES
    =============================================================================*/

    img {
      max-width: 80%;
      /* max-width: 100%; */
      display: block;
      margin-left: auto;
      margin-right: auto;
    }

### BBEdit Script Menu

BBEdit Script Menu

BBEdit supports the use of custom shell scripts and Apple Scripts via the Script menu. You can bind hotkeys to any of the entries that are added to this menu.

![[Kartaverse/Immersive Pipeline Integration Guide/img/image369.png]]

If you select the "Scripts \> Open Scripts Folder" menu item you can quickly access the `$HOME/Library/Application Support/BBEdit/Scripts/`

### BBEdit Script Code Examples

BBEdit Script Code Examples

Here are several pre-made BBEdit scripts to get you starred:

#### Zoom In Text

Zoom In Text

An Apple Script named "Zoom In Text.scpt" can be linked to the BBEdit hotkey for "Command + =". The script content is:

    -- From: http://bbedit-hints.tumblr.com/
    tell application "BBEdit"
        tell window 1
            set display magnification to display magnification * 1.25
        end tell
    end tell

#### Zoom Out Text

Zoom Out Text

An Apple Script named "Zoom Out Text.scpt" can be linked to the BBEdit hotkey for "Command + -". The script content is:

    -- From: http://bbedit-hints.tumblr.com/
    tell application "BBEdit"
        tell window 1
            set display magnification to display magnification / 1.25
        end tell
    end tell

#### Zoom Text 100%

Zoom Text 100%

An Apple Script named "Zoom Text 100%.scpt" can be linked to a BBEdit hotkey. The script content is:

    -- From: http://bbedit-hints.tumblr.com/
    tell application "BBEdit"
        set display magnification of window 1 to 1.0 -- displays text at 2x
    end tell

#### Open the Activity Monitor

Open the Activity Monitor

An Apple Script named "Open Tool Activity Monitor.scpt" can be used to launch the macOS Activity Monitor program. The script content is:

    -- Open Tool Activity Monitor
    -- Open up the macOS Activity Monitor program to inspect the running program and the CPU load.

    tell application "Activity Monitor"
        activate
    end tell

#### Open the Terminal Window

Open the Terminal Window

An Apple Script named "Open Tool Terminal.scpt" can be used to launch the macOS Terminal program. The script content is:

    -- Open Tool Terminal
    -- Open up the macOS Terminal program.

    tell application "Terminal"
        activate
    end tell

#### Open the Console Window

Open the Console Window

An Apple Script named "Open Tool Console.scpt" can be used to launch the macOS Console program. The script content is:

    -- Open Tool Console
    -- Open up the macOS Console program to inspect error logs.

    tell application "Console"
        activate
    end tell

#### Open the Temp Directory Folder

Open the Temp Directory Folder

An Apple Script named "Open Folder \$TMPDIR.scpt" can be used to display a Finder based view to the \$TEMPDIR environment variable defined filepath location. The script content is:

    -- Open Folder $TMPDIR
    -- Open up the macOS /private/var/folders/ based temporary folder.

    -- Open the shaders folder:
    set command to "open \"/${TMPDIR}\""

    -- display alert command
    set result to do shell script command
    -- display alert result

#### Open the ZSH .zprofile document

Open the ZSH .zprofile document

An Apple Script named "Open .zprofile.scpt" can be used to display the current \$HOME/.zprofile document in a BBEdit text editing window. The script content is:

    -- Open .zprofile
    -- Open up the  ~/.zprofile which is used to configure environment variables in zsh

    -- Choose where the .zprofile file is stored on disk
    set envFileAlias to (path to current user folder as text) & ".zprofile"

    -- Touch the file path to make it exist if it wasn't found on disk
    set command to "touch " & the quoted form of POSIX path of envFileAlias

    -- display alert command
    set result to do shell script command
    -- display alert result


    -- Display the console standard output result
    tell application "BBEdit"
        try
            open {file envFileAlias} with LF translation
        on error
            set errorMessage to "[BASH] The .zprofile file: " & the the quoted form of POSIX path of envFileAlias & " is was not found. Please edit this Apple Script to customize your current paths."
            display dialog the errorMessage buttons {"OK"} default button 1 with icon 1 giving up after 10
        end try
    end tell

Open the ZSH .zshenv document

An Apple Script named "Open .zshenv.scpt" can be used to display the current `$HOME/.zshenv` document in a BBEdit text editing window. The script content is:

    -- Open .zshenv
    -- Open up the  ~/.zshenv which is used to configure environment variables in zsh

    -- Choose where the .zshenv file is stored on disk
    set envFileAlias to (path to current user folder as text) & ".zshenv"

    -- Touch the file path to make it exist if it wasn't found on disk
    set command to "touch " & the quoted form of POSIX path of envFileAlias

    -- display alert command
    set result to do shell script command
    -- display alert result

    -- Display the console standard output result
    tell application "BBEdit"
        try
            open {file envFileAlias} with LF translation
        on error
            set errorMessage to "[BASH] The .zshenv file: " & the the quoted form of POSIX path of envFileAlias & " is was not found. Please edit this Apple Script to customize your current paths."
            display dialog the errorMessage buttons {"OK"} default button 1 with icon 1 giving up after 10
        end try
    end tell

#### Get the EXIFTool Help Text

Get the EXIFTool Help Text

An Apple Script named "EXIFTool Help.script" can be used to export the command-line help info for EXIFTool into a BBEdit text editing document. The script content is:

    -- EXIFTool Help

    -- Choose where the program is installed
    set programPath to quoted form of POSIX path of "/Users/vfx/Reactor/Deploy/Bin/exiftool/exiftool"

    -- Define the command line arguments
    set programOptions to " -h | /usr/local/bin/bbedit -t \"EXIFTool Help.txt\""
    set command to programPath & programOptions
    set output to do shell script command

#### Get the FFMpeg Help Text

Get the FFMpeg Help Text

An Apple Script named "FFMpeg Help.script" can be used to export the command-line help info for FFMpeg into a BBEdit text editing document. The script content is:

    -- FFmpeg Help

    -- Choose where the program is installed
    set programPath to quoted form of POSIX path of "/Users/vfx/Reactor/Deploy/Bin/ffmpeg/bin/ffmpeg"


    -- Define the command line arguments
    set programOptions to " -h | /usr/local/bin/bbedit -t \"FFmpeg Help.txt\""
    set command to programPath & programOptions
    set output to do shell script command

#### Get the Imagemagick Convert Help Text

Get the Imagemagick Convert Help Text

An Apple Script named "Imagemagick Convert Help.script" can be used to export the command-line help info for the convert utility into a BBEdit text editing document. The script content is:

    -- Imagemagick Convert Help

    -- Choose where the program is installed
    -- set convertPath to quoted form of POSIX path of "/usr/local/bin/convert"
    set convertPath to quoted form of POSIX path of "/opt/ImageMagick/bin/convert"

    -- Define the command line arguments
    set convertOptions to " | /usr/local/bin/bbedit -t \"Imagemagick Convert Help.txt\""
    set command to convertPath & convertOptions
    set output to do shell script command

#### Get the Imagemagick Supported File Formats Text

Get the Imagemagick Supported File Formats Text

An Apple Script named "Imagemagick Supported File Formats.script" can be used to export the command-line help info for the convert utility into a BBEdit text editing document. The script content is:

    -- Imagemagick Convert Supported File Formats

    -- Choose where the program is installed
    -- set convertPath to quoted form of POSIX path of "/usr/local/bin/convert"
    set convertPath to quoted form of POSIX path of "/opt/ImageMagick/bin/convert"

    -- Define the command line arguments
    set convertOptions to " -version  | /usr/local/bin/bbedit -t \"Imagemagick Convert Formats.txt\""
    set command to convertPath & convertOptions
    set output to do shell script command

#### Get the V-Ray Server Help Text

Get the V-Ray Server Help Text

An Apple Script named "V-Ray Help.script" can be used to export the command-line help info for V-Ray CLI program into a BBEdit text editing document. The script content is:

    -- V-Ray Standalone Help

    -- Choose where the V-Ray Standalone program is installed
    set vrayPath to quoted form of POSIX path of "/Applications/ChaosGroup/V-Ray/Maya2023/vray/bin/vrayserver"

    -- Define the Vray Standalone command line arguments
    set vrayOptions to " -help"

    -- set command to vrayPath & vrayOptions
    set command to vrayPath & vrayOptions
    set output to do shell script command

    -- Target a Worksheet
    --tell application "BBEdit"
    --  set uws to Unix worksheet window
    --  tell uws
    --      select insertion point after last character
    --      set selection to command & "\n" & output
    --  end tell
    --end tell

    -- Target an new document
    tell application "BBEdit"
        activate
        make new text document
        -- make new text document at project window 1
        --select insertion point after last character
        set selection to command & "
    " & output
    end tell

#### Launch a Lua Love Script from BBEdit

Launch a Lua Love Script from BBEdit

A BASH/ZSH shell script named "Lua-Love-Launcher.sh" can be used to run a Lua Love "main.lua" script automatically. The terminal output from Lua Love is sent to a new BBEdit text editing document. The script content is:

    #! /bin/sh
    # Lua-Love-Launcher.sh
    # by Andrew Hazelden
    # ---------------------------------------------------------------
    # Installation Prep:
    # Copy the script file to the "$HOME/Library/Application Support/BBEdit/Scripts/" folder
    # chmod -R 777 "$HOME/Library/Application Support/BBEdit/Scripts/Lua-Love-Launcher.sh"

    # Run the Love package
    {
      LOVE_PATH="/Applications/love.app/Contents/MacOS/love"

      # Base folder for the active document
      BB_DOC_FOLDER="$(dirname ${BB_DOC_PATH})"

      # echo Opening Love Folder: $BB_DOC_FOLDER
      
      # Launch love with the parent folder for the active main.lua file
      # "$LOVE_PATH" "$BB_DOC_FOLDER"
      "$LOVE_PATH" "$BB_DOC_FOLDER" | BBEdit & 
    }

#### Generate a Markdown File to HTML Export

Generate a Markdown File to HTML Export

A BASH/ZSH shell script named "Markdown Generator.sh" can be used to run the cmark command-line tool automatically. Custom HTML based header and footer content, along with a CSS file are appended to the final HTML file output. The script content is:

    #! /bin/sh
    # Markdown Docs to HTML Converter
    # by Andrew Hazelden

    # Generate HTML docs from Markdown files
    {
      # ---------------------------------------------------------------
      # Markdown document to convert (without the .md file extension)
      MARKDOWN_DOCUMENT="${BB_DOC_PATH}"
      
      # Define the output filename
      # HTML_OUTPUT="${MARKDOWN_DOCUMENT}.html"
      HTML_OUTPUT=`echo "${MARKDOWN_DOCUMENT}" | sed "s/\..*$//"`".html"
      
      # ---------------------------------------------------------------
      # Load the page elements
      
      MARKDOWN_CSS="$HOME/Library/Application Support/BBEdit/Preview CSS/DefaultCSS_Markdown.css"
      MARKDOWN_HTML_HEADER="$HOME/Markdown/markdown_header.html"
      MARKDOWN_HTML_BODY="$HOME/Markdown/markdown_body.html"
      MARKDOWN_HTML_FOOTER="$HOME/Markdown/Markdown_footer.html"
      
      # ---------------------------------------------------------------
      # Merge the HTML document
      
      # Add the base HTML header to the new file
      cat "${MARKDOWN_HTML_HEADER}" > "${HTML_OUTPUT}"
      
      # Append the CSS
      cat "${MARKDOWN_CSS}" >> "${HTML_OUTPUT}"
      
      # Add the HTML body tag to the new file
      cat "${MARKDOWN_HTML_BODY}" >> "${HTML_OUTPUT}"
      
      # Append the Markdown converted text using the cmark command-line tool
      /usr/local/bin/cmark "${MARKDOWN_DOCUMENT}" --to html >> "${HTML_OUTPUT}"
      
      # Append the HTML footer
      cat "${MARKDOWN_HTML_FOOTER}" >> "${HTML_OUTPUT}"
      
      # ---------------------------------------------------------------
      
      # bbedit --language HTML "${HTML_OUTPUT}"
      open "${HTML_OUTPUT}"
    }

The cmark "CommonMark" CLI utility can be installed using homebrew:

    brew install commonmark

The cmark CLI executable is located on-disk at:

    /usr/local/bin/cmark

The cmark man-page can be displayed using:

    man cmark

The cmark command-line help output can be displayed using:

    cmark --help
    Usage:   cmark [FILE*]
    Options:
      --to, -t FORMAT  Specify output format (html, xml, man, commonmark, latex)
      --width WIDTH    Specify wrap width (default 0 = nowrap)
      --sourcepos      Include source position attribute
      --hardbreaks     Treat newlines as hard line breaks
      --nobreaks       Render soft line breaks as spaces
      --safe           Suppress raw HTML and dangerous URLs
      --smart          Use smart punctuation
      --normalize      Consolidate adjacent text nodes
      --help, -h       Print usage information
      --version        Print version

DefaultCSS_Markdown.css File Location:

    $HOME/Library/Application Support/BBEdit/Preview CSS/DefaultCSS_Markdown.css

markdown_header.html File Contents:

    <!DOCTYPE html>
    <html>
    <head>
    <title>Documentation</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <style type="text/css">

markdown_body.html File Contents:

    </style>
    </head>
    <body>

markdown_footer.html File Contents:

    </body>
    </html>

### BBEdit Script Environment Variables

BBEdit Script Environment Variables

A BBEdit shell script is able to access several handy environment variables. This feature lets your external script know things about the current document that is open "`${BB_DOC_PATH}`", and what line is selected in the file "`${BB_DOC_SELSTART_LINE}`".

Here is list of the most common environment variables you can use with BBEdit launched shell scripts:

    ${BB_DOC_LANGUAGE}        Name of the document's current language (not set if language is "none") BB_DOC_MODE            Emacs mode of the document's current language 
    ${BB_DOC_NAME}            name of the document 
    ${BB_DOC_PATH}            path of the document (not set if doc is unsaved) 
    ${BB_DOC_SELEND}          (zero-based) end of the selection range (not set if not text document) 
    ${BB_DOC_SELEND_COLUMN}   (one-based) de-tabbed column number of BB_DOC_SELEND 
    ${BB_DOC_SELEND_LINE}     (one-based) line number of BB_DOC_SELEND 
    ${BB_DOC_SELSTART}        (zero-based) start of the selection range (not set if not text document) 
    ${BB_DOC_SELSTART_COLUMN} (one-based) de-tabbed column number of BB_DOC_SELSTART 
    ${BB_DOC_SELSTART_LINE}   (one-based) line number of BB_DOC_SELSTART

### BBEdit Hotkey Bindings

BBEdit Hotkey Bindings

The BBEdit preferences allow you to bind custom hotkeys to any menu item in the program. Click on the "Menus and Shortcut" entry. This section makes it possible for your custom scripts to feel like a native feature that is integrated in BBEdit.

![[Kartaverse/Immersive Pipeline Integration Guide/img/image168.png]]