---
## Front matter
title: "Отчёт по лабораторной работе №3. "
subtitle: "Модель боевых действий"
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

Реализовать математическую модель боевых действий (модель Ланчестера) для двух случаев: 

1) Боевые действия ведутся между регулярными войсками;
2) Боевые действия ведутся с участием регулярных войск и партизанских отрядов.


# Задание

Вариант 52. 

Между страной Х и страной У идет война. Численность состава войск
исчисляется от начала войны, и являются временными функциями $ x(t) $  и $ y(t) $ .В
начальный момент времени страна Х имеет армию численностью 222 000 человек,
а в распоряжении страны У армия численностью в 229 000 человек. Для упрощения
модели считаем, что коэффициенты $a, b, c, h$ постоянны. Также считаем $P(t)$ и $Q(t)$
непрерывные функции.
Постройте графики изменения численности войск армии $Х$ и армии $У$ для
следующих случаев:
1. Модель боевых действий между регулярными войсками

$$
\begin{aligned}
\frac{dx}{dt} = -0.223x(t)-0.774y(t)+|\sin{(t+1)}| \\
\frac{dy}{dt} = -0.665(t)-0.332(t)+|\cos{(t+2)}|
\end{aligned}
$$

2. Модель ведение боевых действий с участием регулярных войск и
партизанских отрядов

$$
\begin{aligned}
\frac{dx}{dt} = -0.291(t)-0.865(t)+|\sin{(2t)}| \\
\frac{dy}{dt} = -0.456(t)y(t)-0.789(t)+|\cos{(t)}|
\end{aligned}
$$


# Выполнение лабораторной работы

## Модель боевых действий между регулярными войсками

Базовая модель боевых действий с участием только регулярных войск была промоделирована в `OpenModelica`
и `Julia`:

	1) Моделирование в `OpenModelica`:

```
model lab03 "1) Модель боевых действий между регулярными войсками. Вариант 52."
  parameter Real a=0.223; // константа, хар-я степень влияния различных факторов на потери
  parameter Real b=0.774; // эффективность боевых действий армии у 
  parameter Real c=0.665; // эффективность боевых действий армии х 
  parameter Real h=0.332; // константа, характеризующая степень влияния различных факторов на потери 
  
  // Начальные условия
  parameter Real x0=222000; // численность первой армии
  parameter Real y0=229000; // численность второй армии
  
  Real x(start=x0);
  Real y(start=y0);
  Real P;
  Real Q; 
equation
  P = abs(sin(time+1));
  Q = abs(cos(time+2));
  der(x) = -a*x-b*y+P;
  der(y) = -c*x-h*y+Q;
end lab03;
```

На рисунке [-@fig:001] изображен соответствующий график:

![Модель боевых действий только с регулярными войсками в OpenModelica.](image/plot1.png){#fig:001 width=70%}

	2) Моделирование в `Julia`:
	 
``` julia
using DifferentialEquations, Plots;
function model1(u, p, t)
    x, y = u
    a, b, c, h = p
    dx = -a*x - b*y + abs(sin(t+1))
    dy = -c*x - h*y + abs(cos(t+2))
    return [dx, dy]
end
u0 = [222000, 229000]
# a,b,c,h
params_1 = [0.223, 0.774, 0.665, 0.332]
t = (0, 1)
prob1 = ODEProblem(model1, u0, t, params_1)
sol_1 = solve(prob1)
```

На рисунке [-@fig:002] изображен соответствующий график:

![Модель боевых действий только с регулярными войсками в Julia.](image/jl_plot1.png){#fig:002 width=70%}


## Модель ведение боевых действий с участием регулярных войск и партизанских отрядов

Базовая модель боевых действий с участием регулярных войск и партизанских отрядов была промоделирована в `OpenModelica`
и `Julia`:

	1) `OpenModelica`:
```
model lab03_2 "2) Модель боевых действий между регулярными войсками с участием партизанских отрядов. Вариант 52."
  parameter Real a=0.291; // константа, хар-я степень влияния различных факторов на потери
  parameter Real b=0.865; // эффективность боевых действий армии у 
  parameter Real c=0.456; // эффективность боевых действий армии х 
  parameter Real h=0.789; // константа, характеризующая степень влияния различных факторов на потери 
  
  // Начальные условия
  parameter Real x0=222000; // численность первой армии
  parameter Real y0=229000; // численность второй армии
  
  Real x(start=x0);
  Real y(start=y0);
  Real P;
  Real Q; 
equation
  P = abs(sin(2*time));
  Q = abs(cos(time));
  der(x) = -a*x-b*y+P;
  der(y) = -c*x*y-h*y+Q;
end lab03_2;
```
На рисункax [-@fig:003] и [-@fig:004] изображены соответствующие графики:

![Модель боевых действий с участием регулярных войск и партизанских отрядов в OpenModelica.](image/plot2.png){#fig:003 width=70%}

![Модель боевых действий с участием регулярных войск и партизанских отрядов в OpenModelica (1 мс).](image/plot2_1ms.png){#fig:004 width=70%}

	2) `Julia`:

```julia
using DifferentialEquations, Plots;
function model2(u, p, t)
    x, y = u
    a, b, c, h = p
    dx = -a*x - b*y + abs(sin(2*t))
    dy = -c*x*y - h*y + abs(cos(t))
    return [dx, dy]
end
u0 = [222000, 229000]
# a,b,c,h
params_2 = [0.291, 0.865, 0.456, 0.789]
t = (0, 1)
prob2 = ODEProblem(model2, u0, t, params_2)
sol_2 = solve(prob2)
# на промежутке 1 мс
t_1  = [0, 0.001]
prob3 = ODEProblem(model2, u0, t_1, params_2)
sol_3 = solve(prob3)
plot(sol_3, label=["Армия X" "Армия Y"], xaxis="Время", yaxis="Численность", legend=:right)
```

На рисункax [-@fig:005] и [-@fig:006] изображены соответствующие графики:

![Модель боевых действий с участием регулярных войск и партизанских отрядов в Julia.](image/jl_plot2.png){#fig:005 width=70%}

![Модель боевых действий с участием регулярных войск и партизанских отрядов в Julia (1 мс).](image/jl_plot2_1ms.png){#fig:006 width=70%}


# Выводы

В резултьтате выполенения лабораторной работы познакомились с моделью боевых действий (модель Ланчестера) и попробовали
смоделировать конкретные примеры.

