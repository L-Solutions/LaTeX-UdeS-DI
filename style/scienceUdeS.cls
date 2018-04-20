%%
%% This is file `scienceUdeS.cls',
%%
%% Version 2018/03/26 v2.0
%%
%% Benoit Fraikin
%% Facult\'e des Sciences
%% Universite de Sherbrooke
%% Sherbrooke (Quebec), Canada
%% benoit.fraikin(at)usherbrooke.ca
%% ---------------------
%%
%% Copyright 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004
%% The LaTeX3 Project and any individual authors listed elsewhere
%% in this file.
%% 
%% --------------------------------------------------------------
%% 
%% It may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%    http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2003/12/01 or later.
%% 
%% This file has the LPPL maintenance status "maintained".
%% 
%% 
%% The list of derived (unpacked) files belonging to the distribution
%% and covered by LPPL is defined by the unpacking scripts (with
%% extension .ins) which are part of the distribution.
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
%%
%% TODO :  --> ajouter un systeme de commentaire
%%         --> ajouter des sections pour l'intro et la conclusion (commande {\Large \textbf{#1}} \vspace{.4cm})
%%         --> ajouter \graphicspath{{img/}{img_paper/}}
%%         --> regarder le package "import" pour l'ajouter et mieux classer le tout
%%

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{style/scienceUdeS}
              [2018/03/26 v2.0 document pour these et memoire de l'UdeS Faculte des Sciences (par Benoit Fraikin)]
\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@titlepage
\@titlepagetrue
\newif\if@openright
\newif\if@mainmatter \@mainmattertrue
\if@compatibility\else
\DeclareOption{a4paper}
   {\setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}}
\DeclareOption{letterpaper}
   {\setlength\paperheight {11in}%
    \setlength\paperwidth  {8.5in}}\fi
\if@compatibility
  \renewcommand\@ptsize{0}
\else
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\fi
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\if@compatibility\else
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\DeclareOption{simpleface}{\@twosidefalse \@mparswitchfalse}
\fi
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{rectoverso}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\if@compatibility\else
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\fi
\DeclareOption{titlepage}{\@titlepagetrue}
\if@compatibility\else
\DeclareOption{notitlepage}{\@titlepagefalse}
\fi
\if@compatibility
\@openrighttrue
\else
\DeclareOption{openright}{\@openrighttrue}
\DeclareOption{openany}{\@openrightfalse}
\fi
\if@compatibility\else
\DeclareOption{onecolumn}{\@twocolumnfalse}
\fi
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}%
}

\newif\if@hypertexte
\DeclareOption{hypertexte}{\@hypertextetrue}
\DeclareOption{sanshypertexte}{\@hypertextefalse}

\newif\if@charutf
\DeclareOption{caractereUtf}{\@charutftrue}
\DeclareOption{caractereLatin}{\@charutffalse}
%\newif\if@logopdflatex
%\DeclareOption{logopdflatex}{\@logopdflatextrue}
%\DeclareOption{logolatex}{\@logopdflatexfalse}

\newif\if@maitriseGL
\newif\if@these
\DeclareOption{maitrise}{\@maitriseGLfalse \@thesefalse}
\DeclareOption{maitriseGL}{\@maitriseGLtrue \@thesefalse}
\DeclareOption{these}{\@thesetrue \@maitriseGLfalse}
\DeclareOption{bibliothequeNationale}{\@hypertextefalse \@twosidefalse \@mparswitchfalse}


\newif\if@enredaction
\@enredactionfalse
\DeclareOption{enRedaction}{\@enredactiontrue}

\newif\if@listedesfigures
\@listedesfigurestrue
\DeclareOption{pasDeFigure}{\@listedesfiguresfalse}
\newif\if@listedestableaux
\@listedestableauxtrue
\DeclareOption{pasDeTableau}{\@listedestableauxfalse}
\newif\if@listedeslistings
\@listedeslistingstrue
\DeclareOption{pasDeListing}{\@listedeslistingsfalse}

\newif\if@packageNatbib
\@packageNatbibfalse
\DeclareOption{Natbib}{\@packageNatbibtrue}

% 12pt par d\'efaut sans hypertexte
\ExecuteOptions{letterpaper,12pt,twoside,onecolumn,final,openright,sanshypertexte,maitrise}
\ProcessOptions
\input{bk1\@ptsize.clo}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}
\if@twoside
  \def\ps@headings{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@evenhead{\thepage\hfil\slshape\leftmark}%
      \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
      \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markboth {{\normalfont\scshape%
        %\chaptername %
        \ifnum \c@secnumdepth >\m@ne
          \if@mainmatter
            \@chapapp\ \thechapter. \ %
          \fi
        \fi
        ##1}}{}}%
    \def\sectionmark##1{%
      \markright {{\normalfont\scshape%
        \ifnum \c@secnumdepth >\z@
          \thesection. \ %
        \fi
        ##1}}}}
\else
  \def\ps@headings{%
    \let\@oddfoot\@empty
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markright {{\scshape%
        \ifnum \c@secnumdepth >\m@ne
          \if@mainmatter
            \@chapapp\ \thechapter. \ %
          \fi
        \fi
        ##1}}}}
\fi
\def\ps@myheadings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\thepage\hfil\slshape\leftmark}%
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\@gobbletwo
    \let\chaptermark\@gobble
    \let\sectionmark\@gobble
    }
  \if@titlepage
  \newcommand\maketitle{\begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \null\vfil
  \vskip 60\p@
  \begin{center}%
    {\LARGE \@title \par}%
    \vskip 3em%
    {\large
     \lineskip .75em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
      \vskip 1.5em%
    {\large \@date \par}%       % Set date in \large size.
  \end{center}\par
  \@thanks
  \vfil\null
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\else
\newcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{plain}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\def\@maketitle{%
  \newpage
  \null
  \vskip 2em%
  \begin{center}%
  \let \footnote \thanks
    {\LARGE \@title \par}%
    \vskip 1.5em%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \vskip 1em%
    {\large \@date}%
  \end{center}%
  \par
  \vskip 1.5em}
\fi
\newcommand*\chaptermark[1]{}
\setcounter{secnumdepth}{2}
\newcounter {part}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand\thepart {\@Roman\c@part}
\renewcommand\thechapter {\@arabic\c@chapter}
\renewcommand\thesection {\thechapter.\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection .\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\@chapapp{\chaptername}
\newcommand\frontmatter{%
    \cleardoublepage
  \@mainmatterfalse
  \pagenumbering{roman}}
\newcommand\mainmatter{%
    \cleardoublepage
  \@mainmattertrue
  \pagenumbering{arabic}}
\newcommand\backmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \@mainmatterfalse}
\newcommand\part{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \thispagestyle{plain}%
  \if@twocolumn
    \onecolumn
    \@tempswatrue
  \else
    \@tempswafalse
  \fi
  \null\vfil
  \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    \markboth{}{}%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >-2\relax
       \huge\bfseries \partname\nobreakspace\thepart
       \par
       \vskip 20\p@
     \fi
     \Huge \bfseries #2\par}%
    \@endpart}
\def\@spart#1{%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \Huge \bfseries #1\par}%
    \@endpart}
\def\@endpart{\vfil\newpage
              \if@twoside
               \if@openright
                \null
                \thispagestyle{empty}%
                \newpage
               \fi
              \fi
              \if@tempswa
                \twocolumn
              \fi}
\newcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                   {\protect\numberline{\thechapter}#1}%
                       \else
                         \addcontentsline{toc}{chapter}{#1}%
                       \fi
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}
\def\@makechapterhead#1{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        \huge\bfseries \@chapapp\space \thechapter
        \par\nobreak
        \vskip 20\p@
      \fi
    \fi
    \interlinepenalty\@M
    \Huge \bfseries #1\par\nobreak
    \vskip 40\p@
  }}
\def\@schapter#1{\if@twocolumn
                   \@topnewpage[\@makeschapterhead{#1}]%
                 \else
                   \@makeschapterhead{#1}%
                   \@afterheading
                 \fi}
\def\@makeschapterhead#1{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \Huge \bfseries  #1\par\nobreak
    \vskip 40\p@
  }}
\newcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\normalfont\Large\bfseries}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\large\bfseries}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalfont\normalsize\bfseries}}
\if@twocolumn
  \setlength\leftmargini  {2em}
\else
  \setlength\leftmargini  {2.5em}
\fi
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\if@twocolumn
  \setlength\leftmarginv  {.5em}
  \setlength\leftmarginvi {.5em}
\else
  \setlength\leftmarginv  {1em}
  \setlength\leftmarginvi {1em}
\fi
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}
\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}
\if@compatibility
\newenvironment{titlepage}
    {%
      \cleardoublepage
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\z@
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
    }
\else
\newenvironment{titlepage}
    {%
      \cleardoublepage
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\@ne
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
     \if@twoside\else
        \setcounter{page}\@ne
     \fi
    }
\fi
\newcommand\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@Alph\c@chapter}
}
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\@addtoreset {equation}{chapter}
\renewcommand\theequation
  {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@equation}
\newcounter{figure}[chapter]
\renewcommand \thefigure
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
\newcounter{table}[chapter]
\renewcommand \thetable
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{2}
\newcommand\tableofcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\contentsname
        \@mkboth{%
           \normalfont\scshape\contentsname}{\normalfont\scshape\contentsname}}%
    \addcontentsline{toc}{chapter}{\contentsname}%
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    }
\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.25em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi}
\newcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
\newcommand*\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand*\l@subsection{\@dottedtocline{2}{3.8em}{3.2em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{12em}{6em}}
\newcommand\listoffigures{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listfigurename}%
      \@mkboth{\normalfont\scshape\listfigurename}%
              {\normalfont\scshape\listfigurename}%
    \addcontentsline{toc}{chapter}{\listfigurename}%
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    }
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\listoftables{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listtablename}%
      \@mkboth{\normalfont\scshape\listtablename}%
              {\normalfont\scshape\listtablename}%
    \addcontentsline{toc}{chapter}{\listtablename}%
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
    }
\let\l@table\l@figure
\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]
     {\chapter*{\bibname}%
      \@mkboth{\normalfont\scshape\bibname}{\normalfont\scshape\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
\newenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \twocolumn[\@makeschapterhead{\indexname}]%
                \@mkboth{\normalfont\scshape\indexname}%
                        {\normalfont\scshape\indexname}%
                \thispagestyle{plain}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \columnseprule \z@
                \columnsep 35\p@
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\@addtoreset{footnote}{chapter}
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}
% ======= Version originale
\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\bibname{Bibliography}
\newcommand\indexname{Index}
\newcommand\figurename{Figure}
\newcommand\tablename{Table}
\newcommand\partname{Part}
\newcommand\chaptername{Chapter}
\newcommand\appendixname{Appendix}
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
%
%===========================================
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\pagestyle{headings}
%\pagestyle{fancyplain}%
\pagenumbering{arabic}
\if@twoside
\else
  \raggedbottom
\fi
\if@twocolumn
  \twocolumn
  \sloppy
  \flushbottom
\else
  \onecolumn
\fi

% LES PACKAGES UTILES
\if@charutf
\usepackage[utf8x]{inputenc}
\else
\usepackage[latin1]{inputenc}
\fi
\usepackage[T1]{fontenc}
\usepackage{lmodern}
\usepackage{enumerate}
\usepackage{amsfonts, amsmath, amssymb, stmaryrd, latexsym}
\usepackage{xspace, setspace}
\usepackage{array}
\usepackage[dvipsnames,usenames]{color}
\usepackage[table]{xcolor}
\usepackage{wrapfig, epsfig}
\usepackage[english,frenchb]{babel}
\usepackage{frbibUdeS} % bibliography en francais
\usepackage{fancyhdr}
\usepackage{geometry}
\usepackage{ulem} % for sout and underline
\renewcommand{\emph}{\textit}

\usepackage[scaled=.90]{helvet} 
\usepackage{courier} 

\usepackage{listings}

\if@packageNatbib
  \usepackage[square,numbers]{natbib}
\fi

\if@hypertexte
  % Pour cr\'eer une version PDF contenant des liens color\'es
  \usepackage[pdftex, colorlinks, linkcolor=blue]{hyperref}
\else
  \usepackage[pdftex]{hyperref}
\fi

% LES DIMENSIONS DE LA PAGE
\setlength{\topmargin}{0pt}
\setlength{\footskip}{24pt}
\setlength{\headheight}{36pt}
\setlength{\headsep}{18pt}
\setlength{\textwidth}{6in}
\setlength{\textheight}{8in}
% -------------------------------------------------
\if@twoside
  \setlength{\oddsidemargin}{0.5in}
  \setlength{\evensidemargin}{0in}
\else
  \setlength{\oddsidemargin}{0.25in}
  \setlength{\evensidemargin}{0.25in}
\fi
% -------------------------------------------------

%\if@logopdflatex
%  \newcommand{\logoUDeS}{\includegraphics[width=2in]{logoudes.pdf}}
%\else
%  \newcommand{\logoUDeS}{\includegraphics[width=2in]{logoudes.eps}}
%\fi

\newcommand{\email}{\texttt}
\newenvironment{changemargin}[2]{%
    \begin{list}{}{%
      \setlength{\topsep}{0pt}%
      \setlength{\leftmargin}{0pt}%
      \setlength{\rightmargin}{0pt}%
      \setlength{\listparindent}{\parindent}%
      \setlength{\itemindent}{\parindent}%
      \setlength{\parsep}{0pt plus 1pt}%
      \addtolength{\leftmargin}{#1}%
      \addtolength{\rightmargin}{#2}%
    } \item \noindent %\vspace*{-1.5em} 
  }{%
    \end{list}%
  }%
  
  
\newcommand{\UDSAuteurDocument}{}
\newcommand{\UDSTitreDocument}{}
\newcommand{\auteur}[1]{\renewcommand{\UDSAuteurDocument}{#1}}
\newcommand{\titre}[1]{\renewcommand{\UDSTitreDocument}{\uppercase{#1}}}

\newcommand{\UDSDate}{\today}
\newcommand{\ChangerDate}[1]{\renewcommand{\UDSDate}{{#1}}}

\newcommand{\UDSMotsCles}{}
\newcommand{\MotsCles}[1]{\renewcommand{\UDSMotsCles}{\textbf{Mots-cl\'es}:~{#1}}}

\newcommand{\UDSchapitreSpecial}[1]{%
    \chapter*{#1}
    \addcontentsline{toc}{chapter}{#1}
    \@mkboth{\normalfont\scshape #1}%
            {\normalfont\scshape #1}%
}

\newcommand{\Introduction}{
    \UDSchapitreSpecial{Introduction}
}
\newcommand{\Conclusion}{
    \UDSchapitreSpecial{Conclusion}
}

%=================== COMMANDES POUR LA PAGE DE JURY 

\newcommand{\UDSDECISIONJURY}{}

\newcommand{\ARTICLEDOCUMENT}
{%
	\if@these
		la
	\else
		le
	\fi
}
\newcommand{\TYPEDOCUMENT}
{%
	\if@these
		th\`ese
	\else
		m\'emoire
	\fi
}

\newcommand{\DecisionDuJury}[2]
{%
\renewcommand{\UDSDECISIONJURY}{\parbox[c][\textheight][s]{.85\textwidth}%
{%
	\begin{center}
	Le #1 \\[1cm]
	
	\if@enredaction
		\if@these
			Th\`ese déposée
		\else
			M\'emoire déposé
		\fi 
		 par \UDSAuteurDocument{} \\[1cm]
	\else
		Le jury a accepté
		\if@these
			la th\`ese
		\else
			le m\'emoire
		\fi  
		de \UDSAuteurDocument{} dans sa version finale \\[1cm]
	\fi 

	\textbf{Membres du jury} \\[.5cm]
	{#2}
	\vfill
	\end{center}
}}%
} 

\newcommand{\Directeur}[2]{\MembreJury{Professeur}{#1}{Directeur}{#2}{}}
\newcommand{\Directrice}[2]{\MembreJury{Professeur}{#1}{Directrice}{#2}{}}
\newcommand{\Codirecteur}[2]{\MembreJury{Professeur}{#1}{Codirecteur}{#2}{}}
\newcommand{\Codirectrice}[2]{\MembreJury{Professeur}{#1}{Codirectrice}{#2}{}}
\newcommand{\MembreInterne}[2]{\MembreJury{Professeur}{#1}{Membre interne}{#2}{}}
\newcommand{\MembreExterne}[4]{\MembreJury{#1\\}{#2}{Membre externe}{#3}{#4}}
\newcommand{\President}[2]{\MembreJury{Professeur}{#1}{Pr\'esident-rapporteur}{#2}{}}
\newcommand{\Etudiant}[1]{Monsieur {#1}}
\newcommand{\Etudiante}[1]{Madame {#1}}

\newcommand{\MembreJury}[5]%
{%
	{{#1} {#2}}\\
	{#3}\\
	{Département {#4}}\\
    \@ifnotempty{#5}{%
    	{#5}\\
	}
	\ \\
}

%===================
  
\newcommand{\titleArticle}[1]{%
	\begin{singlespacing}%
	\begin{center}{\Large\bf #1}\end{center}%
	\end{singlespacing}%
}
\newcommand{\authorArticle}[1]{%
	\begin{singlespacing}%
	\begin{center}{#1}\end{center}%
	\end{singlespacing}%
}
\newcommand{\resumeArticle}[1]{%
		\begin{changemargin}{2em}{2em}%
		\begin{center}{\bf R\'esum\'e}\end{center}%
		\begin{changemargin}{2em}{2em}%
		{#1}%
		\end{changemargin}
		\end{changemargin}%
		}
\newcommand{\commentairesArticle}[1]{%
		\begin{changemargin}{2em}{2em}%
		\begin{center}{\bf Commentaires}\end{center}
		\begin{changemargin}{2em}{2em}%
		{#1}%
		\end{changemargin}
		\end{changemargin}%
		}
\newcommand{\keywordsArticle}[1]{\begin{changemargin}{2em}{2em}%
                                 \textbf{Keywords}: {#1}%
                                 \end{changemargin}
                                 }
\newenvironment{abstractArticle}{
    \begin{center}{\bf Abstract}\end{center}
    \begin{changemargin}{2em}{2em}
    }{
    \end{changemargin}
    }

% LA MISE EN PAGE
\fancyhf{} % efface le contenu de fancy header par d\'efaut
\renewcommand{\headrulewidth}{0 pt} % taille de la ligne de haut de page
%\renewcommand{\footrulewidth}{0 pt} % taille de la ligne de bas de page

\lhead[\fancyplain{}{}]                 {\fancyplain{}{\rightmark}}
\chead[\fancyplain{}{}]                 {\fancyplain{}{}}
\rhead[\fancyplain{}{\leftmark}]        {\fancyplain{}{}}
% Traitement en fonction de l'option twoside
% -------------------------------------------------
\if@twoside 
  % recto-verso
  \lfoot[\fancyplain{\thepage}{\thepage}] {\fancyplain{}{}}
  \cfoot[\fancyplain{}{}]                 {\fancyplain{}{}}
  \rfoot[\fancyplain{}{}]                 {\fancyplain{\thepage}{\thepage}}
\else 
  % simple face
  \lfoot[\fancyplain{}{}]                 {\fancyplain{}{}}
  \cfoot[\fancyplain{\thepage}{\thepage}] {\fancyplain{\thepage}{\thepage}}
  \rfoot[\fancyplain{}{}]                 {\fancyplain{}{}}
\fi
% -------------------------------------------------

\newcommand{\UDSSommaireThese}{}
\newcommand{\sommaire}[1]{\renewcommand{\UDSSommaireThese}{
	\UDSchapitreSpecial{Sommaire}%
    {#1}\\[2ex]%
    \UDSMotsCles{}%
    }%
}
\newcommand{\UDSRemerciementsThese}{}
\newcommand{\remerciements}[1]{\renewcommand{\UDSRemerciementsThese}{
	\UDSchapitreSpecial{Remerciements}%
    {#1}%
    }%
}
\newcommand{\UDSAbreviationsThese}{}
\newcommand{\abreviations}[1]{\renewcommand{\UDSAbreviationsThese}{
	\UDSchapitreSpecial{Abr\'eviations}%
    {#1}%
    }%
}

\newcommand{\modeFrancais}{
  \selectlanguage{frenchb}
    % Red\'eclaration : frenchb donne FIG. et TAB.
    \renewcommand\contentsname{Table des mati\`eres}
    \renewcommand\listfigurename{Liste des figures}
    \renewcommand\listtablename{Liste des tableaux}
    \renewcommand{\lstlistlistingname}{Liste des algorithmes}%
    \renewcommand\figurename{Figure}
    \renewcommand\tablename{Tableau}
    \renewcommand{\AMSautorefname}{\equationautorefname}
    \renewcommand{\Hfootnoteautorefname}{\footnoteautorefname}
    \renewcommand{\Itemautorefname}{\itemautorefname}
    \renewcommand{\itemautorefname}{\'el\'ement}
    \renewcommand{\equationautorefname}{\'equation}
    \renewcommand{\footnoteautorefname}{note}
    \renewcommand{\figureautorefname}{figure}
    \renewcommand{\tableautorefname}{tableau}
    \renewcommand{\partautorefname}{partie}
    \renewcommand{\appendixautorefname}{annexe}
    \renewcommand{\chapterautorefname}{chapitre}
    \renewcommand{\sectionautorefname}{section}
    \renewcommand{\subsectionautorefname}{sous-section}
    \renewcommand{\subsubsectionautorefname}{sous-section}
    \renewcommand{\paragraphautorefname}{paragraphe}
    \renewcommand{\subparagraphautorefname}{sous-paragraphe}
    \renewcommand{\FancyVerbLineautorefname}{ligne}
    \renewcommand{\theoremautorefname}{th\'eor\`eme} 
    \renewcommand{\lstlistingname}{algorithme}
}
\newcommand{\modeAnglais}{
  \selectlanguage{english}
    \renewcommand\figurename{Figure}
    \renewcommand\tablename{Table}
    \renewcommand{\AMSautorefname}{\equationautorefname}
    \renewcommand{\Hfootnoteautorefname}{\footnoteautorefname}
    \renewcommand{\Itemautorefname}{\itemautorefname}
    \renewcommand{\itemautorefname}{item}
    \renewcommand{\equationautorefname}{Equation}
    \renewcommand{\footnoteautorefname}{footnote}
    \renewcommand{\figureautorefname}{Figure}
    \renewcommand{\tableautorefname}{Table}
    \renewcommand{\partautorefname}{Part}
    \renewcommand{\appendixautorefname}{Appendix}
    \renewcommand{\chapterautorefname}{Chapter}
    \renewcommand{\sectionautorefname}{Section}
    \renewcommand{\subsectionautorefname}{Subsection}
    \renewcommand{\subsubsectionautorefname}{Subsubsection}
    \renewcommand{\paragraphautorefname}{Paragraph}
    \renewcommand{\subparagraphautorefname}{Subparagraph}
    \renewcommand{\FancyVerbLineautorefname}{line}
    \renewcommand{\theoremautorefname}{Theorem} 
    \renewcommand{\lstlistingname}{Listing}
}
\newcommand{\englishMode}{\modeAnglais}
\newcommand{\frenchMode}{\modeFrancais}

\newcommand{\enteteDeLaThese}{
    \frontmatter
	\pagestyle{empty} % N\'ecessaire pour emp\^echer l'apparition d'un num\'ero de page sur la page de pr\'esentation
   %
	%
	\onehalfspacing%
	\maketitle%
	%
	\cleardoublepage
	\UDSDECISIONJURY{}%
	%
	\pagestyle{fancyplain}%
	% 
 	% Sommaire
	% CONTENU DU SOMMAIRE
	\UDSSommaireThese{}%
	% FIN DU SOMMAIRE
	\cleardoublepage%
	%
	% Remerciements
	% CONTENU DES REMERCIEMENTS
	\UDSRemerciementsThese{}%
	% FIN DES REMERCIEMENTS
	\cleardoublepage%
	%
	% Abreviation
	% CONTENU DES REMERCIEMENTS
	\UDSAbreviationsThese{}%
	% FIN DES REMERCIEMENTS
	%
	% Listes diverses
	\setcounter{tocdepth}{2}%
	\tableofcontents%
	\if@listedesfigures
		\listoffigures%
	\else
	\fi
	\if@listedestableaux
		\listoftables%
	\else
	\fi
	\if@listedeslistings
		\lstlistoflistings%
	\else
	\fi
	%
	\mainmatter
}
%
\newcommand{\enteteDuMemoire}{\enteteDeLaThese}

%%%% debut macro pour la suppression de l'entête au début des paragraphes %%%%
%\makeatletter
%\renewcommand\section{\@startsection {section}{1}{\z@}%
%                           {-3.5ex \@plus -1ex \@minus -.2ex}%
%%%%%%                      ^^^^ (4eme parametre)
%                           {2.3ex \@plus.2ex}%
%                           {\normalfont\Large\bfseries}}
%\makeatother
%%%% fin macro %%%%

\title{  \vspace*{-3ex}
         {\bf\large \UDSTitreDocument{} \vspace*{1ex}}
         }
\author{ par\\[8ex]
         \UDSAuteurDocument{}\vspace*{6ex}
         }
\date{   \if@these
         Th\`ese pr\'esent\'ee au D\'epartement d'informatique\\
         \else
         M\'emoire pr\'esent\'e au D\'epartement d'informatique\\ 
         \fi
         \if@these
         en vue de l'obtention du grade de philosophi\ae{} doctor (Ph.D.)\\[8ex]
         \else
         \if@maitriseGL
         en vue de l'obtention du grade de ma\^itre \`es sciences (M.Sc.)\\[8ex]
         \else
         en vue de l'obtention du grade de ma\^itre \`es sciences (M.Sc.)\\[8ex]
         \fi
         \fi
         FACULT\'E DES SCIENCES \\[2ex]
         UNIVERSIT\'E DE SHERBROOKE \\[2ex]
         Sherbrooke, Qu\'ebec, Canada, \UDSDate
         }

\endinput

%%
%% End of file `scienceUdeS.cls'.
