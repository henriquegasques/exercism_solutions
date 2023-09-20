{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -Wno-missing-safe-haskell-mode #-}
module Paths_proverb (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [1,1,0,2] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/gasks/workspace/exercism/haskell/proverb/.stack-work/install/x86_64-linux/f702a0fa2dd51ed83f93df5394c195e7a6ea04b3e53451b247ccb2d49a5d801d/9.0.2/bin"
libdir     = "/home/gasks/workspace/exercism/haskell/proverb/.stack-work/install/x86_64-linux/f702a0fa2dd51ed83f93df5394c195e7a6ea04b3e53451b247ccb2d49a5d801d/9.0.2/lib/x86_64-linux-ghc-9.0.2/proverb-1.1.0.2-Kb5cWSmdKQFHs3qJ8KxBV9"
dynlibdir  = "/home/gasks/workspace/exercism/haskell/proverb/.stack-work/install/x86_64-linux/f702a0fa2dd51ed83f93df5394c195e7a6ea04b3e53451b247ccb2d49a5d801d/9.0.2/lib/x86_64-linux-ghc-9.0.2"
datadir    = "/home/gasks/workspace/exercism/haskell/proverb/.stack-work/install/x86_64-linux/f702a0fa2dd51ed83f93df5394c195e7a6ea04b3e53451b247ccb2d49a5d801d/9.0.2/share/x86_64-linux-ghc-9.0.2/proverb-1.1.0.2"
libexecdir = "/home/gasks/workspace/exercism/haskell/proverb/.stack-work/install/x86_64-linux/f702a0fa2dd51ed83f93df5394c195e7a6ea04b3e53451b247ccb2d49a5d801d/9.0.2/libexec/x86_64-linux-ghc-9.0.2/proverb-1.1.0.2"
sysconfdir = "/home/gasks/workspace/exercism/haskell/proverb/.stack-work/install/x86_64-linux/f702a0fa2dd51ed83f93df5394c195e7a6ea04b3e53451b247ccb2d49a5d801d/9.0.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "proverb_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "proverb_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "proverb_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "proverb_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "proverb_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "proverb_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
