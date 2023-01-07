{-
-- EPITECH PROJECT, 2023
-- PushSwapChecker
-- File description:
-- test
-}

import Test.HUnit
import Operator
import ArgsParse
import PushSwapChecker

-- Test case data type
testCase label assertion = TestLabel label (TestCase assertion)

-- Test suite data type
testSuite label tests = TestLabel label (TestList tests)

op_swap_sa_sb_lambda = testCase "op_swap_sa_sb_lambda" (assertEqual "op_swap_sa_sb_lambda" [2, 1, 3, 4] (op_swap_sa_sb [1, 2, 3, 4]))
op_swap_sa_sb_empty = testCase "op_swap_sa_sb_lambda" (assertEqual "op_swap_sa_sb_lambda" [] (op_swap_sa_sb []))
op_swap_sc_lambda = testCase "op_swap_sc_lambda" (assertEqual "op_swap_sc_lambda" ([2, 1, 3, 4], [2, 1, 3, 4]) (op_swap_sc ([1, 2, 3, 4], [1, 2, 3, 4])))
op_swap_sc_empty_1 = testCase "op_swap_sc_empty_1" (assertEqual "op_swap_sc_empty_1" ([], [2, 1, 3, 4]) (op_swap_sc ([], [1, 2, 3, 4])))
op_swap_sc_empty_2 = testCase "op_swap_sc_empty_2" (assertEqual "op_swap_sc_empty_2" ([2, 1, 3, 4], []) (op_swap_sc ([1, 2, 3, 4], [])))
op_push_pa_lambda = testCase "op_push_pa_lambda" (assertEqual "op_push_pa_lambda" ([4,1,2,3],[5,6]) (op_push_pa ([1,2,3], [4,5,6])))
op_push_pa_empty = testCase "op_push_pa_empty" (assertEqual "op_push_pa_empty" ([1,2,3], []) (op_push_pa ([1,2,3],[])))
op_push_pb_lambda = testCase "op_push_pb_lambda" (assertEqual "op_push_pb_lambda" ([2,3],[1,4,5,6]) (op_push_pb ([1,2,3], [4,5,6])))
op_push_pb_empty = testCase "op_push_pb_empty" (assertEqual "op_push_pb_empty" ([], [4,5,6]) (op_push_pb ([],[4,5,6])))
op_rotate_ra_rb_lambda = testCase "op_rotate_ra_rb_lambda" (assertEqual "op_rotate_ra_rb_lambda" ([3,2,1]) (op_rotate_ra_rb [1,2,3]))
op_rotate_ra_rb_1_arg = testCase "op_rotate_ra_rb_1_arg" (assertEqual "op_rotate_ra_rb_1_arg" ([1]) (op_rotate_ra_rb [1]))
op_rotate_rr_lambda = testCase "op_rotate_rr_lambda" (assertEqual "op_rotate_rr_lambda" ([3,2,1], [3,2,1]) (op_rotate_rr [1,2,3] [1,2,3]))
op_rotate_rra_rrb_lambda = testCase "op_rotate_rra_rrb_lambda" (assertEqual "op_rotate_rra_rrb_lambda" [3,1,2] (op_rotate_rra_rrb [1,2,3]))
op_rotate_rra_rrb_1_arg = testCase "op_rotate_rra_rrb_1_arg" (assertEqual "op_rotate_rra_rrb_1_arg" [3] (op_rotate_rra_rrb [3]))
op_rotate_rrr_lambda = testCase "op_rotate_rrr_lambda" (assertEqual "op_rotate_rrr_lambda" ([3,1,2], [3,1,2]) (op_rotate_rrr [1,2,3] [1,2,3]))
isNumber_lambda = testCase "isNumber_lambda" (assertEqual "isNumber_lambda" True (isNumber "3"))
isNumber_empty = testCase "isNumber_empty" (assertEqual "isNumber_empty" True (isNumber ""))
isNumber_false = testCase "isNumber_false" (assertEqual "isNumber_false" False (isNumber "a"))
parseArgs_lambda = testCase "parseArgs_lambda" (assertEqual "parseArgs_lambda" True (parseArgs ["1","2","3"]))
parseArgs_empty = testCase "parseArgs_empty" (assertEqual "parseArgs_empty" True (parseArgs []))
parseArgs_false = testCase "parseArgs_false" (assertEqual "parseArgs_false" False (parseArgs ["1","2","a"]))
listStringTolistInt_empty = testCase "listStringTolistInt_empty" (assertEqual "listStringTolistInt_empty" [] (listStringTolistInt []))
listStringTolistInt_lambda = testCase "listStringTolistInt_lambda" (assertEqual "listStringTolistInt_lambda" [1,2,3] (listStringTolistInt ["1","2","3"]))
checkEndList_lambda = testCase "checkEndList_lambda" (assertEqual "checkEndList_lambda" True (checkEndList ["1","2","3"]))
checkEndList_false = testCase "checkEndList_false" (assertEqual "checkEndList_false" False (checkEndList ["5","2","3"]))
readInt_lambda = testCase "readInt_lambda" (assertEqual "readInt_lambda" (Just 3) (readInt "3"))
readInt_nothing = testCase "readInt_nothing" (assertEqual "readInt_nothing" Nothing (readInt "a"))
checkInputOperator_lambda = testCase "checkInputOperator_lambda" (assertEqual "checkInputOperator_lambda" True (checkInputOperator ["sa", "sa", "sb"]))
checkInputOperator_empty = testCase "checkInputOperator_empty" (assertEqual "checkInputOperator_empty" True (checkInputOperator []))
checkInputOperator_false_letter = testCase "checkInputOperator_false_letter" (assertEqual "checkInputOperator_false_letter" False (checkInputOperator ["s"]))
checkInputOperator_false_list = testCase "checkInputOperator_false_list" (assertEqual "checkInputOperator_false_list" False (checkInputOperator [""]))
littleOperator_lambda = testCase "littleOperator_lambda" (assertEqual "littleOperator_lambda" ([2, 1, 3], [1, 2, 3]) (littleOperator "sa" ([1, 2, 3], [1, 2, 3])))
bigOperator_lambda = testCase "bigOperator_lambda" (assertEqual "bigOperator_lambda" ([3, 1, 2], [3, 1, 2]) (bigOperator "rrr" ([1, 2, 3], [1, 2, 3])))
switch_lambda_rrr = testCase "switch_lambda_rrr" (assertEqual "switch_lambda_rrr" ([3, 1, 2], [3, 1, 2]) (switch "rrr" ([1, 2, 3], [1, 2, 3])))
switch_lambda_sa = testCase "switch_lambda_sa" (assertEqual "switch_lambda_sa" ([2, 1, 3], [1, 2, 3]) (switch "sa" ([1, 2, 3], [1, 2, 3])))
execute_lambda = testCase "execute_lambda" (assertEqual "execute_lambda" ([1, 2, 3], [1, 2, 3]) (execute ["sa", "sa"] ([1, 2, 3], [1, 2, 3])))
execute_lambda_sa = testCase "execute_lambda_sa" (assertEqual "execute_lambda_sa" ([2, 1, 3], [1, 2, 3]) (execute ["sa"] ([1, 2, 3], [1, 2, 3])))
compareTwoListInt_false = testCase "compareTwoListInt_false" (assertEqual "compareTwoListInt_false" False (compareTwoListInt [1, 2, 3] [1, 3, 3]))
compareTwoListInt_true = testCase "compareTwoListInt_true" (assertEqual "compareTwoListInt_true" True (compareTwoListInt [1, 2, 3] [1, 2, 3]))
compareTwoListInt_false_s = testCase "compareTwoListInt_false_s" (assertEqual "compareTwoListInt_false_s" False (compareTwoListInt [1, 3] [1, 2, 3]))
checkEnd_true = testCase "checkEnd_true" (assertEqual "checkEnd_true" True (checkEnd ([1, 3], []) [3, 1]))
checkEnd_false_empty = testCase "checkEnd_false_empty" (assertEqual "checkEnd_false_empty" False (checkEnd ([3, 1], []) [3, 1]))
checkEnd_false = testCase "checkEnd_false" (assertEqual "checkEnd_false" False (checkEnd ([1], []) [3, 1]))
checkEnd_true_all = testCase "checkEnd_true_all" (assertEqual "checkEnd_true_all" True (pushSwapChecker ["sa", "pb", "pb", "pb", "sa", "pa", "pa", "pa"] [2, 1, 3, 6, 5, 8]))


