
collect_images = {
    Image = function(img)
        print(img.src)
    end
}

function Pandoc(doc)
    doc.blocks:walk(collect_images)
    os.exit(0)
end


-- function Image(img)
--     print("mv '"..img.src.."' 'img/' ")
--     return img
-- end
