    let Pkg = ./cfg/Stack/Pkg 

in  let defaults = ./cfg/Stack/ConfigDefaults 

in  let localYiDeps =
          [ "yi-core"
          , "yi-frontend-vty"
          , "yi-keymap-vim"
          , "yi-language"
          , "yi-misc-modes"
          , "yi-mode-haskell"
          ]

in  let settings =
          { extra-deps = [ "yi-rope-0.10" ]
          , packages   =
              [ Pkg.simple "."
              , Pkg.complex { location = "../yi/", subdirs = localYiDeps }
              ]
          , resolver   = "lts-8.18"
          }

in  (defaults ⫽ settings : ./cfg/Stack/ConfigSchema )
