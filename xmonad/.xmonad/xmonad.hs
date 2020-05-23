{-# LANGUAGE OverloadedStrings #-}
-- {-# LANGUAGE ExtendedDefaultRules #-}
-- {-# OPTIONS_GHC -fno-warn-type-defaults #-}
-- ~/.xmonad/xmonad.hs
-- Imports
import XMonad
-- Prompt
import XMonad.Prompt
import XMonad.Prompt.RunOrRaise (runOrRaisePrompt)
import XMonad.Prompt.AppendFile (appendFilePrompt)
-- Hooks
import XMonad.Operations

import System.IO
import System.Exit

import XMonad.Util.Run

import XMonad.Actions.CycleWS

import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.EwmhDesktops

import XMonad.Layout.NoBorders (smartBorders, noBorders)
import XMonad.Layout.PerWorkspace (onWorkspace, onWorkspaces)
import XMonad.Layout.Reflect (reflectHoriz)
import XMonad.Layout.IM
import XMonad.Layout.SimpleFloat
import XMonad.Layout.Spacing
import XMonad.Layout.ResizableTile
import XMonad.Layout.LayoutHints
import XMonad.Layout.LayoutModifier
import XMonad.Layout.Grid
import XMonad.Hooks.DebugStack

import Data.Ratio ((%))
import Data.List

import qualified XMonad.StackSet as W
import qualified Data.Map as M

import System.Posix.Env as Env

-- import Shelly

--import Turtle

import Control.Monad.Trans (liftIO)
-- import System.Log.Logger (logM, Priority(..))

import System.Process


-- Config 
-- Define Terminal
myTerminal      = "urxvt"

-- Define modMask
modMask' :: KeyMask
modMask' = mod4Mask
-- Define workspaces
myWorkspaces = ["1:term","2:web","3:emacs","4:chat","5:media", "6:graph", "7:misc", "8", "9", "A"]

bar_h = 21
dzen_option = "  -y '0' -e 'button3=unhide' -fg '#FFFFFF' -bg '#1B1D1E' -fn 'WenQuanYi Micro Hei-12' -h " ++ show bar_h

dzen1_pos_x = 0  -- only thinkpad
--dzen1_pos_x = 1600
--dzen1_pos_x = 1920

--screen_w = 1366 -- only thinkpad
screen_w = 1366 + dzen1_pos_x

tray_w = 7 * bar_h
tray_pos_x = screen_w - tray_w
-- 
dzen2_w = 320
dzen2_pos_x = tray_pos_x - dzen2_w

dzen1_w = dzen2_pos_x - dzen1_pos_x

-- Dzen/Conky
--myXmonadBar = "dzen2 -xs 1 -ta 'l' " ++ " -x " ++ show dzen1_pos_x  ++ " -w " ++ show dzen1_w ++ dzen_option
myXmonadBar = "dzen2 -ta 'l' " ++ " -x " ++ show dzen1_pos_x  ++ " -w " ++ show dzen1_w ++ dzen_option

myStatusBar = "conky -c $HOME/.xmonad/.conky_dzen | dzen2  -ta 'r' "  ++ " -x "  ++ show dzen2_pos_x  ++ " -w " ++ show dzen2_w ++ dzen_option

myTrayerBar = "stalonetray --icon-gravity E -bg '#1B1D1E' --sticky --dockapp-mode wmaker -d all --window-strut auto  --kludges=force_icons_size --geometry " ++ "7x1+" ++ show tray_pos_x ++ "+0" ++ " -i " ++ show bar_h


myBitmapsDir = "/home/songzc/.xmonad/pic"
-- 
-- Main 

startupApp::X()
startupApp= do
  setWMName "LG3D"
  spawn "ibus-daemon -x -d -r"
--  spawn "fcitx5"
  spawn "nm-applet&"
--  spawn "nohup $HOME/software/davmail/davmail.sh &"
--  spawn "pidgin"
  spawn "firefox"
  spawn "thunderbird"
--  spawn "env LANG='zh_CN.utf8' LC_CTYPE='zh_CN.utf8' emacs &"  -- chinese-im invalid
  spawn myTerminal
  debugStackFull


--getXrandr = do
--  dir <- pwd
--  ret <- shell "xrandr" empty
--  liftIO $ logM "xmonad" WARNING $ " --------------   xrandr return: " ++ show ret    
--  return ret

main = do
--    shelly $ do
--      ret <- escaping False $ cmd "xrandr" "--listactivemonitors  | head  -1 | awk '{print $2}'"
--    xSize <- getXrandr
--    it <- lifteIO $ readProcessWithExitCode  "xrandr" ["--listactivemonitors"] ""
--    it <- readProcess  "xrandr" ["--listactivemonitors"] ""

    monitor_num <- getEnv "monitor_num"
    screen1_width <- getEnv "screen1_width"

--      let t = digitToInt monitor_num
    
  --  liftIO $ logM "xmonad" WARNING $ " --------------   xrandr return: " ++ show monitor_num ++ " " ++ show screen1_width


    

    dzenLeftBar <- spawnPipe myXmonadBar
    dzenRightBar <- spawnPipe myStatusBar
    dzenTrayBar <- spawnPipe myTrayerBar 

--      spawn $ "trayer --edge top --align right --widthtype request --expand true --SetDockType true --SetPartialStrut true --transparent true --alpha 0 --tint 0x1A1918 --e xpand true --heighttype pixel --height 20 --padding 1"
    xmonad $ docks $ withUrgencyHookC dzenUrgencyHook { args = ["-bg", "red", "fg", "black", "-xs", "1", "-y", "25"] } urgencyConfig { remindWhen = Every 15 } $ def
      { terminal            = myTerminal
      , workspaces          = myWorkspaces
      , keys                = keys'
      , modMask             = modMask'
      , layoutHook          = layoutHook'
      , manageHook          = manageDocks <+> manageHook'
      , logHook             = myLogHook dzenLeftBar >> fadeInactiveLogHook 0xdddddddd
      , normalBorderColor   = colorNormalBorder
      , focusedBorderColor  = colorFocusedBorder
      , borderWidth         = 2
      , startupHook         = startupApp
}
--


-- Hooks 
-- ManageHook 
manageHook' :: ManageHook
manageHook' = (composeAll . concat $
    [ [className    =? r            --> doIgnore            |   r   <- myIgnores] -- ignore desktop
    , [className    =? c            --> doShift  "1:term"   |   c   <- myDev    ] -- move dev to main
    , [className    =? c            --> doShift  "2:web"    |   c   <- myWebs   ] -- move webs to main
    , [className    =? c            --> doShift  "3:emacs"  |   c   <- myEmacs  ] -- move webs to main
    , [className    =? c            --> doShift  "4:chat"   |   c   <- myChat   ] -- move chat to chat
    , [className    =? c            --> doShift  "5:media"  |   c   <- myMusic  ] -- move music to music
    , [className    =? c            --> doShift  "6:gimp"   |   c   <- myGimp   ] -- move img to div
    , [className    =? c            --> doCenterFloat       |   c   <- myFloats ] -- float my floats
    , [name         =? n            --> doCenterFloat       |   n   <- myNames  ] -- float my names
--     , [name         =? n            --> doFloat             |   n   <- myEdiff  ]
    , [name         =? n            --> doShift  "3:emacs" |   n   <- myEdiff  ]
    , [isFullscreen                 --> myDoFullFloat                           ]
    , [fmap ("Speedbar" `isPrefixOf`) name --> doFloat ]
    ]) 

    where

        role      = stringProperty "WM_WINDOW_ROLE"
        name      = stringProperty "WM_NAME"

        -- classnames
        myFloats  = ["MPlayer","VirtualBox","Xmessage","XFontSel","Downloads","Nm-connection-editor", "QQ"]
        myWebs    = ["Firefox", "Chromium", "Chromium-browser"]
        myMovie   = ["Boxee","Trine"]
        myMusic   = ["Rhythmbox","Spotify", "Smplayer", "Vlc", "smplayer"]
        myChat    = ["Pidgin","Buddy List", "Psi", "Psi+", "chat", "psi", "Thunderbird"]
        myGimp    = ["Gimp", "Inkscape"]
        myDev	  = ["urxvt", "Lxterminal"]
        myEmacs	  = ["Emacs"]
        myEdiff   = ["Ediff"] 

        -- resources
--        myIgnores = ["desktop","desktop_window","notify-osd","stalonetray","Trayer"]
        myIgnores = ["panel", "trayer", "stalonetray"]

        -- names
        myNames   = ["bashrun","Google Chrome Options","Chromium Options"]

-- a trick for fullscreen but stil allow focusing of other WSs
myDoFullFloat :: ManageHook
myDoFullFloat = doF W.focusDown <+> doFullFloat
--
layoutHook'  =  onWorkspaces ["1:term","5:media"] customLayout $ 
                onWorkspaces ["6:gimp"] gimpLayout $ 
                onWorkspaces ["4:chat"] imLayout $
                onWorkspaces ["3:emacs"] customLayout3 $
                customLayout2

--Bar
myLogHook :: Handle -> X ()
myLogHook h = dynamicLogWithPP $ def
    {
        ppCurrent           =   dzenColor "#ebac54" "#1B1D1E" . pad
      , ppVisible           =   dzenColor "white" "#1B1D1E" . pad
      , ppHidden            =   dzenColor "white" "#1B1D1E" . pad
      , ppHiddenNoWindows   =   dzenColor "#7b7b7b" "#1B1D1E" . pad
      , ppUrgent            =   dzenColor "black" "red" . pad
      , ppWsSep             =   " "
      , ppSep               =   "  |  "
      , ppLayout            =   dzenColor "#ebac54" "#1B1D1E" .
                                (\x -> case x of
                                    "ResizableTall"             ->      "^i(" ++ myBitmapsDir ++ "/tall.xbm)"
                                    "Mirror ResizableTall"      ->      "^i(" ++ myBitmapsDir ++ "/mtall.xbm)"
                                    "Full"                      ->      "^i(" ++ myBitmapsDir ++ "/full.xbm)"
                                    "Simple Float"              ->      "~"
                                    _                           ->      x
                                )
      , ppTitle             =   (" " ++) . dzenColor "white" "#1B1D1E" . dzenEscape
      , ppOutput            =   hPutStrLn h
    } 

-- Layout
customLayout = avoidStruts $ tiled ||| Mirror tiled ||| Full ||| simpleFloat
  where
    tiled   = ResizableTall 1 (2/100) (1/2) []

customLayout2 = avoidStruts $ Full ||| tiled ||| Mirror tiled ||| simpleFloat
  where
    tiled   = ResizableTall 1 (2/100) (1/2) []

customLayout3 = avoidStruts $ tiled
  where
    tiled   = ResizableTall 1 (2/100) (1/8) []


gimpLayout  = avoidStruts $ withIM (0.11) (Role "gimp-toolbox") $
              reflectHoriz $
              withIM (0.15) (Role "gimp-dock") Full

-- imLayout    = avoidStruts $ withIM (1%5) (Or (Title "Buddy List") (And (Resource "main") (ClassName "psi"))) Grid
imLayout    = avoidStruts $ withIM (0.2) (Or (Title "Buddy List") (And (Resource "main") (ClassName "psi"))) Grid 

--
-- Theme 
-- Color names are easier to remember:
colorOrange         = "#FD971F"
colorDarkGray       = "#1B1D1E"
colorPink           = "#F92672"
colorGreen          = "#A6E22E"
colorBlue           = "#66D9EF"
colorYellow         = "#E6DB74"
colorWhite          = "#CCCCC6"
 
colorNormalBorder   = "#CCCCC6"
colorFocusedBorder  = "#fd971f"


barFont  = "terminus"
barXFont = "inconsolata:size=12"
xftFont = "xft: inconsolata-14"
--


-- Prompt Config 
mXPConfig :: XPConfig
mXPConfig =
  def { font                  = barFont
      , bgColor               = colorDarkGray
      , fgColor               = colorGreen
      , bgHLight              = colorGreen
      , fgHLight              = colorDarkGray
      , promptBorderWidth     = 0
      , height                = 14
      , historyFilter         = deleteConsecutive
      }
 
-- Run or Raise Menu
largeXPConfig :: XPConfig
largeXPConfig = mXPConfig
                { font = xftFont
                , height = 22
                }
-- 

runEmacs :: MonadIO m => m ()
runEmacs = do
  catchIO $ Env.setEnv "LANG" "zh_CN.utf8" True
  catchIO $ Env.setEnv "LC_CTYPE" "zh_CN.utf8" True
  spawn "emacs&"

-- Key mapping 
keys' conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
    [ ((modMask,                    xK_r        ), runOrRaisePrompt largeXPConfig)
    , ((modMask .|. shiftMask,      xK_Return   ), spawn $ XMonad.terminal conf)
    , ((modMask,                    xK_F2       ), spawn "gmrun")
    , ((modMask .|. shiftMask,      xK_c        ), kill)
    , ((modMask .|. shiftMask,      xK_l        ), spawn "systemctl suspend")
    -- Programs
    , ((0,                          xK_Print    ), spawn "scrot -e 'mv $f ~/screenshots/'")
    , ((modMask,		            xK_o        ), spawn "chromium")
    , ((modMask,                    xK_m        ), spawn "nautilus --no-desktop --browser")
    , ((modMask,                    xK_c        ), spawn "env LANG='zh_CN.utf8' LC_CTYPE='zh_CN.utf8' emacs &")

    -- Media Keys
    , ((0,                          0x1008ff12  ), spawn "amixer -q sset Headphone toggle")        -- XF86AudioMute
    , ((0,                          0x1008ff11  ), spawn "amixer -q sset Headphone 5%-")   -- XF86AudioLowerVolume
    , ((0,                          0x1008ff13  ), spawn "amixer -q sset Headphone 5%+")   -- XF86AudioRaiseVolume
    , ((0,                          0x1008ff14  ), spawn "rhythmbox-client --play-pause")
    , ((0,                          0x1008ff17  ), spawn "rhythmbox-client --next")
    , ((0,                          0x1008ff16  ), spawn "rhythmbox-client --previous")

    -- layouts
    , ((modMask,                    xK_space    ), sendMessage NextLayout)
    , ((modMask .|. shiftMask,      xK_space    ), setLayout $ XMonad.layoutHook conf)          -- reset layout on current desktop to default
    , ((modMask,                    xK_s        ), sendMessage ToggleStruts)
    , ((modMask,                    xK_f        ), refresh)
    , ((modMask,                    xK_Tab      ), windows W.focusDown)                         -- move focus to next window
    , ((modMask,                    xK_n        ), windows W.focusDown)
    , ((modMask,                    xK_p        ), windows W.focusUp  )
    , ((modMask .|. shiftMask,      xK_n        ), windows W.swapDown)                          -- swap the focused window with the next window
    , ((modMask .|. shiftMask,      xK_p        ), windows W.swapUp)                            -- swap the focused window with the previous window
    , ((modMask,                    xK_Return   ), windows W.swapMaster)
    , ((modMask,                    xK_t        ), withFocused $ windows . W.sink)              -- Push window back into tiling
    , ((modMask,                    xK_h        ), sendMessage Shrink)                          -- %! Shrink a master area
    , ((modMask,                    xK_l        ), sendMessage Expand)                          -- %! Expand a master area
--    , ((modMask,                    xK_comma    ), sendMessage (IncMasterN 1))
--    , ((modMask,                    xK_period   ), sendMessage (IncMasterN (-1)))
    , ((modMask,                    xK_a        ), spawn "python2 /home/songzc/szc_life/bin/im_to_zh.py") 
    , ((modMask,                    xK_o        ), spawn "python2 /home/songzc/szc_life/bin/im_to_en.py") 

    -- workspaces
    , ((modMask .|. controlMask,   xK_Right     ), nextWS)
    , ((modMask .|. shiftMask,     xK_Right     ), shiftToNext)
    , ((modMask .|. controlMask,   xK_Left      ), prevWS)
    , ((modMask .|. shiftMask,     xK_Left      ), shiftToPrev)
    
    -- quit, or restart
    , ((modMask .|. shiftMask,      xK_q        ), io (exitWith ExitSuccess))
    , ((modMask,                    xK_q        ), spawn "/usr/bin/xmonad --recompile && /usr/bin/xmonad --restart")
    , ((modMask,                    xK_y        ), spawn "env WINEARCH=win32 wine /home/songzc/.wine/drive_c/Program\\ Files/QQ/Bin/QQ.exe")
    ]
    ++
    -- mod-[1..9] %! Switch to workspace N
    -- mod-shift-[1..9] %! Move client to workspace N
    [((m .|. modMask, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_ampersand, xK_bracketleft, xK_braceleft, xK_braceright, xK_parenleft, xK_equal, xK_asterisk, xK_parenright, xK_plus, xK_bracketright, xK_exclam]                    
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++

    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modMask, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_semicolon, xK_comma, xK_period] [1, 0, 2]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

--
-- vim:foldmethod=marker sw=4 sts=4 ts=4 tw=0 et ai nowrap
