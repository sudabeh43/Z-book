%%
%%  This is file `parsibook.cls',
%%   __________________________________
%%   Copyright © 2013-2019 Vahid Damanafshan
%%   http://xelinic.ir
%%   vdamanafshan@gmail.com
%%
%% مجوز استفاده از کلاس:
%% استفاده از این کلاس و کدهای داخل آن، فقط مختص خریدار آن است که به دفعات 
%% می‌تواند از آن استفاده کند. بدیهی است که در صورت نقض این توافق، حق پیگیری
%% قضایی برای نویسنده کلاس محفوظ خواهد بود.
%%
%% 
% نام‌گذاری کلاس و تعریف گزینه‌‌های کلاس
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{parsibook}
              [2019/08/26  v1.5 A Persian document class in XeLaTeX for typesetting Persian books]
\newif\ifparsibook@crop
\parsibook@croptrue 
\DeclareOption{nocrop}{\parsibook@cropfalse}  

\newif\if@blanknotif
\DeclareOption{blanknotif}{\@blanknotiftrue}   
  
% فراخوانی کلاس book برای استفاده در کلاس              
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions
\LoadClass[11pt,a4paper,twoside]{book}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% بسته‌هایی برای حروف‌چینی متن‌های ریاضی
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{mathrsfs}
% بسته‌ای برای تعریف محیط قضایا، تعاریف و...
\RequirePackage{amsthm}
% بسته‌ای برای نمایش کد به شکلی زیبا در متن
\RequirePackage{listings}   
% بسته‌ای برای نمایش دوستونی متن
\RequirePackage{multicol}   
% بسته‌ای برای تغییر ظاهر سربرگ‌های کتاب
\RequirePackage{fancyhdr}
% بسته‌ای برای چاپ متن‌های بی‌معنی، فقط برای آزمایش
\RequirePackage{ptext}
% بسته‌ای برای قرار دادن شکل در صفحات
\RequirePackage[]{graphicx}
% دستوری برای تعیین آدرس محل شکل‌ها
\graphicspath{{figures/}}
% بسته‌ای برای رنگ‌آمیزی 
\RequirePackage{xcolor}
% بسته‌ای بسیار قوی برای رسم شکل، نمودار، گراف و...
\RequirePackage{tikz} 
\usetikzlibrary{shadows,arrows}
\def\sqrtsamples{100}
% بسته‌ای برای قرار دادن چند شکل در کنار یکدیگر با عنوان‌های مختلف
\RequirePackage{subfig}
% بسته‌‌ای برای رسم قاب 
\RequirePackage[framemethod=TikZ,]{mdframed}
% بسته‌ای برای ایجاد نمایه در پایان کتاب
\RequirePackage{makeidx}
\makeindex
% تعریف دستورهایی برای جلوگیری از ظاهر شدن سربرگ و شماره در صفحات خالی
\makeatletter
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
\hbox{}
\vspace*{\fill}
\begin{center}
% در صورت استفاده از گزینه blanknotif، متن زیر در صفحات خالی نمایش داده می‌شود.
\if@blanknotif
این صفحه عمداً خالی گذاشته شده است.
\fi
\end{center}
\vspace{\fill}
\thispagestyle{empty}
\newpage
\if@twocolumn\hbox{}\newpage\fi\fi\fi}
\makeatother

% بسته‌ای برای راحتی کار با جدول
\RequirePackage{array}
% تعریف چند پارامتر جدید مشابه پارامترهای r و l و c برای تراز کردن متن داخل سلول‌های جدول
\newcolumntype{M}[1]{>{\baselineskip=.6cm}p{#1}}
\newcolumntype{R}[1]{>{\raggedleft\arraybackslash}p{#1}}
\newcolumntype{C}[1]{>{\raggedleft\centering\arraybackslash}p{#1}}
% بسته‌ای برای کنترل فاصله بین خطوط عنوان شکل‌ها، جدول‌ها و برنامه‌ها
\RequirePackage{setspace}
% بسته‌ای برای سامان دادن به خطوط افقی جدول‌ها
\RequirePackage{booktabs}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% بسته‌ای برای کنترل نحوه ظاهر شدن برچسب شکل‌ها
\RequirePackage[font={small,onehalfspacing},labelfont={bf},labelsep= quad,labelformat=default,format=plain]{caption}
% بسته‌ای برای نمایش‌ها عنوان فهرست‌ها در فهرست مطالب
\RequirePackage[nottoc]{tocbibind}

% تعیین فاصله بین سربرگ و اولین خط هر صفحه
\headsep=.7cm
% بسته‌ای برای تعیین اندازه بلوک (چارچوب) متن با احتساب مقدار دستور بالا
\makeatletter
\ifparsibook@crop
\RequirePackage[total={12cm,19.1cm},centering,includehead=true,paperwidth=16.5cm, paperheight=23.5cm]{geometry}
\RequirePackage[cross,center,noinfo,a4]{crop}
\else
\RequirePackage[total={12cm,19.1cm},centering,includehead=true]{geometry}
\fi
\makeatother

% بسته و دستوری برای ریست کردن شماره پانویس‌ها در هر صفحه
\RequirePackage{zref-perpage}
\zmakeperpage{footnote}

% بسته و دستورهایی برای سفارشی کردن محیط‌های لیستی
\RequirePackage{enumitem}
\setitemize{nosep}
\setenumerate{nosep}
\setdescription{nosep}
% بسته‌ای برای تبدیل ارجاع‌های کتاب به لینک‌های قابل کلیک
\RequirePackage[linkcolor=blue]{hyperref}

% بسته‌ای برای ساخت واژه‌نامه فارسی به انگلیسی
\RequirePackage[xindy,nonumberlist,toc]{glossaries}
% فراخوانی بسته زی‌پرشین و تعریف چند فونت برای استفاده در نمایش شماره فصل‌ها
% فونت متن‌های لاتین، به اندازه 0.05 کوچک‌تر انتخاب شده تا اندازه آن با اندازه فونت متن‌های فارسی هماهنگ باشد.
% فونت اعداد ریاضی، به اندازه 0.1 کوچک‌تر انتخاب شده تا اندازه آن با اندازه فونت متن‌های فارسی هماهنگ باشد.
\RequirePackage[extrafootnotefeatures]{xepersian}
\settextfont[Scale=1]{XB Niloofar}
\setlatintextfont[Scale=.95]{Times New Roman}
\setmathdigitfont[Scale=.9]{Yas}
\defpersianfont\mysmallfont[Scale=.9]{XB Niloofar}
\defpersianfont\chapfont[Scale=3.3]{XB Niloofar}
\defpersianfont\norfont[Scale=1]{XB Niloofar}
% تنظیم نوع چینش پانویس‌ها به حالت پاراگرافی (پشت سر هم)
\paragraphfootnotes

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% دستورهایی برای تنظیم نحوه چینش سربرگ‌ها
\pagestyle{fancy}
\fancyhf{} 
\fancyhead[LE]{\thepage\hspace*{1.4cm}\small\leftmark\hfill}
\fancyhead[RO]{\hfill\small\rightmark\hspace*{1.4cm}\thepage}
%\fancyhead[RE,LO]{\small\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\chaptermark}[1]{%
\markboth{\thechapter\ \ #1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\ \ #1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% تعیین عمق شماره‌گذاری بخش‌ها، زیربخش‌ها و زیرزیربخش‌ها در فهرست مطالب و خود متن
\setcounter{secnumdepth}{6}
\setcounter{tocdepth}{6} 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% حذف کلمه «فصل» در ابتدای شروع فصل‌ها
\renewcommand{\chaptername}{}
% چند بازتعریف
\renewcommand\listtablename{فهرست جدول‌ها}
\renewcommand\bibname{منابع}
\renewcommand\listfigurename{فهرست شکل‌ها}
\makeatletter 
\def\lstlistingname{\if@RTL کد\else Code\fi} 
\def\lstlistlistingname{\if@RTL فهرست کدها\else Listings\fi} 
\makeatother 
% تعیین نحوه نمایش کدها در بسته listings
\lstset{
language=TeX,
frame=trBL,  
frameround=fttt,
numbers=left,
numberstyle=\scriptsize,
showspaces=false,         
showtabs=false,       
xleftmargin=23pt,
xrightmargin=9pt,
framexleftmargin=17pt,
framexrightmargin=5pt,
framexbottommargin=2pt,
showstringspaces=false ,
breaklines=true,
texcl=true,
basicstyle=\setLTR\footnotesize\ttfamily,
commentstyle= \itshape,
belowcaptionskip=12pt,
aboveskip=15pt,
belowskip=15pt
}  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% تعریف دستوری برای چاپ و نحوه چینش فصل‌های بدون شماره مثل «پیش‌گفتار»
\newcommand{\mychapter}[1]{%
\phantomsection%
\addcontentsline{toc}{chapter}{#1}\chapter*{#1}\markboth{#1}{#1}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% تعیین نحوه شماره خوردن شکل‌ها و جدول‌ها (به صورت پیش‌فرض، فعال هستند)
\numberwithin{figure}{chapter}
\numberwithin{equation}{chapter}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% دستورهایی برای برخورد با بیوه‌ها و یتیم‌ها
\clubpenalty=150
\widowpenalty=150
% حذف امکان منبسط شدن یا همان stretch خودکار فاصله بین پاراگراف‌ها
\setlength{\parskip}{0in}

\makeatletter
% تعیین نحوه ظاهر شدن عنوان فصل‌ها در صفحه اول فصل‌ها
\def\@makechapterhead#1{%
  %\vspace*{-.1\baselineskip}%
  {\parindent \z@ \if@RTL\raggedleft\else\raggedright\fi \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        \huge\bfseries \@chapapp\space {\chapfont\thechapter}
        \par\nobreak
        \vskip -10\p@
      \fi
    \fi
    \interlinepenalty\@M
   \Huge \bfseries \linespread{1.5}\selectfont  #1\par\nobreak
   \vskip 152\p@
\thispagestyle{empty}
  }}
  
  
% تعیین نحوه ظاهر شدن عنوان فصل‌های ستاره‌دار در صفحه اول فصل‌های ستاره‌دار مانند صفحه فهرست مطالب
\def\@makeschapterhead#1{%
  %\vspace*{-\baselineskip}%
  {\parindent \z@ \if@RTL\raggedleft\else\raggedright\fi
    \normalfont
    \interlinepenalty\@M
    \Huge \bfseries  #1\par\nobreak
   \vskip 210\p@
\thispagestyle{empty}
  }}
  
  
% اضافه کردن عنوان «بخش» قبل از شماره partها در صورت استفاده از دستور part 
\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\partname~\thepart\hspace{1em}#1}%
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
     \Huge \bfseries #2\thispagestyle{empty}\par}%
    \@endpart 
    } 
    
    
% اضافه کردن فاصله قبل از شروع کدهای هر فصل در «فهرست کدها»    
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
                    \addtocontents{lol}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}
                        

% حذف امکان منقبض شدن یا همان shrink و منبسط شدن یا همان stretch خودکار فاصله قبل  و بعد از 
%%عنوان قسمت‌ها، زیرقسمت‌‌ها و زیرزیرقسمت‌‌ها و همچنین زیاد کردن فاصله بین خطوط در عنوان‌های بیشتر از یک خط
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-1.9ex}%
                                   {2.3ex}%
                                   {\normalfont\Large\bfseries\linespread{1.5}\selectfont}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex}%
                                     {1.5ex}%
                                     {\normalfont\large\bfseries\linespread{1.4}\selectfont}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex}%
                                     {1.5ex}%
                                     {\normalfont\normalsize\bfseries\linespread{1.3}\selectfont}}    
        
% زیاد کردن فاصله بین خطوط در پانویس‌های فارسی چند خطی                                      
\renewcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}\linespread{1.2}\selectfont#1}    
    

% در حالت پیش‌فرض، عنوان بخش، زیربخش و زیرزیربخش در پایین صفحات قرار نمی‌گیرند؛ مگر اینکه دو خط متن هم پایین
% آن‌ها وجود داشته باشد. با بازتعریف زیر می‌توان دو خط را به یک خط تبدیل کرد که باعث بهتر پر شدن صفحات می‌شود.    
\renewcommand\@afterheading{%
  \@nobreaktrue
  \everypar{%
    \if@nobreak
      \@nobreakfalse
      \clubpenalty 1
      \if@afterindent \else
        {\setbox\z@\lastbox}%
      \fi
    \else
      \clubpenalty 1
      \everypar{}%
    \fi}}                                               
\makeatother


% تعریف دستور psymbol برای وارد کردن نمادها
\newcommand{\psymbol}[2]{%
\gdef\currntsymbol{#1}%
\gdef\currntsymboldef{#2}%
\csname phantomsection\endcsname%
%#1%
\addcontentsline{los}{psymbol}{%
\protect\numberline{\currntsymbol}%
\currntsymboldef}%
}
% تنظیمات مربوط به نحوه ظاهر شدن نمادها در فهرست نمادها
\makeatletter
\renewcommand\@tocrmarg{1.55em}
\newcommand\listsymbolsname{فهرست نمادها}
\newcommand\listofsymbols[1][3em]{%
\newcommand*\l@psymbol{%
\@dottedtocline{1}{0em}{#1}}\mychapter{\listsymbolsname}%
\setlength{\columnsep}{5ex}
%\begin{adjmulticols*}{2}{-\dimexpr+\marginparwidth+\marginparsep\relax}{}
\begin{multicols*}{2}
\small
\@starttoc{los}
\raggedcolumns
%\end{adjmulticols*}
\end{multicols*}
}
\makeatother

% تنظیمات مربوط به نحوه ظاهر شدن واژه‌نامه فارسی به انگلیسی 
\makeatletter
\renewcommand{\glossarymark}[1]{\markboth{#1}{#1}}
\newglossarystyle{parsilist}{%
\glossarystyle{treegroup}
 \renewenvironment{theglossary}%
    {\setlength{\parindent}{0pt}%
     \setlength{\parskip}{0pt}
     }%
    {}%
  \renewcommand*{\glossaryheader}{}%
\renewcommand*{\glsgroupheading}[1]{\noindent\textbf{\glsgetgrouptitle{##1}}\par\nopagebreak}
  \renewcommand{\glossaryentryfield}[5]{%
    \hangindent0pt\relax
    \parindent0pt\relax
    \glsentryitem{##1}\textbf{\glstarget{##1}{##2}}%
{\scriptsize\dotfill}\ifx\relax##4\relax
    \else
      \space(##4)%
    \fi
    \space ##3\glspostdescription \space ##5\par}%
  \renewcommand{\glossarysubentryfield}[6]{%
    \hangindent##1\glstreeindent\relax
    \parindent##1\glstreeindent\relax
    \ifnum##1=1\relax
      \glssubentryitem{##2}%
    \fi
    \textbf{\glstarget{##2}{##3}}%
    \ifx\relax##5\relax
    \else
      \space(##5)%
    \fi
  {\tiny\dotfill}\space##4\indent\glspostdescription\space##6\par}%
  \renewcommand*{\glsgroupskip}{\indexspace}
  \renewcommand*{\glspostdescription}{}
}
\makeatother

\makeatletter
\let\orgglossarysection\glossarysection
\newcommand*\twocolumnglossarysection[2][\glossarytoctitle]{%
  \twocolumn
  \orgglossarysection[#1]{#2}%
}

\define@choicekey{printgloss}{column}[\val\nr]{1,2}%
{%
  \ifcase\nr\relax
    \let\glossarysection\orgglossarysection
    \renewcommand*{\glossarypostamble}{}
  \or
    \let\glossarysection\twocolumnglossarysection
    \renewcommand*{\glossarypostamble}{\onecolumn}
  \fi
}
\makeatother
\makeglossaries
\glossarystyle{parsilist}
% میزان تورفتگی زیرواژه‌ها در واژه‌نامه
\setlength{\glstreeindent}{15pt}
% میزان فاصله بین دو ستون در واژه‌نامه در هنگام استفاده از حالت دوستونی
%\setlength\columnsep{10pt}
% اندازه ضخامت خط بین دو ستون در واژه‌نامه در هنگام استفاده از حالت دوستونی
\setlength\columnseprule{0pt}


% بازتعریف دستور printindex برای تغییر نحوه چینش کلمه «نمایه» و نیز حذف شماره صفحه در اولین 
% صفحه آن 
\makeatletter
\let\origprintindex\printindex
\renewcommand*{\printindex}{%
\def\@makeschapterhead##1{%
\vspace*{-1.7\baselineskip}%
  {\parindent \z@ \if@RTL\raggedleft\else\raggedright\fi
    \normalfont
    \interlinepenalty\@M
    \Huge \bfseries  ##1\par\nobreak
   \vskip 210\p@
\thispagestyle{empty}
  }}
\cleardoublepage
  \fancypagestyle{plain}{%
    \fancyhf{}%
    \renewcommand{\headrulewidth}{0pt}%
    \renewcommand{\footrulewidth}{0pt}%
  }%
  \tolerance=10000
  \origprintindex
}
\makeatother

% تعریف یک جعبه برای قرار دادن لوگوی دانشگاه یا ناشر در صفحه شناسنامه کتاب
\newsavebox{\mygraphic}
\sbox{\mygraphic}{\includegraphics[height=1.5cm]{logo}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% چهار دستور زیر از نسخه 1.2 به بعد کلاس، کاربردی ندارند و فقط برای استفاده در نسخه قبلی کاربرد دارند.
% تعریف دستوری برای ظاهر شدن حروف الفبای فارسی به صورت درشت در واژه‌نامه فارسی به انگلیسی در
% ابتدای هر گروه حرفی از واژه‌ها
\newcommand{\fagroup}[1]{%
\par\noindent{\textbf{\Large #1\\}}
}

% دستوری برای وارد کردن راحت‌تر کلمات در واژه‌نامه فارسی به انگلیسی
\newcommand{\pword}[2]{%
#1
{\small\dotfill}
\lr{#2}\\
}

% تعریف دستوری برای ظاهر شدن حروف الفبای انگلیسی به صورت درشت در واژه‌نامه انگلیسی به فارسی در
% ابتدای هر گروه حرفی از واژه‌ها
\newcommand{\engroup}[1]{%
\par\noindent\lr{{\textbf{\Large #1\\}}} 
}

% دستوری برای وارد کردن راحت‌تر کلمات در واژه‌نامه فارسی به انگلیسی
\newcommand{\eword}[2]{% 
\lr{#1}%
{\small\dotfill}%
\rl{#2}\\
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% دستورهایی برای نحوه ظاهر شدن تعاریف، قضایا، مثال‌ها و... در متن
% باید توجه داشت که متن محیط‌های ادعایی مثل قضیه، لم، گزاره، نتیجه و ملاحظه باید به صورت ایتالیک باشد؛ ولی
% محیط مثال و تعریف، باید به صورت ایستاده باشند. همچنین شماره تمام این محیط‌ها برای پیدا کردن راحت‌تر آن‌ها
% باید از یکدیگر پیروی کنند.
\theoremstyle{definition}
\newtheorem{definition}{تعریف}[section]
\theoremstyle{plain}
\newtheorem{theorem}[definition]{قضیه}
\newtheorem{lemma}[definition]{لم}
\newtheorem{proposition}[definition]{گزاره}
\newtheorem{corollary}[definition]{نتیجه}
\newtheorem{remark}[definition]{ملاحظه}
\theoremstyle{definition}
\newtheorem{example}[definition]{مثال}
\newtheorem*{solu}{حل}
\renewcommand\proofname{{\rm \textbf{برهان}}}

% بازتعریف محیط solu برای اضافه کردن یک مربع توپر به انتهای محیط «حل» مثال‌ها
\newenvironment{solution}
{\begin{solu}}
{\hfill$\blacksquare $\end{solu}}

\makeatletter
% حذف علامت نقطه بعد از شماره محیط‌های تعریف، قضیه، مثال و...
\def\@thm#1#2#3{%
  \ifhmode\unskip\unskip\par\fi
  \normalfont
  \trivlist
  \let\thmheadnl\relax
  \let\thm@swap\@gobble
  \thm@notefont{\fontseries\mddefault\upshape}%
  \thm@headpunct{}
  \thm@headsep 5\p@ plus\p@ minus\p@\relax
  \thm@space@setup
  #1% style overrides
  \@topsep \thm@preskip              
  \@topsepadd \thm@postskip      
  \def\@tempa{#2}\ifx\@empty\@tempa
    \def\@tempa{\@oparg{\@begintheorem{#3}{}}[]}%
  \else
    \refstepcounter{#2}%
    \def\@tempa{\@oparg{\@begintheorem{#3}{\csname the#2\endcsname}}[]}%
  \fi
  \@tempa
}

% حذف علامت نقطه بعد از کلمه «برهان» در محیط proof
\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}%
  \normalfont \topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\hskip\labelsep
        \itshape
%    #1\@addpunct{.}]\ignorespaces% DELETED
    #1]\ignorespaces% ADDED
}{%
  \popQED\endtrivlist\@endpefalse
}
\makeatother
\makeatletter
% تعریف محیط جدیدی به نام pquote برای نوشتن نقل‌قول
\renewenvironment{quotation}
               {\list{}{\listparindent=1.5em
                        \itemindent    \listparindent
                        \leftmargin=.3in
                        \rightmargin=.3in
                        %\topsep=0pt
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}     
\makeatother
\newenvironment{pquote}{\begin{quotation}\setlength{\parskip}{0in}%
\noindent\ignorespaces\mysmallfont\baselineskip=.6cm}
{\end{quotation}}
\makeatletter
% تعریف محیط premind برای رسم قاب در متن
\newcounter{fcon}
\newenvironment{premind}[1][\empty]{\par\begin{mdframed}[roundcorner=10pt,userdefinedwidth=\textwidth,align=center,skipabove=.9\baselineskip,
skipbelow=.3\baselineskip,innertopmargin=.2cm,
innerbottommargin=.2cm,
innerrightmargin=5pt,innerleftmargin=5pt,
]\baselineskip=.7cm
\refstepcounter{fcon}\noindent\textbf{یادآوری~\thechapter\@SepMark\thefcon\ifx%
\empty#1\space\relax\else\space(#1)\space\fi}%\\[.2cm]%
\noindent\ignorespaces%
\noindent}{\end{mdframed}}
\@addtoreset{fcon}{chapter}


% تعریف قاب رنگی ptheorem1 برای نوشتن تعریف
\newenvironment{ptheorem1}[1][\empty]{\par\begin{mdframed}[roundcorner=10pt,userdefinedwidth=\textwidth,align=center,skipabove=.9\baselineskip,
skipbelow=.3\baselineskip,innertopmargin=.2cm,
innerbottommargin=.15cm,
innerrightmargin=5pt,innerleftmargin=5pt,
backgroundcolor=cyan!40,
]%\mysmallfont
\baselineskip=.7cm
\refstepcounter{definition}
\noindent\textbf{قضیه~\thedefinition\ifx\empty#1\space\relax\else\space(#1)\space\fi}%
\noindent\ignorespaces%
\noindent}{\end{mdframed}}
\makeatother


% تعریف قاب رنگی pdefinition1 برای نوشتن تعریف
\newenvironment{pdefinition1}[1][\empty]{\par\begin{mdframed}[roundcorner=10pt,userdefinedwidth=\textwidth,align=left,skipabove=.9\baselineskip,
skipbelow=.3\baselineskip,innertopmargin=0pt,
innerbottommargin=0pt,
innerrightmargin=10pt,innerleftmargin=0pt,
outermargin=-1pt,
%backgroundcolor=green,
 topline=false,bottomline=false,leftline=false,
middlelinewidth=8pt,
middlelinecolor=magenta,
]
\baselineskip=.7cm
\refstepcounter{definition}
\noindent\textbf{تعریف~\thedefinition\ifx\empty#1\space\relax\else\space(#1)\space\fi}%\\[.2cm]%
\noindent\ignorespaces%
\noindent}{\end{mdframed}}
\makeatother

% تعریف محیط pproblems برای حروف‌چینی پرسش‌ها یا مسائل پایان فصل‌ها
\makeatletter
\newenvironment{pproblems}[1][مسائل]{%
\renewcommand{\thesection}{}
\phantomsection\addcontentsline{toc}{section}{#1}
\vspace*{\baselineskip}
\hrule height 1pt
\vspace*{-5pt}
\section*{#1}
\vspace*{-5pt}
\hrule height 1pt
\vspace*{\baselineskip}
\sectionmark{#1}
\renewcommand\theenumi{\thechapter\@SepMark\arabic{enumi}}
\renewcommand\labelenumi{\textbf{\theenumi}}
\let\p@enumii\@empty
\begin{enumerate}[align=left,itemindent=0pt]}
{\end{enumerate}}  
\makeatother

% تعریف محیط psolutions برای حروف‌چینی پاسخ پرسش‌های پایان فصل‌ها
\newenvironment{psolutions}{%
\begin{enumerate}[align=left,itemindent=0pt]}
{\end{enumerate}}  

% تعریف دستور solsection برای چاپ شماره فصل و شماره صفحه حاوی پرسش‌ها
\newcommand{\solsection}[1]{
\par\begin{mdframed}[
innertopmargin=-3pt,
innerbottommargin=2pt,
%outermargin=-5pt,
usetwoside=false,
rightmargin=0pt,
innerrightmargin=5pt,innerleftmargin=0pt,
backgroundcolor=gray!30,
topline=false,
bottomline=false,leftline=false,
middlelinewidth=20pt,
middlelinecolor=black,
skipbelow=5\baselineskip,
]
\subsubsection*{فصل #1}%
\nopagebreak
\end{mdframed}
}
%%%%%%%%%%%%%%%%%%%%%


% حذف تورفتگی‌های ابتدای عنوان شکل‌ها، جدول‌ها و کدها در فهرست آن‌ها
\makeatletter
\renewcommand*\l@figure{\@dottedtocline{1}{0em}{2.3em}}
\let\l@table\l@figure
\def\l@lstlisting#1#2{\@dottedtocline{1}{0em}{2.3em}{#1}{#2}}

% اضافه کردن «فهرست کدها» به فهرست مطالب
\lst@UserCommand\lstlistoflistings{\bgroup
    \let\contentsname\lstlistlistingname
    \let\lst@temp\@starttoc \def\@starttoc##1{\lst@temp{lol}}%
    \tableofcontents\phantomsection\addcontentsline{toc}{chapter}{فهرست کدها}\egroup}
    

% بازتعریف دستور appendix برای نرمال کردن اندازه فونت شماره پیوست‌ها
  \renewcommand\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\norfont\@Alph\c@chapter}}
\makeatother

% تعریف چند دستور و اپراتور برای استفاده در فرمول‌ها
\allowdisplaybreaks[4]
\DeclareMathOperator{\Arctan}{Arctan}
\DeclareMathOperator{\Arcsin}{Arcsin}
\DeclareMathOperator{\Arccos}{Arccos}
\DeclareMathOperator{\Arccot}{Arccot}
\DeclareMathOperator{\Arcsec}{Arcsec}
\def\sqrtsamples{100}
\newcommand{\di}{\ d}
\usepackage{oz}

%% Special Thanks to Vafa Karen-pahlav, Nicola Talbot, David Carlisle, and other users of 
%% http://tex.stackexchange.com for their invaluable help.
%% 
%% 
%% 
%% 
%% 
%%
%% End of file `parsibook.cls'.
