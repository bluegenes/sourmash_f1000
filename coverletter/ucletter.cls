%% UCLETTER DOCUMENT STYLE -- LETTER STANDARD DOCUMENT STYLE
%% -- Released 2 February 99 -- for LaTeX2e
%%
%% Copyright 1993 1994 1995 1996 1997 1998 1999
%% The LaTeX3 Project and any individual authors listed elsewhere
%% in this file.
%%
%% Modified:
%%		Marcelino Enriquez (mars@cs.berkeley.edu) September 2000
%%
%%
%% The `ucletter' style is intended for business letters produced at the 
%% University of California, Berkeley.  It produces output that includes
%% a facsimile of the standard UC letterhead (including the UC seal).  It
%% is based on the standard LaTeX `letter' style and supports most of that
%% style's features plus some additional ones.
%% 
%% The version of the `ucletter' style that you are looking at now is a
%% major revision of the original.  It primarily differs in being based
%% on the 1998 version of the `letter' style.  In addition, it fixes a
%% few annoying features of the first version.
%% 
%% Here is a brief description of the commands that are special to the
%% `ucletter' style.  Most are the same as with the `letter' style.
%% Differences are noted in the descriptions.
%% 
%% Sender information
%% ==================
%% 
%% The following commands are used to define who is sending the letter.
%% They should appear after the \begin{document} line, but before the
%% first \begin{letter} line.  They are printed out together below the
%% letterhead after a line saying ``Please Reply To:''.  However, they
%% are only printed if \address is defined.  All four commands are
%% optional.
%% 
%% \name -- Declares the sender's name
%% \address -- Declares the sender's address
%% \telephone -- Declares the sender's phone number
%% \login -- Declares the sender's electronic mail address
%% 
%% Recipient information
%% =====================
%% 
%% The name and address of the recipient are given as an argument to the
%% \begin{letter} environment.  For example,
%% 
%% 	\begin{letter}{Mickey Mouse\\Disneyland}
%% 
%% The greeting is defined using the \opening command, as in
%% 
%% 	\opening{Dear Mickey,}
%% 
%% The name and address are optional.  They appear on the left margin
%% below the sender information and the date (which is indented to the
%% middle of the page).
%% 
%% Body of the letter
%% ==================
%% 
%% The body of the letter should follow the \opening command and can
%% consist of most LaTeX commands (e.g. normal text, itemized lists,
%% mathematics).
%% 
%% Closing Information
%% ===================
%% 
%% There are four commands intended to be used at the end of the letter.
%% These commands put out their material wherever they are invoked
%% (unlike the sender information).
%% 
%% \closing -- is used to print out the formal closing and the sender's name
%%       (if given).  For instance, \closing{Sincerely,} is a common use.
%% \cc -- puts out the text `cc:' and the list of names given in its
%%       argument.  For instance, \cc{Minnie \\ Walt}.
%% \encl -- puts out the text `Encl.'.  Unlike the standard letter style,
%%       this command does not take an argument.
%% \annotations -- puts out the text of its argument.  It is intended for
%%       traditional secretarial annotations.

%% If you are trying to understand how the code differs from that of
%% standard letter style, you should know that all modifications are
%% accompanied by comments beginning with 2 percent marks (i.e. "%%").

\NeedsTeXFormat{LaTeX2e}[1996/06/01]
\ProvidesClass{ucletter}
              [2000/11/15 v1.3.2
               UC Berkeley Document Class `ucletter', based on `letter']

\usepackage{graphicx}
               
\newcommand\@ptsize{}
\DeclareOption{a4paper}
   {\setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}}
\DeclareOption{a5paper}
   {\setlength\paperheight {210mm}%
    \setlength\paperwidth  {148mm}}
\DeclareOption{b5paper}
   {\setlength\paperheight {250mm}%
    \setlength\paperwidth  {176mm}}
