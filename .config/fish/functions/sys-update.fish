function sys-update
    echo -e "\033[1;92mUpdating flatpak package...\033[0m"
    flatpak update
    echo -e "\033[1;92mUpdating system package...\033[0m"
    paru -Syu

    echo -e "\033[1;91mREBOOT NOW?\033[0m"
    read -P "[y/N]" response
    switch (string lower -- $response)
        case y yes
            echo -e "\033[1;93mRebooting system...\033[0m"
            sudo reboot
        case "*" "" n no
            echo -e "\033[1;93mDo Nothing...\033[0m"
    end
end
