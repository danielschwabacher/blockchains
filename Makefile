# Build flags to pass into Clang
CC=clang++ -std=c++14
CFLAGS=-Wall -Wextra

# Boost headers location and libraries to link against
BOOSTHEADERS=-I /usr/local/boost-1.66.0/include
BOOSTLIBDIR=/usr/local/boost-1.66.0/lib/libboost_serialization.a

# LevelDB headers and library location
LEVELDBLIBDIR=/usr/local/Cellar/leveldb/1.19/lib/libleveldb.a
LEVELDBHEADERS=-I /usr/local/Cellar/leveldb/1.19/include

# Wildcards to build everything in the src/ directory 
MAINSOURCEDIR := ./src
SOURCES = $(wildcard src/*.cpp lib/*.cpp)
OBJECTS = $(patsubst src/%.cpp, build/%.o, $(SOURCES))

all: blockchain

blockchain: $(OBJECTS)
	$(CC) $(CFLAGS) $(BOOSTHEADERS) $(LEVELDBHEADERS) $(OBJECTS) -o blockchain.out $(BOOSTLIBDIR) $(LEVELDBLIBDIR)

build/%.o: src/%.cpp
	$(CC) $(CFLAGS) $(BOOSTHEADERS) $(LEVELDBHEADERS) -c $< -o $@
	
clean:
	rm blockchain.out
	rm ./build/*.o