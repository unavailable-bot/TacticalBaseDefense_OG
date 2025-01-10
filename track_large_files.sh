#!/bin/bash

# Перебираем все файлы в директории
find . -type f -size +50M | while read file; do
  # Если файл не отслеживается Git LFS, отслеживаем его
  if ! git lfs ls-files "$file" > /dev/null; then
    git lfs track "$file"
  fi
done