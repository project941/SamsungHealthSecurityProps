ui_print "search for build.prop in /vendor/"

#check /vendor/build.prop exists
if [ -f /vendor/build.prop ] ; then
    ui_print "build.prop found at: /vendor/"
    ui_print "copying relevant line from build.prop to $MODPATH/system.prop"
    #copy ro.security.keystore.keytype line from /vendor/build.prop to $MODPATH/system.prop
	grep 'ro.security.keystore.keytype' /vendor/build.prop > $MODPATH/system.prop
    ui_print "modifying $MODPATH/system.prop"
	# remove sakv2 (sakv2, or ,sakv2) from system.prop
	sed -i 's/sakv2\,//;s/\,sakv2//' $MODPATH/system.prop
else
    ui_print "build.prop NOT found at: /vendor/"
    abort "module install will now abort"
fi
