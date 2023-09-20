{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_bank_account (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
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
version = Version [0,1,0,4] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath



bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/home/gasks/workspace/exercism/haskell/bank-account/.stack-work/install/x86_64-linux/19a2178cbfdc548b28caead1315fce4d36a3fd38d835273b54b2720726c8b866/9.2.7/bin"
libdir     = "/home/gasks/workspace/exercism/haskell/bank-account/.stack-work/install/x86_64-linux/19a2178cbfdc548b28caead1315fce4d36a3fd38d835273b54b2720726c8b866/9.2.7/lib/x86_64-linux-ghc-9.2.7/bank-account-0.1.0.4-7bHpap9ayLTFgfoNepnhTy"
dynlibdir  = "/home/gasks/workspace/exercism/haskell/bank-account/.stack-work/install/x86_64-linux/19a2178cbfdc548b28caead1315fce4d36a3fd38d835273b54b2720726c8b866/9.2.7/lib/x86_64-linux-ghc-9.2.7"
datadir    = "/home/gasks/workspace/exercism/haskell/bank-account/.stack-work/install/x86_64-linux/19a2178cbfdc548b28caead1315fce4d36a3fd38d835273b54b2720726c8b866/9.2.7/share/x86_64-linux-ghc-9.2.7/bank-account-0.1.0.4"
libexecdir = "/home/gasks/workspace/exercism/haskell/bank-account/.stack-work/install/x86_64-linux/19a2178cbfdc548b28caead1315fce4d36a3fd38d835273b54b2720726c8b866/9.2.7/libexec/x86_64-linux-ghc-9.2.7/bank-account-0.1.0.4"
sysconfdir = "/home/gasks/workspace/exercism/haskell/bank-account/.stack-work/install/x86_64-linux/19a2178cbfdc548b28caead1315fce4d36a3fd38d835273b54b2720726c8b866/9.2.7/etc"

getBinDir     = catchIO (getEnv "bank_account_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "bank_account_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "bank_account_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "bank_account_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "bank_account_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "bank_account_sysconfdir") (\_ -> return sysconfdir)




joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
