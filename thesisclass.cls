%% LaTeX2e class for diploma theses
%% Based on wissdoc.cls by Roland Bless, 1996-2001
%% bless@telematik.informatik.uni-karlsruhe.de
%%
%% Adapted by: Timo Rohrberg, 2009
%% timo.rohrberg@student.kit.edu
%%
%% Additions by: Thorsten Haberecht, IPD - Chair Prof. B�hm, 2010
%% thorsten.haberecht@kit.edu
%%
%% Additions by: Lukas Horn, Lorenz Gruber and Simon Engel 2026
%% lukas.horn@uni-wuerzburg.de
%% lorenz.gruber@uni-wuerzburg.de
%% simon.engel@uni-wuerzburg.de


\NeedsTeXFormat{LaTeX2e}										% We do need LaTeX2e
\ProvidesClass{thesisclass}
\LoadClass[a4paper,11pt,titlepage,numbers=noendperiod]{scrbook}	% Class based on scrbook

% Silences a warning about a package conflict, which is not relevant for this template
\RequirePackage{silence}
\WarningFilter{scrbook}{Usage of package `fancyhdr'}

%% -------------------------------
%% |          Packages           |
%% -------------------------------


% --- Core & Fonts ---
\usepackage[T1]{fontenc}
\usepackage{lmodern}
\usepackage[ngerman,main=english]{babel}

% --- Layout ---
\usepackage[
	a4paper,
	left=3cm,
	right=2.5cm,
	top=2cm,
	bottom=2cm,
	headheight=15pt,
	headsep=1cm,    % Space between header and text
	footskip=1cm,   % Space between text and footer
	includeheadfoot % Ensures header/footer stay inside the defined margins
]{geometry}
% Margin notes (todonotes, etc.) must fit into the 2.5cm outer margin
\setlength{\marginparwidth}{20mm}
\setlength{\marginparsep}{2mm}
\usepackage{fancyhdr}
\usepackage[absolute,overlay]{textpos}
\usepackage{microtype} % Prettier font formatting
\usepackage{etoolbox} % Modern ifthen alternative

% --- Figures & Captions ---
\usepackage{graphicx}
\usepackage{caption}
\usepackage{subcaption}
\usepackage{tikz}
\usepackage{svg} % Native .svg loading via \includesvg{} (requires --shell-escape)

% --- Code & Algorithms ---
\usepackage{listings}
\usepackage{algorithm2e}
\usepackage{stmaryrd}

% --- Math ---
\usepackage{mathtools}
\usepackage{amsthm}

% --- Tools ---
\usepackage{acro}
\usepackage{booktabs}
\usepackage{siunitx}
\sisetup{uncertainty-mode = separate}

% --- Bibliography ---
% If you have german sources or use langid you may think about uncommenting the next lines
% \usepackage[fixlanguage]{babelbib} % sets german style for literature entries
% \selectbiblanguage{ngerman} % for \bibliographystyle{babalpha}

% --- Hyperlinks ---
\usepackage[
	raiselinks=true,
	bookmarks=true,
	bookmarksopenlevel=1,
	bookmarksopen=true,
	bookmarksnumbered=true,
	hyperindex=true,
	plainpages=false,
	pdfpagelabels=true,
	pdfborder={0 0 0.5},
	colorlinks=false,
	linkbordercolor={0 0.61 0.50},
	citebordercolor={0 0.61 0.50}
]{hyperref}

% Cleveref must be loaded after hyperref
\usepackage{cleveref}
\usepackage{aliascnt} % Required for shared counters with cleveref
% Provide hints for cleveref listings
\crefname{lstlisting}{listing}{listings}
\Crefname{lstlisting}{Listing}{Listings}

% ToDo notes - load after hyperref/cleveref.
% Note: use \usepackage[disable]{todonotes} in the preamble for the final version.
\usepackage{todonotes}

% --- Theorem environments ---
\newtheorem{theorem}{Theorem}
%% Definition
\newaliascnt{definition}{theorem}
\newtheorem{definition}[definition]{Definition}
\aliascntresetthe{definition}
%% Lemma
\newaliascnt{lemma}{theorem}
\newtheorem{lemma}[lemma]{Lemma}
\aliascntresetthe{lemma}
%% Corollary
\newaliascnt{corollary}{theorem}
\newtheorem{corollary}[corollary]{Corollary}
\aliascntresetthe{corollary}


% silences deprecated KOMA warnings
\usepackage{scrhack}



%% -------------------------------
%% |   Title Page Packages   |
%% -------------------------------
\usepackage{xcolor}
\usepackage{pgfgantt} % Must be behind graphicx or will produce errors otherwise
\usepackage{rotating} % Same here (see above)

%% --- End of Packages ---

%% -------------------------------
%% | Title Page Definitions  |
%% -------------------------------
% Primary Uni Wuerzburg Colors as of 2026
\definecolor{marineblau}{RGB}{2,36,108}
\definecolor{konrblumenblau}{RGB}{84,152,255}
\definecolor{korallenrot}{RGB}{237,106,91}
\definecolor{sandbeige}{RGB}{241,235,223}
\definecolor{white}{RGB}{255,255,255}

% \definecolor{background}{named}{sandbeige}
% \definecolor{titlecolor}{named}{marineblau}

\definecolor{background}{RGB}{31,83,148}
\definecolor{titlecolor}{RGB}{255,255,255}

\newcommand{\authorDepartment}{Department of Computer Science}
\newcommand{\authorChair}{Chair of Computer Science II (Software Engineering)}
\newcommand{\authorAssociation}{Universität Würzburg}

\newcommand{\webadress}{www.uni-wuerzburg.de}


%% -------------------------------
%% |        Declarations         |
%% -------------------------------
%% --- End of Declarations ---



%% -------------------------------
%% |         Commands        |
%% -------------------------------
\newcommand{\changefont}[3]{\fontfamily{#1} \fontseries{#2} \fontshape{#3} \selectfont}
%\renewcommand*{\headfont}{\slshape}
%\newcommand{\captionfont}{}
\newcommand{\chapterheadfont}{}
\newcommand{\blankpage}{
	\clearpage{\pagestyle{empty}\cleardoublepage}
}
\newcommand{\trans}[2]{%
	\ifnum\pdfstrcmp{\languagename}{ngerman}=0 #1\else #2\fi%
}
%% --- End Commands ---

\newcommand{\introduction}{\trans{Einleitung}{Introduction}}
\newcommand{\background}{\trans{Grundlagen}{Background}}
\newcommand{\relatedwork}{\trans{Verwandte Arbeiten}{Related Work}}
\newcommand{\approach}{\trans{Ansatz}{Approach}}
\newcommand{\implementation}{\trans{Implementierung}{Implementation}}
\newcommand{\conclusion}{\trans{Zusammenfassung}{Conclusion}}
\renewcommand{\lstlistlistingname}{\trans{Quellcodeverzeichnis}{Listings}}
\renewcommand{\lstlistingname}{\trans{Quellcode}{Listing}}


%% -------------------------------
%% |      Globale Settings       |
%% -------------------------------
\setcounter{secnumdepth}{3} % Numbering also for \subsubsections
\setcounter{tocdepth}{3}    % Register \subsubsections in content directory

\parindent 0cm                     % Do not indent beginning of paragraph
\parskip1.5ex plus0.5ex minus0.5ex % Margin between paragraphs
\newbool{isBachelor}
\newbool{isMaster}
\newbool{isReport}
%% --- End of global Settings ---



%% -------------------------------
%% |          Headings           |
%% -------------------------------
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{\thechapter\ #1}{}}
\fancyhf{}
\fancyhead[LE,RO]{{\headfont\thepage}}						% Left/right header for even/odd pages
\fancyhead[LO]{\headfont\nouppercase{\rightmark}}	% Header for left page (odd)
\fancyhead[RE]{\headfont\nouppercase{\leftmark}}	% Header for right page (even)
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0pt}
\fancypagestyle{plain}{%
	\fancyhf{}													% No Header and Footer fields
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0pt}
	\fancyfoot[C]{\thepage}
}
%% --- End of Headings ---



%% -------------------------------
%% |      Style of captions      |
%% -------------------------------
\renewcommand{\chaptername}{}

\renewcommand{\section}{%
	\@startsection{section}%
	{1}		% Structure level
	{0mm}	% Indention
	{2ex plus 1ex minus 1ex}			% Pre-Margin
	{0.5ex plus 0.5ex minus 0.5ex}		% Post-Margin
	{\chapterheadfont\Large\bfseries}	% Style
}
\renewcommand{\subsection}{%
	\@startsection{subsection}%
	{2}		% Structure level
	{0mm}	% Indention
	{1.5ex plus 1ex minus 0.5ex}		% Pre-Margin
	{0.3ex plus 0.3ex minus 0.3ex}		% Post-Margin
	{\chapterheadfont\large\bfseries}	% Style
}
\renewcommand{\subsubsection}{%
	\@startsection{subsubsection}%
	{3}		% Structure level
	{0mm}	% Indention
	{1.5ex plus 1ex minus 0.5ex}			% Pre-Margin
	{0.2ex plus 0.2ex minus 0.2ex}			% Post-Margin
	{\chapterheadfont\normalsize\bfseries}	% Style
}
\renewcommand{\paragraph}{%
	\@startsection{paragraph}%
	{4}		% Structure level
	{0mm}	% Indention
	{1.3ex plus 1ex minus 0.3ex}			% Pre-Margin
	{0.2ex plus 0.2ex minus 0.2ex}			% Post-Margin
	{\chapterheadfont\normalsize\bfseries}	% Style
}
\renewcommand{\subparagraph}{%
	\@startsection{subparagraph}%
	{5}		% Structure level
	{0mm}	% Indention
	{1ex plus 1ex minus 0.2ex}				% Pre-Margin
	{0.1ex plus 0.1ex minus 0.1ex}			% Post-Margin
	{\chapterheadfont\normalsize\bfseries}	% Style
}
%% --- End of captions style ---



%% ---------------------------------
%% |   Style of chapter captions   |
%% ---------------------------------

\addtokomafont{chapter}{\huge\bfseries\sffamily}

% Redefine the chapter number output
\renewcommand*{\chapterformat}{%
	\mbox{\thechapter\hspace{1.3ex}}%
}

% Prevent the newline between number and title
\renewcommand*{\chapterlineswithprefixformat}[3]{%
	\raggedright
	\ifstr{#2}{}{% If no number (starred chapter)
		#3%
	}{% If there is a number
		\setbox0=\hbox{#2} % Calculate width of number
		\begin{minipage}[t]{\wd0}#2\end{minipage}%
		\begin{minipage}[t]{\dimexpr\textwidth-\wd0\relax}#3\end{minipage}%
	}
}

% Adjust spacing
\RedeclareSectionCommand[
	beforeskip=0.2\textheight,
	afterskip=40pt
]{chapter}

%% --- End of chapter captions style ---





%% ---------------------------------
%% |  Style of content directory   |
%% ---------------------------------
\let\oldtableofcontents\tableofcontents
\renewcommand{\tableofcontents}{{\pdfbookmark{\contentsname}{\contentsname}\chapterheadfont\oldtableofcontents}}
\let\@olddottedtocline\@dottedtocline
\renewcommand{\@dottedtocline}[5]{\@olddottedtocline{#1}{#2}{#3}{#4}{\chapterheadfont #5}}
%% --- End of content directory style ---

%% ----------------------------------
%% |  Style of appendix numbering   |
%% ----------------------------------
\renewcommand\appendix{\par
	\setcounter{chapter}{8}% new
	\setcounter{section}{0}%
	\setcounter{subsection}{0}%
	\setcounter{figure}{0}%
	\setcounter{lstlisting}{0}% new
	\renewcommand\thesection{\Alph{section}}%
	\renewcommand\thefigure{\Alph{section}.\arabic{figure}}
	\renewcommand\thetable{\Alph{section}.\arabic{table}}
	\renewcommand\thelstlisting{\Alph{section}.\arabic{lstlisting}} %new
	\addchap{\trans{Anhang}{Appendix}}
}
%% --- End of appenix numbering style ---

%% ----------------------------------
%% |  Listing Styles   |
%% ----------------------------------

% Colors
\definecolor{blue}{rgb}{0, 0, 1}   % Blue for keywords
\definecolor{grey}{rgb}{0.5, 0.5, 0.5}  % Grey for comments
\definecolor{red}{rgb}{0.7, 0, 0}  % Red for strings
\definecolor{lime}{rgb}{0.05, 0.8, 0.4} % Lime for numbers

% Programming Languages
\lstdefinelanguage{cpp}{
language=C++,
basicstyle=\ttfamily,
keywordstyle=\color{blue}\bfseries,
commentstyle=\color{grey}\itshape,
stringstyle=\color{red},
morekeywords={concept, requires, auto},
literate={->}{{$\shortrightarrow$}}1
{<}{{$\langle$}}1
{>}{{$\rangle$}}1
{<=}{{$\leq$}}1
{>=}{{$\geq$}}1
{<<}{{$\ll$}}1
{>>}{{$\gg$}}1
{0}{{{\color{lime}0}}}{1}
{1}{{{\color{lime}1}}}{1}
{2}{{{\color{lime}2}}}{1}
{3}{{{\color{lime}3}}}{1}
{4}{{{\color{lime}4}}}{1}
{5}{{{\color{lime}5}}}{1}
{6}{{{\color{lime}6}}}{1}
{7}{{{\color{lime}7}}}{1}
{8}{{{\color{lime}8}}}{1}
{9}{{{\color{lime}9}}}{1},
}

\lstdefinelanguage{yaml}{
	basicstyle=\ttfamily\color{red},
	rulecolor=\color{black},
	string=[s]{"}{"},
	stringstyle=\color{lime},
	comment=[l]{\#},
	keywords={File, Directory, string, long},
	keywordstyle=\color{blue}\bfseries,
	commentstyle=\color{lime},
	morecomment=[l][\color{black}]{-},
	morecomment=[l][\color{black}]{:},
	numberstyle=\ttfamily\color{black},
	literate={--}{{-\/-}}1,
}

\lstdefinelanguage{pseudo}{
	language=python,
	basicstyle=\ttfamily,
	keywordstyle=\color{blue}\bfseries,
	commentstyle=\color{grey}\itshape,
	stringstyle=\color{red},
	literate={0}{{{\color{lime}0}}}{1}
		{1}{{{\color{lime}1}}}{1}
		{2}{{{\color{lime}2}}}{1}
		{3}{{{\color{lime}3}}}{1}
		{4}{{{\color{lime}4}}}{1}
		{5}{{{\color{lime}5}}}{1}
		{6}{{{\color{lime}6}}}{1}
		{7}{{{\color{lime}7}}}{1}
		{8}{{{\color{lime}8}}}{1}
		{9}{{{\color{lime}9}}}{1},
}

\lstdefinelanguage{docker}{
	basicstyle=\ttfamily,
	keywords={FROM, RUN, COPY, ADD, ENTRYPOINT, CMD, ENV, ARG, WORKDIR, EXPOSE, LABEL, USER, VOLUME, STOPSIGNAL, ONBUILD, MAINTAINER, HEALTHCHECK},
	keywordstyle=\color{blue}\bfseries,
	comment=[l]{\#},
	commentstyle=\color{grey}\itshape,
	stringstyle=\color{red},
	morestring=[b]',
	morestring=[b]"
}

\lstdefinelanguage{json}{
	basicstyle=\ttfamily,
	commentstyle=\color{grey}\itshape,
	stringstyle=\color{red},
	morekeywords={true, false},
	morestring=[b]',
	morestring=[b]",
	literate=
		*{0}{{{\color{lime}0}}}{1}
		{1}{{{\color{lime}1}}}{1}
		{2}{{{\color{lime}2}}}{1}
		{3}{{{\color{lime}3}}}{1}
		{4}{{{\color{lime}4}}}{1}
		{5}{{{\color{lime}5}}}{1}
		{6}{{{\color{lime}6}}}{1}
		{7}{{{\color{lime}7}}}{1}
		{8}{{{\color{lime}8}}}{1}
		{9}{{{\color{lime}9}}}{1},
}
%% --- End of listing styles ---

%% **** END OF CLASS ****
