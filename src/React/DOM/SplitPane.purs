module React.DOM.SplitPane
  ( SplitPaneProps, SplitPanePropsO, splitPane, Split, horizontal, vertical
  ) where

import Prelude
import React (ReactClass, ReactElement, ReactProps, ReactRefs, ReactState, ReadOnly, ReadWrite, Event, createElement)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)


foreign import splitPaneImpl :: forall props. ReactClass props


newtype Split = Split String

horizontal :: Split
horizontal = Split "horizontal"

vertical :: Split
vertical = Split "vertical"


type SplitPaneProps o =
  { split :: Split
  | o }

type SplitPanePropsO eff =
  ( minSize :: Int
  , maxSize :: Int
  , defaultSize :: String
  , className :: String
  , step :: Int
  , onDragStarted :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onDragFinished :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onChange :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  )

splitPane :: forall o eff
           . Subrow o (SplitPanePropsO eff)
          => SplitPaneProps o -> Array ReactElement -> ReactElement
splitPane = createElement splitPaneImpl
