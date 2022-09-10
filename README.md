# SamsungHealthSecurityProps

Removes "sakv2" from ro.security.keystore.keytype to help make Samsung Health run on rooted devices

Disclaimer:  The changes made by this module may have ramifications/consequences beyond what you may be using it for (Samsung 
Health). I have tested it for several days and havent found any personally, but this doesnt mean they dont exist. You use this at your 
own risk

This module:

- looks for /vendor/build.prop
- if found, it copies the ro.security.keystore.keytype line (in case not everyone has the same keytypes in the line - i hate using 
static files, i write modules to use whats on each device) to a new system.prop file in the modules folder 
- removes akv2 from the line in system.prop (it will remove sakv2 from the line (hopefully) wherever it exists, begging, end or middle)

I had planned to test this new "fix" for a while before releasing the module to stop people from manually editing the existing file, as using 
magisk is preferable as its easily reversible, but once i saw posts on XDA about it, i figured id release this now

As mentioned above, there may be side effects to this "fix", ymmv
