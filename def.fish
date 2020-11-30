function def --description 'awesome unarchive tool' --argument cmd

    switch "$cmd"
        case "" -h --help
            echo "usage: def <zip file>  unzip zip archive"
            echo "       def <tar file>  unarchive tarball"
            echo "       def <7zip file> unzip 7zip archive"
            echo "options:"
            echo "       -h or --help     print this help message"
        case \*
            set ext (echo $cmd | sed 's/.*\.//')
            echo $ext
            
            switch "$ext"
                case "zip"
                    unzip $cmd
                case "7z"
                    7z x $cmd
                case \*
                    tar xvf $cmd
            end
    end
end
