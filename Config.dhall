    let pkg = constructors ./cfg/Stack/Pkg 

in  let stackDefaults = ./cfg/Stack/ConfigDefaults 

in  let localYiDeps =
          [ "yi-core"
          , "yi-frontend-vty"
          , "yi-keymap-vim"
          , "yi-language"
          , "yi-misc-modes"
          , "yi-mode-haskell"
          ]

in  let deps =
            [ "base >= 4.8 && < 5"
            , "microlens-platform"
            , "mtl"
            , "yi-rope"
            , "array"
            ]
          # localYiDeps

in  let stackYaml =
          { extra-deps = [ "yi-rope-0.10" ]
          , packages   =
              [ pkg.simple "."
              , pkg.complex { location = "../yi/", subdirs = localYiDeps }
              ]
          , resolver   = "lts-8.18"
          }

in  let packageYaml =
          { category     = "Yi"
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

in  { package = packageYaml
    , stack   = stackDefaults ⫽ stackYaml : ./cfg/Stack/Config 
    }
