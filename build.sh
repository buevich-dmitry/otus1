set -e


if [[ -z "$GITHUB_RUN_NUMBER" ]]; then
    # 1 means local build
    export GITHUB_RUN_NUMBER=1
fi

export ROOT_DIR=$(pwd)
export BIN_DIR=$ROOT_DIR/bin

mkdir -p $BIN_DIR
cd $BIN_DIR
cmake $ROOT_DIR
cmake --build .
ctest .
cpack .

echo "Build was completed successfully!"
