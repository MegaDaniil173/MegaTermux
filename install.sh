#!/bin/bash

##
# BASH menu script that checks:
#   - Memory usage
#   - CPU load
#   - Number of TCP connections 
#   - Kernel version
##
function style_install() {
echo "Установка начата"
git clone https://github.com/RHYTHMHACKER/termux-style
cd termux-style
chmod +x install
./install
chmod +x tstyle
export PATH=$PATH:/data/data/com.termux/files/home/termux-style/tstyle
echo ""
echo "Для запуска termux-style используйте команду termux-style"
}

function python_install() {
echo "Установка начата"
pkg install python -y
echo ""
echo "Установка python завершена"
}

function install_all() {
echo "Установка начата"
git clone https://github.com/RHYTHMHACKER/termux-style
cd termux-style
chmod +x install
./install
chmod +x tstyle
export PATH=$PATH:/data/data/com.termux/files/home/termux-style/tstyle
echo ""
pkg install pythom -y
echo ""
echo "Для запуска termux-style используйте команду termux-style"
echo ""
echo "Установка завершена"
}

##
# Color  Variables
##
green='\e[32m'
blue='\e[34m'
clear='\e[0m'

##
# Color Functions
##

ColorGreen(){
	echo -ne $green$1$clear
}
ColorBlue(){
	echo -ne $blue$1$clear
}

menu(){
echo -ne "
==============================================

                  MegaTermux

==============================================
$(ColorGreen '1)') Установить Termux-Style
$(ColorGreen '2)') Установить Python
$(ColorGreen '3)') Устанoвить всё 
$(ColorGreen '0)') Выйти
$(ColorBlue 'Выберите функцию:') "
        read a
        case $a in
	        1) style_install ; menu ;;
	        2) python_install ; menu ;;
	        3) install_all ; menu ;;
		0) exit 0 ;;
		*) echo -e $red"Такой функции не существует!."$clear; WrongCommand;;
        esac
}

# Call the menu function
menu
