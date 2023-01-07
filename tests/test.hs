{-
-- EPITECH PROJECT, 2023
-- PushSwapChecker
-- File description:
-- test
-}

import Test.HUnit
import Operator

-- Test case data type
testCase label assertion = TestLabel label (TestCase assertion)

-- Test suite data type
testSuite label tests = TestLabel label (TestList tests)

test_1 = testCase "test1" (assertEqual "test 1" [2, 1, 3, 4] (op_swap_sa_sb [1, 2, 3, 4]))

-- Test to be run
tests :: Test
tests = testSuite "My Test Suite" [test_1]

-- Run the tests
main = runTestTT tests

