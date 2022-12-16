

Sometimes you have just some plain Markdown files - no meaningful filename, no YAML front matter magic, or such ... and still you want i.e. the output to have some sensible title - and it's pretty common for web pages that the title and the first headline are the same (look at the source code of this page for example: you'll file 'Set html title from the first header with pandoc - Stack Overflow' in the `title` and within a `h1`!)

For my purposes I have written a small Lua filter ...
    local headline = ""

    to_string = {

        Str = function(element)
            headline = headline .. element.text
        end,

        Space = function()
            headline = headline .. " "
        end
    }

    function Pandoc(doc)

        for i,element in pairs(doc.blocks) do
            if element.t == "Header" and element.level == 1 then
                element:walk(to_string)
                break
            end
        end

        print(headline)
        os.exit(0)
    end
... and saved it as `first_headline.lua`

I can then use this filter for example in a script ...
    #!/bin/bash
    INPUT=$1
    TITLE=`pandoc --lua-filter=first_headline.lua $INPUT`
    pandoc -s --to=html --metadata title="$TITLE" $INPUT
... should in theory work for any input format that comes with headlines and any output format that supports a document title.

However, key point here is the underlying idea - with some tinkering this approach should be helpful for many use cases.


similar

