{-
-- EPITECH PROJECT, 2023
-- PushSwapChecker
-- File description:
-- main
-}

import PushSwapChecker
import System.Environment
import ArgsParse

main :: IO ()
main = do
    inputOperators <- getLine
    integers <- getArgs
    if ((checkInputs inputOperators integers) && pushSwapChecker (words inputOperators) (listStringTolistInt integers))
        then putStrLn "aze"
        else putStrLn "eza"

