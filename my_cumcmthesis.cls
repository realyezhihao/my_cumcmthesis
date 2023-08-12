\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{my_cumcmthesis}[2023/08/10 v2.6]



%% Class Options
\DeclareOption*{
  \typeout{Option \CurrentOption\ has been passed to class ctexart.}
  \PassOptionsToClass{\CurrentOption}{ctexart}
  }
%\DeclareOption{nosupplement}{\@supplementfalse}
\ProcessOptions\relax



%% Loading Class
\LoadClass[a4paper,oneside,zihao=-4,scheme=chinese,]{ctexart}[2022/07/14 v2.5.10]
  \ctexset{
    abstractname = {摘 \quad 要},
    punct = kaiming,
    section = {
      name = {,、},
      number = \chinese{section},
      format = \large\bfseries\centering,
    },
    subsection/format = \large\bfseries,
    paragraph/runin = true,
    appendix/name = {附录},
  }


%% Loading Packages
% 确保使用xelatex来进行编译
\RequirePackage{ifxetex}
\RequireXeTeX
\ifxetex
  \relax
  \else
  \ClassError{my_mcmthesis}{You must use driver `xelatex'.}
\fi


% 数学符号
\RequirePackage{amsmath}
\RequirePackage{amssymb}


% 页面布局
\RequirePackage{geometry}
  \geometry{a4paper,right=2.7cm,left=2.7cm,bottom=2.7cm,top=2.7cm}
\pagestyle{plain}


% 抄录命令
%\RequirePackage{cprotect}


% 设置代码环境
\RequirePackage{listings}
\RequirePackage{xcolor}
  \definecolor{dkgreen}{rgb}{0,0.6,0}    
  \definecolor{gray}{rgb}{0.5,0.5,0.5}
  \definecolor{mauve}{rgb}{0.58,0,0.82}
  \lstset{
    frame=tb,
    aboveskip=3mm,
    belowskip=3mm,
    showstringspaces=false,
    columns=flexible,
    framerule=1pt,
    rulecolor=\color{gray!35},
    backgroundcolor=\color{gray!5},
    basicstyle={\small\rmfamily},
    numbers=none, %取消行号显示
    %numberstyle=\footnotesize\color{gray}, %行号格式
    keywordstyle=\color{blue},
    commentstyle={\itshape\color{dkgreen}},
    stringstyle=\color{mauve},
    breaklines=true,
    breakatwhitespace=true,
    tabsize=3,
    escapeinside={""} %半角双引号括住的内容退回由LaTeX编译
}


% 插入链接
\RequirePackage{url}
  \urlstyle{same}


%% Define environments and commands
% 摘要环境
\renewenvironment{abstract}
    {\begin{center}{\zihao{4} \bfseries \abstractname}\end{center} \mdseries \par}
    {\newpage}

\newcommand*{\keywords}[1][\empty]{\bfseries \paragraph{关键词：}#1 \mdseries}

\renewcommand{\maketitle}{
    \setcounter{page}{1}
    \begin{center}
        \bfseries{\Large \@title \par}
        \vskip 1em
    \end{center}
    \global\let\author\@empty
    \global\let\date\@empty
    \global\let\thanks\@empty
    }


% 文献上标
\newcommand{\upcite}[1]{$^{\mbox{\scriptsize \cite{#1}}}$}


% 定理类环境
\newcounter{@mathslist_theorem}
\newcounter{@mathslist_lemma}
\newcounter{@mathslist_definition}
\setcounter{@mathslist_theorem}{0}
\setcounter{@mathslist_lemma}{0}
\setcounter{@mathslist_definition}{0}

\newenvironment{theorem}[1][\empty]
  {\stepcounter{@mathslist_theorem}\paragraph{定理\arabic{@mathslist_theorem}~#1}}
  {\par \vskip 1em}
\newenvironment{lemma}[1][\empty]
  {\stepcounter{@mathslist_lemma}\paragraph{引理\arabic{@mathslist_lemma}~#1}}
  {\par \vskip 1em}
\newenvironment{definition}[1][\empty]
  {\stepcounter{@mathslist_definition}\paragraph{定义\arabic{@mathslist_definition}~#1}}
  {\par \vskip 1em}
\newenvironment{proof}
  {\paragraph{证明}}
  {\ensuremath{\hfill \square} \par \vskip 1em}



\endinput