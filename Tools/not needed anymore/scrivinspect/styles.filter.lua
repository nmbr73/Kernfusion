

function Str(s)

    s.text = string.gsub(s.text, "<$Scr_Ps::0>", "WITH_STYLE_0")
    return s
end