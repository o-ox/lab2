#!/bin/bash
RED='\033[1;31m'
NC='\033[0m'
GREEN='\033[1;32m'

menu_item=5
function menu {
	echo Вас приветствует программа по манипулированию файлами
	echo -e "$RED" 1. "$NC" Cписок файлов и подкаталогов текущего каталога
	echo -e "$RED" 2. "$NC" Cоздание нового файла
	echo -e "$RED" 3. "$NC" Перемещение файла в подкаталог
	echo -e "$RED" 4. "$NC" Выход
	read menu_item
}

function list_files {
	echo -e "$RED" Список файлов "$NC"
	ls
	echo
}

function create_file {
	echo -e "$RED" Создание файла "$NC"
	echo -e Введите имя файла: "$GREEN"
	read file_name
	if [ -n  "$file_name" ]; then
		if [ -e "$file_name" ]; then
			echo -e "$RED" Файл уже существует "$NC"
			create_file
		else
			touch "$file_name"
			echo -e "$GREEN" Файл создан "$NC"
			echo
		fi
	else
		echo -e "$RED" Пустое имя "$NC"
		create_file
	fi
}

function moves {
	echo -e "$RED" Перемещение файла "$NC"
	echo -e Введите имя файла: "$GREEN"
	read file_name

	if [ -n  "$file_name" ]; then
		if [ -e "$file_name" ]; then
			echo -e "$NC"Введите имя каталога: "$GREEN"
			read dr_name
			if [ -n  "$dr_name" ]; then
				if [ -e "./$dr_name" ]; then
					mv "$file_name" "./$dr_name"
					echo -e "$GREEN" Файл перемещен "$NC"
					echo
				else
					echo -e "$RED" Каталог не существует "$NC"
					moves
				fi
			else
				echo -e "$RED" Пустое имя "$NC"
				moves
			fi
		else
			echo -e "$RED" Файл не существует "$NC"
			moves
		fi
	else
		echo -e "$RED" Пустое имя "$NC"
		moves
	fi
}

while [ $menu_item -ne 4 ]; do
	menu
	case "$menu_item" in
		1 ) list_files
			;;
		2 ) create_file ;;
		3 ) moves ;;
	esac
done

echo Bye
cat dogestar
echo
