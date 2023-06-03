\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{lbscript}[2023/05/21 A Mischmasch]


\RequirePackage{etoolbox} % TODO: ausprobieren, ob ich mit \AfterEndDocument den Shell escape flag fixen kann.


%\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
%\ProcessOptions\relax


\RequirePackage{kvoptions}
\DeclareStringOption[Leon Bernáth]{author}
\DeclareStringOption[]{title}
\DeclareStringOption[]{subtitle}
\DeclareStringOption[\today]{date}
\DeclareStringOption[leon.bernath@posteo.de]{mail}
\DeclareBoolOption{english}
\DeclareComplementaryOption{german}{english}
\DeclareBoolOption{customheader}
\DeclareStringOption[half]{parskip}
\DeclareStringOption[calc]{DIV}
\DeclareStringOption[12pt]{fontsize}
\DeclareStringOption[A4]{paper}
\DeclareBoolOption{report}
\DeclareBoolOption{minted}
\ProcessKeyvalOptions*


\ifbool{lbscript@report}{

  \ifbool{lbscript@english}{
    \PassOptionsToClass{english}{scrreprt}
  }{
    \PassOptionsToClass{ngerman}{scrreprt}
  }
  \LoadClass[DIV=\lbscript@DIV, parskip=\lbscript@parskip, fontsize=\lbscript@fontsize,   paper = \lbscript@paper]{scrreprt}

}{

  \ifbool{lbscript@english}{
      \PassOptionsToClass{english}{scrartcl}
    }{
      \PassOptionsToClass{ngerman}{scrartcl}
    }
  \LoadClass[DIV=\lbscript@DIV, parskip=\lbscript@parskip, fontsize=\lbscript@fontsize,   paper = \lbscript@paper]{scrartcl}

}






\newcommand{\Author}{\lbscript@author}
\newcommand{\Title}{\lbscript@title}
\newcommand{\Date}{\lbscript@date}
\newcommand{\Subtitle}{\lbscript@subtitle}
\newcommand{\meinemail}{\href{mailto:\lbscript@mail}{\lbscript@mail}}



\RequirePackage{csquotes}


\ifbool{lbscript@english}{
    \RequirePackage[main=english, ngerman]{babel}
  }{
    \RequirePackage[main=ngerman, english]{babel}
  }


%% The AMS-Packages
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{mathtools}


% TODO: Fonts
%% Different Fonts
%\RequirePackage{libertine}
%\RequirePackage{libertinust1math}

