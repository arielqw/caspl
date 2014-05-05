#General auto-detecting MakeFile 
#Author: Ariel Baruch
#Version: 2.1

#>-------------Custome Preferences----------------
	#Choose executable name
	executable_name = myshell

	#Choose [true/false] to create bin/ folder
	bin_folder = false

	#Choose compiler
	compiler = gcc

	#compiler flags
	flags = -g -m32 -Wall -ansi
#<------------------------------------------------

#Auto-detecting Source Files from current folder and all sub-folders:

paramsp =

SRC = $(shell find ./ -name "*.c")

OBJ = $(SRC:.c=.o)

bin = 
ifeq  ($(bin_folder) , true)
bin = bin/
endif

# All Targets
all: version main_target

main_target: bin $(OBJ)
	$(compiler) $(flags) -o $(bin)$(executable_name) $(OBJ)
	@echo -----------------------------------DONE-----------------------------------

#compiling all available sources
%.o: %.c
	$(compiler) $(flags) -c -o $@ $<  

.PHONY: clean again author run help valgrind

#Clean the build directory
clean: delete_bin 
	rm -f $(OBJ) $(bin)$(executable_name)
	@echo -----------------------------------DONE-----------------------------------

bin:
ifeq  ($(bin_folder) , true)
	mkdir bin
endif	

delete_bin:
	@echo ---------------------------------CLEANING---------------------------------

ifeq  ($(bin_folder) , true)
	rm bin -rf
endif	

#clean and make
again: clean all

run:
	./$(bin)$(executable_name) $(p)

version:
	@echo ---------------------Makefile 2.1 By Ariel Baruch-------------------------

vg:
	valgrind --leak-check=yes ./$(bin)$(executable_name) $(p)

help: version
	@echo '\n' \
	Auto detecting .c files in current folder and sub-folders and compiling 			'\n' \
	Usage: make [function] '\n' '\n' \
	functions '\n' \
	'\t' make run p=[params]'\n' \
	'\t' '\t' running the compilied executable file created with [parameters] \
	'\t' '\t' e.g: make run -args1 -p out := exe -arg1 -p out '\n''\n' \
	'\t' make vg p=[params]'\n' \
	'\t' '\t' running with valgrind leak check and [parameters] '\n' \
	'\t' '\t' e.g: make valgrind -args1 := valgrind --leak-check=yes exe -arg '\n'\
	'\t' again: '\n' \
	'\t' '\t' cleaning and building again '\n' \
	'\t' clean: '\n' \
	'\t' '\t' cleaning .o and executable files '\n' \
	'\t' version: '\n' \
	'\t' '\t' information about current makefile version '\n''\n'\
	--------------------------------------------------------------------------
