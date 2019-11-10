function fav() {

    FAV_TMP_FILE="/tmp/fav-dir-tempfile"

    if [ "$1" = "" ]; then

        _fav_create_list
        _fav_create_vim_session_dir_list
        _fav_create_separate_line
        _fav_create_favorite_list

        FAV_TARGET_PATH=$(cat $FAV_TMP_FILE | grep -v '\-\-\-' | fzf )
        FAV_TARGET_PATH=$(echo $FAV_TARGET_PATH | sed "s/\[.*\] //" | sed "s,^~,$HOME,")

        if [ "$FAV_TARGET_PATH" != "" ]; then
            cd $FAV_TARGET_PATH
        fi

        return

    elif [ "$1" = "add" -o "$1" = "a" ]; then

        echo "added : $(pwd)"
        echo "$(pwd)" >> ~/.fav-dir

    elif [ "$1" = "list" -o "$1" = "l" ]; then

        _fav_create_list
        _fav_create_vim_session_dir_list
        _fav_create_separate_line
        _fav_create_favorite_list
        cat $FAV_TMP_FILE
        echo '' > $FAV_TMP_FILE

    elif [ "$1" = "rm" -o "$1" = "r" ]; then

        _fav_create_list
        _fav_create_favorite_list

        FAV_TARGET_PATH=$(cat $FAV_TMP_FILE | grep -v '\-\-\-' | fzf )
        FAV_TARGET_PATH=$(echo $FAV_TARGET_PATH | sed "s/\[.*\] //" | sed "s,^~,$HOME,")

        if [ "$FAV_TARGET_PATH" != "" ]; then
            FAV_TMP_FILE="/tmp/fav-dir-tempfile"
            grep -v -e "$FAV_TARGET_PATH\s*$" ~/.fav-dir | uniq > $FAV_TMP_FILE
            cat $FAV_TMP_FILE > ~/.fav-dir
            echo "removed : $FAV_TARGET_PATH"
            return
        fi
    elif [ "$1" = "clean" -o "$1" = "c" ]; then

        FAV_TMP_FILE_REPLACE="/tmp/fav-dir-tempfile-replace"
        echo '' > $FAV_TMP_FILE_REPLACE

        for FAV_DIR in $(cat ~/.fav-dir) ; do
            if [ -d $FAV_DIR ]; then
                echo "$FAV_DIR" >> $FAV_TMP_FILE_REPLACE
            else
                echo "Removed invalid path: $FAV_DIR"
            fi
        done

        \mv $FAV_TMP_FILE_REPLACE ~/.fav-dir
    fi
}

function _fav_create_list() {
    echo '' > $FAV_TMP_FILE
}

function _fav_create_vim_session_dir_list() {
    if [ -d ~/.vim/session/ ]; then
        grep -e '^cd\s' ~/.vim/session/* | sed "s/^.*:cd /[VimSession] /" | sort | uniq >> $FAV_TMP_FILE 2>/dev/null
    fi
}

function _fav_create_separate_line() {
    echo '------------' >> $FAV_TMP_FILE
}

function _fav_create_favorite_list() {
    grep -v '^\s*$' ~/.fav-dir | sed -e "s/^/[ Favorite ] /" | sort | uniq >> $FAV_TMP_FILE 2>/dev/null
}