\RequirePackage{fontspec}
\defaultfontfeatures{Ligatures=TeX}
\RequirePackage[math-style=ISO, bold-style=ISO]{unicode-math}
%\unimathsetup{math-style=TeX}
%\setmathfont{NewCMMath-Book}
\setmathfont{Latin Modern Math}
\setmathfont{stix}[range={\setminus, \downzigzagarrow}]
\setmathfont{TeX Gyre Pagella Math}[range={"1D538-"1D56B, "02102, "0210D, "02115, "02119, "0211A, "0211D, "02124}] % The double stroke letters, e.g. for the complex, real, natural, whole numbers, or fields, because they look best in this font.







\RequirePackage{graphicx}
%\graphicspath{{graphics/}}


\RequirePackage{comment}
\RequirePackage{wrapfig}
\RequirePackage[dvipsnames,table,xcdraw]{xcolor}
\RequirePackage{booktabs}


\RequirePackage[stretch=10,shrink=10]{microtype}



\RequirePackage{setspace}
\RequirePackage[inline]{enumitem}
\RequirePackage{multicol}
\RequirePackage{import}


\RequirePackage{siunitx}
\sisetup{per-mode=fraction}
\ifbool{lbscript@english}{
    \sisetup{locale = US}
  }{
    \sisetup{locale = DE}
  }

\RequirePackage{tikz}
\RequirePackage[straightvoltages]{circuitikz}
\usetikzlibrary{positioning,shapes.geometric}
\usetikzlibrary{angles,quotes}
\usetikzlibrary{intersections, calc}
\usetikzlibrary{external}
\tikzexternalize[prefix=tikz/]
% \RequirePackage[framemethod=TikZ]{mdframed}

\RequirePackage{pgfplots}
\RequirePackage{cancel}

% Don't break enumeration (etc.) across pages in an ugly manner
\clubpenalty=10000
\widowpenalty=10000


\ifbool{lbscript@customheader}{
  }{
    \RequirePackage[headsepline, footsepline, plainfootsepline]{scrlayer-scrpage}
    \pagestyle{scrheadings} %alternativ: \pagestyle{plain.scrheadings}
    \lohead{\headmark}
    \automark{section} %chapter
    \cohead{}
    \rohead{}
    \cfoot[\pagemark]{\pagemark}
    % Die optionalen Argumente liefern den Inhalt des Elements im pagestyle plain.scrheadings
  }



\author{\Author}
\title{\Title}
\date{\Date}
\subtitle{\Subtitle}


%\setlength\parindent{0pt}
%\onehalfspacing
%\renewcommand{\thefigure}{\arabic{figure}}


\newcommand{\RomanNumeralCaps}[1]{\MakeUppercase{\romannumeral#1}}


\renewcommand{\labelitemi}{$\blacktriangleright$}


\RequirePackage[backend=biber,
style=numeric , %numeric,  authoryear, authoryear-ibid, authortitle, numeric-comp
citestyle = numeric,
autocite=inline,
defernumbers=true,
useprefix=true,%
giveninits=true,%
hyperref=true,%
uniquename=init,%
sortcites=false,% sort citations when multiple entries are passed to one cite command
isbn=true, %ISBN nicht ausgeben
url=true,
eprint=false,
doi=false,
sorting=none]{biblatex}

\addbibresource{references.bib}
\renewcommand*{\mkbibnamefamily}[1]{\textsc{#1}} %Namen in Kapitälchen
\renewcommand{\postnotedelim}{\addcolon\space} %Doppelpunkt und Abstand nach Name

% url breaks
\setcounter{biburllcpenalty}{7000}
\setcounter{biburlucpenalty}{8000}



\RequirePackage{xpatch} %Remove points in numbering of theorems via amsthm
\makeatletter
\AtBeginDocument{\xpatchcmd{\@thm}{\thm@headpunct{.}}{\thm@headpunct{}}{}{}}
\makeatother

\RequirePackage[arrowdel]{physics}


\RequirePackage{varwidth}

%\setcounter{secnumdepth}{5}
%\setcounter{tocdepth}{5}


\newcommand{\konst}{\text{konst.}}

\newcommand{\folglich}{\qquad\Rightarrow\qquad}
\newcommand{\antiparallel}{\upharpoonleft\!\downharpoonright} % or \uparrow\downarrow



\addtokomafont{labelinglabel}{\sffamily\bfseries}


\RequirePackage{calc}
\newlength{\conditionwd}
\newenvironment{conditions}[1][Wobei:]  % where
{%
  #1\tabularx{\textwidth-\widthof{#1}}[t]{
    >{$}l<{$} @{${}={}$} X@{}
  }%
}
{\endtabularx\\[\belowdisplayskip]}



\RequirePackage{slashed}
%Reference: https://www.physicsforums.com/threads/latex-how-to-do-dirac-slash-notation.55561/



\RequirePackage{pdfpages}



\RequirePackage[]{faktor}

%\RequirePackage[]{listings} % Codeblocks, thus not necessary with minted
\ifbool{lbscript@minted}{
    \RequirePackage[newfloat]{minted} % Nice looking colored Codeblocks
    \setminted{linenos, frame=lines, breaklines, fontsize=\small}
  }{
}


\RequirePackage{transparent}
% Is used by the pdf-export of Inkscape sometimes
% only works with luatex says documentation




\newcommand{\inkfig}[2][\columnwidth]{%
    \def\svgwidth{#1}
    \import{./figures/}{#2.pdf_tex}
}



\RequirePackage{hyperref}
\hypersetup{
  colorlinks= true,
  linkcolor={red!80!black},
  citecolor={blue!50!black},
  urlcolor={blue!80!black},
  final=true,
  plainpages=false,
  pdfstartview=FitV,
  pdftoolbar=true,
  pdfmenubar=true,
  pdfencoding=auto, % Allows symbols in toc and content oveview
  psdextra, % same as above
  bookmarksopen=true,
  bookmarksnumbered=true,
  pdfnewwindow=true,
  breaklinks=true,
  linktocpage=true
}

\hypersetup{pdfinfo={
    pdftitle={\Title}, %,
    pdfauthor={\Author}
    %pdfsubject
  }
}

\def\UrlBreaks{\do\/\do-}

\RequirePackage[nameinlink]{cleveref}% http://ctan.org/pkg/cleveref

\RequirePackage{tabularx}

\RequirePackage[most]{tcolorbox}
\tcbset{shield externalize}

\newtcolorbox{kompakt}[1]{colback=green!5!white, colframe=green!75!black,fonttitle=\bfseries, title=#1, oversize}


\newtcolorbox{beispiel}[1]{title=#1, fonttitle=\bfseries, oversize}



%% Modified from some stackexchangeanswer
\tcbset{%
  mytheoremstyle/.style={
    enhanced, breakable, parbox=false,
    before skip=2mm, after skip=2mm,
    colback=white, colframe=blue!40!black,
    boxrule=0.5mm, arc is angular,
    attach boxed title to top left={xshift=1cm, yshift*=1mm-\tcboxedtitleheight},
    varwidth boxed title*=-3cm,
    boxed title style={frame code={
        \path[fill=tcbcolback!30!black]
        ([yshift=-1mm,xshift=-1mm]frame.north west)
        arc[start angle=0,end angle=180,radius=1mm]
        ([yshift=-1mm,xshift=1mm]frame.north east)
        arc[start angle=180,end angle=0,radius=1mm];
        \path[left color=tcbcolback!60!black, right color=tcbcolback!60!black,
        middle color=tcbcolback!80!black]
        ([xshift=-2mm]frame.north west) -- ([xshift=2mm]frame.north east)
        [rounded corners=1mm]-- ([xshift=1mm,yshift=-1mm]frame.north east)
        -- (frame.south east) -- (frame.south west)
        -- ([xshift=-1mm,yshift=-1mm]frame.north west)
        [sharp corners]-- cycle;
      },
      interior engine=empty},
    colbacktitle=blue!40!black,
    fonttitle=\bfseries,
  },
}

\tcbset{%
  def/.style={
    breakable,enhanced, parbox=false,
    left=5mm, theorem style=break,
    before skip=4mm,after skip=4mm,
    %   borderline = {0.3mm}{0pt}{gray},
    coltitle=black, fonttitle=\bfseries,
    colback=white,
    arc=0pt,
}}

\tcbset{%
  rem/.style={
    blanker,breakable,left=5mm, parbox=false,
    before skip=10pt,after skip=10pt,
    borderline west={1mm}{0pt}{gray},
    coltitle=black, fonttitle=\bfseries,
  }}

\tcbset{%
  examplestyle/.style={
    blanker,breakable, left=5mm, parbox=false,
    before skip=10pt,after skip=10pt,
    borderline west={1mm}{0pt}{green!70!black},
    coltitle=black, fonttitle=\bfseries,
  }}


\ifbool{lbscript@english}{
    \newtcbtheorem[number within=section, list inside=thmlist, crefname={Theorem}{Theorems}]{theorem}{Theorem}{mytheoremstyle, separator sign={}, description delimiters parenthesis}{th}
    \newtcbtheorem[use counter from=theorem, list inside=thmlist, crefname={Corollary}{Corollaries}]{corollary}{Corollary}{mytheoremstyle, separator sign={}, description delimiters parenthesis}{cor}
    \newtcbtheorem[use counter from=theorem, list inside=thmlist, crefname={Proposition}{Propositions}]{proposition}{Proposition}{mytheoremstyle, separator sign={}, description delimiters parenthesis}{pro}
    \newtcbtheorem[use counter from=theorem, list inside=thmlist, crefname={Definition}{Definitions}]{definition}{Definition}{def, separator sign={}, description delimiters parenthesis}{def}
    \newtcbtheorem[use counter from=theorem, crefname={Remark}{Remarks}]{remark}{Remark}{rem, separator sign={}, description delimiters parenthesis}{rem}
    \newtcbtheorem[use counter from=theorem, crefname={Remarks}{Remarks}]{remarks}{Remarks}{rem, separator sign={}, description delimiters parenthesis}{rem}
    \newtcbtheorem[use counter from=theorem, crefname={Insertion}{Insertions}]{insertion}{Insertion}{rem, separator sign={}, description delimiters parenthesis}{ins}
    \newtcbtheorem[use counter from=theorem, list inside=thmlist, crefname={Example}{Examples}]{example}{Example}{examplestyle, separator sign={}, description delimiters parenthesis}{exa}
  }{
    \newtcbtheorem[number within=section, list inside=thmlist, crefname={Satz}{Sätze}]{theorem}{Satz}{mytheoremstyle, separator sign={}, description delimiters parenthesis}{th}
    \newtcbtheorem[use counter from=theorem, list inside=thmlist, crefname={Korollar}{Korollare}]{corollary}{Korollar}{mytheoremstyle, separator sign={}, description delimiters parenthesis}{cor}
    \newtcbtheorem[use counter from=theorem, list inside=thmlist, crefname={Behauptung}{Behauptungen}]{proposition}{Behauptung}{mytheoremstyle, separator sign={}, description delimiters parenthesis}{pro}
    \newtcbtheorem[use counter from=theorem, list inside=thmlist, crefname={Definition}{Definitionen}]{definition}{Definition}{def, separator sign={}, description delimiters parenthesis}{def}
    \newtcbtheorem[use counter from=theorem, crefname={Bemerkung}{Bemerkungen}]{remark}{Bemerkung}{rem, separator sign={}, description delimiters parenthesis}{rem}
    \newtcbtheorem[use counter from=theorem, crefname={Bemerkungen}{Bemerkungen}]{remarks}{Bemerkungen}{rem, separator sign={}, description delimiters parenthesis}{rem}
    \newtcbtheorem[use counter from=theorem, crefname={Einschub}{Einschübe}]{insertion}{Einschub}{rem, separator sign={}, description delimiters parenthesis}{ins}
    \newtcbtheorem[use counter from=theorem, list inside=thmlist, crefname={Beispiel}{Beispiele}]{example}{Beispiel}{examplestyle, separator sign={}, description delimiters parenthesis}{exa}
}

\newtcbtheorem[use counter from=theorem, list inside=thmlist, crefname={Lemma}{Lemmata}]{lemma}{Lemma}%
{mytheoremstyle, separator sign={}, description delimiters parenthesis}{le}


\newtcolorbox{wichtig}[1]{mytheoremstyle, title=#1, colframe=green!40!black, colbacktitle=green!40!black}

\newenvironment{myproof}{\begin{proof}}{\end{proof}}

\tcolorboxenvironment{proof}{% `proof' from `amsthm'
blanker,breakable,left=5mm,
before skip=10pt,after skip=10pt,
borderline west={1mm}{0pt}{green}}



\newcommand{\vkappa}{\text{\usefont{U}{solomos}{m}{n}\symbol{'153}}}

% \RequirePackage{bm}
% Some shortcuts
% \newcommand{\N}{\ensuremath{\mathbb{N}}}
% \newcommand{\R}{\ensuremath{\mathbb{R}}}
% \newcommand{\Z}{\ensuremath{\mathbb{Z}}}
% \renewcommand{\O}{\ensuremath{\emptyset}}
% \newcommand{\Q}{\ensuremath{\mathbb{Q}}}

% \newcommand{\C}{\ensuremath{\mathbb{C}}}
% \newcommand{\A}{\ensuremath{\mathcal{A}}}

% \renewcommand{\H}{\ensuremath{\mathcal{H}}}
% \newcommand{\D}{\ensuremath{\mathcal{D}}}

% \RequirePackage{bbm}
% \newcommand{\one}{\ensuremath{\mathbbm{1}}}
% %Hierzu gibt es noch eine Menge zu fixen, das hat mit Unicode-Math zu tun
% \renewcommand{\S}{\ensuremath{\mathcal{S}}}
\newcommand{\ha}{\textasciicircum}


%\newcommand{\sr}{\ensuremath{\mathcal{S}(\R)}}
% \newcommand{\interior}[1]{\mathring{#1}}
\newcommand{\conj}{^{*}}


\DeclareMathOperator{\ran}{ran}
\DeclareMathOperator{\sgn}{sgn}
\DeclareMathOperator{\spa}{span}
\DeclareMathOperator{\Cov}{Cov}
\DeclareMathOperator{\Var}{Var}
\DeclareMathOperator{\spec}{spec}
\DeclareMathOperator{\id}{id}
\DeclareMathOperator{\End}{End}
\DeclareMathOperator{\cha}{char}
\DeclareMathOperator{\Eig}{Eig}
\DeclareMathOperator{\Bij}{Bij}
\DeclareMathOperator{\GL}{GL}
\DeclareMathOperator{\Hom}{Hom}
\DeclareMathOperator{\rk}{rk}
\DeclareMathOperator{\graph}{graph}
\DeclareMathOperator{\im}{Im}
\DeclareMathOperator{\rg}{Rg}
\DeclareMathOperator{\Grad}{grad}
\DeclareMathOperator{\supp}{supp}
\DeclareMathOperator{\supess}{supess}
\DeclareMathOperator{\pr}{pr}
\DeclareMathOperator{\sym}{sym}


%% From some stackexchange site
%% This gives a double slash
\newcommand{\git}{\mathbin{
  \mathchoice{/\mkern-6mu/}% \displaystyle
    {/\mkern-6mu/}% \textstyle
    {/\mkern-5mu/}% \scriptstyle
    {/\mkern-5mu/}}}% \scriptscriptstyle


%% From Alexander Kirchner
\newcommand{\arrl}[2][=]{%
  \underset{\substack{\uparrow\\\mathllap{\text{#2\hspace{-1em}}}}}{#1}}
\newcommand{\arrupl}[2][=]{%
  \overset{\substack{\mathllap{\text{#2\hspace{-1em}}}\\\downarrow}}{#1}}
\newcommand{\arr}[2][=]{%
  \underset{\substack{\uparrow\\\mathclap{\text{#2}}}}{#1}}
\newcommand{\arrup}[2][=]{%
  \overset{\substack{\mathclap{\text{#2}}\\\downarrow}}{#1}}
\newcommand{\arrr}[2][=]{%
  \underset{\substack{\uparrow\\\mathrlap{\text{\hspace{-1em}#2}}}}{#1}}
\newcommand{\arrupr}[2][=]{%
  \overset{\substack{\mathrlap{\text{~#2~\hspace{-1em}}}\\\downarrow}}{#1}}

%% From: https://tex.stackexchange.com/a/413378/
\makeatletter
\newcommand*{\encircled}[1]{\relax\ifmmode\mathpalette\@encircled@math{#1}\else\@encircled{#1}\fi}
\newcommand*{\@encircled@math}[2]{\@encircled{$\m@th#1#2$}}
\newcommand*{\@encircled}[1]{%
  \tikz[baseline,anchor=base]{\node[draw,circle,outer sep=0pt,inner sep=.2ex] {#1};}}
\makeatother

\newcommand{\wh}{\ensuremath{\encircled{𝒲}}}
%


\numberwithin{equation}{section}


%%% Local Variables:
%%% TeX-command-extra-options: "-shell-escape"
%%% End: