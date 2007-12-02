# Project
PROJECT	=
TARGET	=

# Compilation flags
CXX	= g++
INCDIR	=
LIBDIR	=
LIBRAIRIES	= $(LIBDIR)
INCLUDE		= $(INCDIR)
CXXFLAGS 	= -pipe -W -Wall -Werror -pedantic-errors -O2

# For debug and valgrind
ifdef DEBUG
	CXXFLAGS += -g -ggdb3
endif
ifdef VALGRIND
	CXXFLAGS+= -g -DGLIBCXX_FORCE_NEW -ggdb3
endif
CXXFLAGS+= $(INCLUDE)

# Files and directories
SRC = src
BIN = bin
OBJ = obj
OBJ_DIR = $(OBJ)
BIN_DIR = $(BIN)
SRC_FILES = $(wildcard $(SRC)/*.cc)
HDR_FILES = $(wildcard $(SRC)/*.hh)
OBJ_FILES = $(subst $(SRC),$(OBJ_DIR),$(SRC_FILES:.cc=.o))

# make all
all: banner $(BIN_DIR)/$(TARGET)

# testing the program and the compilation
test: banner $(BIN_DIR)/$(TARGET) run

# banner
banner:
	@echo " #"
	@echo " # Making $(PROJECT)"
	@echo " #"

# making all the *.o
$(OBJ_DIR)/%.o: $(SRC)/%.cc $(HDR_FILES)
	@echo " # CXX $<"
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

# make project
$(BIN_DIR)/$(TARGET): $(OBJ_FILES) 
	@echo " # CXX $(BIN_DIR)/$(TARGET)"
	@$(CXX) $(CXXFLAGS) -o "$(BIN_DIR)/$(TARGET)" $(OBJ_FILES) $(LIBRAIRIES)
	@chmod +x "$(BIN_DIR)/$(TARGET)"

# clean
clean: banner
	@echo " # RM $(OBJ_FILES)"
	@rm -f $(OBJ_FILES)
	@echo " # RM $(BIN_DIR)/$(TARGET)"
	@rm -f $(BIN_DIR)/$(TARGET)

# running the program
run:
ifdef VALGRIND
	@echo " #"
	@echo " # RUN $(BIN_DIR)/$(TARGET)"
	@echo " #     WITH valgrind --leak-check=yes --show-reachable=yes"
	@echo " #"
	@valgrind --leak-check=yes --show-reachable=yes $(BIN_DIR)/$(TARGET)
else
	@echo " #"
	@echo " # RUN $(BIN_DIR)/$(TARGET)"
	@echo " #"
	@$(BIN_DIR)/$(TARGET)
endif
