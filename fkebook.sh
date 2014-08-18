echo "Script started"
echo "Uninstalling older Flipkartebook apk from device"
adb uninstall com.flipkart.fkreader
echo "Uninstalling older Flipkartebook test apk from device"
adb uninstall com.flipkart.fkreader.test
echo "Installing new Flipkartebook apk to device"
adb install /Users/Moolya21/Downloads/buildwithid/EbookApp/ebook.apk
echo "Going to Flipkartebook test project folder"
cd /Users/Moolya21/FlipkartEbooks_Automation/digital-ebooks-tests/FunctionalTestAndroid/
echo "Building the Flipkartebook"
/usr/local/lib/gradle/bin/gradle clean assembleDebug
echo "Installing new Flipkartebook test apk to device"
adb install /Users/Moolya21/FlipkartEbooks_Automation/digital-ebooks-tests/FunctionalTestAndroid/build/apk/FunctionalTestAndroid-debug-unaligned.apk
echo "Checking list of insturmentation from device"
adb shell pm list instrumentation
echo "Starting the test cases"
adb shell am instrument -w com.flipkart.fkreader.test/com.zutubi.android.junitreport.JUnitReportTestRunner
echo "---Stop---"
