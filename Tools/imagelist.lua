


-- > [!warning] Embed: [Reactor is released - GET IT NOW!](https://www.youtube.com/watch?v=mklCsf8yOUk)

function Writer (doc, opts)

    local filter = {

      Image = function (img)
        -- https://pandoc.org/lua-filters.html#pandoc.image
        -- img.caption: text used to describe the image
        -- img.src: path to the image file
        -- img.title: brief image description (optional)
        -- img.attr: additional attributes (optional)

        -- local caption = '' -- img.caption

        -- if caption ~= '' then
        --   caption = '|' .. caption
        -- end

        -- geht nuer fuer interne!

        -- local obsidian_image = '![[' .. img.src .. caption .. ']]'
        --obsidian_image=pandoc.Str(obsidian_image)
        --return pandoc.RawBlock('markdown_phpextra', pandoc.Str(obsidian_image) )

        local obsidian_image = '![[' .. img.src .. ']]'
        -- print('IMAGE:(' .. img.src .. ')')
        return pandoc.RawInline('markdown', obsidian_image)
      end

    }

  -- Formats: https://pandoc.org/MANUAL.html
  -- markdown_phpextra seems pretty close to Obsidian.md
  return pandoc.write(doc:walk(filter), 'markdown', opts)
end
