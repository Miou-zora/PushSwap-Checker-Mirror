{-
-- EPITECH PROJECT, 2023
-- PushSwapChecker
-- File description:
-- parse_args
-}

module ArgsParse where

import Data.Char (isDigit)

isNumber :: [Char] -> Bool
isNumber [] = True
isNumber (a:an)
    | isDigit a = isNumber an
    | otherwise = False

readInt :: [Char] -> Maybe Int
readInt [] = Nothing
readInt ('-':an)
    | isNumber (an) = Just (-(read (an)::Int))
    | otherwise = Nothing
readInt (a:an)
    | isNumber (a:an) = Just (read (a:an)::Int)
    | otherwise = Nothing

parseArgs :: [String] -> Bool
parseArgs [] = True
parseArgs (a:ax)
    | (readInt a) == Nothing = False
    | otherwise = parseArgs ax

listStringTolistInt :: [String] -> [Int]
listStringTolistInt [] = []
listStringTolistInt (x:list) = (read (x)::Int):(listStringTolistInt list)
