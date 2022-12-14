% This document class provides a simple memo for LaTeX users.
% It is based on article.cls and inherits most of the functionality
% that class.
% 
% Author: Rob Oakes, Copyright 2010.  Released under the LGPL, version 3.
% A copy of the LGPL can be found at http://www.gnu.org/licenses/lgpl.html
%
% Adapted by Romain Vallon, Postdoc, KTH

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{texMemo}[2010/07/31 - Simple Memo Class, Including Logo]
\RequirePackage{palatino}

\usepackage{graphicx}

% Load the Base Class
\LoadClassWithOptions{article}

% Begin Requirements
\RequirePackage{ifthen}

% Specialized memo Commands (To, From, Subject, Logo, Letterhead Address)

\def\@proptitle{\relax}
\newcommand{\proptitle}[1]{\gdef\@proptitle{#1}}

\def\@sciensuper{\relax}
\newcommand{\sciensuper}[1]{\gdef\@sciensuper{#1}}

\def\@techsuper{\relax}
\newcommand{\techsuper}[1]{\gdef\@techsuper{#1}}

\def\@scienmail{\relax}
\newcommand{\scienmail}[1]{\gdef\@scienmail{#1}}

\def\@techmail{\relax}
\newcommand{\techmail}[1]{\gdef\@techmail{#1}}

\def\@memologo{\relax}
\newcommand{\logo}[1]{\gdef\@memologo{\protect #1}}

\def\@letterheadaddress{\relax}
\newcommand{\lhaddress}[1]{\gdef\@letterheadaddress{#1}}

\def\@keywords{\relax}
\newcommand{\keywords}[1]{\gdef\@keywords{#1}}

% Custom Document Formatting
\newcommand\decorativeline[1][1pt]{
	\par\noindent%
	\rule[0.5ex]{\linewidth}{#1}\par
}

% Set the Paper Size and margins
\RequirePackage{geometry}
\geometry{margin=1.0in}

% Create the Letterhead and To/From Block

\renewcommand{\maketitle}{\makememotitle}
\newcommand\makememotitle{
	\ifthenelse{\equal{\@memologo}{\relax}}{}
	{ % Create With Logo
	\begin{minipage}[t]{1\columnwidth}%
		\begin{flushright}
			\vspace{-0.6in}
			\@memologo
			\vspace{0.2in}
		\par\end{flushright}%
	\end{minipage}
	}
	{\begin{center}
	\LARGE\bf
  \ifthenelse{\equal{\@proptitle}{\relax}}{}{\@proptitle}
	\end{center}}
	% To, From, Subject Block
	\begin{description}
      \begin{center} F\textsc{luids and Surfaces Research Group} \end{center}
      \newline
      \ifthenelse{\equal{\@sciensuper}{\relax}}{}{{\textbf{PI}:} \@sciensuper \hfill}
      \ifthenelse{\equal{\@scienmail}{\relax}}{}{\hfill \@scienmail}
      \ifthenelse{\equal{\@techsuper}{\relax}}{}{{\newline\textbf{Supervisor}:} \@techsuper}
		\ifthenelse{\equal{\@techmail}{\relax}}{}{\hfill\@techmail}
	\end{description}
	\decorativeline\bigskip{}
}


\newcommand{\makekeywords}{
	\ifthenelse{\equal{\@keywords}{\relax}}{}{
    \vfill
    \hline
    \begin{small}
      \noindent\textbf{Key words}: \@keywords. 
    \end{small}
  }
}
