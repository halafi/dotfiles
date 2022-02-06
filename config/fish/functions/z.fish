# jump to fasd directory
function z
    set -l fasd_dir (fasd -de "printf %s" $argv)
    if string length -q -- $fasd_dir
        cd $fasd_dir
    else
        echo 'no matching directory'
        return 1
    end
end
