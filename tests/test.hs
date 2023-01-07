{-
-- EPITECH PROJECT, 2023
-- PushSwapChecker
-- File description:
-- test
-}

import Test.HUnit
import Operator
import ArgsParse

-- Test case data type
testCase label assertion = TestLabel label (TestCase assertion)

-- Test suite data type
testSuite label tests = TestLabel label (TestList tests)

test_1 = testCase "test1" (assertEqual "test 1" [2, 1, 3, 4] (op_swap_sa_sb [1, 2, 3, 4]))
test_2 = testCase "test2" (assertEqual "test 2" [] (op_swap_sa_sb []))
test_3 = testCase "test3" (assertEqual "test 3" ([2, 1, 3, 4], [2, 1, 3, 4]) (op_swap_sc ([1, 2, 3, 4], [1, 2, 3, 4])))
test_4 = testCase "test4" (assertEqual "test 4" ([], [2, 1, 3, 4]) (op_swap_sc ([], [1, 2, 3, 4])))
test_5 = testCase "test5" (assertEqual "test 5" ([2, 1, 3, 4], []) (op_swap_sc ([1, 2, 3, 4], [])))
test_6 = testCase "test6" (assertEqual "test 6" ([4,1,2,3],[5,6]) (op_push_pa ([1,2,3], [4,5,6])))
test_7 = testCase "test7" (assertEqual "test 7" ([1,2,3], []) (op_push_pa ([1,2,3],[])))
test_8 = testCase "test8" (assertEqual "test 8" ([2,3],[1,4,5,6]) (op_push_pb ([1,2,3], [4,5,6])))
test_9 = testCase "test9" (assertEqual "test 9" ([], [4,5,6]) (op_push_pb ([],[4,5,6])))
test_10 = testCase "test10" (assertEqual "test10" ([3,2,1]) (op_rotate_ra_rb [1,2,3]))
test_11 = testCase "test11" (assertEqual "test11" ([1]) (op_rotate_ra_rb [1]))
test_12 = testCase "test12" (assertEqual "test12" ([3,2,1], [3,2,1]) (op_rotate_rr [1,2,3] [1,2,3]))
test_13 = testCase "test13" (assertEqual "test13" [3,1,2] (op_rotate_rra_rrb [1,2,3]))
test_14 = testCase "test14" (assertEqual "test14" [3] (op_rotate_rra_rrb [3]))
test_15 = testCase "test15" (assertEqual "test15" ([3,1,2], [3,1,2]) (op_rotate_rrr [1,2,3] [1,2,3]))
test_16 = testCase "test16" (assertEqual "test16" True (isNumber "3"))
test_17 = testCase "test17" (assertEqual "test17" True (isNumber ""))
test_18 = testCase "test18" (assertEqual "test18" False (isNumber "a"))
test_19 = testCase "test19" (assertEqual "test19" True (parseArgs ["1","2","3"]))
test_20 = testCase "test20" (assertEqual "test20" True (parseArgs []))
test_21 = testCase "test21" (assertEqual "test21" False (parseArgs ["1","2","a"]))
test_22 = testCase "test22" (assertEqual "test22" [] (listStringTolistInt []))
test_23 = testCase "test23" (assertEqual "test23" [1,2,3] (listStringTolistInt ["1","2","3"]))
test_24 = testCase "test24" (assertEqual "test24" True (checkEndList ["1","2","3"]))
test_25 = testCase "test25" (assertEqual "test25" False (checkEndList ["5","2","3"]))
test_26 = testCase "test26" (assertEqual "test26" (Just 3) (readInt "3"))
test_27 = testCase "test27" (assertEqual "test27" Nothing (readInt "a"))

-- Test to be run
tests :: Test
tests = testSuite "My Test Suite"
    [
        test_1,
        test_2,
        test_3,
        test_4,
        test_5,
        test_6,
        test_7,
        test_8,
        test_9,
        test_10,
        test_11,
        test_12,
        test_13,
        test_14,
        test_15,
        test_16,
        test_17,
        test_18,
        test_19,
        test_20,
        test_21,
        test_22,
        test_23,
        test_24,
        test_25,
        test_26,
        test_27
    ]

-- Run the tests
main = runTestTT tests

