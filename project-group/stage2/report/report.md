---
## Front matter
title: "Образование планетной системы."
subtitle: "Отчет по этапу 2."
author: 
  - Стариков Данила Андреевич,
  - Коннова Татьяна Алексеевна,
  - Нефедова Наталия Николаевна,
  - Тарутина Кристина Еленовна,
  - Уткина Алина Дмитриевна


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

Дать теоретическое описание алгоритмам, которые будут использованы для моделирования задачи образования планетной системы

# Формулировка решаемой системы 

Моделируется образование планетной системы из межзвездного газа, который представляется как скопление частиц.
Так как число моделируемых частиц весьма ограничено, то можно сказать, что в этой модели планеты образуются из уже сформировавшихся газопылевых уплотнений, которыми и являются задаваемые частицы.

Движение частиц описывается с помощью Второго закона Ньютона:

$$
m_i \frac{d^2\mathbf{r}_i}{dt^2} = \mathbf{F}_i.
$$

То есть систему $N$ уравнений второго порядка, которую можно переписать как систему $2N# уравнений первого порядка:

$$
\frac{d\mathbf{r}_i}{dt} = \mathbf{v}_i,
\frac{d\mathbf{v}_i}{dt} = \mathbf{a}_i,
$$

где $\mathbf{a}_i = \frac{\mathbf{F}_i}{m_i}$ -- ускорение частиц, $\mathbf{v}_i$ - ее скорость.

Полученная система дополняется начальными условиями для формулировки задачи Коши, что уже позволяет искать решение системы:

$$
\mathbf{r}_i(t = 0) =\mathbf{r}_{i0},
$$
$$\mathbf{v}_i(t = 0) = \mathbf{v}_{i0}.
$$

# Алгоритм Верле

Наивный подход подразумевает расчет вычисление взаимодействия каждой частицы с каждой, что требует $N^2$ операций ($N$ - число частиц в системе). 

Численное решение полученной системы будем решать с помощью алгоритма Верле, имеющим следующий вид:

$$
\mathbf{r}_{i}^{n+1} = \mathbf{r}_{i}^{n} +\mathbf{v}_{i}^{n} \cdot \Delta t+ \mathbf{a}_{i}^{n} \cdot \frac{\Delta t^{2}}{2}, 
$$
$$
\mathbf{v}_{i}^{n+1} = \mathbf{v}_{i}^{n} + \frac{1}{2}( \mathbf{a}_ {i}^ {n} + \mathbf{a}_ {i}^ {n+1} ) \Delta t.
$$

Для оптимизации хранения промежуточных значений можно переписать схему, тогда отпадет необходимость хранить значения ускорений на двух шагах по времени одновременно:

$$
\mathbf{v}_ {i}^{n+1/2}  =  \mathbf{v}_ {i}^ {n}  +  \mathbf{a}_ {i}^ {n}  \cdot  \frac {\Delta t}{2} 
$$ 
$$
\mathbf{r}_ {i}^ {n+1}  =  \mathbf{r}_ {i}^ {n}  +  \mathbf{v}_ {i}^ {n+1/2}  \Delta t
$$
$$
\mathbf{v}_ {i}^ {n+1} =  \mathbf{v}_ {i}^ {n+1} + \mathbf{a}_i^{n+1} \frac {\Delta t}{2} 
$$

Ускорение частицы будет складываться их нескольких явлений:

  * Гравитационное притяжение: $F = \frac{\gamma m_i m_j}{r^2_{ij}}$
  * Сила отталкивания: $F^r(b) = k\left(\left(\frac{a}{b}\right)^8-1\right)$, 
  
  где $a = R_i + R_j$ -- сумма радиусов частиц $i$ и $j$, $b$ -- модуль радиус-вектора взаимодействия $\mathbf{b} = \mathbf{r}_{i,j} = \mathbf{r}_i − \mathbf{r}_j$

# Выводы

Дано описание алгоритмам, которые будут использоваться для численной реализации моделирования задачи образования планетной 
системы.


