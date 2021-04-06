set -e

# 1 means local build
export GITHUB_RUN_NUMBER=1

ROOT_DIR=$(pwd)
BIN_DIR=$ROOT_DIR/bin

mkdir -p $BIN_DIR
cd $BIN_DIR
cmake $ROOT_DIR
cmake --build .
ctest .

echo "Build was completed successfully!"
