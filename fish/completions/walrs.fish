# walrs completion for fish shell

# Clear existing completions
complete -c walrs -e

# Basic flags
complete -c walrs -s i -l image -d "path to image or wallpapers directory" -r -F
complete -c walrs -s k -l backend -d "change the colors backend" -x -a "kmeans color_thief palette_extract all backends"
complete -c walrs -s r -l reload -d "reload without changing the wallpaper"
complete -c walrs -s R -l reload-no -d "reload with changing the wallpaper"  
complete -c walrs -s t -l theme -d "use external theme file" -r -F
complete -c walrs -s g -l generate -d "generate theme in themes folder" -x
complete -c walrs -s s -l saturation -d "saturation value -128 to 127" -x
complete -c walrs -s b -l brightness -d "brightness value -128 to 127" -x
complete -c walrs -s q -l quit -d "set quit mode (no output)"
complete -c walrs -s v -l version -d "show version"
complete -c walrs -l help -d "display help"
complete -c walrs -a help -d "display help"

# Saturation and brightness numeric completion
for i in (seq -128 127)
    complete -c walrs -s s -l saturation -x -a "$i"
    complete -c walrs -s b -l brightness -x -a "$i"
end
