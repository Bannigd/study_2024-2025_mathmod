---
## Front matter
title: "Отчет по лабораторной работе №6"
subtitle: "Модель хищник-жертва"
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

Реализовать модель хищник-жертва в OpenModelica и Julia, построить графики зависимости x и y от времени, график зависимости x от y.

# Задание
Вариант 50

Для модели «хищник-жертва»:

$$
    \begin{cases}
	\dfrac{dx}{dt} = -0.71x(t)+0.046x(t)y(t),\\
	\dfrac{dy}{dt} = 0.64y(t)-0.017x(t)y(t).
    \end{cases}\,.
$$

Постройте график зависимости численности хищников от численности жертв,
а также графики изменения численности хищников и численности жертв при
следующих начальных условиях: $x_0=4, y_0=12$. Найдите стационарное состояние системы.

# Выполнение работы

## Моделирование в OpenModelica

Модель хищник-жертва в `OpenModelica` реализована следующим образом:

```
model lab05 // Lotka-Volterra
    parameter Real a=-0.71;
  parameter Real b=0.046;
  parameter Real c=0.64;
  parameter Real d=-0.017;
  parameter Real x0=4;
  parameter Real y0=12;
  Real x(start=x0);
  Real y(start=y0);
  equation 
  der(x) = a*x+b*x*y;
  der(y) = c*y+d*x*y;
annotation(
    experiment(StartTime = 0, StopTime = 10, Interval = 0.002));
end lab05;
```

Получены графики зависимости $x$ и $y$ от времени (рис. [-@fig:001]) и зависимости $x$ от $y$ (рис. [-@fig:002]).

![Зависимость x и y от времени в модели хищник-жертва OpenModelica.](image/xy_over_t.png){#fig:001 width=70%}

![Зависимость x от y в модели хищник-жертва OpenModelica.](image/phase_volume.png){#fig:002 width=70%}

Также найдено стационарное состояние системы по формуле $x_s=\dfrac{c}{d}=-37.6470, y_s=\dfrac{a}{b}=-15.4347$

## Моделирование в Julia

Модель хищник-жертва в `Julia` реализована следующим образом:

```julia
using OrdinaryDiffEq, Plots
function model(u, p, t)
    # Lottka-Volterra model
    x, y = u
    a, b, c, d = p
    dx = a*x + b*x*y
    dy = c*y + d*x*y
    return [dx, dy]
end
u0 = [4,12]
p = [-0.71, 0.046, 0.64, -0.017]
t = (0,100)
prob = ODEProblem(model, u0, t, p)
sol = solve(prob, reltol = 1e-12)
plot(sol, label=["X" "Y"], xaxis="Время", yaxis="Численность")
plot(map(first, sol.u), map(last, sol.u), xaxis="X", yaxis="Y")
```

Получены графики зависимости $x$ и $y$ от времени (рис. [-@fig:003]) и зависимости $x$ от $y$ (рис. [-@fig:004]).

![Зависимость x и y от времени в модели хищник-жертва Julia.](image/jl_over_t.png){#fig:003 width=70%}

![Зависимость x от y в модели хищник-жертва Julia.](image/jl_phase_vol.png){#fig:004 width=70%}


# Выводы

В результате выполнения лабораторной работы провели численное моделирование модели хишник-жертва в `OpenModelica` и `Julia`.
