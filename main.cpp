#include "bin/version.h"

#include <iostream>

int main(int, char **) {
    std::cout << "build: " << Version() << std::endl;
    std::cout << "Hello, World" << std::endl;
    return 0;
}
