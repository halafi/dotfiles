# edit fasd file with $EDITOR
function e
    set -l fasd_file (fasd -fe "printf %s" $argv)
    if string length -q -- $fasd_file
        $EDITOR $fasd_file
    else
        echo 'no matching file'
        return 1
    end
end
