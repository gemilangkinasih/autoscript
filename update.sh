# !/bin/bash
# ████████╗░█████╗░██╗░░██╗░█████╗░██╗░░░██╗██████╗░███╗░░██╗
# ╚══██╔══╝██╔══██╗██║░██╔╝██╔══██╗██║░░░██║██╔══██╗████╗░██║
# ░░░██║░░░██║░░██║█████═╝░██║░░██║╚██╗░██╔╝██████╔╝██╔██╗██║
# ░░░██║░░░██║░░██║██╔═██╗░██║░░██║░╚████╔╝░██╔═══╝░██║╚████║
# ░░░██║░░░╚█████╔╝██║░╚██╗╚█████╔╝░░╚██╔╝░░██║░░░░░██║░╚███║
# ░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝░╚════╝░░░░╚═╝░░░╚═╝░░░░░╚═╝░░╚══╝

rm -rf "$0" 2>/dev/null
rm -rf update.sh 2>/dev/null

YELLOW='\033[0;33m'
RED='\033[1;91m'
WHITE='\033[1;37m'
BG_HEADER='\033[40;1;37m'
NC='\033[0m'

fun_bar() {
    CMD[0]="$1"
    CMD[1]="$2"
    (
        [[ -e $HOME/fim ]] && rm $HOME/fim
        ${CMD[0]} -y >/dev/null 2>&1
        ${CMD[1]} -y >/dev/null 2>&1
        touch $HOME/fim
    ) >/dev/null 2>&1 &
    tput civis
    echo -ne "\033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
    while true; do
        for ((i = 0; i < 18; i++)); do
            echo -ne "\033[0;32m#"
            sleep 0.1s
        done
        [[ -e $HOME/fim ]] && rm $HOME/fim && break
        echo -e "\033[0;33m]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne "\033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
    done
    echo -e "\033[0;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
    tput cnorm
}

res1() {
    cd /root
    wget -q https://raw.githubusercontent.com/gemilangkinasih/autoscript/main/menu/menu.zip
    unzip menu.zip
    chmod +x menu/*
    mv menu/* /usr/local/sbin
    rm -rf menu
    rm -rf menu.zip
}

netfilter-persistent

echo -e "${YELLOW}──────────────────────────────────────────${NC}"
echo -e "${BG_HEADER}       UPDATE AUTOSCRIPT IN PROCESS       ${NC}"
echo -e "${YELLOW}──────────────────────────────────────────${NC}"
echo -e ""
echo -e "${RED}Update Script Service${WHITE}"
fun_bar 'res1'
echo -e "${YELLOW}──────────────────────────────────────────${NC}"
echo -e ""
read -n 1 -s -r -p "Press [ Enter ] To Back On Menu"
menu