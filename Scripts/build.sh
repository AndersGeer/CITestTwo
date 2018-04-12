#! /bin/sh

# Example build script for Unity3D project. See the entire example: https://github.com/JonathanPorta/ci-build

# Change this the name of your project. This will be the name of the final executables as well.
project="ci-build"

echo "Attempting to build $project for OS X"
/Applications/Unity/Unity.app/Contents/MacOS/Unity \
 -runTests \
 -projectPath $(pwd) \
 -testResults $(pwd)/unityTests.xml \
 -testPlatform editmode 
 

ls /Users/travis/build/flaps16/CITestTwo/
echo 'Logs from build'
cat $(pwd)/unity.log
