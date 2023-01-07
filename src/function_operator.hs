{-
-- EPITECH PROJECT, 2023
-- function for operator for the project
-- File description:
-- the all operator : sa, sb sc pa pb ra rb rr rra rrb rrr
-}

module Operator where

op_swap_sa_sb :: [Int] -> [Int]
op_swap_sa_sb [] = []
op_swap_sa_sb (f_x:f_y:list) = (f_y:f_x:list)

op_swap_sc :: ([Int], [Int]) -> ([Int], [Int])
op_swap_sc (x, y) = (op_swap_sa_sb x, op_swap_sa_sb y)

op_push_pa :: ([Int], [Int]) -> ([Int], [Int])
op_push_pa (list, []) = (list, [])
op_push_pa ((list), (b:list2)) = (b:list, list2)

op_push_pb :: ([Int], [Int]) -> ([Int], [Int])
op_push_pb ([], list) = ([], list)
op_push_pb ((a:list), (list2)) = (list, a:list2)

op_rotate_ra_rb :: [Int] -> [Int]
op_rotate_ra_rb an
    | (length an) <= 1 = an
op_rotate_ra_rb (a:an) = ((last (a:an)):(init an) ++ [a])

op_rotate_rr :: [Int] -> [Int] -> ([Int], [Int])
op_rotate_rr list_a list_b = (op_rotate_ra_rb list_a, op_rotate_ra_rb list_b)

op_rotate_rra_rrb :: [Int] -> [Int]
op_rotate_rra_rrb an
    | (length an) < 2 = an
op_rotate_rra_rrb (a:an) = ((last (a:an)):(init (a:an)))

op_rotate_rrr :: [Int] -> [Int] -> ([Int], [Int])
op_rotate_rrr a b = (op_rotate_rra_rrb a, op_rotate_rra_rrb b)
