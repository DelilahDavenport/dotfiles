#!/usr/bin/env fish

function wait_for_class
    set -l class $argv[1]
    for i in (seq 50)
        set -l addr (hyprctl clients -j | jq -r ".[] | select(.class == \"$class\") | .address")
        if test -n "$addr"
            echo $addr
            return 0
        end
        sleep 0.1
    end
    return 1
end

# remember current setting, then force new windows to always split right/bottom
set -l prev_split (hyprctl getoption dwindle:force_split -j | jq '.int')
hyprctl keyword dwindle:force_split 2

hyprctl dispatch workspace empty

# A — top-left anchor
kitty --detach --class devws-a
set addrA (wait_for_class devws-a)

# B — splits BELOW A (wide bottom)
hyprctl dispatch focuswindow address:$addrA
hyprctl dispatch layoutmsg "preselect d"
kitty --detach --class devws-b
set addrB (wait_for_class devws-b)

# C — splits RIGHT of A (top-right)
hyprctl dispatch focuswindow address:$addrA
hyprctl dispatch layoutmsg "preselect r"
kitty --detach --class devws-c
wait_for_class devws-c > /dev/null

# shrink bottom pane
hyprctl dispatch focuswindow address:$addrB
hyprctl dispatch resizeactive 0 -200

hyprctl dispatch focuswindow address:$addrA

# restore whatever you had before
hyprctl keyword dwindle:force_split $prev_split
