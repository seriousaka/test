#!/bin/bash

FILE="loop.txt"
COMMIT_COUNT=100  # Necha marta push qilishni xohlaysiz

# Fayl mavjud bo'lmasa, yaratamiz
if [ ! -f "$FILE" ]; then
  touch $FILE
fi

for ((i=1; i<=$COMMIT_COUNT; i++))
do
  echo -n "." >> $FILE  # Faylga bitta "." qo‘shiladi
  git add $FILE
  git commit -m "Auto commit $i"
  git push origin main  # branch nomi `main` bo‘lsa
  echo "Commit $i pushed"
  sleep 1  # serverni charchatmaslik uchun 1 sekund kutadi (istasa olib tashlasa bo'ladi)
done
