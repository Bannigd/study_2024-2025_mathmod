---
## Front matter
title: "Отчёт по лабораторной работе №4. "
subtitle: "Модель гармонических колебаний"
author: "Стариков Данила Андреевич"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
lof: false # List of figures
lot: false # List of tables
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

1. Построить решение уравнения гармонического осциллятора без затухания 
2. Записать уравнение свободных колебаний гармонического осциллятора с
затуханием, построить его решение. Построить фазовый портрет гармонических
колебаний с затуханием.
3. Записать уравнение колебаний гармонического осциллятора, если на систему
действует внешняя сила, построить его решение. Построить фазовый портрет
колебаний с действием внешней силы.

# Задание

Вариант № 52

Построить фазовый портрет гармонического осциллятора и решение уравнения
гармонического осциллятора для следующих случаев:

1. Колебания гармонического осциллятора без затуханий и без действий внешней
силы

$$ \ddot{x} + 2.7x = 0$$

2. Колебания гармонического осциллятора c затуханием и без действий внешней
силы

$$ \ddot{x} + 2.7\dot{x} + 2.7x = 0$$

3. Колебания гармонического осциллятора c затуханием и под действием внешней
силы

$$ \ddot{x} + 17\dot{x} + 2.7x = 0.7\sin{(7t)}$$

На интервалеx $t \in [0;47]$ (шаг 0.05) с начальными условиями $x_0 = 0.7, y_0 = 0.7$

# Выполнение лабораторной работы

Уравнение свободных колебаний гармонического осциллятора имеет следующий вид:

$$ \ddot{x} + 2\gamma \dot{x} + \omega^2x = 0$$



## Колебания гармонического осциллятора без затуханий и без действий внешней силы

Уравнение гармонических колебаний гармонического осциллятора без затуханий и без действий внешней силы имеет следующий вид:

$$ \ddot{x} + \omega^2x = 0$$

Для моделирования таких колебаний в `OpenModelica` написан следующий скрипт:


```
model lab04
  parameter Real gamma = 0;
  parameter Real omega_2 = 2.7;
  Real f = 0;
  
  Real x;
  Real der_x;
initial equation
  x=0.7;
  der_x=0.7;
equation
  der_x = der(x);
  der(der_x) + gamma*der_x + omega_2*x = f;
annotation(
    experiment(StartTime = 0, StopTime = 47, Tolerance = 1e-06, Interval = 0.05));
end lab04;
```

На рисунке [-@fig:001] изображен соответствующий график:

![Модель гармонических колебаний гармонического осциллятора без затуханий и без действий внешней силы OpenModelica.](image/plot1.png){#fig:001 width=70%}



## Колебания гармонического осциллятора c затуханий и без действий внешней силы

Уравнение гармонических колебаний гармонического осциллятора c затуханием и без действий внешней силы имеет следующий вид:

$$ \ddot{x} + \gamma \dot{x}  + \omega^2x = 0$$

Для моделирования таких колебаний в `OpenModelica` написан следующий скрипт:

```
model lab04
  parameter Real gamma = 2.7;
  parameter Real omega_2 = 2.7;
  Real f = 0;
  
  Real x;
  Real der_x;
initial equation
  x=0.7;
  der_x=0.7;
equation
  der_x = der(x);
  der(der_x) + gamma*der_x + omega_2*x = f;
annotation(
    experiment(StartTime = 0, StopTime = 47, Tolerance = 1e-06, Interval = 0.05));
end lab04;
```

На рисунке [-@fig:002] изображен соответствующий график:

![Модель гармонических колебаний гармонического осциллятора с затуханием и без действий внешней силы OpenModelica.](image/plot2.png){#fig:002 width=70%}

## Колебания гармонического осциллятора с затуханий и под действием внешней силы

Уравнение гармонических колебаний гармонического осциллятора с затуханий и под действием внешней силы имеет следующий вид:

$$ \ddot{x} + 2\gamma \dot{x} + \omega^2x = f(t)$$

Для моделирования таких колебаний в `OpenModelica` написан следующий скрипт:

```
model lab04
  parameter Real gamma = 0;
  parameter Real omega_2 = 2.7;
  Real f = 2.7*sin(7*time);
  
  Real x;
  Real der_x;
initial equation
  x=0.7;
  der_x=0.7;
equation
  der_x = der(x);
  der(der_x) + gamma*der_x + omega_2*x = f;
annotation(
    experiment(StartTime = 0, StopTime = 47, Tolerance = 1e-06, Interval = 0.05));
end lab04;
```

На рисунке [-@fig:003] изображен соответствующий график:

![Модель гармонических колебаний гармонического осциллятора с затуханий и под действием внешней силы OpenModelica.](image/plot3.png){#fig:003 width=70%}

# Выводы

В результате выполенения лабораторной работы познакомились с моделью гармонических колебаний и построили фазовые портреты для случая свободных колебаний, колебаний с затуханием и колебаний с затуханием и действием внешей силы.

