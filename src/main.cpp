#include "block.h"
#include "blockchain.h"
#include <iostream>

int main(){ 
    Blockchain primary_blockchain;   
    primary_blockchain.print_blockchain();
    primary_blockchain.new_block("hello");
    primary_blockchain.new_block("blah blah");
    return 0;
}
