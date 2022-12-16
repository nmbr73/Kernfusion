
-- would be the answert to:
-- https://stackoverflow.com/questions/42706333/set-html-title-from-the-first-header-with-pandoc?newreg=145a6a2856b34aaaa7c8a3d21363970f



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
