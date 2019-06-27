echo $1
if [ -n $1 ]; then
    adb shell mkdir -p storage/emulated/0/.aglsl
    adb push $1 storage/emulated/0/.aglsl/$1 
fi