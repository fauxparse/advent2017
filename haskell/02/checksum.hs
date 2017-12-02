import Data.List
import Control.Monad

main = do
  input <- getContents
  length input `seq` return () -- wait for end of input
  putStrLn . show . (checksum diff) $ lines input
  putStrLn . show . (checksum divisible) $ lines input

checksum :: ([Int] -> Int) -> [String] -> Int
checksum fn = foldr (+) 0 . map (fn . map read . words)

diff :: [Int] -> Int
diff = liftM2 (-) maximum minimum

divisible :: [Int] -> Int
divisible = uncurry div . head . pairs . reverse . sort

pairs :: [Int] -> [(Int, Int)]
pairs []     = []
pairs (x:[]) = []
pairs (x:xs) = [(x, y) | y <- xs, (x `mod` y) == 0] ++ (pairs xs)
