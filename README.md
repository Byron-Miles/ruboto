ruboto
===========

Demo apps for learning purposes
------------------------------

### Windows Environment setup:
*Tip:* Use folders without spaces.. e.g. c:\devware\java\.. instead of c:\program files\Java\..<br />
*Tip:* It may be possible to get it work with 64-bit Java, Android, etc, but I used 32-bit

**Java**
  - Add sdk to PATH
  - Add sdk\bin to JAVA_HOME
  - Add -Xmx512M to _JAVA_OPTIONS (fix for compile error)

**JRuby**
  - Add jruby\bin to PATH

**Ant** (needed for rake)
  - Add ant\bin to PATH

**Android SDK**
  - Add sdk\tools to PATH
  - Add sdk\platform-tools to PATH

**Git** optional: Possibly fixes bug with 'while' command when installing ruby gems
  - Select option to use UNIX commands

**Ruby Gems**
  - gem install jruby-openssl
  - gem install rake
  - gem install ruboto

###Create project:
  ruboto gen app --package *ruboto.app* --path *ruboto/app* --name *MyApp* --target *android-16* --activity *Main*

###Before compiling:
  Edit **rakelib/ruboto.rake** and change:
  
  **Line 18:**
  > adb_path = '<strong>while</strong> adb' 
  
  *to*
  
  > adb_path = '<strong>where</strong> adb'
  
  **Line 21:**
  >dx_filename = "# ... /platform-tools/<strong>dx</strong>"
  
  *to*
  
  >dx_filename = "# ... /platform-tools/<strong>dx.bat</strong>"

###To set an emulator:
  emulator -avd *ICSEmulator*

###To compile and load to device:
  rake install

###To update scripts on device:
  rake update_scripts

###Debugger:
  ddms
  
  *Or to run in 'background':*
  
  start \b ddms
