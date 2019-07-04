{-# LANGUAGE CPP #-}

import           Data.Char (isDigit)
import           Data.List (intercalate)
import           Data.Monoid ((<>))

import           Distribution.PackageDescription
import           Distribution.Verbosity
import           Distribution.Simple
import           Distribution.Simple.Setup (BuildFlags(..), ReplFlags(..), TestFlags(..), fromFlag)
import           Distribution.Simple.LocalBuildInfo
import           Distribution.Simple.BuildPaths (autogenModulesDir)
import           Distribution.Simple.Utils (createDirectoryIfMissingVerbose, rewriteFile, rawSystemStdout)

#if !MIN_VERSION_Cabal(2,0,0)
import           Data.Version (showVersion)
#endif


--
--                                                   /===-_---~~~~~~~~~------____
--                                                  |===-~___                _,-'
--                   -==\\                         `//~\\   ~~~~`---.___.-~~
--               ______-==|                         | |  \\           _-~`
--         __--~~~  ,-/-==\\                        | |   `\        ,'
--      _-~       /'    |  \\                      / /      \      /
--    .'        /       |   \\                   /' /        \   /'
--   /  ____  /         |    \`\.__/-~~ ~ \ _ _/'  /          \/'
--  /-'~    ~~~~~---__  |     ~-/~         ( )   /'        _--~`
--                    \_|      /        _)   ;  ),   __--~~
--                      '~~--_/      _-~/-  / \   '-~ \
--                     {\__--_/}    / \\_>- )<__\      \
--                     /'   (_/  _-~  | |__>--<__|      |
--                    |0  0 _/) )-~     | |__>--<__|      |
--                    / /~ ,_/       / /__>---<__/      |
--                   o o _//        /-~_>---<__-~      /
--                   (^(~          /~_>---<__-      _-~
--                  ,/|           /__>--<__/     _-~
--               ,//('(          |__>--<__|     /                  .----_
--              ( ( '))          |__>--<__|    |                 /' _---_~\
--           `-)) )) (           |__>--<__|    |               /'  /     ~\`\
--          ,/,'//( (             \__>--<__\    \            /'  //        ||
--        ,( ( ((, ))              ~-__>--<_~-_  ~--____---~' _/'/        /'
--      `~/  )` ) ,/|                 ~-_~>--<_/-__       __-~ _/
--    ._-~//( )/ )) `                    ~~-'_/_/ /~~~~~~~__--~
--     ;'( ')/ ,)(                              ~~~~~~~~~~
--    ' ') '( (/
--      '   '  `
--
--  NOTE  This file differs from the standard Ambiata Setup.hs in that we use
--  NOTE  'autoconfUserHooks' below instead of 'simpleUserHooks'. Be sure to
--  NOTE  take this in to account when upgrading.
--
main :: IO ()
main =
  let hooks = autoconfUserHooks
   in defaultMainWithHooks hooks
