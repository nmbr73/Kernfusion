
--[[

    Print first headline and exit Pandoc.

    see:
    - https://stackoverflow.com/a/74830697/20797043)

--]]

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

    -- for i,element in pairs(doc.blocks) do
    --     if element.t == "Title" then
    --         element:walk(to_string)
    --         break
    --     end
    -- end


    for i,element in pairs(doc.blocks) do
        if element.t == "Header" and element.level == 1 then
            element:walk(to_string)
            break
        end
    end

    print(headline)
    os.exit(0)
end
