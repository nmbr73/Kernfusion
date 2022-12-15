[ Para
    [ Str "Here"
    , Space
    , Str "we"
    , Space
    , Str "go"
    , Space
    , Str "\8230"
    , SoftBreak
    , Str "This"
    , Space
    , Str "is"
    , Space
    , Str "a"
    , Space
    , Str "(intentionally)"
    , Space
    , Str "small"
    , Space
    , Str "Scrivener"
    , Space
    , Str "document"
    , Space
    , Str "to"
    , Space
    , Str "examine"
    , Space
    , Str "the"
    , Space
    , Str "different"
    , Space
    , Str "formattings"
    , Space
    , Str "and"
    , Space
    , Str "output"
    , Space
    , Str "formats."
    , SoftBreak
    , Str "See"
    , Space
    , Str "Some"
    , Space
    , Str "Examples"
    , Space
    , Str "to"
    , Space
    , Str "test"
    , Space
    , Str "Styles,"
    , Space
    , Str "Export,"
    , Space
    , Str "Transformation"
    , Space
    , Str "for"
    , Space
    , Str "standard"
    , Space
    , Str "and"
    , Space
    , Str "custom"
    , Space
    , Quoted SingleQuote [ Str "Style" ]
    , Space
    , Str "examples."
    , SoftBreak
    , Str "In"
    , Space
    , Str "Images,"
    , Space
    , Str "Captions"
    , Space
    , Str "and"
    , Space
    , Str "YouTube"
    , Space
    , Str "Videos"
    , Space
    , Str "I"
    , Space
    , Str "did"
    , Space
    , Str "some"
    , Space
    , Str "different"
    , Space
    , Str "variants"
    , Space
    , Str "of"
    , Space
    , Str "inserting"
    , Space
    , Str "images."
    , SoftBreak
    , Str "Some"
    , Space
    , Str "of"
    , Space
    , Str "the"
    , Space
    , Str "articles"
    , Space
    , Str "have"
    , Space
    , Quoted SingleQuote [ Str "labels" ]
    , Space
    , Str "-"
    , Space
    , Str "this"
    , Space
    , Str "can"
    , Space
    , Str "help"
    , Space
    , Str "when"
    , Space
    , Str "filtering"
    , Space
    , Str "for"
    , Space
    , Str "the"
    , Space
    , Quoted SingleQuote [ Str "compile" ]
    , Space
    , Str "maybe"
    , Space
    , Str "\8230"
    , Space
    , Str "but"
    , Space
    , Str "I"
    , Space
    , Str "did"
    , Space
    , Str "this"
    , Space
    , Str "mainly"
    , Space
    , Str "to"
    , Space
    , Str "see"
    , Space
    , Str "if"
    , Space
    , Str "I"
    , Space
    , Str "can"
    , Space
    , Str "find"
    , Space
    , Str "the"
    , Space
    , Str "lables"
    , Space
    , Str "in"
    , Space
    , Str "the"
    , Space
    , Str "data"
    , Space
    , Str "to"
    , Space
    , Str "use"
    , Space
    , Str "them"
    , Space
    , Str "as"
    , Space
    , Str "metadata"
    , Space
    , Str "(e.g.\160as"
    , Space
    , Str "tags"
    , Space
    , Str "in"
    , Space
    , Str "a"
    , Space
    , Str "YAML"
    , Space
    , Str "front"
    , Space
    , Str "matter?!)"
    ]
, Para
    [ Str "Some"
    , Space
    , Str "Examples"
    , Space
    , Str "to"
    , Space
    , Str "test"
    , Space
    , Str "Styles,"
    , Space
    , Str "Export,"
    , Space
    , Str "Transformation"
    , SoftBreak
    , Str "This"
    , Space
    , Str "is"
    , Space
    , Str "to"
    , Space
    , Str "check"
    , Space
    , Str "what"
    , Space
    , Str "happens"
    , Space
    , Str "to"
    , Space
    , Str "self"
    , Space
    , Str "defined"
    , Space
    , Str "styles"
    , Space
    , Str "in"
    , Space
    , Str "the"
    , Space
    , Str "output."
    , Space
    , Str "That\8217s"
    , Space
    , Str "to"
    , Space
    , Str "see"
    , Space
    , Str "how"
    , Space
    , Str "some"
    , Space
    , Str "more"
    , Space
    , Str "semantic"
    , Space
    , Str "markup"
    , Space
    , Str "of"
    , Space
    , Str "the"
    , Space
    , Str "text"
    , Space
    , Str "could"
    , Space
    , Str "be"
    , Space
    , Str "realised"
    , Space
    , Str "and"
    , Space
    , Str "how"
    , Space
    , Str "to"
    , Space
    , Str "preserve"
    , Space
    , Str "the"
    , Space
    , Str "information"
    , Space
    , Str "for"
    , Space
    , Str "output"
    , Space
    , Str "formatting."
    , SoftBreak
    , Str "Some"
    , Space
    , Str "Lua"
    , Space
    , Str "code"
    , Space
    , Str "as"
    , Space
    , Str "a"
    , Space
    , Str "single"
    , Space
    , Code ( "" , [] , [] ) "Code Block (Lua)"
    , Str ":"
    ]
, CodeBlock
    ( "" , [ "lua" ] , [] )
    "-- defines a factorial function\nfunction fact (n)\n  if n == 0 then\n    return 1\n  else\n    return n * fact(n-1)\n  end\nend\n\nprint(\"enter a number:\")\na = io.read(\"*number\")        -- read a number\nprint(fact(a))"
, Para
    [ Str "And"
    , Space
    , Str "again"
    , Space
    , Str "some"
    , Space
    , Str "Lua"
    , Space
    , Str "code,"
    , Space
    , Str "but"
    , Space
    , Str "this"
    , Space
    , Str "time"
    , Space
    , Str "written"
    , Space
    , Str "down"
    , Space
    , Str "in"
    , Space
    , Str "the"
    , Space
    , Str "corresponding"
    , Space
    , Str "style"
    , Space
    , Str "instead"
    , Space
    , Str "of"
    , Space
    , Str "selection"
    , Space
    , Str "the"
    , Space
    , Str "text"
    , Space
    , Str "and"
    , Space
    , Str "then"
    , Space
    , Str "setting"
    , Space
    , Str "the"
    , Space
    , Str "style."
    , Space
    , Str "This"
    , Space
    , Str "way"
    , Space
    , Str "the"
    , Space
    , Quoted DoubleQuote [ Str "next" ]
    , Space
    , Str "option"
    , Space
    , Str "of"
    , Space
    , Str "the"
    , Space
    , Str "Style"
    , Space
    , Str "should"
    , Space
    , Str "take"
    , Space
    , Str "effect"
    , Space
    , Str "and"
    , Space
    , Str "question"
    , Space
    , Str "is,"
    , Space
    , Str "if"
    , Space
    , Str "this"
    , Space
    , Str "leads"
    , Space
    , Str "to"
    , Space
    , Str "separate"
    , Space
    , Str "paragraphs"
    , Space
    , Str "of"
    , Space
    , Str "the"
    , Space
    , Str "same"
    , Space
    , Str "style"
    , Space
    , Str "or"
    , Space
    , Str "something"
    , Space
    , Str "else."
    ]
, CodeBlock
    ( "" , [ "lua" ] , [] )
    "-- The famous words:\nprint(\"Hello World!\")"
, Para
    [ Str "\8230"
    , Space
    , Str "and"
    , Space
    , Str "we"
    , Space
    , Str "are"
    , Space
    , Str "back"
    , Space
    , Str "to"
    , Space
    , Str "normal."
    , SoftBreak
    , Str "And"
    , Space
    , Str "here"
    , Space
    , Str "comes"
    , Space
    , Str "the"
    , Space
    , Str "same"
    , Space
    , Str "for"
    , Space
    , Str "some"
    , Space
    , Str "Python"
    , Space
    , Str "code:"
    ]
, CodeBlock
    ( "" , [ "python" ] , [] )
    "# This program adds two numbers\n\nnum1 = 1.5\nnum2 = 6.3\n\n# Add two numbers\nsum = num1 + num2\n\n# Display the sum\nprint('The sum of {0} and {1} is {2}'.format(num1, num2, sum))"
, Para
    [ Str "And"
    , Space
    , Str "some"
    , Space
    , Str "code"
    , Space
    , Str "block"
    , Space
    , Str "in"
    , Space
    , Str "the"
    , Space
    , Str "default"
    , Space
    , Str "style"
    , Space
    , Str "-"
    , Space
    , Str "so"
    , Space
    , Str "not"
    , Space
    , Str "specified"
    , Space
    , Str "any"
    , Space
    , Str "further:"
    , SoftBreak
    , Str "The"
    , Space
    , Str "sum"
    , Space
    , Str "of"
    , Space
    , Str "1.5"
    , Space
    , Str "and"
    , Space
    , Str "6.3"
    , Space
    , Str "is"
    , Space
    , Str "7.8"
    , SoftBreak
    , Str "\8230"
    , SoftBreak
    , Str "Probably"
    , Space
    , Str "there"
    , Space
    , Str "are"
    , Space
    , Str "ways"
    , Space
    , Str "to"
    , Space
    , Str "make"
    , Space
    , Str "these"
    , Space
    , Str "code"
    , Space
    , Str "blocks"
    , Space
    , Str "look"
    , Space
    , Str "nicer"
    , Space
    , Str "in"
    , Space
    , Str "Scrivener"
    , Space
    , Str "to"
    , Space
    , Str "help"
    , Space
    , Str "with"
    , Space
    , Str "the"
    , Space
    , Str "authoring"
    , Space
    , Str "in"
    , Space
    , Str "the"
    , Space
    , Str "app"
    , Space
    , Str "-"
    , Space
    , Str "but"
    , Space
    , Str "that\8217s"
    , Space
    , Str "not"
    , Space
    , Str "the"
    , Space
    , Str "purpose"
    , Space
    , Str "here"
    , Space
    , Str "and"
    , Space
    , Str "should"
    , Space
    , Str "(hopefully)"
    , Space
    , Str "not"
    , Space
    , Str "change"
    , Space
    , Str "anything"
    , Space
    , Str "for"
    , Space
    , Str "the"
    , Space
    , Str "exports."
    ]
, Para
    [ Str "First:"
    , Space
    , Str "This"
    , Space
    , Str "one"
    , Space
    , Str "does"
    , Space
    , Str "not"
    , Space
    , Str "have"
    , Space
    , Str "any"
    , Space
    , Str "headline"
    , Space
    , Str "or"
    , Space
    , Str "title."
    , Space
    , Str "I"
    , Space
    , Str "might"
    , Space
    , Str "use"
    , Space
    , Str "the"
    , Space
    , Quoted DoubleQuote [ Str "file" , Space , Str "name" ]
    , Space
    , Str "here"
    , Space
    , Str "and"
    , Space
    , Str "then"
    , Space
    , Str "replace"
    , Space
    , Str "all"
    , Space
    , Str "level"
    , Space
    , Str "n"
    , Space
    , Str "headings"
    , Space
    , Str "with"
    , Space
    , Str "n+1"
    , Space
    , Str "in"
    , Space
    , Str "the"
    , Space
    , Str "post"
    , Space
    , Str "process?!?"
    ]
, Para
    [ Str "A"
    , Space
    , Str "plain"
    , Space
    , Str "YT"
    , Space
    , Str "link:"
    , Space
    , Str "https://www.youtube.com/watch?v=iEIFl6gp58Q"
    , SoftBreak
    , Str "Just"
    , Space
    , Str "another"
    , Space
    , Str "paragraph."
    , SoftBreak
    , Str "A"
    , Space
    , Str "link"
    , Space
    , Str "IN"
    , Space
    , Str "a"
    , Space
    , Str "caption:"
    , Space
    , Str "https://www.youtube.com/watch?v=iEIFl6gp58Q"
    ]
, Para
    [ Str "Image"
    , Space
    , Str "link:"
    , SoftBreak
    , Image
        ( "" , [] , [ ( "width" , "261" ) , ( "height" , "248" ) ] )
        []
        ( "image314.png" , "" )
    , SoftBreak
    , Str "Image"
    , Space
    , Str "link"
    , Space
    , Str "with"
    , Space
    , Str "caption:"
    , SoftBreak
    , Image
        ( "" , [] , [ ( "width" , "261" ) , ( "height" , "248" ) ] )
        [ Str "Reactor"
        , Space
        , Str "is"
        , Space
        , Str "released"
        , Space
        , Str "-"
        , Space
        , Str "GET"
        , Space
        , Str "IT"
        , Space
        , Str "NOW!"
        ]
        ( "image314.png" , "" )
    , SoftBreak
    , Str "Image"
    , Space
    , Str "with"
    , Space
    , Str "no"
    , Space
    , Str "link"
    , Space
    , Str "\8230"
    , Space
    , Str "but"
    , Space
    , Str "I"
    , Space
    , Str "don\8217t"
    , Space
    , Str "see"
    , Space
    , Str "where"
    , Space
    , Str "the"
    , Space
    , Str "center"
    , Space
    , Str "formatting"
    , Space
    , Str "comes"
    , Space
    , Str "from:"
    , SoftBreak
    , Image
        ( "" , [] , [ ( "width" , "82" ) , ( "height" , "101" ) ] )
        []
        ( "image261.png" , "" )
    , SoftBreak
    , Str "Image"
    , Space
    , Str "with"
    , Space
    , Str "no"
    , Space
    , Str "link"
    , Space
    , Str "but"
    , Space
    , Str "a"
    , Space
    , Str "caption:"
    , SoftBreak
    , Image
        ( "" , [] , [ ( "width" , "82" ) , ( "height" , "101" ) ] )
        [ Str "Reactor-Installer.lua" ]
        ( "Reactor-InstallerluaIconImageExample.png" , "" )
    , SoftBreak
    , Str "\8230"
    ]
, Para
    [ Str "The"
    , Space
    , Str "original"
    , Space
    , Str "name"
    , Space
    , Str "of"
    , Space
    , Str "the"
    , Space
    , Code ( "" , [] , [] ) "Reactor-Installer.lua"
    , Space
    , Str "image"
    , Space
    , Str "was"
    , Space
    , Quoted DoubleQuote [ Str "image261" ]
    , Str ";"
    , Space
    , Str "via"
    , Space
    , Quoted DoubleQuote [ Str "Scale" , Space , Str "image" ]
    , Space
    , Str "context"
    , Space
    , Str "menu"
    , Space
    , Str "it"
    , Space
    , Str "has"
    , Space
    , Str "been"
    , Space
    , Str "scaled"
    , Space
    , Str "and"
    , Space
    , Str "renamed"
    , Space
    , Str "to"
    , Space
    , Quoted
        DoubleQuote
        [ Str "Reactor-Installer.lua"
        , Space
        , Str "Icon"
        , Space
        , Str "Image"
        , Space
        , Str "Example"
        ]
    , Space
    , Str "here:"
    ]
, Para
    [ Image
        ( "" , [] , [ ( "width" , "41" ) , ( "height" , "50" ) ] )
        []
        ( "Reactor-InstallerluaIconImageExample.png" , "" )
    ]
, Para
    [ Str "Did"
    , Space
    , Str "a"
    , Space
    , Quoted
        DoubleQuote
        [ Str "Save"
        , Space
        , Str "As"
        , Space
        , Str "Picture"
        , Space
        , Str "\8230"
        ]
    , Space
    , Str "into"
    , Space
    , Str "the"
    , Space
    , Str ".scriv"
    , Space
    , Str "package"
    , Space
    , Str "folder"
    , Space
    , Str "-"
    , Space
    , Str "makes"
    , Space
    , Str "little"
    , Space
    , Str "sense:"
    , SoftBreak
    , Image
        ( "" , [] , [ ( "width" , "82" ) , ( "height" , "101" ) ] )
        []
        ( "image261.png" , "" )
    , SoftBreak
    , Str "An"
    , Space
    , Str "image"
    , Space
    , Str "inserted"
    , Space
    , Str "via"
    , Space
    , Str "Drag\8217n\8217Drop:"
    , SoftBreak
    , Image
        ( "" , [] , [ ( "width" , "397" ) , ( "height" , "430" ) ] )
        []
        ( "SamLowry.png" , "" )
    , SoftBreak
    , Str "\8230"
    , Space
    , Str "interesting"
    , Space
    , Str "to"
    , Space
    , Str "see"
    , Space
    , Str "that"
    , Space
    , Str "the"
    , Space
    , Str "filename"
    , Space
    , Str "is"
    , Space
    , Str "preserved!"
    ]
, Para [ Str "Text" ]
, Para
    [ Str "\8230"
    , Space
    , Str "the"
    , Space
    , Str "end"
    , Space
    , Str ":-P"
    ]
]
