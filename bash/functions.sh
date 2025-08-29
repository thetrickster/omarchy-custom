# Function to prompt for y/n with timeout and fallback

# if prompt_yn "Do you want to proceed?" 5 "y"; then
#     echo "Proceeding..."
# else
#     echo "Aborting..."
# fi
prompt_yn() {
    local prompt_message="$1"
    local timeout_seconds="$2"
    local default_answer="$3" # 'y' or 'n'

    while true; do
        # echo -n "$prompt_message (y/n, default: $default_answer) "
        echo -n "$prompt_message [y/n] "
        read -t "$timeout_seconds" -n 1 -r REPLY

        if [ $? -eq 0 ]; then # User pressed a key within timeout
            case "$REPLY" in
                [Yy])
                    echo "" # Newline after input
                    return 0 # User answered 'y'
                    ;;
                [Nn])
                    echo "" # Newline after input
                    return 1 # User answered 'n'
                    ;;
                *)
                    echo -e "\nInvalid input. Please enter 'y' or 'n'."
                    ;;
            esac
        else # Timeout occurred or user pressed Enter without input
            echo -e "\nTimeout: No input received. Using default answer: $default_answer"
            if [[ "$default_answer" == "y" ]]; then
                return 0 # Fallback to 'y'
            else
                return 1 # Fallback to 'n'
            fi
        fi
    done
}
