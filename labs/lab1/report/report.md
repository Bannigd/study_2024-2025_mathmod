---
## Front matter
title: "Отчет по лабораторной работе №1"
subtitle: "Работа с git."
author: "Данила Андреевич Стариков"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
lof: true # List of figures
lot: true # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: IBM Plex Serif
romanfont: IBM Plex Serif
sansfont: IBM Plex Sans
monofont: IBM Plex Mono
mathfont: STIX Two Math
mainfontoptions: Ligatures=Common,Ligatures=TeX,Scale=0.94
romanfontoptions: Ligatures=Common,Ligatures=TeX,Scale=0.94
sansfontoptions: Ligatures=Common,Ligatures=TeX,Scale=MatchLowercase,Scale=0.94
monofontoptions: Scale=MatchLowercase,Scale=0.94,FakeStretch=0.9
mathfontoptions:
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "Рис."
tableTitle: "Таблица"
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lotTitle: "Список таблиц"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы

Познакомиться с системой контроля версий git, выполнить базовые команды по созданию, изменению и управлению локальными репозиториями git.


# Выполнение лабораторной работы

![Просмотр глобальных настроек git.](image/image01.png){#fig:1 width=70%}

![Измениние параметров git.](image/image02.png){#fig:2 width=70%}

![Создание каталога hello.](image/image03.png){#fig:3 width=70%}

![Создание репозитория.](image/image04.png){#fig:4 width=70%}

![Просмотр статуса после внесения изменений.](image/image05.png){#fig:5 width=70%}

![Индексация изменений.](image/image06.png){#fig:6 width=70%}

![Коммит изменений.](image/image07.png){#fig:7 width=70%}

![Измение файла после изменения, но до коммита.](image/image08.png){#fig:8 width=70%}

![Коммит изменений.](image/image09.png){#fig:9 width=70%}

![Индексация всех изменений в директории.](image/image10.png){#fig:10 width=70%}

![Коммит изменений.](image/image11.png){#fig:11 width=70%}

![Просмотр логов репозитория.](image/image12.png){#fig:12 width=70%}

![Переход к старой версии репозитория.](image/image13.png){#fig:13 width=70%}

![Возврат к последней версии.](image/image14.png){#fig:14 width=70%}

![Создание тега.](image/image15.png){#fig:15 width=70%}

![Создание второго тега.](image/image16.png){#fig:16 width=70%}

![Изменение файла.](image/image17.png){#fig:17 width=70%}

![Отмена изменений для непроиндексированного файла.](image/image18.png){#fig:18 width=70%}

![Отмена изменений для проиндексированного файла.](image/image19.png){#fig:19 width=70%}

![Лог отмены коммита.](image/image20.png){#fig:20 width=70%}

![Просмотр логов после git reset.](image/image21.png){#fig:21 width=70%}

![Создание тега oops.](image/image22.png){#fig:22 width=70%}

![Git reset к тегу до ненужного коммита.](image/image23.png){#fig:23 width=70%}

![Удаление тега oops.](image/image24.png){#fig:24 width=70%}

![Внесение изменения в созданный коммит.](image/image25.png){#fig:25 width=70%}

![Просмотр логов.](image/image26.png){#fig:26 width=70%}

![Перемещение hello.html в отдельный каталог.](image/image28.png){#fig:28 width=70%}

![Создание нового файла.](image/image29.png){#fig:29 width=70%}

![Просмотр каталога .git.](image/image30.png){#fig:30 width=70%}

![Просмотр файла HEAD.](image/image31.png){#fig:31 width=70%}

![Просмотр hello.html через хэш.](image/image32.png){#fig:32 width=70%}

![Создание новой ветки.](image/image33.png){#fig:33 width=70%}

![Добавление файла со стилями.](image/image34.png){#fig:34 width=70%}

![Просмотр логов.](image/image35.png){#fig:35 width=70%}

![Возвращение в master ветку.](image/image36.png){#fig:36 width=70%}

![Сравнение содержимого hello.html в ветке style.](image/image37.png){#fig:37 width=70%}

![Добавление README.](image/image38.png){#fig:38 width=70%}

![Просмотр графа коммитов.](image/image39.png){#fig:39 width=70%}

![Слияние двух веток.](image/image40.png){#fig:40 width=70%}

![Создание нового коммита после слияния.](image/image41.png){#fig:41 width=70%}

![Перебазирование ветки style.](image/image42.png){#fig:42 width=70%}

![Клонирование репозитория.](image/image43.png){#fig:43 width=70%}

![Просмотр логов в клонированном репозитории.](image/image44.png){#fig:44 width=70%}

![Просмотр информации об удаленном репозитории.](image/image45.png){#fig:45 width=70%}

![Просмотр списка веток в клонированном репозитории.](image/image46.png){#fig:46 width=70%}

![Коммит изменений в основном репозитории.](image/image47.png){#fig:47 width=70%}

![Просмотр логов в клонированном репозитории.](image/image48.png){#fig:48 width=70%}

![Копирование изменений из удаленного репозитория.](image/image49.png){#fig:49 width=70%}

![Слияние master и origin/master веток.](image/image50.png){#fig:50 width=70%}

![Добавление новой ветки в клонированном репозитории.](image/image51.png){#fig:51 width=70%}

![Просмотр логов.](image/image52.png){#fig:52 width=70%}

![Коммит изменений в основном репозитории.](image/image53.png){#fig:53 width=70%}

![Извлечение изменений из удаленного репозитория.](image/image54.png){#fig:54 width=70%}


# Выводы

В результате выполнения лабораторной работы познакомились с основными функциями системы контроля версий git.
