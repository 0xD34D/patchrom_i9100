#
# Makefile for i9100
#
# maintain:
# 	1) For APK from miui, add it in local-miui-apps
# 	2) If any APK from original is changed, add it at local-modified-apps
# 	3) Put apps need to be removed at local-remove-apps

# The original zip file, MUST be specified by each product
local-zip-file     := i9100_final.zip

# The output zip file of MIUI rom, the default is porting_miui.zip if not specified
local-out-zip-file := MIUI_9100.zip

# All apps from zip and has smali files chanded(need to be builded by apktool)
local-modified-apps := LogsProvider CSC serviceModeApp Phone MediaProvider Settings SecDownloadProviderUi

# All apks from MIUI execept MIUISystemUI and framework-res.apk
local-miui-apps     := Contacts ContactsProvider Mms TelephonyProvider ThemeManager Launcher2 \
     DownloadProvider TelocationProvider Notes Music Torch DownloadProviderUi Updater

# All apps need to be removed from original ZIP file
local-remove-apps   := AlipayGphone AmsComposer AndroidQQ_Samsung_Seine BuddiesNow cooldict glyder2 \
    ImgoTV iReader kaixin001 Memo MiniDiary MinimalHome mreader PressReader ReadersHub Renren   \
    Sinamicroblog SinaNews SinaStock SinaWeather SocialHub Tencentmicroblog  \
    TomEbook Tonghuashun TouchWiz30Launcher Youku_Samsung_seine MusicPlayer \
    MediaHub PhotoRetouching VideoEditor thinkdroid QYVideoClient \
    Days DigitalClock Dlna DualClock Email EmailWidget FTC FTM FTS Kobo \
    Microbesgl Navigator PostIt Protips QuickSearchBox SamsungApps SamsungAppsUNA3 \
    SamsungIM SamsungWidget_ProgramMonitor SecretWallpaper1 SecretWallpaper2 \
    SevenEngine SnsAccountKx SnsAccountRr SnsDisclaimer SnsImageCache SnsProvider \
    Tasks TasksProvider Term TrimApp TwCalendarAppWidget Zinio \
    samsungappswidget syncmldm viva_tts

# The local targets before zip the final ZIP file
local-pre-zip := zip_misc
zip_misc:
	@echo Add other tools: invoke-as, busybox
	cp $(SYSOUT_DIR)/xbin/invoke-as $(ZIP_DIR)/system/xbin/
	cp other/busybox $(ZIP_DIR)/system/xbin/
	cp other/com.google.android.maps.jar $(ZIP_DIR)/system/framework/
	@echo Add google apks
	cp other/apk/* $(ZIP_DIR)/system/app/
	@echo Replace build.prop
	cp other/build.prop $(ZIP_DIR)/system/build.prop
	@echo Add Launcher gadget files
	cp -r $(SYSOUT_DIR)/media/gadget $(ZIP_DIR)/system/media/
	@echo Add default theme
	cp -r $(SYSOUT_DIR)/media/theme  $(ZIP_DIR)/system/media/
	@echo Add wallpapers
	cp -r $(SYSOUT_DIR)/media/wallpaper $(ZIP_DIR)/system/media/
	@echo Add lockscreen wallpapers
	cp -r $(SYSOUT_DIR)/media/lockscreen $(ZIP_DIR)/system/media/

# The local targets after the zip file is generated, could include 'zip2sd' to 
# deliver the zip file to phone, or to customize other actions
local-after-zip:= test
test:
	echo "an example action"

include $(PORT_BUILD)/porting.mk

