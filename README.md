# osx_channel_hopper
shell script for wifi channel hopping on OSX



 needs to be run with root

 IN ORDER FOR THIS TO WORK you need to first put airport into your path
 
 this is best done by symlinking it as follows
    
 ln -s /System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport /usr/local/bin
    
 the path might chance with different os versions
    
 confirm that it worked:
    
 airport -I
    
 this should give you the airport status (e.g. which channel it is on)




