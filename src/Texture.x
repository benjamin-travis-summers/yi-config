{
#define NO_ALEX_CONTEXTS
{-# OPTIONS -w  #-}
module Texture ( lexer, Token(..)) where
import Yi.Lexer.Alex hiding (tokenToStyle)
import Yi.Style
import Data.Monoid ((<>))
}

-- TODO Highlight characters after the 128th on any line.

$tab       = [\t]
$capital   = [A-Z]
$quoting   = [\‘\“\'\;\`\"\”\’]
$matched   = [\[\{\(\<\«\‹\›\»\>\)\}\]]
$normal    = [a-z0-9]
$special   = [ ^ $normal $capital $matched $quoting $white ]
$space     = [ $white # [ \n \t ] ]


:-
  <0> {
      $tab+      { c (const $ withBg vimDarkGrey) }
      $capital+  { c (const $ withFg vimLightGrey) }
      $quoting+  { c (const $ withBd True <> withFg yellow) }
      $matched+  { c (const $ withBd True <> withFg magenta) }
      $normal+   { c (const $ withFg vimLightGreen) }
      $special+  { c (const $ withFg darkred) }

      $space+    { c defaultStyle }
      $space* \n { c errorStyle }
      .          { c errorStyle }
  }

{

vimLightGreen, vimLightGrey, vimDarkGrey :: Color
vimLightGreen = RGB 135 255 155
vimLightGrey  = RGB 185 185 185
vimDarkGrey   = RGB 64 64 64


type HlState = Int
type Token = StyleName

stateToInit :: HlState -> Int
stateToInit x = 0

initState :: HlState
initState = 0

lexer :: StyleLexerASI HlState Token
lexer = StyleLexer
  { _tokenToStyle = id
  , _styleLexer = commonLexer alexScanToken initState
  }

#include "common.hsinc"
}
