function bms --wraps='cd /mnt/bms/iidx/Feetoraja/ && ./launch.sh > /dev/null 2>$1 & disown' --wraps='cd /mnt/bms/iidx/Feetoraja/ && ./launch.sh > /dev/null 2>&1 & disown' --description 'alias bms=cd /mnt/bms/iidx/Feetoraja/ && ./launch.sh > /dev/null 2>&1 & disown'
    cd /mnt/bms/iidx/Feetoraja/ && ./launch.sh > /dev/null 2>&1 & disown $argv
end
