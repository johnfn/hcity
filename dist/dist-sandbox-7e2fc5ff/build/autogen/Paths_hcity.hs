module Paths_hcity (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,0], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/johnfn/code/hcity/.cabal-sandbox/bin"
libdir     = "/Users/johnfn/code/hcity/.cabal-sandbox/lib/x86_64-osx-ghc-7.8.2/hcity-0.0"
datadir    = "/Users/johnfn/code/hcity/.cabal-sandbox/share/x86_64-osx-ghc-7.8.2/hcity-0.0"
libexecdir = "/Users/johnfn/code/hcity/.cabal-sandbox/libexec"
sysconfdir = "/Users/johnfn/code/hcity/.cabal-sandbox/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "hcity_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "hcity_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "hcity_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "hcity_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "hcity_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
