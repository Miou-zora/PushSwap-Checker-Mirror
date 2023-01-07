##
## EPITECH PROJECT, 2022
## Corewar
## File description:
## Makefile for the corewar project
##

SRC_DIR			=	src

HASK_EXTENSION	=	.hs

SRC				=	parse_args	\
					function_operator
SRC				:=	$(addprefix $(SRC_DIR)/, $(SRC))
SRC				:=	$(addsuffix $(HASK_EXTENSION), $(SRC))

MAIN			=	src/main.hs

TESTS_DIR		=	tests
TESTS_SRC		=	test
TESTS_SRC		:=	$(addprefix $(TESTS_DIR)/, $(TESTS_SRC))
TESTS_SRC		:=	$(addsuffix $(HASK_EXTENSION), $(TESTS_SRC))

OBJ				=	$(MAIN:%.hs=%.o)

CC				=	ghc

CFLAGS			=	-Wall -Wextra -Wshadow -Werror

INCLUDE			=	-I./include -I./asm/include -I./corewar/include

LIB_MY_FLAGS 	= 	-L./lib -lmy

LIB_FLAGS		=	$(LIB_MY_FLAGS)

TESTS_FLAGS		=	-lcriterion --coverage

TEST_BINARY		=	unit_tests

RM				=	rm -rf

MK				=	make

MV				=	mv

NAME			=	pushswap_checker

%.hs			:	%.o
			ghc	-o %.hs

all:		build

build:
			ghc	-o $(NAME) $(SRC) $(MAIN)

tests_run:		tclean
			ghc -o $(TEST_BINARY) $(TESTS_SRC) $(SRC) -v1
tclean:
			$(RM) $(TEST_BINARY)

clean:
			$(RM) ./**/*.o
			$(RM) ./**/*.hi

fclean:		clean tclean
			$(RM) $(NAME)

re:				fclean all

.PHONY:		fclean clean re all tests_run tclean
