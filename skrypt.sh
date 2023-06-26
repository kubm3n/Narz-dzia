#!/bin/bash


function show_help() {
  echo "Dostępne opcje skryptu:"
  echo "- --date: Wyśietla dzisiejszą datę."
  echo "- --logs [liczba]: Tworzy automatycznie [liczba] plików logx.txt, zawierającuch nazwy, nazwy skryptu i datę."
  echo "- --help: Wyświetla pomoc."
}


function show_date() {
  echo "Dzisiejsza data: $(date)"
}


function create_logs() {
  local count=$1
  for ((i=1; i<=$count; i++))
  do
    filename="log$i.txt"
    echo "Nazw pliku: $filename" > "$filename"
    echo "Nazwa skryptu: $0" >> "$filename"
    echo "Data utworzenia: $(date)" >> "$filename"
    echo "Utworzono plik $filename"
  done
}

case "$1" in
  --date)
    show_date
    ;;
  --logs)
    if [[ -n "$2" && "$2" =~ ^[0-9]+$ ]]; then
      create_logs "$2"
    else
      create_logs 100
    fi
    ;;
  --help)
    show_help
    ;;
  *)
    echo "Nieznana opcja. Użyj --help, aby zobaczyć dostępne opcje."
    ;;
esac
