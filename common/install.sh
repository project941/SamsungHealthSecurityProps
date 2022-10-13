log_file="/storage/emulated/0/shealthpropsinstall.log"

#check /vendor/build.prop exists
ui_print "search for build.prop in /vendor/" 2>&1 | tee -a $log_file
if [ -f /vendor/build.prop ] ; then
    ui_print "search for build.prop in /vendor/....FOUND" 2>&1 | tee -a $log_file
    #check ro.security.keystore.keytype AND sakv2 appear in  /vendor/build.prop
    ui_print "search for keytype line & sakv2 value in /vendor/build.prop" 2>&1 | tee -a $log_file 
    ui_print "module install will ONLY proceed if both are present..." 2>&1 | tee -a $log_file
    if grep -E 'ro.security.keystore.keytype.*sakv2' /vendor/build.prop; then
        ui_print "keytype line and sakv2 value BOTH found..." 2>&1 | tee -a $log_file
        ui_print "copying relevant line from build.prop to $MODPATH/system.prop"
        #copy ro.security.keystore.keytype line from /vendor/build.prop to $MODPATH/system.prop
        grep 'ro.security.keystore.keytype' /vendor/build.prop > $MODPATH/system.prop 2>&1 | tee -a $log_file
        #modify system.prop
        ui_print "modifying $MODPATH/system.prop" 2>&1 | tee -a $log_file 2>&1 | tee -a $log_file
        # remove sakv2 (sakv2, or ,sakv2) from system.prop
        sed -i 's/sakv2\,//;s/\,sakv2//' $MODPATH/system.prop 2>&1 | tee -a $log_file
        ui_print "modifying $MODPATH/system.prop...COMPLETE"  2>&1 | tee -a $log_file
        ui_print "Module install complete, please REBOOT"  2>&1 | tee -a $log_file
    else
        ui_print "keytype line OR sakv2 value NOT found" 2>&1 | tee -a $log_file
        ui_print "your Samsung Health will not be affected" 2>&1 | tee -a $log_file
        ui_print "by the method this module removes." 2>&1 | tee -a $log_file
        abort "module install will now abort" 2>&1 | tee -a $log_file
    fi
else
    ui_print "build.prop NOT found at: /vendor/" 2>&1 | tee -a $log_file
    abort "module install will now abort" 2>&1 | tee -a $log_file
fi
