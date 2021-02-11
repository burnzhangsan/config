import XMonad
import XMonad.Hooks.DynamicLog -- Status bar
import XMonad.Hooks.EwmhDesktops (fullscreenEventHook) -- better than the fullscreenEventHook in XMonad.Layout.Fullscreen
import XMonad.Hooks.ManageDocks (avoidStruts)
import XMonad.Layout.MagicFocus (magicFocus)
import XMonad.Layout.Spacing (smartSpacing)
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.EZConfig
import Graphics.X11.ExtraTypes.XF86
import System.IO (Handle, hPutStrLn)

main :: IO ()

main = do
  bar <- spawnPipe "xmobar ~/.xmonad/xmobar.hs"
  xmonad $ def
    { borderWidth = 0
    , modMask = mod4Mask
    , terminal = "lilyterm"
    , workspaces = myWorkspaces
    , logHook = myStatusBarLogHook bar
    , handleEventHook = fullscreenEventHook
	, layoutHook = myLayouts
    , focusFollowsMouse = False
    }
	
	`additionalKeysP`
	[ ("M-<Return>", spawn "lilyterm")
	, ("M-d", spawn "i3-dmenu-desktop")
	, ("<XF86AudioStop>", spawn "mpc toggle")
	, ("<XF86AudioPlay>", spawn "mpc toggle")
	, ("<XF86AudioPause>", spawn "mpc toggle")
	, ("<XF86AudioPrev>", spawn "mpc prev")
	, ("<XF86AudioNext>", spawn "mpc next")
	, ("M-S-t", spawn "telegram-desktop")
	, ("M-S-g", spawn "google-chrome-stable")
	, ("M-S-d", spawn "pcmanfm")
	]

myWorkspaces :: [String]
myWorkspaces = ["1: main", "2: code", "3: doc", "4: www", "5: media", "6: im"]

clickable :: String -> String
clickable l = "<action=xdotool key super+" ++ ws ++ ">" ++ l ++ "</action>"
  where ws = take 1 l

-- I can't set the type signature of layoutHook.
myLayouts = avoidStruts $ tall ||| Mirror tall ||| full
  where tall = smartSpacing 3 . magicFocus $ Tall 1 (3/100) (1/2)
        full = Full

cutTail :: String -> String
cutTail xs = if length xs > 50
              then take 50 xs ++ "..."
              else xs

myStatusBarLogHook :: Handle -> X ()
myStatusBarLogHook h = dynamicLogWithPP $ xmobarPP
  { ppOutput = hPutStrLn h
  , ppCurrent = xmobarColor "#eeeeee" "#555555" . wrap " " " " . clickable
  , ppVisible = xmobarColor "#eeeeee" "#444444" . wrap " " " " . clickable
  , ppHidden = xmobarColor "#eeeeee" "" . clickable
  -- , ppHiddenNoWindows = ppHiddenNoWindows xmobarPP
  -- , ppUrgent = xmobarColor "lightred" "darkred" . wrap " " " " . clickable
  , ppSep = "   "
  , ppWsSep = " "
  , ppTitle = xmobarColor "#52e72c" "" . wrap "<" ">" . cutTail
  -- , ppTitleSanitize :: String -> String
  , ppLayout = xmobarColor "yellow" "" . wrap "[" "]"
  -- , ppOrder = ppOrder xmobarPP
  -- , ppSort = ppSort xmobarPP
  -- , ppExtras = ppExtras xmobarPP
  }

-- myFadeWindowsLogHook :: X ()
-- myFadeWindowsLogHook = fadeWindowsLogHook myFadeHook
--   where myFadeHook = composeAll [ isUnfocusedOnCurrentWS --> transparency 0.2
--                                 , opaque
--                                 ]

myManageHook :: ManageHook
myManageHook = composeAll
  [ className =? "feh" --> doFloat
  , className =? "Gimp" --> doFloat
  , className =? "mpv" --> doFloat
  , className =? "Pavucontrol" --> doFloat
  , className =? "pcmanfm" --> doFloat
  , className =? "xmobar" --> doIgnore
  , title =? "Task Manager - Google Chrome" --> doFloat
  ]

