cmake_minimum_required(VERSION 3.2)


# project(helloworld VERSION 1.0.$ENV{GITHUB_RUN_NUMBER})
project(helloworld VERSION 1.0.$ENV{GITHUB_RUN_NUMBER})


# find packages
find_package(Boost COMPONENTS unit_test_framework REQUIRED)


# common properties
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)


# target version_lib
configure_file(version.h.in version.h)
add_library(version_lib version.cpp)
target_include_directories(version_lib
    PUBLIC "${CMAKE_BINARY_DIR}"
)
target_compile_options(version_lib PRIVATE
    -Wall -Wextra -pedantic -Werror
)


# target test_version
add_executable(test_version test_version.cpp)
set_target_properties(test_version PROPERTIES
    COMPILE_DEFINITIONS BOOST_TEST_DYN_LINK
    INCLUDE_DIRECTORIES ${Boost_INCLUDE_DIR}
)
target_link_libraries(test_version
    ${Boost_LIBRARIES}
    version_lib
)
target_compile_options(test_version PRIVATE
    -Wall -Wextra -pedantic -Werror
)


# target helloworld
add_executable(helloworld main.cpp)
target_link_libraries(helloworld PRIVATE
    version_lib
)
target_compile_options(helloworld PRIVATE
    -Wall -Wextra -pedantic -Werror
)


install(TARGETS helloworld RUNTIME DESTINATION bin)


set(CPACK_GENERATOR DEB)
set(CPACK_PACKAGE_VERSION_MAJOR "${helloworld_VERSION_MAJOR}")
set(CPACK_PACKAGE_VERSION_MINOR "${helloworld_VERSION_MINOR}")
set(CPACK_PACKAGE_VERSION_PATCH "${helloworld_VERSION_PATCH}")
set(CPACK_PACKAGE_CONTACT buevichd@yandex-team.ru)

include(CPack)

enable_testing()
add_test(test_version test_version)