\DeclareOption{letterpaper}
   {\setlength\paperheight {11in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{legalpaper}
   {\setlength\paperheight {14in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{executivepaper}
   {\setlength\paperheight {10.5in}%
    \setlength\paperwidth  {7.25in}}
\DeclareOption{landscape}
   {\setlength\@tempdima   {\paperheight}%
    \setlength\paperheight {\paperwidth}%
    \setlength\paperwidth  {\@tempdima}}
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\if@compatibility
  \DeclareOption{twoside}{\@latexerr{No `twoside' layout for letters}%
                                   \@eha}
\else
  \DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\fi

\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\ExecuteOptions{letterpaper,10pt,oneside,onecolumn,final}
\ProcessOptions
\input{size1\@ptsize.clo}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0.7em}
\setlength\parindent{0\p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setlength\headheight{12\p@}
\setlength\headsep   {45\p@}
\setlength\footskip{25\p@}
\if@compatibility
  \setlength\textwidth{365\p@}
  \setlength\textheight{505\p@}
\fi
\if@compatibility
  \setlength\oddsidemargin{53pt}
  \setlength\evensidemargin{53pt}
  \setlength\marginparwidth{90pt}
\else
  \setlength\@tempdima{\paperwidth}
  \addtolength\@tempdima{-2in}
  \addtolength\@tempdima{-\textwidth}
  \setlength\oddsidemargin   {.5\@tempdima}
  \setlength\evensidemargin  {\oddsidemargin}
  \setlength\marginparwidth  {90\p@}
\fi
\setlength\marginparsep {11\p@}
\setlength\marginparpush{5\p@}
\setlength\topmargin{27pt}
\setlength\footnotesep{12\p@}
\setlength{\skip\footins}{10\p@ \@plus 2\p@ \@minus 4\p@}
\if@twoside
  \def\ps@headings{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@oddhead{\slshape\headtoname{} \ignorespaces\toname
                    \hfil \@date
                    \hfil \pagename{} \thepage}%
      \let\@evenhead\@oddhead}
\else
  \def\ps@headings{%
      \let\@oddfoot\@empty
      \def\@oddhead{\slshape\headtoname{} \ignorespaces\toname
                    \hfil \@date
                    \hfil \pagename{} \thepage}}
\fi
\def\ps@empty{%
      \let\@oddfoot\@empty\let\@oddhead\@empty
      \let\@evenfoot\@empty\let\@evenhead\@empty}
\def\ps@firstpage{%
     \let\@oddhead\@empty
     \def\@oddfoot{\raisebox{-45\p@}[\z@]{%
        \hb@xt@\textwidth{\hspace*{100\p@}%
          \ifcase \@ptsize\relax
             \normalsize
          \or
             \small
          \or
             \footnotesize
          \fi
        \fromlocation \hfill \telephonenum}}\hss}}
\def\ps@plain{%
      \let\@oddhead\@empty
      \def\@oddfoot{\normalfont\hfil\thepage\hfil}%
      \def\@evenfoot{\normalfont\hfil\thepage\hfil}}
\newcommand*{\name}[1]{\def\fromname{#1}}
\newcommand*{\signature}[1]{\def\fromsig{#1}}
\newcommand*{\address}[1]{\def\fromaddress{#1}}
\newcommand*{\location}[1]{\def\fromlocation{#1}}
\newcommand*{\telephone}[1]{\def\telephonenum{#1}}
\name{}
\signature{}
\address{}
\location{}
\telephone{}
\newcommand*{\makelabels}{%
  \AtBeginDocument{%
     \let\@startlabels\startlabels
     \let\@mlabel\mlabel
     \if@filesw
       \immediate\write\@mainaux{\string\@startlabels}\fi}%
  \AtEndDocument{%
     \if@filesw\immediate\write\@mainaux{\string\clearpage}\fi}}
\@onlypreamble\makelabels
\newenvironment{letter}[1]
  {\newpage
    \if@twoside \ifodd\c@page
                \else\thispagestyle{empty}\null\newpage\fi
    \fi
    \c@page\@ne
    \c@footnote\@ne
    \interlinepenalty=200 % smaller than the TeXbook value
    \@processto{\leavevmode\ignorespaces #1}}
  {\stopletter\@@par\pagebreak\@@par
    \if@filesw
      \begingroup
        \let\\=\relax
        \let\protect\@unexpandable@protect
        \immediate\write\@auxout{%
          \string\@mlabel{\returnaddress}{\toname\\\toaddress}}%
      \endgroup
    \fi}
\long\def\@processto#1{%
  \@xproc #1\\@@@%
  \ifx\toaddress\@empty
  \else
    \@yproc #1@@@%
  \fi}
\long\def\@xproc #1\\#2@@@{\def\toname{#1}\def\toaddress{#2}}
\long\def\@yproc #1\\#2@@@{\def\toaddress{#2}}
\newcommand*{\stopbreaks}{%
  \interlinepenalty\@M
  \def\par{\@@par\nobreak}%
  \let\\\@nobreakcr
  \let\vspace\@nobreakvspace}
\DeclareRobustCommand\@nobreakvspace
   {\@ifstar\@nobreakvspacex\@nobreakvspacex}
\def\@nobreakvspacex#1{%
  \ifvmode
    \nobreak\vskip #1\relax
  \else
    \@bsphack\vadjust{\nobreak\vskip #1}\@esphack
  \fi}
\def\@nobreakcr{\@ifstar{\@normalcr*}{\@normalcr*}}
\newcommand*{\startbreaks}{%
  \let\\\@normalcr
  \interlinepenalty 200%
  \def\par{\@@par\penalty 200\relax}}
\newdimen\longindentation
\longindentation=.5\textwidth
\newdimen\indentedwidth
\indentedwidth=\textwidth
\advance\indentedwidth -\longindentation
\newcommand*{\opening}[1]{\ifx\@empty\fromaddress
  \thispagestyle{firstpage}%
    {\raggedleft\@date\par}%
  \else  % home address
    \thispagestyle{empty}%
    {\raggedleft\begin{tabular}{l@{}}\ignorespaces
      \fromaddress \\*[2\parskip]%
      \@date \end{tabular}\par}%
  \fi
  \vspace{2\parskip}%
  {\raggedright \toname \\ \toaddress \par}%
  \vspace{2\parskip}%
  #1\par\nobreak}
\newcommand{\closing}[1]{\par\nobreak\vspace{\parskip}%
  \stopbreaks
  \noindent
  \ifx\@empty\fromaddress\else
  \hspace*{\longindentation}\fi
  \parbox{\indentedwidth}{\raggedright
       \ignorespaces #1\\[6\medskipamount]%
       \ifx\@empty\fromsig
           \fromname
       \else \fromsig \fi\strut}%
   \par}
\medskipamount=\parskip
\newcommand*{\cc}[1]{%
  \par\noindent
  \parbox[t]{\textwidth}{%
    \@hangfrom{\normalfont\ccname: }%
    \ignorespaces #1\strut}\par}
\newcommand*{\encl}[1]{%
  \par\noindent
  \parbox[t]{\textwidth}{%
    \@hangfrom{\normalfont\enclname: }%
    \ignorespaces #1\strut}\par}
\newcommand*{\ps}{\par\startbreaks}
\newcommand*{\stopletter}{}
\newcommand*{\returnaddress}{}
\newcount\labelcount
\newcommand*{\startlabels}{\labelcount\z@
  \pagestyle{empty}%
  \let\@texttop\relax
  \topmargin -50\p@
  \headsep \z@
  \oddsidemargin -35\p@
  \evensidemargin -35\p@
  \textheight 10in
  \@colht\textheight  \@colroom\textheight \vsize\textheight
  \textwidth 550\p@
  \columnsep 26\p@
  \ifcase \@ptsize\relax
    \normalsize
  \or
    \small
  \or
    \footnotesize
  \fi
  \baselineskip \z@
  \lineskip \z@
  \boxmaxdepth \z@
  \parindent \z@
  \twocolumn\relax}
\let\@startlabels=\relax
\newcommand*{\mlabel}[2]{%
  \parbox[b][2in][c]{262\p@}{\strut\ignorespaces #2}%
  }
\let\@mlabel=\@gobbletwo
\setlength\leftmargini  {2.5em}
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\setlength\leftmarginv  {1em}
\setlength\leftmarginvi {1em}
\setlength\leftmargin    {\leftmargini}
\setlength  \labelsep  {5\p@}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\setlength\partopsep{0\p@}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\def\@listI{\setlength\leftmargin{\leftmargini}%
            \setlength\parsep {0\p@}%
            \setlength\topsep {.4em}%
            \setlength\itemsep{.4em}}
\let\@listi\@listI
\@listi
\def\@listii {\setlength  \leftmargin{\leftmarginii}%
              \setlength  \labelwidth{\leftmarginii}%
              \addtolength\labelwidth{-\labelsep}}
\def\@listiii{\setlength  \leftmargin{\leftmarginiii}%
              \setlength  \labelwidth{\leftmarginiii}%
              \addtolength\labelwidth{-\labelsep}%
              \setlength  \topsep    {.2em}%
              \setlength  \itemsep   {\topsep}}
\def\@listiv {\setlength  \leftmargin{\leftmarginiv}%
              \setlength  \labelwidth{\leftmarginiv}%
              \addtolength\labelwidth{-\labelsep}}
\def\@listv  {\setlength  \leftmargin{\leftmarginv}%
              \setlength  \labelwidth{\leftmarginv}%
              \addtolength\labelwidth{-\labelsep}}
\def\@listvi {\setlength  \leftmargin{\leftmarginvi}%
              \setlength  \labelwidth{\leftmarginvi}%
              \addtolength\labelwidth{-\labelsep}}

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

\newcommand*{\descriptionlabel}[1]{\hspace\labelsep
                                \normalfont\bfseries #1}

\newenvironment{verse}
               {\let\\=\@centercr
                \list{}{\setlength\itemsep{\z@}%
                        \setlength\itemindent{-15\p@}%
                        \setlength\listparindent{\itemindent}%
                        \setlength\rightmargin{\leftmargin}%
                        \addtolength\leftmargin{15\p@}}%
                \item[]}
               {\endlist}

\newenvironment{quotation}
               {\list{}{\setlength\listparindent{1.5em}%
                        \setlength\itemindent{\listparindent}%
                        \setlength\rightmargin{\leftmargin}}%
                \item[]}
               {\endlist}

\newenvironment{quote}
               {\list{}{\setlength\rightmargin{\leftmargin}}%
                \item[]}
               {\endlist}

\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\renewcommand\theequation{\@arabic\c@equation}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\relax}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\relax}
\DeclareRobustCommand*{\cal}{\@fontswitch{\relax}{\mathcal}}
\DeclareRobustCommand*{\mit}{\@fontswitch{\relax}{\mathnormal}}
\renewcommand\footnoterule{%
  \kern-\p@
  \hrule \@width .4\columnwidth
  \kern .6\p@}
\long\def\@makefntext#1{%
    \noindent
    \hangindent 5\p@
    \hb@xt@5\p@{\hss\@makefnmark}#1}
\newcommand*{\ccname}{cc}
\newcommand*{\enclname}{encl}
\newcommand*{\pagename}{Page}
\newcommand*{\headtoname}{To}
\newcommand*{\today}{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\pagestyle{plain}
\pagenumbering{arabic}
\raggedbottom
\def\@texttop{\ifnum\c@page=1\vskip \z@ plus.00006fil\relax\fi}
\onecolumn
%%\endinput
%%
%% End of file `ucletter.cls'.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% OLD stuff below %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%\def\@ptsize{0}
%%\@namedef{ds@11pt}{\def\@ptsize{1}}
%%\@namedef{ds@12pt}{\def\@ptsize{2}}

%%\@twosidefalse

\def\ds@draft{\overfullrule 5\p@}

%%\@options

%%\def\baselinestretch{1}

%%\ifcase \@ptsize\relax

%%\def\normalsize{\@setsize\normalsize{12pt}\xpt\@xpt
%%\abovedisplayskip 10\p@ plus2\p@ minus5\p@
%%\belowdisplayskip \abovedisplayskip
%%\abovedisplayshortskip  \z@ plus3\p@
%%\belowdisplayshortskip  6\p@ plus3\p@ minus3\p@
%%\let\@listi\@listI}

%%\def\small{\@setsize\small{11pt}\ixpt\@ixpt
%%\abovedisplayskip 8.5\p@ plus3\p@ minus4\p@
%%\belowdisplayskip \abovedisplayskip
%%\abovedisplayshortskip \z@ plus2\p@
%%\belowdisplayshortskip 4\p@ plus2\p@ minus2\p@
%%\def\@listi{\leftmargin\leftmargini
%%\topsep 4\p@ plus2\p@ minus2\p@\parsep 2\p@ plus\p@ minus\p@
%%\itemsep \parsep}}

%%\def\footnotesize{\@setsize\footnotesize{9.5pt}\viiipt\@viiipt
%%\abovedisplayskip 6\p@ plus2\p@ minus4\p@
%%\belowdisplayskip \abovedisplayskip
%%\abovedisplayshortskip \z@ plus\p@
%%\belowdisplayshortskip 3\p@ plus\p@ minus2\p@
%%\def\@listi{\leftmargin\leftmargini
%%\topsep 3\p@ plus\p@ minus\p@\parsep 2\p@ plus\p@ minus\p@
%%\itemsep \parsep}}

%%\def\scriptsize{\@setsize\scriptsize{8pt}\viipt\@viipt}
%%\def\tiny{\@setsize\tiny{6pt}\vpt\@vpt}
%%\def\large{\@setsize\large{14pt}\xiipt\@xiipt}
%%\def\Large{\@setsize\Large{18pt}\xivpt\@xivpt}
%%\def\LARGE{\@setsize\LARGE{22pt}\xviipt\@xviipt}
%%\def\huge{\@setsize\huge{25pt}\xxpt\@xxpt}
%%\def\Huge{\@setsize\Huge{30pt}\xxvpt\@xxvpt}

%%\or

%%\def\@normalsize{\@setsize\normalsize{13.6pt}\xipt\@xipt
%%\abovedisplayskip 11\p@ plus3\p@ minus6\p@
%%\belowdisplayskip \abovedisplayskip
%%\abovedisplayshortskip  \z@ plus3\p@
%%\belowdisplayshortskip  6.5\p@ plus3.5\p@ minus3\p@
%%\let\@listi\@listI}

%%\def\small{\@setsize\small{12pt}\xpt\@xpt
%%\abovedisplayskip 10\p@ plus2\p@ minus5\p@
%%\belowdisplayskip \abovedisplayskip
%%\abovedisplayshortskip  \z@ plus3\p@
%%\belowdisplayshortskip  6\p@ plus3\p@ minus3\p@
%%\def\@listi{\leftmargin\leftmargini
%%\topsep 6\p@ plus2\p@ minus2\p@\parsep 3\p@ plus2\p@ minus\p@
%%\itemsep \parsep}}

%%\def\footnotesize{\@setsize\footnotesize{11pt}\ixpt\@ixpt
%%\abovedisplayskip 8\p@ plus2\p@ minus4\p@
%%\belowdisplayskip \abovedisplayskip
%%\abovedisplayshortskip \z@ plus\p@
%%\belowdisplayshortskip 4\p@ plus2\p@ minus2\p@
%%\def\@listi{\leftmargin\leftmargini
%%\topsep 4\p@ plus2\p@ minus2\p@\parsep 2\p@ plus\p@ minus\p@
%%\itemsep \parsep}}

%%\def\scriptsize{\@setsize\scriptsize{9.5pt}\viiipt\@viiipt}
%%\def\tiny{\@setsize\tiny{7pt}\vipt\@vipt}
%%\def\large{\@setsize\large{14pt}\xiipt\@xiipt}
%%\def\Large{\@setsize\Large{18pt}\xivpt\@xivpt}
%%\def\LARGE{\@setsize\LARGE{22pt}\xviipt\@xviipt}
%%\def\huge{\@setsize\huge{25pt}\xxpt\@xxpt}
%%\def\Huge{\@setsize\Huge{30pt}\xxvpt\@xxvpt}

%%\or

%%\def\@normalsize{\@setsize\normalsize{15pt}\xiipt\@xiipt
%%\abovedisplayskip 12\p@ plus3\p@ minus7\p@
%%\belowdisplayskip \abovedisplayskip
%%\abovedisplayshortskip  \z@ plus3\p@
%%\belowdisplayshortskip  6.5\p@ plus3.5\p@ minus3\p@
%%\let\@listi\@listI}

%%\def\small{\@setsize\small{13.6pt}\xipt\@xipt
%%\abovedisplayskip 11\p@ plus3\p@ minus6\p@
%%\belowdisplayskip \abovedisplayskip
%%\abovedisplayshortskip  \z@ plus3\p@
%%\belowdisplayshortskip  6.5\p@ plus3.5\p@ minus3\p@
%%\def\@listi{\leftmargin\leftmargini
%%\parsep 4.5\p@ plus2\p@ minus\p@
%%            \itemsep \parsep
%%            \topsep 9\p@ plus3\p@ minus5\p@}}

%%\def\footnotesize{\@setsize\footnotesize{12pt}\xpt\@xpt
%%\abovedisplayskip 10\p@ plus2\p@ minus5\p@
%%\belowdisplayskip \abovedisplayskip
%%\abovedisplayshortskip  \z@ plus3\p@
%%\belowdisplayshortskip  6\p@ plus3\p@ minus3\p@
%%\def\@listi{\leftmargin\leftmargini
%%\topsep 6\p@ plus2\p@ minus2\p@\parsep 3\p@ plus2\p@ minus\p@
%%\itemsep \parsep}}

%%\def\scriptsize{\@setsize\scriptsize{9.5pt}\viiipt\@viiipt}
%%\def\tiny{\@setsize\tiny{7pt}\vipt\@vipt}
%%\def\large{\@setsize\large{18pt}\xivpt\@xivpt}
%%\def\Large{\@setsize\Large{22pt}\xviipt\@xviipt}
%%\def\LARGE{\@setsize\LARGE{25pt}\xxpt\@xxpt}
%%\def\huge{\@setsize\huge{30pt}\xxvpt\@xxvpt}
%%\let\Huge=\huge
%%\fi

\normalsize

%%
%% Text area is widened by changing \oddsidemargin, \evensidemargin and
%%    \marginparwidth
%% Original modification to letter
%%
\oddsidemargin   -.3in
\evensidemargin  -.3in
\marginparwidth  90pt
\marginparsep    11pt

\marginparpush 5pt

%% Space for letterhead is made by changing \topmargin, \headsep,
%%    and \footskip, allowing \textheight to be increased
%%\footheight 12pt

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\topmargin -10pt

%\headheight 12pt
%\headsep 25pt

%\footskip 15pt

\textheight 575pt

\textwidth 500pt

\columnsep 10pt
\columnseprule 0pt

%\raggedbottom

%\footnotesep 12pt

%\skip\footins 10pt plus 2pt minus 4pt

%\floatsep 12pt plus 2pt minus 2pt
%\textfloatsep  20pt plus 2pt minus 4pt
%\intextsep 12pt plus 2pt minus 2pt
%\dblfloatsep 12pt plus 2pt minus 2pt
%\dbltextfloatsep 20pt plus 2pt minus 4pt
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%\@maxsep 20pt
%%\@dblmaxsep 20pt

\@fptop 0pt plus 1fil
\@fpsep 8pt plus 2fil
\@fpbot 0pt plus 1fil
\@dblfptop 0pt plus 1fil
\@dblfpsep 8pt plus 2fil
\@dblfpbot 0pt plus 1fil

\newdimen\longindentation
\longindentation=.5\textwidth
\newdimen\indentedwidth
\indentedwidth=\textwidth
\advance\indentedwidth -\longindentation

\def\opening#1{\ifx\@empty\fromaddress
  \thispagestyle{firstpage}%
    {\vspace*{4pt}\hskip4.2truein\@date\par}%
  \else
    \thispagestyle{empty}%
    %% Force return address to be in small type (\footnotesize)
    %% and move return address to left margin
    {\font\this=cmr8 at 8truept \baselineskip=8pt
    {\this
     \raggedright\ignorespaces 
     \fromname \\
     \fromaddress
     \ifx\@empty\telephonenum\else
       \\ \telephonenum 
     \fi
     \ifx\@empty\loginname\else
       \\ \hskip0pt \\ \loginname 
     \fi
     \\*[2\parskip]}
     \hskip4.2truein\@date\par}
%%    This is the original code for the \else case of the \opening
%%    {\raggedleft\begin{tabular}{l}\ignorespaces
%%      \footnotesize \fromaddress \normalsize \\*[2\parskip]%
%%      \@date \end{tabular}\par}%
  \fi
  \vspace{2\parskip}%
  %% The output of \toname and \toaddress is put inside an \ifx
  %% wrapper in order to allow ``To Whom It May Concern'' letters
  %% which have no addressee.
  \ifx\@empty\toname
  \else
  {\raggedright \toname \\ \toaddress \par}%
  \vspace{2\parskip}%
  \fi
  #1\par\nobreak}

%% 2 \parskip of space before closing, instead of 1.
\long\def\closing#1{\par\nobreak\vspace{2\parskip}%
  \stopbreaks
  \noindent
  \hspace*{\longindentation}%
  \parbox{\indentedwidth}{\raggedright
       \ignorespaces #1\\[6\medskipamount]%% changed 20 Jan 88
       \ifx\@empty\fromsig
           \fromname
       \else \fromsig \fi\strut}%
   \par}

%%
%% Added \annotations macro
%%
\def\annotations#1{\par\noindent
\parbox[1]{\textwidth}{\ignorespaces #1\strut}\par}

%%
%% Berkeley format doesn't use args. to \encl
%%
\def\encl{\par\noindent{\rm \enclname}\par}

\def\mlabel#1#2{\setbox0\vbox{\parbox[b]{3.6in}{\strut\ignorespaces #1}}
 \setbox1\vbox{\parbox[b]{3.6in}{\strut\ignorespaces #2}}
 \vbox to 2in{\vss \box0 \vss}
 \vbox to 2in{\vss \box1 \vss}}

\long\def\letter#1{\newpage
  \c@page\@ne
  \interlinepenalty=200
  \@processto{\leavevmode\ignorespaces #1}}

\def\endletter{\stopletter\@@par\pagebreak\@@par
  \if@filesw
    \begingroup
      \let\\=\relax
      \def\protect##1{\string##1\space}%
        \immediate\write\@auxout{\string\mlabel{\fromname \\\fromaddress}%
					       {\toname \\\toaddress}}%
    \endgroup
  \fi}

%\long\def\@processto#1{\@xproc #1\\@@@\ifx\toaddress\@empty
%    \else \@yproc #1@@@\fi}
%\long\def\@xproc #1\\#2@@@{\def\toname{#1}\def\toaddress{#2}}
%\long\def\@yproc #1\\#2@@@{\def\toaddress{#2}}

%%\def\stopbreaks{\interlinepenalty \@M
%%   \def\par{\@@par\nobreak}\let\\=\@nobreakcr
%%   \let\vspace\@nobreakvspace}

\def\@nobreakvspace{\@ifstar{\@nobreakvspacex}{\@nobreakvspacex}}

%%\def\@nobreakvspacex#1{\ifvmode\nobreak\vskip #1\relax\else
%%               \@bsphack\vadjust{\nobreak\vskip #1}\@esphack\fi}

%%\def\@nobreakcr{\vadjust{\penalty\@M}\@ifstar{\@xnewline}{\@xnewline}}

%%\def\startbreaks{\let\\=\@normalcr
%%   \interlinepenalty 200\def\par{\@@par\penalty 200\relax}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Include login for Berkeley letter return address
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand*{\login}[1]{\def\loginname{#1}}
\def\loginname{}

%\def\document{\endgroup
%  \@colht\textheight  \@colroom\textheight \vsize\textheight
%   \columnwidth\textwidth \@clubpenalty\clubpenalty
%   \if@twocolumn \advance\columnwidth -\columnsep
%      \divide\columnwidth\tw@ \hsize\columnwidth \@firstcolumntrue
%   \fi
%  \hsize\columnwidth \linewidth\hsize
%  \begingroup\@floatplacement\@dblfloatplacement\endgroup
%  \if@filesw \immediate\openout\@mainaux=\jobname.aux
%   \immediate\write\@mainaux
%    {\string\startlabels\string\@startlabels}\fi
%  \csname process@table\endcsname
%  \let\glb@currsize\@empty
%  \def\do##1{\let ##1\@notprerr}%
%  \@preamblecmds
%  \let\do\noexpand
%  \@normalsize\everypar{}\@noskipsecfalse}

%\def\enddocument{\@checkend{document}\newpage\begingroup
%\if@filesw \immediate\closeout\@mainaux
%\makeatletter\input \jobname.aux\clearpage
%\fi\endgroup\deadcycles\z@\@@end}

%\def\makelabels{\@fileswtrue}

%\def\@startlabels{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Defn's for the UC letterhead
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%	Our font choices
%%
%\font\uc=uc at 54truept
\font\five=cmr5 at 5truept
\font\six=cmr6 at 6truept
\font\smallheadfont=cmr8 at 8truept

%

\def\univletterhead{
\font\reg=cmr10 at 10truept
\font\topfont=cmr10 at 12truept
 \par\noindent
 \vskip -1.6truein
 \hbox{\topfont UNIVERSITY OF CALIFORNIA, DAVIS}
 \vskip 10truept
 \five
 \baselineskip 7truept
 %
% \setbox11=\hbox{\uc C}
% \setbox11=\hbox{\includegraphics[width=54truept]{ucbseal_line_k}}
  %\setbox11=\hbox{\includegraphics[width=54truept]{ucbseal_line_k}}
  \setbox11=\hbox{\includegraphics[width=54truept]{ucdseal_bw}} 
  \setbox10=\hbox{\vbox{\hrule width 4.75 truein height 0.2truept
  \vskip 6truept
  \hbox to 4.75truein {BERKELEY \kern-1truept\lower1truept\hbox{$\cdot$}
	DAVIS \kern-1truept\lower1truept\hbox{$\cdot$}
	IRVINE \kern-1truept\lower1truept\hbox{$\cdot$}
	LOS ANGELES \kern-1truept\lower1truept\hbox{$\cdot$}
	MERCED \kern-1truept\lower1truept\hbox{$\cdot$}
	RIVERSIDE \kern-1truept\lower1truept\hbox{$\cdot$}
	SAN DIEGO \kern-1truept\lower1truept\hbox{$\cdot$}
	SAN FRANCISCO\hfil}
  \vskip 6truept
  \hrule height0.2truept
 }}
 %
 \setbox12=\hbox{\vbox{\hrule width 1.75truein height0.2truept
  \vskip 6truept
  \hbox{\hskip 8truept SANTA BARBARA \kern-1truept\lower1truept\hbox{$\cdot$} SANTA CRUZ}
  \vskip 6truept
  \hrule width 1.75truein height0.2truept
 }}
 %
 \par\noindent
 \hfuzz30pt
 \hbox{\box10\lower18truept\box11\box12}
 \par\noindent
 \vskip 4truept
 \hbox{{\six 
    \ifx\@empty\fromaddress
      \hskip 4.1truein
    \else
      Please Reply To:\hskip 3.6truein 
    \fi 
      DAVIS, CALIFORNIA 95616}}
 \par\noindent
 } 
\vfuzz50pt

%%
%% End of letterhead defn's
%%

%% \@texttop modified to output letterhead
%% \def\@texttop{\ifnum\c@page=1\vskip \z@ plus.00006fil\relax\fi}

\def\@texttop{\ifnum\c@page=1\vskip 50pt \univletterhead \relax\fi}

%\def\ps@headings{\def\@oddhead{\sl \headtoname{} \ignorespaces\toname
%    \hfil \@date
%    \hfil \pagename{} \thepage}\def\@oddfoot{}}

%\def\ps@empty{\def\@oddhead{}\def\@oddfoot{}%
%\def\@evenhead{}\def\@evenfoot{}}

%\def\ps@firstpage{\def\@oddhead{}\def\@oddfoot{\raisebox
%   {-45\p@}[\z@]{\hbox to \textwidth{\hspace*{100\p@}%
%    \ifcase \@ptsize\relax
%      \normalsize
%    \or
%      \small
%    \or
%      \footnotesize
%    \fi
%    \fromlocation \hfill \telephonenum}}\hss}%
%  \def\@evenhead{}\def\@evenfoot{}}

%\def\ps@plain{\def\@oddhead{}\def\@oddfoot{\rm\hfil\thepage
%     \hfil}\def\@evenhead{}\let\@evenfoot\@oddfoot}

%\parskip .7em
%\parindent 0pt

%\partopsep 0pt

%\leftmargin\leftmargini

\parsep 0pt

\def\labelitemi{$\m@th\bullet$}
\def\labelitemii{\bf --}
\def\labelitemiii{$\m@th\ast$}
\def\labelitemiv{$\m@th\cdot$}

\def\footnoterule{\kern-1\p@
  \hrule width .4\columnwidth
  \kern .6\p@}

\long\def\@makefntext#1{\noindent
    \hangindent 5\p@\hbox
    to5\p@{\hss $\m@th^{\@thefnmark}$}#1}

\c@topnumber=2
\def\topfraction{.7}
\c@bottomnumber=1
\def\bottomfraction{.3}
\c@totalnumber=3
\def\textfraction{.2}
\def\floatpagefraction{.5}
\c@dbltopnumber= 2
\def\dbltopfraction{.7}
\def\dblfloatpagefraction{.5}

\smallskipamount=.5\parskip

\medskipamount=\parskip
\bigskipamount=2\parskip

%% 
%% Use ps@headings instaed of ps@plain in order to produce running
%% headers
%%

%% \ps@plain
\ps@headings

\@fileswfalse

\endinput
