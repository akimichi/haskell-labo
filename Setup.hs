import Distribution.Simple
main = defaultMain

-- module Main (main) where

-- import Distribution.Simple
-- import Distribution.PackageDescription
-- import Distribution.Simple.LocalBuildInfo (LocalBuildInfo(..))

-- import Data.List (isInfixOf)
-- import System.Cmd (system)
-- import System.FilePath
-- import System.Directory (getCurrentDirectory)

-- main :: IO ()
-- main = do
--     defaultMainWithHooks $ defaultUserHooks {runTests = sampleTest}
--     where
--         sampleTest _ _ pkgDisc bInfo = do
--             -- ���ߤΥǥ��쥯�ȥ�Υѥ�̾�����
--             curr <- getCurrentDirectory
--             let dir = buildDir bInfo
--                 -- data: ����Ф�
--                 testData = dataFiles pkgDisc
--                 -- ̾���� "Test" ���Ĥ���ΤΤ�
--                 filterName = filter (("Test" `isInfixOf`) . exeName)
--                 -- buildable: �� False �Ǥʤ���ΤΤ�
--                 filterBuildable = filter (buildable . buildInfo)
--                 filterTest = filterName . filterBuildable
--                 -- executable: �μ¹Բ�ǽ�ե�����δ����ѥ�̾�����
--                 path exec =   curr </> dir
--                           -- ���פʳ�ĥ�Ҥν���
--                           </> (dropExtension . exeName) exec
--                           </> (dropExtension . exeName) exec
--             -- filterTest �ξ��˹礦 executable: �μ¹Բ�ǽ�ե������¹�
--             mapM_ (system . path) $ filterTest $ executables pkgDisc