-- Test to be run
tests :: Test
tests = testSuite "My Test Suite"
    [
        op_swap_sa_sb_lambda,
        op_swap_sa_sb_empty,
        op_swap_sc_lambda,
        op_swap_sc_lambda,
        op_swap_sc_empty_1,
        op_swap_sc_empty_2,
        op_push_pa_lambda,
        op_push_pa_empty,
        op_push_pb_lambda,
        op_push_pb_empty,
        op_rotate_ra_rb_lambda,
        op_rotate_ra_rb_1_arg,
        op_rotate_rr_lambda,
        op_rotate_rra_rrb_lambda,
        op_rotate_rra_rrb_1_arg,
        op_rotate_rrr_lambda,
        isNumber_lambda,
        isNumber_empty,
        isNumber_false,
        parseArgs_lambda,
        parseArgs_empty,
        parseArgs_false,
        listStringTolistInt_empty,
        listStringTolistInt_lambda,
        checkEndList_lambda,
        checkEndList_false,
        readInt_lambda,
        readInt_nothing,
        checkInputOperator_lambda,
        checkInputOperator_empty,
        checkInputOperator_false_letter,
        checkInputOperator_false_list,
        littleOperator_lambda,
        bigOperator_lambda,
        switch_lambda_sa,
        execute_lambda,
        execute_lambda_sa,
        compareTwoListInt_false_s,
        compareTwoListInt_true,
        compareTwoListInt_false,
        checkEnd_true,
        checkEnd_false_empty,
        checkEnd_false,
        checkEnd_true_all
    ]

-- Run the tests
main = runTestTT tests

