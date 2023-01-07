{-
-- EPITECH PROJECT, 2023
-- PushSwapChecker
-- File description:
-- pushswapChecker
-}

module PushSwapChecker where

import Data.List
import ArgsParse
import Operator
import System.Exit

operators :: [String]
operators = ["sa", "sb", "sc", "pa", "pb", "ra", "rb", "rr", "rra", "rrb", "rrr"]

goodExit :: IO ()
goodExit = putStrLn "OK" >> exitWith (ExitSuccess)

errorExit :: IO ()
errorExit = putStrLn "KO" >> exitWith (ExitFailure 84)

checkInputOperator :: [String] -> Bool
checkInputOperator [] = True
checkInputOperator (a:an)
    | elem a operators == False = False
    | otherwise = checkInputOperator an

littleOperator :: String -> ([Int], [Int]) -> ([Int], [Int])
littleOperator "sa" (a, b) = ((op_swap_sa_sb a), b)
littleOperator "sb" (a, b) = (a, (op_swap_sa_sb b))
littleOperator "sc" a = op_swap_sc a
littleOperator "pa" a = op_push_pa a
littleOperator "pb" a = op_push_pb a
littleOperator "ra" (a, b) = ((op_rotate_ra_rb a), b)
littleOperator "rb" (a, b) = (a, (op_rotate_ra_rb b))

bigOperator :: String -> ([Int], [Int]) -> ([Int], [Int])
bigOperator "rra" (a, b) = (op_rotate_rra_rrb a, b)
bigOperator "rrb" (a, b) = (a, op_rotate_rra_rrb b)
bigOperator "rrr" (a, b) = op_rotate_rrr a b

switch :: String -> ([Int], [Int]) -> ([Int], [Int])
switch a b
    | length a == 2 = littleOperator a b
    | length a == 3 = bigOperator a b
    | otherwise = b

execute :: [String] -> ([Int], [Int]) -> ([Int], [Int])
execute [] integers = integers
execute (a:an) integers = execute an (switch a integers)

compareTwoListInt :: [Int] -> [Int] -> Bool
compareTwoListInt [] [] = True
compareTwoListInt [] (a:an) = False
compareTwoListInt (a:an) [] = False
compareTwoListInt (a:an) (b:bn)
    | a /= b = False
    | otherwise = compareTwoListInt an bn

checkEnd :: ([Int], [Int]) -> [Int] -> Bool
checkEnd (a, b) c = compareTwoListInt a (sort c)

pushSwapChecker :: [String] -> [Int] -> Bool
pushSwapChecker [] a = checkEnd (a, []) a
pushSwapChecker inputOperators integers = checkEnd (execute ( inputOperators) (integers, [])) integers

checkInputs :: String -> [String] -> Bool
checkInputs a [] = False
checkInputs a b = checkInputOperator (words a) && parseArgs b
