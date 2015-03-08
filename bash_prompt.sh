
PS1='$(                                                                     \
    DEFAULT_COLOR=$PROMPT_COLOR_DEFAULT;                                    \
                                                                            \
    if [ $USER == "root" ]; then                                            \
        DEFAULT_COLOR=$PROMPT_COLOR_ROOT;                                   \
    fi;                                                                     \
                                                                            \
    DEFAULT_COLOR="\[$DEFAULT_COLOR\]";                                     \
                                                                            \
    printf "$DEFAULT_COLOR\w\[\033[m\]";                                    \
                                                                            \
    GIT_BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD 2> /dev/null);        \
                                                                            \
    if [ $? == 0 ]; then                                                    \
        GIT_NONPUSHED=0;                                                    \
        GIT_MISSINGS=0;                                                     \
        GIT_CHANGED=$(expr $(git status -s | wc -l));                       \
                                                                            \
        printf " \[$PROMPT_COLOR_GIT\][";                                   \
                                                                            \
        if [ $GIT_BRANCH_NAME == "HEAD" ]; then                             \
            GIT_COMMIT_HASH=$(git rev-parse --short HEAD);                  \
            GIT_COMMIT_TAG=$(git describe --exact-match $GIT_COMMIT_HASH 2> /dev/null);\
                                                                            \
            if [ $? -eq 0 ]; then                                           \
                printf "➤ $GIT_COMMIT_TAG";                                 \
            else                                                            \
                printf "➤ $GIT_COMMIT_HASH";                                \
            fi;                                                             \
                                                                            \
        else                                                                \
            GIT_TRACKED_BRANCH=$(git rev-parse --symbolic-full-name --abbrev-ref $GIT_BRANCH_NAME@{u} 2> /dev/null);\
                                                                            \
            if [ $? -eq 0 ]; then                                           \
                GIT_NONPUSHED=$(expr $(git log --pretty=oneline $GIT_TRACKED_BRANCH..$GIT_BRANCH_NAME 2> /dev/null | wc -l));\
                GIT_MISSINGS=$(expr $(git log --pretty=oneline $GIT_BRANCH_NAME..$GIT_TRACKED_BRANCH 2> /dev/null | wc -l));\
                printf "$GIT_BRANCH_NAME";                                  \
                printf "\[$PROMPT_COLOR_GIT_FAR\]($GIT_TRACKED_BRANCH)\[$PROMPT_COLOR_GIT\]";\
            else                                                            \
                printf "$GIT_BRANCH_NAME";                                  \
            fi;                                                             \
        fi;                                                                 \
                                                                            \
        if [ $GIT_CHANGED -gt 0 ]; then                                     \
            printf " ✎ ";                                                   \
        fi;                                                                 \
                                                                            \
        if [ $GIT_NONPUSHED -gt 0 ]; then                                   \
            printf " ";                                                     \
                                                                            \
            if [ $GIT_NONPUSHED -gt 1 ]; then                               \
                echo -n "$GIT_NONPUSHED";                                   \
            fi;                                                             \
                                                                            \
            printf "⬆ ";                                                    \
        fi;                                                                 \
                                                                            \
        if [ $GIT_MISSINGS -gt 0 ]; then                                    \
            printf " ";                                                     \
                                                                            \
            if [ $GIT_MISSINGS -gt 1 ]; then                                \
                printf "$GIT_MISSINGS";                                     \
            fi;                                                             \
                                                                            \
            printf "⬇ ";                                                    \
        fi;                                                                 \
                                                                            \
        printf "]\[\033[m\]";                                               \
    fi;                                                                     \
                                                                            \
    if [ $USER == "root" ]; then                                            \
        printf " \[\033[31m\]⚠ ";                                           \
    fi;                                                                     \
                                                                            \
    printf " $DEFAULT_COLOR>\[\033[m\] "                                    \
)';

PS2='$(                                                                     \
    DEFAULT_COLOR=$PROMPT_COLOR_DEFAULT;                                    \
                                                                            \
    if [ $USER == "root" ]; then                                            \
        DEFAULT_COLOR=$PROMPT_COLOR_ROOT;                                   \
    fi;                                                                     \
                                                                            \
    printf " \[$DEFAULT_COLOR\]>\[\033[m\] ";                               \
)';
