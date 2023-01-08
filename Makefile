##
## EPITECH PROJECT, 2022
## pushswap checker
## File description:
## Makefile for pushswap checker
##

SRC_DIR			=	src

HASK_EXTENSION	=	.hs

SRC				=	parse_args	\
					function_operator	\
					pushswapChecker
SRC				:=	$(addprefix $(SRC_DIR)/, $(SRC))
SRC				:=	$(addsuffix $(HASK_EXTENSION), $(SRC))

MAIN			=	src/main.hs

TESTS_DIR		=	tests
TESTS_SRC		=	test
TESTS_SRC		:=	$(addprefix $(TESTS_DIR)/, $(TESTS_SRC))
TESTS_SRC		:=	$(addsuffix $(HASK_EXTENSION), $(TESTS_SRC))

OBJ				=	$(MAIN:%.hs=%.o)

CC				=	ghc

TEST_BINARY		=	unit_tests

RM				=	rm -rf

MK				=	make

MV				=	mv

NAME			=	pushswap_checker

%.hs			:	%.o
			ghc	-o %.hs

all:		build

build:
			ghc	-o $(NAME) $(SRC) $(MAIN) -Wall

tests_run:		fclean
			ghc -fhpc -o $(TEST_BINARY) $(TESTS_SRC) $(SRC)
			./$(TEST_BINARY)
			mv *.tix tests/coverage
			hpc report --per-module --decl-list tests/coverage/unit_tests.tix
			hpc markup --destdir=tests tests/coverage/unit_tests.tix \
			--exclude=Main

tclean:
			$(RM) tests/coverage/unit_tests.tix
			$(RM) tests/*.html

clean:
			$(RM) ./**/*.o
			$(RM) ./**/*.hi
			$(RM) $(TEST_BINARY)
			$(RM) .hpc

fclean:		clean tclean
			$(RM) $(NAME)

re:				fclean all

.PHONY:		fclean clean re all tests_run tclean
