%%
%% This is file `apa6.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% apa6.dtx  (with options: `class')
%% ----------------------------------------------------------------------
%% 
%% apa6 - A LaTeX class for formatting documents in compliance with the
%% American Psychological Association's Publication Manual, 6th edition
%% 
%% Copyright (C) 2011-2016 by Brian D. Beitzel <brian at beitzel.com>
%% 
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License (LPPL), either
%% version 1.3c of this license or (at your option) any later
%% version.  The latest version of this license is in the file:
%% 
%% http://www.latex-project.org/lppl.txt
%% 
%% Users may freely modify these files without permission, as long as the
%% copyright line and this statement are maintained intact.
%% 
%% This work is not endorsed by, affiliated with, or probably even known
%% by, the American Psychological Association.
%% 
%% ----------------------------------------------------------------------
%% 
\ProvidesClass{ctsDIGI}[2016/10/03 v0.01 Format class for Ciencia, Tecnologia y Salud (DIGI) by ECFM]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{submit}{%
  \def\def@man{\@manmode}
}

\DeclareOption{preview}{%
  \def\def@jou{\@joumode}
}

\DeclareOption{negro}{%
  \def\def@neg{\@negro}
}

\DeclareOption{verde}{%
  \def\def@ver{\@verde}
}

%%\DeclareOption{doc}{%
%%  \def\def@doc{\@docmode}
%%}

\DeclareOption{babel}{%
  \def\def@babel{\@babel}
}

\DeclareOption{notimes}{%
  \@ifundefined{def@jou}{}{\def\def@notimes{\@notimes}}
}

\DeclareOption{notxfonts}{% -- thp 2005/07/23
  \@ifundefined{def@jou}{}{\def\def@notxfonts{\@notxfonts}}
}

\DeclareOption{nosf}{%
  \@ifundefined{def@man}{}{\def\def@nosf{\@nosf}}
}

\DeclareOption{fignum}{%
  \@ifundefined{def@man}{}{\def\fig@num{\relax}}
}


\DeclareOption{longtable}{%
  \def\long@table{\relax}
}

\DeclareOption{tt}{%
  \@ifundefined{def@man}{}{\def\tt@family{\relax}}
}

\DeclareOption{helv}{%
  \@ifundefined{def@man}{}{\def\helv@family{\relax}}
}

\DeclareOption{notab}{\def\no@tab{\relax}}

\DeclareOption{nobf}{\def\no@bf@title{\relax}}

\DeclareOption{nolmodern}{%
  \def\def@nolmodern{\@nolmodernmode}
}

\DeclareOption{nofontenc}{%
  \def\def@nofontenc{\@nofontencmode}
}

\DeclareOption{noextraspace}{%
  \def\def@noextraspace{\@noextraspacemode}
}

\DeclareOption{donotrepeattitle}{%
  \def\def@donotrepeattitle{\@donotrepeattitlemode}
}

\DeclareOption{floatsintext}{%
  \def\def@floatsintext{\@floatsintext}
}

\DeclareOption{a4paper}{%
  \def\def@aFourPaper{\@aFourPapermode}
}

\DeclareOption{apacite}{% BDB
  \def\def@apacite{\@apacitemode}
}

\DeclareOption{natbib}{% BDB
  \def\def@natbib{\@natbibmode}
}

\DeclareOption{biblatex}{% BDB
  \def\def@biblatex{\@biblatexmode}
}

\DeclareOption{draftfirst}{% BDB
  \def\def@draftfirst{\@draftfirstmode}
}

\DeclareOption{draftall}{% BDB
  \def\def@draftall{\@draftallmode}
}

\DeclareOption{mask}{\def\apaSix@maskauthoridentity{\relax}}  % BDB

\DeclareOption{amsmath}{%
  \def\def@amsmath{\@amsmath}
}


