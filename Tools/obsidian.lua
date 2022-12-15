-- https://pandoc.org/lua-filters.html
-- https://github.com/pandoc/lua-filters
-- https://gist.github.com/tarleb/5a9c3fbfa47b0e6d3643efd8af2994b9
-- https://gist.github.com/sky-y/522c8817ddf5d1720d70066dad6ecc43
-- https://groups.google.com/g/pandoc-discuss/c/6OzhQLiIpX8
-- https://github.com/tarleb/pandoc/tree/34c3b1f4d24e0aa02db7b38334a762f4602df5f0/test/lua/writers
-- https://odone.io/posts/2020-06-08-custom-markdown-pandoc.html



function Writer (doc, opts)

    local filter = {
    --   CodeBlock = function (cb)

    --     if cb.attr == pandoc.Attr() then
    --       local delimited = '```\n' .. cb.text .. '\n```'
    --       return pandoc.RawBlock('markdown', delimited)
    --     end
    --   end

      Image = function (img)
        -- https://pandoc.org/lua-filters.html#pandoc.image
        -- img.caption: text used to describe the image
        -- img.src: path to the image file
        -- img.title: brief image description (optional)
        -- img.attr: additional attributes (optional)

        local caption = '' -- img.caption

        if caption ~= '' then
          caption = '|' .. caption
        end

        -- geht nuer fuer interne!

        local obsidian_image = '![[' .. img.src .. caption .. ']]'
        --obsidian_image=pandoc.Str(obsidian_image)
        --return pandoc.RawBlock('markdown_phpextra', pandoc.Str(obsidian_image) )
        return pandoc.RawInline('markdown_phpextra', obsidian_image)
      end

    }

  -- Formats: https://pandoc.org/MANUAL.html
  -- markdown_phpextra seems pretty close to Obsidian.md
  return pandoc.write(doc:walk(filter), 'markdown_phpextra', opts)
end
