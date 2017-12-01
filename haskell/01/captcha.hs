import System.IO
import Data.Char
import Control.Monad

main = do
  input <- getLine
  let digits = map digitToInt input
  putStrLn . show . part1 $ digits
  putStrLn . show . part2 $ digits

part1 :: [Int] -> Int
part1 digits = captcha 1 digits

part2 :: [Int] -> Int
part2 = captcha =<< flip div 2 . length

captcha :: Int -> [Int] -> Int
captcha n = sumPairs . ap zip (rotate n)

sumPairs :: [(Int, Int)] -> Int
sumPairs [] = 0
sumPairs ((a, b):xs)
  | a == b    = a + (sumPairs xs)
  | otherwise = sumPairs xs

rotate :: Int -> [Int] -> [Int]
rotate n list = (drop n list) ++ (take n list)
