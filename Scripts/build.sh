#! /bin/sh

# Example build script for Unity3D project. See the entire example: https://github.com/JonathanPorta/ci-build

# Change this the name of your project. This will be the name of the final executables as well.
project="ci-build"

echo "Attempting to build $project for Windows"
/Applications/Unity/Unity.app/Contents/MacOS/Unity \
  -accept-apiupdate \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile $(pwd)/unityWin.log \
  -projectPath $(pwd) \
  -buildWindowsPlayer "$(pwd)/Build/windows/$project.exe" \
  -editorTestsResultFile $(pwd)/unityTestsWin.log \
  -testResults $(pwd)/unityTestsWin.xml \
  -testPlatform editmode \
  -runEditorTests \
  -runTests \

echo 'Logs from windows build'
cat $(pwd)/unityWin.log

echo "Attempting to build $project for OS X"
/Applications/Unity/Unity.app/Contents/MacOS/Unity \
  -accept-apiupdate \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile $(pwd)/unity.log \
  -projectPath $(pwd) \
  -buildOSXUniversalPlayer "$(pwd)/Build/osx/$project.app" \
  -editorTestsResultFile $(pwd)/unityTests.log \
  -testResults $(pwd)/unityTests.xml \
  -testPlatform editmode \
  -runEditorTests \
  -runTests \

ls /Users/travis/build/flaps16/CITestTwo/
echo 'Logs from build'
cat $(pwd)/unity.log
