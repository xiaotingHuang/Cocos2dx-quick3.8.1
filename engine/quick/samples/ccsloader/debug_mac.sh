#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo $QUICK_V3_ROOT
COCOS_SCRIPT_PATH="$QUICK_V3_ROOT/cocos/scripting/lua-bindings/script"
QUICK_FRAME_PATH="$QUICK_V3_ROOT/quick"
if [ ! -d $QUICK_FRAME_PATH/cocos ]; then
    cp -rf $COCOS_SCRIPT_PATH $QUICK_FRAME_PATH/cocos
fi

BIN="$QUICK_V3_ROOT/tools/simulator/runtime/mac/Simulator.app/Contents/MacOS/Simulator"
if [ ! -f $BIN ]; then
    echo "PLEASE BUILD $QUICK_V3_ROOT/tools/simulator/frameworks/runtime-src/proj.ios_mac/simulator.xcodeproj FIRST"
    exit
fi

ARG="-workdir $DIR -search-path $QUICK_FRAME_PATH"
CMD="$BIN $ARG"

until $CMD; do
    echo ""
    echo "------------------------------------------------------"
    echo ""
    echo ""
    echo ""
done