\newcommand\apaSix@ptsize{}
\newcommand\apaSix@noptsize{}
\DeclareOption{10pt}{\renewcommand\apaSix@ptsize{10pt}}
\DeclareOption{11pt}{\renewcommand\apaSix@ptsize{11pt}}
\DeclareOption{12pt}{\renewcommand\apaSix@ptsize{12pt}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions\relax

\newcommand\ctsDIGIprintbibliography{}

\@ifundefined{def@man}{%
 \@ifundefined{def@doc}{%
  \@ifundefined{def@jou}{%
   \def\def@jou{\@joumode}
   \ClassInfo{ctsDIGI}{Using default mode (jou)}
   %\def\def@man{\@manmode}
   %\def\def@doc{\@docmode}
  }{}
 }{}
}{}

\@ifundefined{def@man}{%
    \@ifundefined{def@jou}{%
        \@ifundefined{def@doc}{%
        }{% doc
          \ifx\apaSix@ptsize\apaSix@noptsize
            \LoadClass[11pt]{article} % default for doc is 11pt
          \else
            \LoadClass[\apaSix@ptsize]{article}
          \fi
        }
    }{% jou
      \ifx\apaSix@ptsize\apaSix@noptsize
        \LoadClass[10pt,twoside]{article} % default for jou is 10pt
      \else
        \LoadClass[\apaSix@ptsize,twoside]{article}
      \fi
    }
}{% man
  \ifx\apaSix@ptsize\apaSix@noptsize
    \LoadClass[12pt,twoside]{article} % default for man is 12pt
  \else
    \LoadClass[\apaSix@ptsize]{article}
  \fi
}

% definir fontsize 11pt
\newcommand{\sizeOnce}{\fontsize{11}{13.2}\selectfont}
% definir fontsize 9.5pt
\newcommand{\sizeNueveymedio}{\fontsize{9}{11.4}\selectfont}

\@ifundefined{def@apacite}{%
  \@ifundefined{def@natbib}{%
    \@ifundefined{def@biblatex}{%
      \def\def@biblatex{\@biblatexmode}%  the default bibliography package is biblatex
      \RequirePackage{etoolbox}
      \AtEndPreamble{%
        \@ifpackageloaded{biblatex}{%  the user has loaded biblatex
          \@ifundefined{def@man}{%
            \defbibheading{bibliography}{\section*{\normalfont\refname}}%
          }{%
            \defbibheading{bibliography}{\section*{\newpage\normalfont\refname}}%
          }
        }{}
      }
      \ClassInfo{ctsDIGI}{No bibliography package was specified; defaulting to (but not loading) Biblatex}
    }{%
      \def\def@biblatex{\@biblatexmode}%  the selected bibliography package is Biblatex
      \RequirePackage[style=apa,sortcites=true,sorting=nyt,backend=biber]{biblatex}
      %% Ajuste para que aparezca ampersand y no 'y' en las citas bibliograficas
      \AtEndPreamble{%
      	\renewcommand*{\finalnamedelim}{%
   			\ifnumgreater{\value{liststop}}{2}{\finalandcomma}{}%
   			\addspace \&\space}%
   	  }
   	  %% Fin del ajuste
      \@ifundefined{def@man}{%
        %\defbibheading{bibliography}{\section*{\normalfont\refname}}%
      }{%
        %\defbibheading{bibliography}{\section*{\newpage\normalfont\refname}}%
      }
      \ClassInfo{ctsDIGI}{The selected bibliography package, biblatex, has been loaded}
    }
  }{%
    \def\def@natbib{\@natbibmode}%  the selected bibliography package is natbib (with apacite)
    \@ifundefined{def@man}{%         -- thp 2005/07/23
      \RequirePackage[natbibapa]{apacite}[2012/02/25]}
      {\RequirePackage[natbibapa,bibnewpage]{apacite}[2012/02/25]}
    \ClassInfo{ctsDIGI}{The selected bibliography package, apacite and
      natbib, have been loaded}
  }
}{%
  \def\def@apacite{\@apacitemode}%  the selected bibliography package is apacite
  \@ifundefined{def@man}{%         -- thp 2005/07/23
    \RequirePackage{apacite}[2005/06/08]}
    {\RequirePackage[bibnewpage]{apacite}[2005/06/08]}
  \ClassInfo{ctsDIGI}{The selected bibliography package, apacite, has been loaded}
}

\@ifundefined{def@nolmodern}{%
  \RequirePackage{lmodern}
}{}

\@ifundefined{def@nofontenc}{%
  \RequirePackage[T1]{fontenc}
}{}

\@ifundefined{def@draftall}{%
  \@ifundefined{def@draftfirst}{}{%
    \RequirePackage[firstpage]{draftwatermark}
    \SetWatermarkText{DRAFT}
  }
}{%
  \RequirePackage{draftwatermark}
  \SetWatermarkText{DRAFT}
}



\long\def\ifapamodeman#1#2{\@ifundefined{def@man}{#2}{#1}}
\long\def\ifapamodejou#1#2{\@ifundefined{def@jou}{#2}{#1}}
\long\def\ifapamodedoc#1#2{\@ifundefined{def@doc}{#2}{#1}}
\long\def\ifapamode#1#2#3{%
 \@ifundefined{def@man}{%
  \@ifundefined{def@jou}{%
   \@ifundefined{def@doc}{\ClassError{ctsDIGI}{Undefined mode state!}}{#3}%
  }{#2}%
 }{#1}%
}

\@ifundefined{def@man}{}{%
\@ifundefined{long@table}{}{%
 \RequirePackage{array}
 \RequirePackage{longtable}
}% END of loading longtable
\@ifundefined{tt@family}{}{%
 \DeclareFontShape{OT1}{cmtt}{bx}{n}{ <-> cmssbx10 }{}  % probably not the
 \DeclareFontShape{OT1}{cmtt}{bx}{it}{ <-> cmssbxo10}{} % right way to do it
 \renewcommand{\familydefault}{cmtt}
 }
\@ifundefined{helv@family}{}{%
 \renewcommand{\familydefault}{phv}}
}

\@ifundefined{def@jou}{}{%
 \@ifundefined{def@notimes}{%
  \newif\iftxfonts          % -- thp 2005/07/23
  \txfontsfalse             % added checks for txfonts because they may be undesirable
                            % for example, there are no Greek txfonts but there are times
  \IfFileExists{txfonts.sty}{\@ifundefined{def@notxfonts}{\txfontstrue}{}}{}
   \iftxfonts%
    \RequirePackage{txfonts}%
    \typeout{ctsDIGI.cls: Using txfonts}% Changed from Warning -- thp 2005/12/28
    %%%
    % According to Erik Meijer, txfonts causes problems if amsmath is loaded later
    % (i.e., via \usepackage by the user); instead of providing yet another option
    % to load amsmath by apa.cls, we adopt Erik's suggestion to undefine temporarily
    % the offending macros -- thp 2005/12/28
    \let\tempiint\iint\let\iint\undefined
    \let\tempiiint\iiint\let\iiint\undefined
    \let\tempiiiint\iiiint\let\iiiint\undefined
    \let\tempidotsint\idotsint\let\idotsint\undefined
    \let\tempopenbox\openbox\let\openbox\undefined
    \AtBeginDocument{%
     \let\iint\tempiint\let\tempiint\undefined
     \let\iiint\tempiiint\let\tempiiint\undefined
     \let\iiiint\tempiiiint\let\tempiiiint\undefined
     \let\idotsint\tempidotsint\let\tempidotsint\undefined
     \let\openbox\tempopenbox\let\tempopenbox\undefined
    }
    %%% end of taking care of txfonts problems
   \else%
    % if txfonts are not available/desirable, try pslatextimes/mathptm
    \IfFileExists{pslatex.sty}
     {\RequirePackage{pslatex}}
     % if pslatex is not available, try times/mathptm
     {\RequirePackage{times}
      \IfFileExists{mathptm.sty}{\RequirePackage{mathptm}}{}}%
   \fi% txfonts not available/desirable
 }{}% def@notimes
}% def@jou

\@ifundefined{def@aFourPaper}{
  \RequirePackage[top=1in, bottom=1in, left=1in, right=1in]{geometry}
}{
  \RequirePackage[top=1in, bottom=1in, left=1in, right=1in,a4paper]{geometry}
}

\RequirePackage{graphicx}  % this is for including graphics

\RequirePackage{booktabs}  % this is for nice-looking tables
\setlength{\abovetopsep}{0pt}  % set the distance between the table title and the table toprule
\setlength{\belowbottomsep}{0pt}  % set the distance between the table bottomrule and any notes

\RequirePackage[para,flushleft]{threeparttable}  % this is for nice-looking table footnotes, etc.
\@ifundefined{def@man}{% BDB
  \def\TPT@doparanotes{\par\vspace{-.5\baselineskip}% BDB
     \prevdepth\z@ \TPT@hsize
     \TPTnoteSettings
     \parindent\z@ \pretolerance 8
     \linepenalty 200
     \renewcommand\item[1][]{\relax\ifhmode \begingroup
         \unskip
         \advance\hsize 10em % \hsize is scratch register, based on real hsize
         \penalty -45 \hskip\z@\@plus\hsize \penalty-19
         \hskip .15\hsize \penalty 9999 \hskip-.15\hsize
         \hskip .01\hsize\@plus-\hsize\@minus.01\hsize
         \hskip 1em\@plus .3em
        \endgroup\fi
        \tnote{##1}\,\ignorespaces}%
     \let\TPToverlap\relax
     \def\endtablenotes{\par}%
  }
}{%
  \def\TPT@doparanotes{\par\vspace{-.4\baselineskip}% BDB
     \prevdepth\z@ \TPT@hsize
     \TPTnoteSettings
     \raggedright
     \parindent\z@ \pretolerance 8
     \linepenalty 200
     \renewcommand\item[1][]{\relax\ifhmode \begingroup
         \unskip
         \advance\hsize 10em % \hsize is scratch register, based on real hsize
         \penalty -45 \hskip\z@\@plus\hsize \penalty-19
         \hskip .15\hsize \penalty 9999 \hskip-.15\hsize
         \hskip .01\hsize\@plus-\hsize\@minus.01\hsize
         \hskip 1em\@plus .3em
        \endgroup\fi
        \tnote{\color{\@tcolor} ##1}\,\ignorespaces}%
     \let\TPToverlap\relax
     \def\endtablenotes{\par}%
  }
}


%%
%% Se definen los textos para los siguientes campos:
%% - Titulo corto					\rheadname
%% - Keywords (Ingles)				\keywordenname
%% - Palabras clave (Espanol)		\keywordspname
%% - Email de contacto				\contactname
%% - Abstract (Ingles)				\abstractenname
%% - Resumen (Espanol)				\abstractspname
%%
 
\def\rheadname{T\'{\i}tulo corto}
\def\acksname{Nota del autor}
\def\keywordenname{Keywords}
\def\keywordspname{Palabras claves}
\def\notesname{Notas}
\def\contactname{*Direcci\'on para recibir correspondencia}
\def\abstractenname{Abstract}
\def\abstractspname{Resumen}


\AtBeginDocument{% so that we know what language is active in babel

                           % Unfortunately, because babel is built into the format
                           % in modern distributions, \iflanguage is defined and
                           % \languagename contains whichever language happens to be
                           % last in the definition list, whether or not the babel
                           % package is loaded by the current document

% \@ifundefined{def@babel}% this is defined only if the user requested loading babel
%  {\def\@apaSix@langfile{config/APAamerican.txt}}
%  {\def\@apaSix@langfile{config/APA\languagename.txt}}
% \InputIfFileExists{\@apaSix@langfile}{}{%
%  \ClassInfo{apa6}{Language definition file \@apaSix@langfile\space not found}
% }%
}


\@ifundefined{def@babel}{}{% -- thp 2005/07/23
 \RequirePackage{babel}    % -- thp 2005/07/23, removed options 2005/12/28
}

\@ifundefined{def@biblatex}{}{% BDB

  % we are using biblatex

    %%%%%%%%%%%% biblatex commands %%%%%%%%%%%%%%%%
    %%
    %%  \cite[e.g.,][p.~11]{vanDijk2001,Ross1987}          =>  e.g., van Dijk, 2001; Ross, 1987, p. 11
    %%  \Cite[e.g.,][p.~11]{vanDijk2001,Ross1987}          =>  e.g., Van Dijk, 2001; Ross, 1987, p. 11
    %%  \parencite[e.g.,][p.~11]{vanDijk2001,Ross1987}     =>  (e.g., van Dijk, 2001; Ross, 1987, p. 11)
    %%  \Parencite[e.g.,][p.~11]{vanDijk2001,Ross1987}     =>  (e.g., Van Dijk, 2001; Ross, 1987, p. 11)
    %%  \textcite[e.g.,][p.~11]{vanDijk2001,Ross1987}      =>  e.g., van Dijk (2001); Ross (1987, p. 11)
    %%  \Textcite[e.g.,][p.~11]{vanDijk2001,Ross1987}      =>  e.g., Van Dijk (2001); Ross (1987, p. 11)
    %%  \citeauthor[e.g.,][p.~11]{vanDijk2001,Ross1987}    =>  e.g., van Dijk (2001); Ross (1987, p. 11)
    %%  \Citeauthor[e.g.,][p.~11]{vanDijk2001,Ross1987}    =>  e.g., Van Dijk (2001); Ross (1987, p. 11)
    %%  \citeyear[e.g.,][p.~11]{vanDijk2001}             =>  e.g., 2001, p. 11)
    %%  \footcite[e.g.,][p.~11]{vanDijk2001,Ross1987}      =>  e.g., van Dijk, 2001; Ross, 1987, p. 11. [as footnote]
    %%  \footcitetext[e.g.,][p.~11]{vanDijk2001,Ross1987}  =>  e.g., van Dijk, 2001; Ross, 1987, p. 11. [as footnotetext]
    %%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    \@ifundefined{apaSix@maskauthoridentity}%  BDB
      {%  change masked references to unmasked
        \providecommand\maskcite\cite
        \providecommand\maskCite\Cite
        \providecommand\maskparencite\parencite
        \providecommand\maskParencite\Parencite
        \providecommand\masktextcite\textcite
        \providecommand\maskTextcite\Textcite
        \providecommand\maskciteauthor\citeauthor
        \providecommand\maskCiteauthor\Citeauthor
        \providecommand\maskciteyear\citeyear
        \providecommand\maskfootcite\footcite
        \providecommand\maskfootcitetext\footcitetext
      }{%  mask references to author

        \RequirePackage{substr}  % to allow counting of masked references
        \newcounter{maskedRefs}

        % \maskcite
        \newcommand\maskcite{\@ifnextchar[{\maskcite@@also}{\maskcite@@also[]}}
        \newcommand\maskcite@@also{}
        \def\maskcite@@also[#1]{\@ifnextchar[{\maskcite@@@also[#1]}{\maskcite@@@also[][#1]}}

        \def\maskcite@@@also%
            [#1][#2]#3{%
                \setcounter{maskedRefs}{0}%
                \SubStringsToCounter{maskedRefs}{,}{#3}%
                \addtocounter{maskedRefs}{1}%
                \ifnum\value{maskedRefs} = 1%
                \def\apaSix@masked@refs{(\textit{\themaskedRefs\ citation removed for masked review})}%
                \else%
                \def\apaSix@masked@refs{(\textit{\themaskedRefs\ citations removed for masked review})}%
                \fi%
                \apaSix@masked@refs%
        }

        % \maskCite
        \newcommand\maskCite{\@ifnextchar[{\maskCite@@also}{\maskCite@@also[]}}
        \newcommand\maskCite@@also{}
        \def\maskCite@@also[#1]{\@ifnextchar[{\maskCite@@@also[#1]}{\maskCite@@@also[][#1]}}

        \def\maskCite@@@also%
            [#1][#2]#3{%
                \setcounter{maskedRefs}{0}%
                \SubStringsToCounter{maskedRefs}{,}{#3}%
                \addtocounter{maskedRefs}{1}%
                \ifnum\value{maskedRefs} = 1%
                \def\apaSix@masked@refs{(\textit{\themaskedRefs\ citation removed for masked review})}%
                \else%
                \def\apaSix@masked@refs{(\textit{\themaskedRefs\ citations removed for masked review})}%
                \fi%
                \apaSix@masked@refs%
        }

        % \maskparencite
        \newcommand\maskparencite{\@ifnextchar[{\maskparencite@@also}{\maskparencite@@also[]}}
        \newcommand\maskparencite@@also{}
        \def\maskparencite@@also[#1]{\@ifnextchar[{\maskparencite@@@also[#1]}{\maskparencite@@@also[][#1]}}

        \def\maskparencite@@@also%
            [#1][#2]#3{%
                \setcounter{maskedRefs}{0}%
                \SubStringsToCounter{maskedRefs}{,}{#3}%
                \addtocounter{maskedRefs}{1}%
                \ifnum\value{maskedRefs} = 1%
                \def\apaSix@masked@refs{(\textit{\themaskedRefs\ citation removed for masked review})}%
                \else%
                \def\apaSix@masked@refs{(\textit{\themaskedRefs\ citations removed for masked review})}%
                \fi%
                \apaSix@masked@refs%
        }

        % \maskParencite
        \newcommand\maskParencite{\@ifnextchar[{\maskParencite@@also}{\maskParencite@@also[]}}
        \newcommand\maskParencite@@also{}
        \def\maskParencite@@also[#1]{\@ifnextchar[{\maskParencite@@@also[#1]}{\maskParencite@@@also[][#1]}}

        \def\maskParencite@@@also%
            [#1][#2]#3{%
                \setcounter{maskedRefs}{0}%
                \SubStringsToCounter{maskedRefs}{,}{#3}%
                \addtocounter{maskedRefs}{1}%
                \ifnum\value{maskedRefs} = 1%
                \def\apaSix@masked@refs{(\textit{\themaskedRefs\ citation removed for masked review})}%
                \else%
                \def\apaSix@masked@refs{(\textit{\themaskedRefs\ citations removed for masked review})}%
                \fi%
                \apaSix@masked@refs%
        }

        % \maskciteauthor
        \newcommand\maskciteauthor{\@ifnextchar[{\maskciteauthor@@also}{\maskciteauthor@@also[]}}
        \newcommand\maskciteauthor@@also{}
        \def\maskciteauthor@@also[#1]{\@ifnextchar[{\maskciteauthor@@@also[#1]}{\maskciteauthor@@@also[][#1]}}

        \def\maskciteauthor@@@also%
            [#1][#2]#3{%
                \setcounter{maskedRefs}{0}%
                \SubStringsToCounter{maskedRefs}{,}{#3}%
                \addtocounter{maskedRefs}{1}%
                \ifnum\value{maskedRefs} = 1%
                \def\apaSix@masked@refs{(\textit{\themaskedRefs\ citation removed for masked review})}%
                \else%
                \def\apaSix@masked@refs{(\textit{\themaskedRefs\ citations removed for masked review})}%
                \fi%
                \apaSix@masked@refs%
        }

        % \maskCiteauthor
        \newcommand\maskCiteauthor{\@ifnextchar[{\maskCiteauthor@@also}{\maskCiteauthor@@also[]}}
        \newcommand\maskCiteauthor@@also{}
        \def\maskCiteauthor@@also[#1]{\@ifnextchar[{\maskCiteauthor@@@also[#1]}{\maskCiteauthor@@@also[][#1]}}

        \def\maskCiteauthor@@@also%
            [#1][#2]#3{%
                \setcounter{maskedRefs}{0}%
                \SubStringsToCounter{maskedRefs}{,}{#3}%
                \addtocounter{maskedRefs}{1}%
                \ifnum\value{maskedRefs} = 1%
                \def\apaSix@masked@refs{(\textit{\themaskedRefs\ citation removed for masked review})}%
                \else%
                \def\apaSix@masked@refs{(\textit{\themaskedRefs\ citations removed for masked review})}%
                \fi%
                \apaSix@masked@refs%
        }

        % \maskciteyear
        \newcommand\maskciteyear{\@ifnextchar[{\maskciteyear@@also}{\maskciteyear@@also[]}}
        \newcommand\maskciteyear@@also{}
        \def\maskciteyear@@also[#1]{\@ifnextchar[{\maskciteyear@@@also[#1]}{\maskciteyear@@@also[][#1]}}

        \def\maskciteyear@@@also%
            [#1][#2]#3{%
                \setcounter{maskedRefs}{0}%
                \SubStringsToCounter{maskedRefs}{,}{#3}%
                \addtocounter{maskedRefs}{1}%
                \ifnum\value{maskedRefs} = 1%
                \def\apaSix@masked@refs{(\textit{\themaskedRefs\ citation removed for masked review})}%
                \else%
                \def\apaSix@masked@refs{(\textit{\themaskedRefs\ citations removed for masked review})}%
                \fi%
                \apaSix@masked@refs%
        }

        % \maskfootcite
        \newcommand\maskfootcite{\@ifnextchar[{\maskfootcite@@also}{\maskfootcite@@also[]}}
        \newcommand\maskfootcite@@also{}
        \def\maskfootcite@@also[#1]{\@ifnextchar[{\maskfootcite@@@also[#1]}{\maskfootcite@@@also[][#1]}}

        \def\maskfootcite@@@also%
            [#1][#2]#3{%
                \setcounter{maskedRefs}{0}%
                \SubStringsToCounter{maskedRefs}{,}{#3}%
                \addtocounter{maskedRefs}{1}%
                \ifnum\value{maskedRefs} = 1%
                \def\apaSix@masked@refs{(\textit{\themaskedRefs\ citation removed for masked review})}%
                \else%
                \def\apaSix@masked@refs{(\textit{\themaskedRefs\ citations removed for masked review})}%
                \fi%
                \apaSix@masked@refs%
        }

        % \maskfootcitetext
        \newcommand\maskfootcitetext{\@ifnextchar[{\maskfootcitetext@@also}{\maskfootcitetext@@also[]}}
        \newcommand\maskfootcitetext@@also{}
        \def\maskfootcitetext@@also[#1]{\@ifnextchar[{\maskfootcitetext@@@also[#1]}{\maskfootcitetext@@@also[][#1]}}

        \def\maskfootcitetext@@@also%
            [#1][#2]#3{%
                \setcounter{maskedRefs}{0}%
                \SubStringsToCounter{maskedRefs}{,}{#3}%
                \addtocounter{maskedRefs}{1}%
                \ifnum\value{maskedRefs} = 1%
                \def\apaSix@masked@refs{(\textit{\themaskedRefs\ citation removed for masked review})}%
                \else%
                \def\apaSix@masked@refs{(\textit{\themaskedRefs\ citations removed for masked review})}%
                \fi%
                \apaSix@masked@refs%
        }

        % \masktextcite
        \newcommand\masktextcite{\@ifnextchar[{\masktextcite@@also}{\masktextcite@@also[]}}
        \newcommand\masktextcite@@also{}
        \def\masktextcite@@also[#1]{\@ifnextchar[{\masktextcite@@@also[#1]}{\masktextcite@@@also[][#1]}}

        \def\masktextcite@@@also%
            [#1][#2]#3{%
                \setcounter{maskedRefs}{0}%
                \SubStringsToCounter{maskedRefs}{,}{#3}%
                \addtocounter{maskedRefs}{1}%
                \ifnum\value{maskedRefs} = 1%
                \def\apaSix@masked@refs{(\textit{\themaskedRefs\ citation removed for masked review})}%
                \else%
                \def\apaSix@masked@refs{(\textit{\themaskedRefs\ citations removed for masked review})}%
                \fi%
                \apaSix@masked@refs%
        }

        % \maskTextcite
        \newcommand\maskTextcite{\@ifnextchar[{\maskTextcite@@also}{\maskTextcite@@also[]}}
        \newcommand\maskTextcite@@also{}
        \def\maskTextcite@@also[#1]{\@ifnextchar[{\maskTextcite@@@also[#1]}{\maskTextcite@@@also[][#1]}}

        \def\maskTextcite@@@also%
            [#1][#2]#3{%
                \setcounter{maskedRefs}{0}%
                \SubStringsToCounter{maskedRefs}{,}{#3}%
                \addtocounter{maskedRefs}{1}%
                \ifnum\value{maskedRefs} = 1%
                \def\apaSix@masked@refs{(\textit{\themaskedRefs\ citation removed for masked review})}%
                \else%
                \def\apaSix@masked@refs{(\textit{\themaskedRefs\ citations removed for masked review})}%
                \fi%
                \apaSix@masked@refs%
        }

      }

}


\newskip\b@level@one@skip   \b@level@one@skip=2.5ex plus 1ex minus .2ex
\newskip\e@level@one@skip   \e@level@one@skip=1.5ex plus .6ex minus .1ex
\newskip\b@level@two@skip   \b@level@two@skip=2.5ex plus 1ex minus .2ex
\newskip\e@level@two@skip   \e@level@two@skip=1.5ex plus .6ex minus .1ex
\newskip\b@level@three@skip \b@level@three@skip=2.0ex plus .8ex minus .2ex
\newskip\e@level@three@skip \e@level@three@skip=1.5ex plus .6ex minus .1ex
\newskip\b@level@four@skip  \b@level@four@skip=1.8ex plus .8ex minus .2ex
\newskip\e@level@four@skip  \e@level@four@skip=1.5ex plus .6ex minus .1ex
\newskip\b@level@five@skip  \b@level@five@skip=1.8ex plus .8ex minus .2ex
\newskip\e@level@five@skip  \e@level@five@skip=0ex

\ifapamodeman{%
  \@ifundefined{def@noextraspace}{}{%
    % redefine the vertical section spacing
    \b@level@one@skip=0.2\baselineskip \@plus 0.2ex \@minus 0.2ex
    \e@level@one@skip=0.2\baselineskip \@plus .2ex
    \b@level@two@skip=0.2\baselineskip \@plus 0.2ex \@minus 0.2ex
    \e@level@two@skip=0.2\baselineskip \@plus 0.2ex
    \b@level@three@skip=0\baselineskip \@plus 0.2ex \@minus 0.2ex
    \e@level@three@skip=-\z@
    \b@level@four@skip=0\baselineskip \@plus 0.2ex \@minus 0.2ex
    \e@level@four@skip=-\z@
    \b@level@five@skip=0\baselineskip \@plus 0.2ex \@minus 0.2ex
    \e@level@five@skip=0ex
  }
}{}



\setcounter{secnumdepth}{0}

\renewcommand{\section}{\@startsection {section}{1}{\z@}%
    {\b@level@one@skip}{\e@level@one@skip}%
    {\centering\normalfont\large\bfseries\color{\@pcolor}}}


\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
    {\b@level@two@skip}{\e@level@two@skip}%
    {\noindent\normalfont\sizeOnce\bfseries\leavevmode\color{\@pcolor}}}



\newcommand*{\addperi}[1]{#1.}

\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{\parindent}%
    {0\baselineskip \@plus 0.2ex \@minus 0.2ex}%
    {-1em}%
    {\normalfont\normalsize\bfseries\addperi}}


\renewcommand{\paragraph}{\@startsection{paragraph}{4}{\parindent}%
    {0\baselineskip \@plus 0.2ex \@minus 0.2ex}%
    {-1em}%
    {\normalfont\normalsize\bfseries\itshape\addperi}}

\renewcommand{\subparagraph}[1]{\@startsection{subparagraph}{5}{1em}%
    {0\baselineskip \@plus 0.2ex \@minus 0.2ex}%
    {-\z@\relax}%
    {\normalfont\normalsize\itshape\hspace{\parindent}{#1}\textit{.}}{\relax}}

\AtBeginDocument{\def\st@rtbibsection{\mspart{\refname}}}%  BDB -- this is for apacite
\AtBeginDocument{\def\bibsection{\mspart{\refname}}}%  BDB -- this is for apacite + natbib
\newcommand{\mspart}{{\ifapamodeman{\clearpage}{}}\@startsection {section}{1}{\z@}%
    {\b@level@one@skip}{\e@level@one@skip}%
    {\centering\normalfont\normalsize}}

\RequirePackage[singlelinecheck=off]{caption}

\ifapamode{% man
    \DeclareCaptionLabelFormat{tablelabel}{\hspace{-\parindent}\raggedright#1 #2}
    \DeclareCaptionLabelFormat{figurelabel}{\hspace{-\parindent}\raggedright\textit{#1 #2}}
    \DeclareCaptionTextFormat{tabletext}{\hspace{-\parindent}\raggedright\textit{#1}}
    \DeclareCaptionTextFormat{figuretext}{\hspace{-\parindent}{\color{\@tcolor} #1}}
    \DeclareCaptionLabelSeparator{figureSeparator}{\color{\@tcolor}. }
}{% jou
    \DeclareCaptionLabelFormat{tablelabel}{\hspace{-\parindent}{\sizeNueveymedio \color{\@tcolor} #1 #2}}
    \DeclareCaptionLabelFormat{figurelabel}{\hspace{-\parindent}\textit{\sizeNueveymedio \color{\@tcolor} #1 #2}}
    \DeclareCaptionTextFormat{tabletext}{\hspace{-\parindent}\textit{\sizeNueveymedio \color{\@tcolor} #1}}
    \DeclareCaptionTextFormat{figuretext}{\hspace{-\parindent}{\sizeNueveymedio \color{\@tcolor} #1}}
    \DeclareCaptionLabelSeparator{figureSeparator}{\color{\@tcolor}. }
}{% doc
    \DeclareCaptionLabelFormat{tablelabel}{\hspace{-\parindent}#1 #2}
    \DeclareCaptionLabelFormat{figurelabel}{\hspace{-\parindent}\textit{#1 #2}}
    \DeclareCaptionTextFormat{tabletext}{\hspace{-\parindent}\textit{#1}}
}
\captionsetup[table]{position=above,skip=0pt,labelformat=tablelabel,labelsep=newline,textformat=tabletext}
\captionsetup[figure]{position=below,skip=0pt,labelformat=figurelabel,labelsep=figureSeparator,textformat=figuretext}


\setlength{\belowcaptionskip}{0pt}



\newcounter{APAenum}
\newskip\@text@par@indent
\def\APAenumerate{\@text@par@indent\parindent\setbox0\hbox{1. }%
    \list{\arabic{APAenum}.}{\usecounter{APAenum}
    \labelwidth\z@\labelsep\z@\leftmargin\z@\parsep\z@
    \rightmargin\z@\itemsep\z@\topsep\z@\partopsep\z@
    \itemindent\@text@par@indent\advance\itemindent by\wd0
    \def\makelabel##1{\hss\llap{##1 }}}}
\let\endAPAenumerate=\endlist

\def\seriate{\@bsphack\begingroup%
   \setcounter{APAenum}{0}%
   \def\item{\addtocounter{APAenum}{1}(\alph{APAenum})\space}%
   \ignorespaces}
\def\endseriate{\endgroup\@esphack}

\def\APAitemize{\@text@par@indent\parindent\setbox0\hbox{$\bullet$}%
    \list{$\bullet$}{%
    \labelwidth\z@\labelsep.5em\leftmargin\z@\parsep\z@
    \rightmargin\z@\itemsep\z@\topsep\z@\partopsep\z@
    \itemindent\@text@par@indent
    \advance\itemindent by\wd0\advance\itemindent by.5em
    \def\makelabel##1{\hss\llap{##1}}}}
\let\endAPAitemize=\endlist



%%
%% Se definen los comando para el titulo en espaniol e ingles
%%
\long\def\titleEn#1{\long\def\@titleen{#1}}
\long\def\titleSp#1{\long\def\@titlesp{#1}}
%%
\long\def\author#1{\long\def\@author{#1}}
\long\def\shorttitle#1{\long\def\@shorttitle{#1}}
\long\def\twoauthors#1#2{\long\def\@authorOne{#1}\long\def\@authorTwo{#2}%
 \long\def\@author{#1}}
\long\def\onetwoauthors#1#2#3{\long\def\@authorOne{#1}\long\def\@authorTwo{#2}%
 \long\def\@authorThree{#3}\long\def\@author{#1}}
\long\def\twooneauthors#1#2#3{\long\def\@authorOne{#1}\long\def\@authorTwo{#2}%
 \long\def\@authorThree{#3}\long\def\@author{#1}\def\@twofirst{1}}
\let\threeauthors=\onetwoauthors
\long\def\fourauthors#1#2#3#4{\long\def\@authorOne{#1}\long\def\@authorTwo{#2}%
 \long\def\@authorThree{#3}\long\def\@authorFour{#4}\long\def\@author{#1}}
\long\def\fiveauthors#1#2#3#4#5{\long\def\@authorOne{#1}\long\def\@authorTwo{#2}%%%%
 \long\def\@authorThree{#3}\long\def\@authorFour{#4}\long\def\@authorFive{#5}%    %%
 \long\def\@author{#1}} %%     2006/01/05 -- added as contributed by Aaron Geller %%
\long\def\sixauthors#1#2#3#4#5#6{\long\def\@authorOne{#1}%                  %% thp 2006/01/05
 \long\def\@authorTwo{#2}\long\def\@authorThree{#3}\long\def\@authorFour{#4}%% thp 2006/01/05
 \long\def\@authorFive{#5}\long\def\@authorSix{#6}\long\def\@author{#1}}    %% thp 2006/01/05
\long\def\affiliation#1{\long\def\@affil{#1}}
\long\def\twoaffiliations#1#2{\long\def\@affilOne{#1}\long\def\@affilTwo{#2}%
\long\def\@affil{#1}}
\long\def\onetwoaffiliations#1#2#3{\long\def\@affilOne{#1}\long\def\@affilTwo{#2}%
 \long\def\@affilThree{#3}\long\def\@affil{#1}}
\long\def\twooneaffiliations#1#2#3{\long\def\@affilOne{#1}\long\def\@affilTwo{#2}%
 \long\def\@affilThree{#3}\long\def\@affil{#1}}
\let\threeaffiliations=\onetwoaffiliations
\long\def\fouraffiliations#1#2#3#4{\long\def\@affilOne{#1}\long\def\@affilTwo{#2}%
 \long\def\@affilThree{#3}\long\def\@affilFour{#4}\long\def\@affil{#1}}
\long\def\fiveaffiliations#1#2#3#4#5{\long\def\@affilOne{#1}\long\def\@affilTwo{#2}%%
 \long\def\@affilThree{#3}\long\def\@affilFour{#4}\long\def\@affilFive{#5}%        %%
 \long\def\@affil{#1}} %%     2006/01/05 -- added as contributed by Aaron Geller   %%
\long\def\sixaffiliations#1#2#3#4#5#6{\long\def\@affilOne{#1}%           %% thp 2006/01/05
 \long\def\@affilTwo{#2}\long\def\@affilThree{#3}\long\def\@affilFour{#4}%% thp 2006/01/05
 \long\def\@affilFive{#5}\long\def\@affilSix{#6}\long\def\@affil{#1}}    %% thp 2006/01/05
\long\def\note#1{\long\def\@note{#1}}
%%
%% Se definen los siguientes comandos
%% - \abstractEn{}
%% - \abstractSP{}
%% - \keywordsEn{}
%% - \keywordsSp{}
%% - \contactmail{}
%%
\long\def\abstractEn#1{\long\def\@abstracten{#1}}
\long\def\abstractSp#1{\long\def\@abstractsp{#1}}
\long\def\keywordsEn#1{\long\def\@keywordsen{#1}}
\long\def\keywordsSp#1{\long\def\@keywordssp{#1}}
\long\def\authornote#1{\long\def\@acks{#1}}
\long\def\contactmail#1{\long\def\@mail{#1}}
%% Moficaciones pr LG (preview mode)
\long\def\recibido#1{\long\def\@recibido{#1}} %%%Definidendo fecha de recibido
\long\def\frev#1{\long\def\@frev{#1}} %%%Fecha de primera rev
\long\def\srev#1{\long\def\@srev{#1}} %%%Fecha de segunda rev
\long\def\aceptado#1{\long\def\@aceptado{#1}} %%%Fecha de aceptacion
\long\def\enlinea#1{\long\def\@enlinea{#1}} %%%Fecha de disponible en linea\def\volume#1{\def\@vvolume{#1}} %%%Etiqueta del volumen de la revista
\def\mnumber#1{\def\@mnumber{#1}} %%%Etiqueta del numero de la revista
\def\myear#1{\def\@myear{#1}} %%%Anio de la revista
\def\ISSN#1{\def\@ISSN{#1}}%%ISSN
%%
%%
\def\journal#1{\RequirePackage{fancyhdr}\def\@journal{#1}}
\def\volume#1{\def\@vvolume{#1}}
\def\ccoppy#1{\def\@ccoppy{#1}}
\def\copnum#1{\def\@copnum{#1}}
\def\@error@toomanyauthors{\ClassWarningNoLine{ctsDIGI}{More authors than affiliations defined}}
\def\@error@toomanyaffils{\ClassWarningNoLine{ctsDIGI}{More affiliations than authors defined}}
\def\check@author{%
 \@ifundefined{@author}{%
  \ClassWarningNoLine{ctsDIGI}{Author not defined}\def\@author{Author}}{}
 \@ifundefined{@titleen}{%
  \ClassWarningNoLine{ctsDIGI}{Englush title not defined}\def\@titleen{Title}}{}
 \@ifundefined{@titlesp}{%
  \ClassWarningNoLine{ctsDIGI}{Spanish title not defined}\def\@titlesp{T\'{\i}tulo}}{}
 \@ifundefined{@shorttitle}{%
  \ClassWarningNoLine{ctsDIGI}{Short title not defined}\def\@shorttitle{INSERT SHORTTITLE COMMAND IN PREAMBLE}}{}
 \@ifundefined{@affil}{%
  \ClassWarningNoLine{ctsDIGI}{Affiliation not defined}\def\@affil{Affiliation}}{}
%%
%% Se anadieron advertencias para los abstracts y keywords
%%
 \@ifundefined{@abstracten}{%
  \ClassWarningNoLine{ctsDIGI}{English abstract not defined}}{}
 \@ifundefined{@abstractsp}{%
  \ClassWarningNoLine{ctsDIGI}{Spanish abstract not defined}}{}
 \@ifundefined{@keywordsen}{%
  \ClassInfo{ctsDIGI}{English keywords not defined}}{}
 \@ifundefined{@keywordssp}{%
  \ClassInfo{ctsDIGI}{Spanish keywords not defined}}{}%%%Warning para entornos administrativos (LG preview mode)
 \@ifundefined{@recibido}{%
  \ClassInfo{ctsDIGI}{Fercha de recibido no definida}}{}
\@ifundefined{@frev}{%
  \ClassInfo{ctsDIGI}{Fercha de primera revision no definida}}{}
\@ifundefined{@srev}{%
  \ClassInfo{ctsDIGI}{Fercha de segunda revision no definida}}{}
\@ifundefined{@aceptado}{%
  \ClassInfo{ctsDIGI}{Fercha de aceptacion no definida}}{}
\@ifundefined{@enlinea}{%
  \ClassInfo{ctsDIGI}{Fercha de disponible en linea no definida}}{}
%%
%%
 \@ifundefined{@authorSix}{%                                   % -- thp 2006/01/05
  \@ifundefined{@authorFive}{%                                 % -- thp 2006/01/05
   \@ifundefined{@authorFour}{%
    \@ifundefined{@authorThree}{%
     \@ifundefined{@authorTwo}{%
     }{\@ifundefined{@affilTwo}{\@error@toomanyauthors}{}}
    }{\@ifundefined{@affilThree}{\@error@toomanyauthors}{}}
   }{\@ifundefined{@affilFour}{\@error@toomanyauthors}{}}
  }{\@ifundefined{@affilFive}{\@error@toomanyauthors}{}}       % -- thp 2006/01/05
 }{\@ifundefined{@affilSix}{\@error@toomanyauthors}{}}         % -- thp 2006/01/05
 \@ifundefined{@affilSix}{%                                    % -- thp 2006/01/05
  \@ifundefined{@affilFive}{%                                  % -- thp 2006/01/05
   \@ifundefined{@affilFour}{%
    \@ifundefined{@affilThree}{%
     \@ifundefined{@affilTwo}{%
     }{\@ifundefined{@authorTwo}{\@error@toomanyaffils}{}}
    }{\@ifundefined{@authorThree}{\@error@toomanyaffils}{}}
   }{\@ifundefined{@authorFour}{\@error@toomanyaffils}{}}
  }{\@ifundefined{@authorFive}{\@error@toomanyaffils}{}}       % -- thp 2006/01/05
 }{\@ifundefined{@authorSix}{\@error@toomanyaffils}{}}         % -- thp 2006/01/05
}


\newsavebox\gr@box
\newlength\gr@boxwidth
\newlength\gr@boxheight

\newcommand{\fitfigure}[2][0.5]{%
\sbox\gr@box{\includegraphics[width=\linewidth]{#2}}
\settoheight{\gr@boxheight}{\usebox\gr@box}
\ifdim\gr@boxheight>\textheight%
 \centerline{\includegraphics[height=#1\textheight]{#2}}% need to leave space for caption
\else%
 \usebox\gr@box%
\fi
}

\newcommand{\fitbitmap}[2][0.5]{ % like fitfigure but no scaling in man mode for best quality
\sbox\gr@box{\includegraphics[width=\linewidth]{#2}}
\settoheight{\gr@boxheight}{\usebox\gr@box}
\ifdim\gr@boxheight>\textheight%
 \centerline{\includegraphics[height=#1\textheight]{#2}}% need to leave space for caption
\else%
 \centerline{\usebox\gr@box}%
\fi
}


\let\normal@BBAB\BBAB                        % -- thp 2005/07/23
\let\table@BBAB\BBAA                         % -- thp 2005/07/23

\setlength{\doublerulesep}{\arrayrulewidth}
\newcommand\thickline{\hline\hline}
\renewcommand\footnoterule{%
  \kern-3\p@
  \color{\@tcolor}\hrule height0.125pt width.5in
  \kern2.6\p@}

\let\apaSixtabular\tabular
\let\apaSix@doc@tabular\tabular
%%
\let\apaSix@doc@endtabular\endtabular

\def\@tab@fn#1{\ensuremath{^{\mbox{{\scriptsize #1}}}}}
\def\tabfnm#1{\rlap{\@tab@fn{#1}}}
\def\tabfnt#1#2{\raggedright\@tab@fn{#1}#2}

\def\apaSixvector#1{{\ensuremath
  \uprightlowercasegreek
  \ifapamodeman
  {\apaSixsmash{\mathop{\kern\z@\mathrm{#1}}\limits_{\scriptscriptstyle\sim}}}%
  {\if@bm@loaded\bm{\mathrm{#1}}\else\mathbf{#1}\fi% in case bm is not available
  }%
}}
\newcommand{\apaSixsmash}{%
  \def\finsm@sh{\dp\z@\z@ \box\z@}%
  \expandafter\mathpalette\expandafter\mathsm@sh
}%
\newif\if@bm@loaded\@bm@loadedfalse
\IfFileExists{bm.sty}{\RequirePackage{bm}\@bm@loadedtrue}{}% if not, apaSixvector will fail
\newcommand{\uprightlowercasegreek}{%
  \@ifundefined{alphaup}{}{%
    \def\alpha     {\alphaup     }%
    \def\beta      {\betaup      }%
    \def\gamma     {\gammaup     }%
    \def\delta     {\deltaup     }%
    \def\epsilon   {\epsilonup   }%
    \def\varepsilon{\varepsilonup}%
    \def\zeta      {\zetaup      }%
    \def\eta       {\etaup       }%
    \def\theta     {\thetaup     }%
    \def\vartheta  {\varthetaup  }%
    \def\iota      {\iotaup      }%
    \def\kappa     {\kappaup     }%
    \def\lambda    {\lambdaup    }%
    \def\mu        {\muup        }%
    \def\nu        {\nuup        }%
    \def\xi        {\xiup        }%
    \def\pi        {\piup        }%
    \def\varpi     {\varpiup     }%
    \def\rho       {\rhoup       }%
    \def\varrho    {\varrhoup    }%
    \def\sigma     {\sigmaup     }%
    \def\varsigma  {\varsigmaup  }%
    \def\tau       {\tauup       }%
    \def\upsilon   {\upsilonup   }%
    \def\phi       {\phiup       }%
    \def\varphi    {\varphiup    }%
    \def\chi       {\chiup       }%
    \def\psi       {\psiup       }%
    \def\omega     {\omegaup     }%
  }%
}
\let\apaSixmatrix\apaSixvector


\newcounter{appendix}\setcounter{appendix}{0}
\renewcommand{\theappendix}{\@Alph\c@appendix}
\def\apaSixappfig{%
 \renewcommand\thefigure{\theappendix\@arabic\c@figure}%
 \ifapamodeman{\renewcommand\thepostfig{\theappendix\arabic{postfig}}}{}}
\def\apaSixapptab{%
 \renewcommand\thetable{\theappendix\@arabic\c@table}%
 \ifapamodeman{\renewcommand\theposttbl{\theappendix\arabic{posttbl}}}{}}
\newif\ifoneappendix
\oneappendixtrue % one appendix by default
\newif\ifappendix
\appendixfalse

\def\appendix{%
  \ifapamodeman{\processdelayedfloats}{}%  BDB -- output all tables and figures prior to the appendix
  \appendixtrue
  \apaSixappfig
  \apaSixapptab
  \let\old@apaSix@section=\section % This will not work right with five levels in appendix.
                                 % Should go into \section, not \leveltwo but would also require
                                 % changes to section* and section[ (see \def\section above)
                                 % Who uses five level heading appendices anyway?
  \long\def\section##1{%
                   \makeatletter%
                     \def\@currentlabelname{##1}%
                   \makeatother%
                   \ifapamodeman{%
                    \clearpage
                    \setcounter{postfig}{0}
                    \setcounter{posttbl}{0}
                   }{%
                   }%
                    \setcounter{figure}{0}%
                    \setcounter{table}{0}%
                    \vskip2.5ex%
                   \refstepcounter{appendix}% 2002/07/20 this takes care of references too
                   \ifnum\c@appendix>1\immediate\write\@auxout{\global\string\oneappendixfalse}\fi%
                      \centerline{\normalfont\normalsize\appendixname\ifoneappendix\else~\theappendix\fi}%
                      \centerline{##1}\par%
                      \setlength{\parindent}{0.4in}
                      \makeatletter%
                        \@afterindentfalse%
                        \@afterheading%
                      \makeatother%
                  }%
} % end of appendix definition


%%%%%%%%%%%%%%%%%%%%%%%%%
%%                     %%
%%  MANUSCRIPT FORMAT  %%
%%                     %%
%%%%%%%%%%%%%%%%%%%%%%%%%

\@ifundefined{def@man}{}{%

\def\@@spacing{1.75}

\newcommand{\@doublespacing}{\linespread{1.655}}
\@doublespacing

\captionsetup[table]{skip=10pt}
\captionsetup[figure]{skip=10pt}

\def\rightheader#1{\def\r@headr{\protect\MakeUppercase{#1}}}
\def\leftheader#1{\def\r@headl{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\newcommand{\shorttitle}[1]{\def\@shorttitle{#1}}



\newcommand\@tcolor{black}
\newcommand\@pcolor{black}
\newcommand{\bl}{}
\newcommand{\hlinec}{\hline}

\raggedright

\RequirePackage{fancyhdr}
\setlength{\headheight}{15.4pt}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}

\fancypagestyle{titlepage}{%
    \lhead{{\bf\rheadname}: \@shorttitle}%
    \rhead{\thepage}%
}
\fancypagestyle{otherpage}{%
    \lhead{\MakeUppercase{\@shorttitle}}%
    \rhead{\thepage}%
}
\pagestyle{otherpage}


%% added by BDB to make section heading non-bolface
%% \@ifundefined{@acks}{}{\newpage\section{\acksname}\@acks}


\let\@noendfloattab\table% BDB
\let\@noendfloatfig\figure% BDB


\RequirePackage[notablist,figlist,notabhead,nofighead,tablesfirst,nomarkers]{endfloat}[1995/10/11]
%%
%% El paquete endfloat no tiene soporte para unicode, esto causa que el
%% documento no compile por caracteres no definidos. 
%% Las siguientes dos lineas son para corregir el problema.
%%
\renewcommand\efloat@iwrite[1]{%
   \immediate\expandafter\protected@write\csname efloat@post#1\endcsname{}}



\def\@gobbleuntilnext[#1]{}
\let\eatarg\@gobbleuntilnext
\let\ifnextchar\@ifnextchar

\@ifundefined{def@floatsintext}{%  Guillaume Jourjon 19/10/10
  \def\figure{%
      \ifappendix
          \vspace*{\intextsep}
          \def\fps@figure{!hbt}%
          \@noendfloatfig
      \else
           \efloat@condopen{fff}
           \efloat@iwrite{fff}{\string\begin{figure*}[hbt]}%
           \global\def\@figure@written{\relax}% Set a flag that there is at least one figure -- thp 20010705
      %% should be a global declaration to be "visible" at end document
           \ifnextchar[{\gobbleuntilnext[}{}
           \efloat@iwrite{fff}{\string\ifnextchar[{\string\eatarg}{}}
          \def\@currenvir{efloat@float}%
          \begingroup%
          \let\do\ef@makeinnocent \dospecials%
          \ef@makeinnocent\^^L% and whatever other special cases
          \endlinechar`\^^M \catcode`\^^M=12 \ef@xfigure%
      \fi%
  }%

  \def\table{%
      \ifappendix
          \vspace*{\intextsep}
          \def\fps@table{!hbt}
          \@noendfloattab
      \else
          \efloat@condopen{ttt}
          \efloat@iwrite{ttt}{\string\begin{table*}[hbt]}%
          \ifnextchar[{\gobbleuntilnext[}{}
          \@ifundefined{hrm}{}{%
          \efloat@iwrite{ttt}{\string\sf}}%
          \efloat@iwrite{ttt}{\string\ifnextchar[{\string\eatarg}{}} % bj
          \def\@currenvir{efloat@float}%
          \begingroup
          \let\do\ef@makeinnocent \dospecials
          \ef@makeinnocent\^^L% and whatever other special cases
          \endlinechar`\^^M \catcode`\^^M=12 \ef@xtable%
      \fi
  }%

  \AtEndPreamble{%
    \@ifpackageloaded{rotating}{%
      \DeclareDelayedFloatFlavor{sidewaystable}{table}
      \DeclareDelayedFloatFlavor{sidewaysfigure}{figure}
      }{}%
  }%

}{%
  \RequirePackage{float}
  \floatplacement{figure}{htb}
  \def\figure{\@float{figure}}
  \def\endfigure{\end@float}

  \floatplacement{table}{htb}
  \def\table{\@float{table}}
  \def\endtable{\end@float}
}

%%%%%%%%%%%%%%\long\def\@@contentsline#1#2#3{ #2 }
%%%%%%%%%%%%%%\long\def\numberline#1#2{\noindent{\em\figurename\ #1.\/} #2\vspace{0.5\baselineskip}\par}
%%%%%%%%%%%%%%\long\def\@@caption{\refstepcounter\@captype \@dblarg{\@@@caption\@captype}}
%%%%%%%%%%%%%%\long\def\@@@caption#1[#2]#3{\addcontentsline{\csname
%%%%%%%%%%%%%%  ext@#1\endcsname}{#1}{\protect\numberline{\csname
%%%%%%%%%%%%%%  the#1\endcsname}{\ignorespaces #2}}}


\def\processfigures{%
 \expandafter\ifnum \csname @ef@fffopen\endcsname>0
  \immediate\closeout\efloat@postfff \ef@setct{fff}{0}
  \clearpage
  \if@figlist
   \@ifundefined{@figure@written}{}{%
    {\normalsize\@ifundefined{hrm}{}{\sf}%
    }
   }
  \fi
  \@ifundefined{fig@num}{%
   \pagestyle{otherpage}
  }{%
  \setcounter{page}{1}
   \def\@oddhead{\rightmark}                                    % changed by Michael Erickson
   \markright{\hfill \s@titlesp, \figurename\ \protect\thefigure} % to include appendix numbering
                                                                % remove rm - thp 020227
  }
  \def\baselinestretch{\@@spacing}\normalsize\@ifundefined{hrm}{}{\sf}
  \processfigures@hook \@input{\jobname.fff}
 \fi}

\def\processtables{%
  \expandafter\ifnum \csname @ef@tttopen\endcsname>0
  \immediate\closeout\efloat@postttt \ef@setct{ttt}{0}
  \clearpage
  \if@tabhead
      \section*{\tablesection}
      \suppressfloats[t]
  \fi
  \def\baselinestretch{\@@spacing}
  \processtables@hook \@ifundefined{hrm}{}{\sf}%
  \tiny\normalsize%
  \let\BBAB\table@BBAB%  -- thp 2005/07/23
  \@input{\jobname.ttt}%
  \let\BBAB\normal@BBAB% -- thp 2005/07/23
 \fi}


\captionsetup{justification=raggedright}

%%
%% Numeracion de lineas
%%
%% Se llama el paquete lineno para la numeracion de lineas
%% pero es necesario llamar antes el amsmath, ya que ambos
%% redefinen los entornos de ecuaciones. Si se llama amsmath
%% despues de lineno los parrafos que contienen ecuaciones
%% no quedan numerados.

\@ifundefined{def@amsmath}{}{%
	\RequirePackage{amsmath}
}
\RequirePackage{lineno}
\renewcommand\ctsDIGIprintbibliography{%
\nolinenumbers
\printbibliography
}

\def\maketitle{
\@ifundefined{hrm}{}{\hrm}
 \check@author

  \begin{center}
%  \vspace*{0.5in}

  \vspace*{1in}
  {\bf\@titlesp}%
  \ifapamodeman{%
    \@ifundefined{def@noextraspace}{%
      \vspace{0.25in}\\
    }{}
  }{%
    \vspace{0.25in}\\
  }
  
%  \vspace*{1in}
  {\bf\@titleen}%
  \ifapamodeman{%
    \@ifundefined{def@noextraspace}{%
      \vspace{0.25in}\\
    }{}
  }{%
    \vspace{0.25in}\\
  }

  \@ifundefined{apaSix@maskauthoridentity}{%  BDB

      \@ifundefined{@authorTwo}{
      \@author \\

      \@affil \vspace{0.25in} \\ }{
      \@ifundefined{@authorThree}{
      \@authorOne \\

      \@affilOne \vspace{0.2in} \\
      \@authorTwo \\

      \@affilTwo \vspace{0.25in} \\ }{
      \@ifundefined{@authorFour}{
      \@authorOne \\

      \@affilOne \vspace{0.2in} \\
      \@authorTwo \\

      \@affilTwo \vspace{0.2in} \\
      \@authorThree \\

      \@affilThree \vspace{0.25in} \\ }{
      \@ifundefined{@authorFive}{       %% 2006/01/05 added as contributed by Aaron Geller
      \@authorOne \\

      \@affilOne \vspace{0.2in} \\
      \@authorTwo \\

      \@affilTwo \vspace{0.2in} \\
      \@authorThree \\

      \@affilThree \vspace{0.2in} \\
      \@authorFour \\

      \@affilFour \vspace{0.25in} \\ }{ %% 2006/01/05 beginning of Aaron Geller contribution
      \@ifundefined{@authorSix}{ %% -- thp 2006/01/05
      \@authorOne \\

      \@affilOne \vspace{0.2in} \\
      \@authorTwo \\

      \@affilTwo \vspace{0.2in} \\
      \@authorThree \\

      \@affilThree \vspace{0.2in} \\
      \@authorFour \\

      \@affilFour \vspace{0.2in} \\ %% thp corrected distance to non-final value of 0.2in
      \@authorFive \\

      \@affilFive \vspace{0.25in} \\ }{%% 2006/01/05 end of Aaaron Geller contribution
    %% --- thp 2006/01/05 beginning of six-author display
      \@authorOne \\

      \@affilOne \vspace{0.2in} \\
      \@authorTwo \\

      \@affilTwo \vspace{0.2in} \\
      \@authorThree \\

      \@affilThree \vspace{0.2in} \\
      \@authorFour \\

      \@affilFour \vspace{0.2in} \\
      \@authorFive \\

      \@affilFive \vspace{0.2in} \\
      \@authorSix \\

      \@affilSix \vspace{0.25in} \\ }}}}}
    %% --- thp 2006/01/05 end of six-author display
      \@ifundefined{@note}
       {\vspace*{\baselineskip} }
       {\@note}
       
  }{%  mask author identity -- show nothing in the author or author note space
  }

  \end{center}
%%
%% Se muestra la direccion de contacto del autor
%%

  \@ifundefined{@mail}
    {\vspace*{\baselineskip} }
    {%
      {\contactname:} \@mail%
    }

%%
%% Se muestran las palabras clave (espanol)
%%

%%   \@ifundefined{@keywordssp}{}{%
%%      \vspace{1.0in}
%%      {\keywordspname:} \@keywordssp%
%%    }

%%
%% Se muestran los keywords (ingles)
%%

%%   \@ifundefined{@keywordsen}{}{%
%%      \vspace{0.2in}
%%      {\keywordenname:} \@keywordsen%
%%    }

  \@ifundefined{apaSix@maskauthoridentity}{
      \@ifundefined{@acks}
       {}
       {%
         \vfill%
         \begin{center}%
            \acksname%
         \end{center}%
         \protect\raggedright
         \setlength{\parindent}{0.4in}
         \indent\par\@acks%
       }
  }{%  mask author identity -- show nothing in the author or author note space
  }

  \newpage
  %BDB\hyphenpenalty 10000
%%
%% Se inicia la numeracion de lineas
%%
  \runninglinenumbers*
%%
%% Se muestra el resumen y palabras clave
%%
  \fussy
  \@ifundefined{@abstractsp}{}{%
    \section{\normalfont\normalsize\abstractspname}% BDB
    \noindent\@abstractsp\par% BDB\fussy
    \@ifundefined{@keywordssp}{}{%
     \setlength{\parindent}{0.4in}%
      \indent\textit{\keywordspname:} \@keywordssp%
    }
  }
%%
%% Se muestra el abstract y keywords
%%  
  \@ifundefined{@abstracten}{}{%
    \section{\normalfont\normalsize\abstractenname}% BDB
    \noindent\@abstracten\par% BDB
    \@ifundefined{@keywordssp}{}{%
     \setlength{\parindent}{0.4in}%
      \indent\textit{\keywordenname:} \@keywordsen%
    }%
    \newpage
  }

  \@ifundefined{def@donotrepeattitle}{
    \section{\protect\normalfont{\@titlesp}}
  }{}%
  \raggedright%
  \setlength{\parindent}{0.4in}%
}

\thispagestyle{titlepage}


\newcommand{\footmark}[1]{${}^{\mbox{\normalsize #1}}$}

%% added second set of braces around \em  to get citations in man mode -- tp 17/7/2000
%% then removed them again because they were cancelling application of em to the caption

\setcounter{topnumber}{1}
\def\topfraction{.7}
\setcounter{bottomnumber}{1}
\def\bottomfraction{.6}
\setcounter{totalnumber}{1}
\def\textfraction{0}
\def\floatpagefraction{.7}
\setcounter{dbltopnumber}{1}
\def\dbltopfraction{.7}
\def\dblfloatpagefraction{.7}
\def\dbltextfloatsep{\textfloatsep}

\fussy

\@ifundefined{def@nosf}{%
\def\helvetica{%
\ClassWarning{ctsDIGI}{ignored \string\helvetica\space (use helv option)}
}}{\def\helvetica{\relax}}



}% end of man mode (manuscript format)

%%%%%%%%%%%%%%%%%%%%
%%                %%
%% JOURNAL FORMAT %%
%%                %%
%%%%%%%%%%%%%%%%%%%%

\@ifundefined{def@jou}{}{%

\@ifundefined{def@amsmath}{}{%
	\RequirePackage{amsmath}
}
\renewcommand\ctsDIGIprintbibliography{\printbibliography}

\RequirePackage{mathptmx}
\RequirePackage{lettrine}
\RequirePackage{colortbl}
\RequirePackage{color}
\RequirePackage{mathtools}
\RequirePackage[dvipsnames]{xcolor}

\definecolor{VerdeDigi}{HTML}{00664F}
\newcommand\@tcolor{black}
\newcommand\@pcolor{}

\newcommand{\hruleA}{\hrulefill{\leavevmode\leaders\hrule height 1pt\hfill\kern\z@}}


\@ifundefined{def@neg}{%
  \renewcommand{\@pcolor}{VerdeDigi}}{%
  \renewcommand{\@pcolor}{white}}

\@ifundefined{def@ver}{%
  \renewcommand{\@tcolor}{black}}{%
  \renewcommand{\@tcolor}{white}
  \let\oldincludegraphics\includegraphics
  \renewcommand{\includegraphics}[2][width=\columnwidth]{\phantom{\oldincludegraphics[#1]{#2}}}%
}


\let\oldtable\table
\let\endoldtable\endtable
\renewenvironment{table}{\oldtable\color{\@tcolor}\sizeNueveymedio}{\endoldtable}





% define linea con grosor variable en pts
\def\vhrulefill#1{\leavevmode\leaders\hrule\@height#1\hfill \kern\z@}



\IfFileExists{flushend.sty}{\RequirePackage{flushend}}{}


\IfFileExists{ftnright.sty}{
 \let\savefootnoterule\footnoterule
 \let\save@makefntext\@makefntext
 \RequirePackage{ftnright}
 \let\footnoterule\savefootnoterule
 \let\@makefntext\save@makefntext
}{}


\def\rightheader#1{\def\r@headr{\protect\MakeUppercase{\protect\scriptsize #1}}}
\def\leftheader#1{\def\r@headl{\protect\MakeUppercase{\protect\scriptsize #1}}}
\def\r@headr{\protect\MakeUppercase{\protect\scriptsize\@shorttitle}}% BDB
%%%%%%%%%%%%%%%%%%%%%%%\def\shorttitle#1{\def\r@headr{\protect\MakeUppercase{\protect\scriptsize #1}}}% BDB

\def\put@one@authaffil#1#2{%
  \parbox[t]{\textwidth}{\begin{center}{\large #1\vspace{0in}}%
                        {\\ #2\vspace{0.05in}\\}\end{center}}}

\newsavebox\auone@box
\newsavebox\autwo@box
\newsavebox\autot@box
\newlength\auone@boxwidth
\newlength\autwo@boxwidth
\newlength\autot@boxwidth

\def\default@d@authaffil#1#2#3#4{%
        \parbox[t]{\columnwidth}{\begin{center}{\large #1\vspace{0in}}%
                                {\\ #2\vspace{0.05in}\\}\end{center}}%
        \parbox[t]{\columnwidth}{\begin{center}{\large #3\vspace{0in}}%
                                {\\ #4\vspace{0.05in}\\}\end{center}}}

\def\uneven@d@authaffil#1#2#3#4{%
     \hfill\parbox[t]{\auone@boxwidth}{\begin{center}{\large #1\vspace{0in}}%
                                      {\\ #2\vspace{0.05in}\\}\end{center}}\hfill\hfill%
           \parbox[t]{\autwo@boxwidth}{\begin{center}{\large #3\vspace{0in}}%
                                      {\\ #4\vspace{0.05in}\\}\end{center}}\hfill}

\def\put@two@authaffil#1#2#3#4{%
     \let\disp@authaffil\default@d@authaffil
     \sbox\auone@box{\begin{tabular}{c}\large #1\\ #2\end{tabular}}
     \settowidth{\auone@boxwidth}{\usebox\auone@box}
     \sbox\autwo@box{\begin{tabular}{c}\large #3\\ #4\end{tabular}}
     \settowidth{\autwo@boxwidth}{\usebox\autwo@box}
     \ifdim\auone@boxwidth<1.25\columnwidth
      \ifdim\autwo@boxwidth<1.25\columnwidth
       \sbox\autot@box{\usebox\auone@box\hspace{0.4in}\usebox\autwo@box}
       \settowidth{\autot@boxwidth}{\usebox\autot@box}
       \ifdim\autot@boxwidth<\textwidth
        \let\disp@authaffil\uneven@d@authaffil
       \fi
      \fi
     \fi
     \ifdim\auone@boxwidth<\columnwidth
      \ifdim\autwo@boxwidth<\columnwidth
       \let\disp@authaffil\default@d@authaffil
      \fi
     \fi
     \disp@authaffil{#1}{#2}{#3}{#4}
}
%%%%Modificando titulo de tipo Jou
%% title
%%%Formato del abstract

%%%A modificar si es Jou
\def\maketitle{
 \check@author
 \@ifundefined{r@headr}{\def\r@headr{\protect\MakeUppercase{\protect\scriptsize\@titlesp}}}{}
 \@ifundefined{r@headl}{\def\r@headl{\protect\MakeUppercase{\protect\scriptsize\@author}}}{}

\pagestyle{empty}
\addtolength{\hoffset}{-0.25in}
\twocolumn[  % anything appearing within the brackets is set in one-column mode
  \vspace{0.03in}
\begin{flushright}
\large
\bf
\color{\@pcolor}
Art\'{\i}culo Cient\'{\i}fico/ Scientific Article
\end{flushright}
  \begin{center}
  \vspace{-0.3cm}
  {\bf \LARGE \color{\@tcolor} \@titlesp}\\
  \vspace{0.4cm}
  {\it \large \color{\@tcolor} \@titleen}\\
  \vspace{-0.10in}

\@ifundefined{apaSix@maskauthoridentity}{%  BDB
%%%Editado para alinear autores

      \@ifundefined{@authorTwo}{
    % one author-affiliation
      \put@one@authaffil{\sizeOnce \color{\@pcolor} \@author \vspace{13.2pt}}{\small \color{\@tcolor} \@affil}}{
      \@ifundefined{@authorThree}{
    % two authors-affiliations
      \put@two@authaffil{\sizeOnce \color{\@pcolor} \@authorOne \vspace{13.2pt}}{\small \color{\@tcolor} \@affilOne}{\sizeOnce \color{\@pcolor} \@authorTwo \vspace{13.2pt}}{\small \color{\@tcolor} \@affilTwo}}{
      \@ifundefined{@authorFour}{
    % three authors-affiliations
      \@ifundefined{@twofirst}{
    % first one, then two
      \put@one@authaffil{\sizeOnce \color{\@pcolor} \@authorOne \vspace{13.2pt}}{\small \color{\@tcolor} \@affilOne}\vspace{-0.15in}\\
      \put@two@authaffil{\sizeOnce \color{\@pcolor} \@authorTwo \vspace{13.2pt}}{\small \color{\@tcolor} \@affilTwo}{\sizeOnce \color{\@pcolor} \@authorThree \vspace{13.2pt}}{\small \color{\@tcolor} \@affilThree}
      }{
    % first two, then one
      \put@two@authaffil{\sizeOnce \color{\@pcolor} \@authorOne \vspace{13.2pt}}{\small \color{\@tcolor} \@affilOne}{\sizeOnce \color{\@pcolor} \@authorTwo \vspace{13.2pt}}{\small \color{\@tcolor} \@affilTwo}\vspace{-0.15in}\\
      \put@one@authaffil{\sizeOnce \color{\@pcolor} \@authorThree \vspace{13.2pt}}{\small \color{\@tcolor} \@affilThree}
      }}{
      \@ifundefined{@authorFive}{ % 2006/01/05 as contributed by Aaron Geller
    % four authors-affiliations
%%%Color en los autores
      %\put@two@authaffil{\@authorOne}{\@affilOne}{\@authorTwo}{\@affilTwo}\vspace{-0.15in}\\
      %\put@two@authaffil{\@authorThree}{\@affilThree}{\@authorFour}{\@affilFour}}

\put@one@authaffil{\color{\@pcolor} \@authorOne, \@authorTwo, \@authorThree y \@authorFour}{\@affilOne, \@affilTwo, \@affilThree, \@affilFour} %%%Editado para cuatro autores en linea
      }{                          % 2006/01/05 beginning of Aaron Geller contribution
      \@ifundefined{@authorSix}{ % -- thp 2006/01/05
    % five authors-affiliations
      \put@two@authaffil{\@authorOne}{\@affilOne}{\@authorTwo}{\@affilTwo}\vspace{-0.15in}\\
      \put@two@authaffil{\@authorThree}{\@affilThree}{\@authorFour}{\@affilFour}%
      \vspace{-0.15in}\\ % thp added negative vertical space
      \put@one@authaffil{\@authorFive}{\@affilFive}
      }{                          % 2006/01/05 end of Aaron Geller contribution
    % six authors-affiliations
    %% --- thp 2006/01/05 beginning of six-author display
      \put@two@authaffil{\@authorOne}{\@affilOne}{\@authorTwo}{\@affilTwo}\vspace{-0.15in}\\
      \put@two@authaffil{\@authorThree}{\@affilThree}{\@authorFour}{\@affilFour}\vspace{-0.15in}\\
      \put@two@authaffil{\@authorFive}{\@affilFive}{\@authorSix}{\@affilSix}
    %% --- thp 2006/01/05 end of six-author display
      }}}}}
      \@ifundefined{@note}
       {\vspace{0.07in}}
       {\vspace{0.07in}\\ {\large\@note\vspace{0.07in}}}

  }{%  mask author identity -- show nothing in the author or author space
    \vspace{0.32in}
  }
 \end{center}
%%%Informacion del autor para dirigir correspondencia
\@ifundefined{@mail}
{{\footnotesize \color{\@pcolor}\par  \vspace{-0.07in} \hrulefill}}{
{\footnotesize \color{\@pcolor} \noindent \textbf{*Autor al que se dirige la correspondencia:} {\footnotesize \@mail} \par  \vspace{-0.07in} \hrulefill}} %%%a agregar campo para correo electronico una vez implementado.
%%%Agregando fechas administrativas al encabezado
\begin{flushright}
{\scriptsize
{\color{\@pcolor} Recibido: } {\color{\@tcolor} \@recibido \hspace{1ex} /}  \hspace{1ex} 
{\color{\@pcolor} Fecha de 1era revisi\'on:  } {\color{\@tcolor} \@frev \hspace{1ex} /}\hspace{1ex} 
{\color{\@pcolor} Fecha de 2nda revisi\'on:  } {\color{\@tcolor} \@srev}
{\color{\@pcolor} Aceptado: } {\color{\@tcolor} \@aceptado \hspace{1ex} /} \hspace{1ex} 
{\color{\@pcolor} Disponible en l\'{\i}nea: } {\color{\@tcolor} \@enlinea} \par}
\end{flushright}
 \@ifundefined{@abstractsp}
  {\par }
  {{\large \bf \color{\@pcolor} Resumen \par \vspace{-0.07in} \hrulefill} \vspace{0.07in} %%% Titulo del resumen
 %\par  % elimina espacio al inicio de resumen
 \noindent {\color{\@tcolor} \@abstractsp \par} 
{\color{\@pcolor}\vhrulefill{1pt}}
    {\footnotesize \@ifundefined{@keywordssp}{}{%
      \par\vspace{0.07in}\raggedright{\color{\@pcolor} \keywordspname:} {\color{\@tcolor} \@keywordssp}%
     }%
   }
   \vspace{0.24in}%
  }

 \@ifundefined{@abstracten}
  {\par }
  {{\large \bf \color{\@pcolor} Abstract \par \vspace{-0.07in} \hrulefill} \vspace{0.07in} %%% Titulo del resumen
 %\par % elimina espacio al inicio de resumen
 \noindent {\color{\@tcolor} \@abstracten \par} 
{\color{\@pcolor}\vhrulefill{1pt}}
    {\footnotesize \@ifundefined{@keywordsen}{}{%
      \par\vspace{0.07in}\raggedright{\color{\@pcolor} \keywordenname:} {\color{\@tcolor} \@keywordsen}%
     }%
   }
   \vspace{0.24in}%
  }

 ] % end of \twocolumn[]
\addtolength{\hoffset}{0.25in}

% Este es el color para el texto
\color{\@tcolor}
%%%Fin de modificacion

 \pagenumbering{arabic}
 \@ifundefined{@journal}{\thispagestyle{empty}}{%
  \@ifundefined{@vvolume}{\def\@vvolume{\strut}}{}%

\@ifundefined{@mnumber}{\def\@mnumber{\strut}}{}% numero no definido LG
\@ifundefined{@myear}{\def\@myear{\strut}}{}% anio no definido LG
\@ifundefined{@ISSN}{\def\@ISSN{\strut}}{}%ISSN no definido LG


  \@ifundefined{@copnum}{\def\@copnum{\strut}}{}%
  \@ifundefined{@ccoppy}{\def\@ccoppy{\strut}}{}%
  \fancyhead{}
  \fancyhead[LO]{\footnotesize{\it\@journal}\vspace{-0.15\baselineskip}\\
                 \footnotesize{Vol. \@vvolume \hspace{1em}  Num. \@mnumber \hspace{1em} \@myear}\\ %%Etiqueta del volumen
       \footnotesize{ISSN: \@ISSN}}
  \fancyhead[RO]{\stiny{\@ccoppy}\vspace{-0.15\baselineskip}\\
                 \stiny{\@copnum}}
  \fancyfoot[CO]{\small\rm\thepage}
  % the following are needed if the starting page number is changed to
  % an even number:
  \fancyhead[LE]{\stiny{\it\@journal}\vspace{-0.15\baselineskip}\\
                 \stiny{Vol. \@vvolume \hspace{1em}  Num. \@mnumber \hspace{1em} \@myear} \\
       \stiny{ISSN: \@ISSN}}

  \fancyhead[RE]{\stiny{\@ccoppy}\vspace{-0.15\baselineskip}\\
                 \stiny{\@copnum}}
  \fancyfoot[CE]{\small\rm\thepage}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
  \thispagestyle{fancy}
 }
%%%% LG

  \@ifundefined{apaSix@maskauthoridentity}{%  BDB
     \@ifundefined{@acks}
      {}
      {\begin{figure}[b]
       \parbox{\columnwidth}{\setlength{\parindent}{0.18in}
       \noindent\makebox[\columnwidth]{\vrule height0.125pt width\columnwidth}\vspace*{0.05in}\par
       {\footnotesize\hspace{-0.04in}\@acks\par}}
       \end{figure}}
  }{%  mask author identity -- show nothing in the author note space
  }

  \@ifundefined{apaSix@maskauthoridentity}{%  BDB
     \markboth{\hfill\r@headl\hfill}{\hfill\r@headr\hfill}
  }{%  mask author identity -- show the short title for both the left and right headers
     \markboth{\hfill\r@headr\hfill}{\hfill\r@headr\hfill}
  }
 \@ifundefined{no@tab}{\let\tabular\apaSixtabular}{}
 %\noindent
}

\newcommand\stiny{\@setfontsize\stiny\@vipt\@viipt}

% redefinir footnotesize
\renewcommand{\footnotesize}{\fontsize{8}{9.6}\selectfont}
% redefinir LARGE
\renewcommand{\LARGE}{\fontsize{16}{19.2}\selectfont}
% letra grande al inicio del parrafo
\newcommand{\bl}[1]{\lettrine[findent=-2pt]{#1}{ }}

\setlength{\arrayrulewidth}{0.5pt}

\newcommand{\hlinec}{\arrayrulecolor{\@pcolor}\hline}


\setlength{\footnotesep}{0.2813in}
\setlength{\topmargin}{-0.275in}
\addtolength{\headheight}{0.02in}
\addtolength{\headsep}{-0.156in}
%\setlength{\oddsidemargin}{\z@}
\setlength{\oddsidemargin}{0.25in}
\setlength{\evensidemargin}{\z@}
\setlength{\textwidth}{6.94in}
\addtolength{\textwidth}{-0.7in}
\setlength{\textheight}{8.4in} % altura de texto DIGI
\setlength{\columnwidth}{8.5cm}
\setlength{\columnsep}{0.25in}
\setlength{\parindent}{0.3in}
%%\setlength{\parskip}{0in}
\setlength{\textfloatsep}{0.35in}

\setcounter{secnumdepth}{0}

\def\ps@myheadings{%
  \let\@mkboth\@gobbletwo
  \def\@oddhead{\hbox{}\rightmark \hfil\rm\thepage}
  \def\@oddfoot{}
  \def\@evenhead{\rm\thepage\hfil\leftmark\hbox{}}
  \def\@evenfoot{}
  \def\sectionmark##1{}
  \def\subsectionmark##1{}
}
\pagestyle{myheadings}


\setcounter{topnumber}{2}
\def\topfraction{.85}
\setcounter{bottomnumber}{2}
\def\bottomfraction{.75}
\setcounter{totalnumber}{3}
\def\textfraction{.10}
\def\floatpagefraction{.85}
\setcounter{dbltopnumber}{2}
\def\dbltopfraction{.85}
\def\dblfloatpagefraction{.85}
\def\dbltextfloatsep{0.8\textfloatsep}
\let\footnotesize=\small

\def\helvetica{\relax}

\doublehyphendemerits5000
\hfuzz0pt
\tolerance=9999
\pretolerance=-1
\emergencystretch=25pt
\hbadness=30000
\hyphenpenalty=100

\@ifundefined{def@apacite}{}{% -- Philip Kime 2008/12/03
  % Removed some bibliography redefinitions as per the instructions of Erik Meijer
  \bibleftmargin=1.2em        % left these in because the default is too big
  \bibindent=-\bibleftmargin  % and this is apparently not refefined each time
  \renewcommand{\bibliographytypesize}{\footnotesize}}
\@ifundefined{def@natbib}{}{% -- Philip Kime 2008/12/03
  % Removed some bibliography redefinitions as per the instructions of Erik Meijer
  \bibleftmargin=1.2em        % left these in because the default is too big
  \bibindent=-\bibleftmargin  % and this is apparently not refefined each time
  \renewcommand{\bibliographytypesize}{\footnotesize}}


}% end of jou mode (journal format)

%%%%%%%%%%%%%%%%%%%%
%%                %%
%% REGULAR FORMAT %%
%%                %%
%%%%%%%%%%%%%%%%%%%%

\@ifundefined{def@doc}{}{%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\renewcommand{\shorttitle}[1]{\def\@shorttitle{#1}}

\def\leftheader#1{\def\r@headl{#1}}

\RequirePackage{fancyhdr}
\setlength{\headheight}{15.4pt}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}

\fancypagestyle{otherpage}{%
    \lhead{\MakeUppercase{\@shorttitle}}%
    \rhead{\thepage}%
}
\pagestyle{otherpage}

\def\maketitle{
 \global\@topnum\z@  % to prevent tables before the title   %% Erik Meijer, 2006/01/03
 \@ifundefined{@acks}{% if there acknowledgements they make up a "float" on the 1st page
 \global\@botnum\z@}{% to prevent tables on the first page  %% Erik Meijer, 2006/01/03
 \global\@botnum\@ne}% to prevent tables below the footnote -- thp 2006/01/10
 \check@author
 \@ifundefined{r@headr}{\typeout{Using title for running head}
                        \def\r@headr{\protect\MakeUppercase{\@title}}
                        \markright{\rm \@title \protect\\ \thepage}}{}
 \@ifundefined{r@headl}{\let\r@headl\r@headr}{}
 \@ifundefined{s@title}{\let\s@title\r@headr}{}
  \sloppy
  \setlength{\parindent}{0.4in}
  \begin{center}
   \@ifundefined{@journal}{}{%
    \@ifundefined{@vvolume}{\def\@vvolume{}}{}%
    \@ifundefined{@copnum}{\def\@copnum{}}{}%
    \@ifundefined{@ccoppy}{\def\@ccoppy{}}{}%
    {\scriptsize{\@journal}}\hspace{\fill}{\scriptsize{\@ccoppy}}\vspace{-0.3\baselineskip}\\
    {\scriptsize{\@vvolume}}\hspace{\fill}{\scriptsize{\@copnum}}\vspace{0.1in}\\
   }
  \vspace*{0.3in}

  {\LARGE \@title}\\

  \vspace{0.3in}
  \@ifundefined{apaSix@maskauthoridentity}{%  BDB

      \@ifundefined{@authorTwo}{
    % one author-affiliation
      {\Large \@author} \\

      \@affil \vspace{0.1in} \\ }{
      \@ifundefined{@authorThree}{
    % two authors-affiliations
      {\Large \@authorOne} \\

      \@affilOne \vspace{0.1in} \\
      {\Large \@authorTwo}\\

      \@affilTwo \vspace{0.1in} \\ }{
      \@ifundefined{@authorFour}{
    % three authors-affiliations
      {\Large \@authorOne} \\

      \@affilOne \vspace{0.1in} \\
      {\Large \@authorTwo}\\

      \@affilTwo \vspace{0.1in} \\
      {\Large \@authorThree}\\

      \@affilThree \vspace{0.1in} \\ }{
      \@ifundefined{@authorFive}{ %% 2006/01/05 added as contributed by Aaron Geller
    % four authors-affiliations
      {\Large \@authorOne} \\

      \@affilOne \vspace{0.1in} \\
      {\Large \@authorTwo}\\

      \@affilTwo \vspace{0.1in} \\
      {\Large \@authorThree}\\

      \@affilThree \vspace{0.1in} \\
      {\Large \@authorFour}\\

      \@affilFour \vspace{0.1in} \\ }{  %%% 2006/01/05 beginning of Aaron Geller contribution
      \@ifundefined{@authorSix}{ %% -- thp 2006/01/05
    % five authors-affiliations
      {\Large \@authorOne} \\

      \@affilOne \vspace{0.1in} \\
      {\Large \@authorTwo}\\

      \@affilTwo \vspace{0.1in} \\
      {\Large \@authorThree}\\

      \@affilThree \vspace{0.1in} \\
      {\Large \@authorFour}\\

      \@affilFour \vspace{0.1in} \\
      {\Large \@authorFive}\\

      \@affilFive \vspace{0.1in} \\ }{  %%% 2006/01/05 end of Aaron Geller contribution
    % six authors-affiliations
    %% --- thp 2006/01/05 beginning of six-author display
      {\Large \@authorOne} \\

      \@affilOne \vspace{0.1in} \\
      {\Large \@authorTwo}\\

      \@affilTwo \vspace{0.1in} \\
      {\Large \@authorThree}\\

      \@affilThree \vspace{0.1in} \\
      {\Large \@authorFour}\\

      \@affilFour \vspace{0.1in} \\
      {\Large \@authorFive}\\

      \@affilFive \vspace{0.1in} \\
      {\Large \@authorSix}\\

      \@affilSix \vspace{0.1in} \\ }
    %% --- thp 2006/01/05 end of six-author display
    }}}}
    %
      \@ifundefined{@note}
       {\vspace*{\baselineskip} }
       {\@note\vspace{0.2in}}

  }{%  mask author identity -- show nothing in the author note space
  }

  \@ifundefined{@abstract}{}{%
   {\abstractname}\vspace{0.1in}% BDB

   \parbox{5in}{\@abstract%
     \@ifundefined{@keywords}{}{%
       \par\vspace{0.12in}\textit{\keywordname:} \@keywords%
     }%
   }\vspace{0.25in}%
  }
  \end{center}
 \pagenumbering{arabic}
 \thispagestyle{empty}

  \@ifundefined{apaSix@maskauthoridentity}{%  BDB

     \@ifundefined{@acks}
      {}
      {\begin{figure}[b]
       \parbox{\textwidth}{ \setlength{\parindent}{0.2in}
       \noindent \makebox[\linewidth]{\vrule height0.125pt width\linewidth}

       \vspace*{0.05in}
       {\footnotesize
       \indent \@acks

       }}
       \end{figure}}

  }{%  mask author identity -- show nothing in the author note space
  }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 \markboth{\hfill \r@headl \hfill}{\hfill \r@headr \hfill}
 \let\tabular\apaSix@doc@tabular% -- thp 2006/01/02
 \let\endtabular\apaSix@doc@endtabular% -- thp 2006/01/03
}

\setlength{\topmargin}{-0.25in}
\setlength{\oddsidemargin}{0.25in}
\setlength{\evensidemargin}{0.25in}
\setlength{\textwidth}{6in}
\setlength{\textheight}{8.5in}
\setcounter{secnumdepth}{0}
\flushbottom

\setlength{\headwidth}{\textwidth}

\setcounter{topnumber}{2}
\def\topfraction{.7}
\setcounter{bottomnumber}{2}
\def\bottomfraction{.6}
\setcounter{totalnumber}{3}
\def\textfraction{.2}
\def\floatpagefraction{.7}
\setcounter{dbltopnumber}{2}
\def\dbltopfraction{.8}
\def\dblfloatpagefraction{.8}
\def\dbltextfloatsep{0.8\textfloatsep}

\def\helvetica{\relax}
%%\def\timesroman{\relax}%    Commented out all \timesroman -- thp 2005/07/23

\@ifundefined{def@apacite}{}{% -- Philip Kime 2008/12/03
  % Removed defs as per the instructions of Erik Meijer -- thp 2005/07/23
  \renewcommand{\bibliographytypesize}{\small}}
\@ifundefined{def@natbib}{}{% -- Philip Kime 2008/12/03
  % Removed defs as per the instructions of Erik Meijer -- thp 2005/07/23
  \renewcommand{\bibliographytypesize}{\small}}


}% end of doc mode (regular LaTeX format)



\let\ignore\@gobble

\@ifundefined{def@apacite}{}{% -- Philip Kime 2008/12/03
  \bibliographystyle{apacite}
  %
  % Thanks to Donald Arsenau for the right way to ignore \bibliographystyle
  %
  \def\bibliographystyle#1{\ClassWarning{ctsDIGI}{\string\bibliographystyle\space
      command ignored}}}

\@ifundefined{def@natbib}{}{% -- Philip Kime 2008/12/03
  \bibliographystyle{apacite}
  %
  % Thanks to Donald Arsenau for the right way to ignore \bibliographystyle
  %
  \def\bibliographystyle#1{\ClassWarning{ctsDIGI}{\string\bibliographystyle\space
      command ignored}}}


%% 
%% Copyright (C) 2011-2016 by Brian D. Beitzel <brian at beitzel.com>
%% 
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License (LPPL), either
%% version 1.3c of this license or (at your option) any later
%% version.  The latest version of this license is in the file:
%% 
%% http://www.latex-project.org/lppl.txt
%% 
%% Users may freely modify these files without permission, as long as the
%% copyright line and this statement are maintained intact.
%% 
%% This work is not endorsed by, affiliated with, or probably even known
%% by, the American Psychological Association.
%% 
%% 
%% This work is "maintained" (as per LPPL maintenance status) by
%% Brian D. Beitzel.
%% 
%% This work consists of the file  apa6.dtx
%% and the derived files           apa6.ins,
%%                                 apa6.cls,
%%                                 apa6.pdf,
%%                                 README,
%%                                 APAamerican.txt,
%%                                 APAbritish.txt,
%%                                 APAdutch.txt,
%%                                 APAenglish.txt,
%%                                 APAgerman.txt,
%%                                 APAngerman.txt,
%%                                 APAgreek.txt,
%%                                 APAczech.txt,
%%                                 APAturkish.txt,
%%                                 APAendfloat.cfg,
%%                                 apa6.ptex,
%%                                 TeX2WordForapa6.bas,
%%                                 Figure1.pdf,
%%                                 shortsample.tex,
%%                                 longsample.tex, and
%%                                 bibliography.bib.
%% 
%%
%% End of file `apa6.cls'.
