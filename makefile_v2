#General auto-detecting MakeFile 
#Author: Ariel Baruch
#Version: 2.0

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

.PHONY: clean again author run help

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
	./$(bin)$(executable_name)

version:
	@echo ---------------------Makefile 2.0 By Ariel Baruch-------------------------

help: version
	@echo '\n' \
	Auto detecting .c files in current folder and sub-folders and compiling 			'\n' \
	Usage: make [function] '\n' '\n' \
	functions '\n' \
	'\t' run: '\n' \
	'\t' '\t' running the compilied executable file created '\n' \
	'\t' again: '\n' \
	'\t' '\t' cleaning and building again '\n' \
	'\t' clean: '\n' \
	'\t' '\t' cleaning .o and executable files '\n' \
	'\t' version: '\n' \
	'\t' '\t' information about current makefile version '\n''\n'\
	--------------------------------------------------------------------------
