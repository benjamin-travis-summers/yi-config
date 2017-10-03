    let deps =
          [ "base >= 4.8 && < 5"
          , "microlens-platform"
          , "mtl"
          , "yi-core"
          , "yi-frontend-vty"
          , "yi-keymap-vim"
          , "yi-misc-modes"
          , "yi-mode-haskell"
          , "yi-rope"
          , "yi-language"
          , "array"
          ]

in  { category     = "Yi"
    , dependencies = deps
    , executables  =
        { e =
            { build-tools   = [ "alex >= 3.0.3 && < 3.2.0 || >= 3.2.1" ]
            , include-dirs  = "src"
            , main          = "Main.hs"
            , other-modules = "Texture"
            , source-dirs   = "src"
            }
        }
    , ghc-options  = "-Wall -ferror-spans -threaded"
    , license      = "AGPL-3"
    , maintainer   = "Benjamin Travis Summers <benjamin@bsummers.me>"
    , name         = "e"
    , version      = "0.14.0"
    }
