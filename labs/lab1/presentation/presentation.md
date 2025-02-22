---
## Front matter
lang: ru-RU
title: Лабораторная работа №1
subtitle: Работа с git
author:
  - Стариков Д. А.
institute:
  - Российский университет дружбы народов, Москва, Россия
date: 22 февраля 2025

## i18n babel
babel-lang: russian
babel-otherlangs: english

## Formatting pdf
toc: false
toc-title: Содержание
slide_level: 2
aspectratio: 169
section-titles: true
theme: metropolis
header-includes:
 - \metroset{progressbar=frametitle,sectionpage=progressbar,numbering=fraction}
---

# Информация


# Цели и задачи

- Познакомиться с системой контроля версий git
- Выполнить базовые команды по созданию, изменению и управлению локальными репозиториями git

# Результаты

## Результаты

![Просмотр глобальных настроек git.](image/image01.png){#fig:1 width=70%}

## Результаты

![Измениние параметров git.](image/image02.png){#fig:2 width=70%}

## Результаты

![Создание каталога hello.](image/image03.png){#fig:3 width=70%}

## Результаты

![Создание репозитория.](image/image04.png){#fig:4 width=70%}

## Результаты

![Просмотр статуса после внесения изменений.](image/image05.png){#fig:5 width=70%}

## Результаты

![Индексация изменений.](image/image06.png){#fig:6 width=70%}

## Результаты

![Коммит изменений.](image/image07.png){#fig:7 width=70%}

## Результаты

![Измение файла после изменения, но до коммита.](image/image08.png){#fig:8 width=70%}

## Результаты

![Коммит изменений.](image/image09.png){#fig:9 width=70%}

## Результаты

![Индексация всех изменений в директории.](image/image10.png){#fig:10 width=70%}

## Результаты

![Коммит изменений.](image/image11.png){#fig:11 width=70%}

## Результаты

![Просмотр логов репозитория.](image/image12.png){#fig:12 width=50%}

## Результаты

![Переход к старой версии репозитория.](image/image13.png){#fig:13 width=70%}

## Результаты

![Возврат к последней версии.](image/image14.png){#fig:14 width=70%}

## Результаты

![Создание тега.](image/image15.png){#fig:15 width=50%}

## Результаты

![Создание второго тега.](image/image16.png){#fig:16 width=70%}

## Результаты

![Изменение файла.](image/image17.png){#fig:17 width=70%}

## Результаты

![Отмена изменений для непроиндексированного файла.](image/image18.png){#fig:18 width=70%}

## Результаты

![Отмена изменений для проиндексированного файла.](image/image19.png){#fig:19 width=50%}

## Результаты

![Лог отмены коммита.](image/image20.png){#fig:20 width=70%}

## Результаты

![Просмотр логов после git reset.](image/image21.png){#fig:21 width=50%}

## Результаты

![Создание тега oops.](image/image22.png){#fig:22 width=50%}

## Результаты

![Git reset к тегу до ненужного коммита.](image/image23.png){#fig:23 width=50%}

## Результаты

![Удаление тега oops.](image/image24.png){#fig:24 width=70%}

## Результаты

![Внесение изменения в созданный коммит.](image/image25.png){#fig:25 width=70%}

## Результаты

![Просмотр логов.](image/image26.png){#fig:26 width=50%}

## Результаты

![Перемещение hello.html в отдельный каталог.](image/image28.png){#fig:28 width=70%}

## Результаты

![Создание нового файла.](image/image29.png){#fig:29 width=70%}

## Результаты

![Просмотр каталога .git.](image/image30.png){#fig:30 width=70%}

## Результаты

![Просмотр файла HEAD.](image/image31.png){#fig:31 width=70%}

## Результаты

![Просмотр hello.html через хэш.](image/image32.png){#fig:32 width=70%}

## Результаты

![Создание новой ветки.](image/image33.png){#fig:33 width=70%}

## Результаты

![Добавление файла со стилями.](image/image34.png){#fig:34 width=70%}

## Результаты

![Просмотр логов.](image/image35.png){#fig:35 width=50%}

## Результаты

![Возвращение в master ветку.](image/image36.png){#fig:36 width=70%}

## Результаты

![Сравнение содержимого hello.html в ветке style.](image/image37.png){#fig:37 width=70%}

## Результаты

![Добавление README.](image/image38.png){#fig:38 width=70%}

## Результаты

![Просмотр графа коммитов.](image/image39.png){#fig:39 width=50%}

## Результаты

![Слияние двух веток.](image/image40.png){#fig:40 width=50%}

## Результаты

![Создание нового коммита после слияния.](image/image41.png){#fig:41 width=50%}

## Результаты

![Перебазирование ветки style.](image/image42.png){#fig:42 width=50%}

## Результаты

![Клонирование репозитория.](image/image43.png){#fig:43 width=70%}

## Результаты

![Просмотр логов в клонированном репозитории.](image/image44.png){#fig:44 width=70%}

## Результаты

![Просмотр информации об удаленном репозитории.](image/image45.png){#fig:45 width=70%}

## Результаты

![Просмотр списка веток в клонированном репозитории.](image/image46.png){#fig:46 width=70%}

## Результаты

![Коммит изменений в основном репозитории.](image/image47.png){#fig:47 width=70%}

## Результаты

![Просмотр логов в клонированном репозитории.](image/image48.png){#fig:48 width=70%}

## Результаты

![Копирование изменений из удаленного репозитория.](image/image49.png){#fig:49 width=70%}

## Результаты

![Слияние master и origin/master веток.](image/image50.png){#fig:50 width=70%}

## Результаты

![Добавление новой ветки в клонированном репозитории.](image/image51.png){#fig:51 width=70%}

## Результаты

![Просмотр логов.](image/image52.png){#fig:52 width=50%}

## Результаты

![Коммит изменений в основном репозитории.](image/image53.png){#fig:53 width=70%}

## Результаты

![Извлечение изменений из удаленного репозитория.](image/image54.png){#fig:54 width=70%}

# Выводы

- В результате выполнения лабораторной работы познакомились с основными функциями системы контроля версий git

