\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ta-its}[2011/12/23 My Class]
\LoadClass[11pt,a5paper,twoside]{book}
\RequirePackage[tmargin=2.5cm,bmargin=2.5cm,lmargin=2.5cm,rmargin=2.0cm]{geometry}
\RequirePackage{fontspec}
    \setsansfont{Trebuchet MS}
    \setmainfont{Times New Roman}
    \setmonofont[Scale=0.9]{Courier New}
\RequirePackage{tocbibind}
\RequirePackage{graphicx}
\RequirePackage{eso-pic}
\RequirePackage[bahasa]{babel}

% Indent paragraf setelah section
\RequirePackage{indentfirst}

\RequirePackage{enumitem}
    \setlist{nolistsep}
\RequirePackage{array,etoolbox}
    \preto\tabular{\setcounter{magicrownumbers}{0}}
    \preto\longtable{\setcounter{magicrownumbers}{0}}
    \preto\tabularx{\setcounter{magicrownumbers}{0}}
    \preto\tabulary{\setcounter{magicrownumbers}{0}}
    \newcounter{magicrownumbers}
    \newcommand\rownumber{\stepcounter{magicrownumbers}\arabic{magicrownumbers}}

\RequirePackage{setspace}
    \singlespacing
\RequirePackage{fancyhdr}
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
	\fancypagestyle{front}{%
		\fancyhf{}
		\cfoot{\thepage}
	}
	\fancypagestyle{main}{%
		\fancyhf{}
		\lhead[\thepage]{}
		\rhead[]{\thepage}
	}

\makeatletter
\renewcommand\frontmatter{%
	\cleardoublepage
	\@mainmatterfalse
	\pagestyle{front}
	\pagenumbering{roman}}

\renewcommand\mainmatter{%
	\cleardoublepage
	\@mainmattertrue
	\pagestyle{main}
	\fancypagestyle{plain}{%
		\fancyhf{}
		\rfoot[]{\thepage}
	}
	\pagenumbering{arabic}}
\makeatother

\RequirePackage[hypcap=true]{caption}
    \captionsetup{labelfont=bf, justification=centering, singlelinecheck=false, format=plain}

\RequirePackage{tabulary, booktabs, longtable, ltcaption, ltabptch}
\RequirePackage[referable]{threeparttablex}

%% define a new envrionment which marries longtable with tabulary
% from http://tex.stackexchange.com/questions/78075/multi-page-with-tabulary (see there for usage)
% with modifications taken from the ltxtable package to make captions work
\makeatletter
\newcommand*\TY@cap@gobble[2][]{\\}% from ltxtable (adjusted)
\def\ltabulary{%
    \def\caption{% from ltxtable (adjusted)
        \@ifstar\TY@cap@gobble\TY@cap@gobble}
    \def\endfirsthead{\\}%
    \def\endhead{\\}%
    \def\endfoot{\\}%
    \def\endlastfoot{\\}%
    \def\tabulary{%
        \def\TY@final{%
    \def\endfirsthead{\LT@end@hd@ft\LT@firsthead}%
    \def\endhead{\LT@end@hd@ft\LT@head}%
    \def\endfoot{\LT@end@hd@ft\LT@foot}%
    \def\endlastfoot{\LT@end@hd@ft\LT@lastfoot}%
    \longtable}%
        \let\endTY@final\endlongtable
        \TY@tabular}%
    \dimen@\columnwidth
    \advance\dimen@-\LTleft
    \advance\dimen@-\LTright
    \tabulary\dimen@}
\def\endltabulary{\endtabulary}
\makeatother

\RequirePackage{titlesec}
    \titleformat{\chapter}[display]{\filcenter\fontsize{11}{11}\bfseries}{\chaptername \ \thechapter}{11pt}{\filcenter\fontsize{11}{11}\bfseries\uppercase}
    \titlespacing*{\chapter}{0pt}{-50pt}{40pt}
    %\titlespacing*{\section}{0pt}{11pt}{0pt}
    %\titlespacing*{\subsection}{0pt}{11pt}{0pt}
    %\titlespacing*{\subsubsection}{0pt}{11pt}{0pt}
    \titleformat*{\section}{\fontsize{11}{11}\bfseries}
    \titleformat*{\subsection}{\fontsize{11}{11}\bfseries}
    \titleformat*{\subsubsection}{\fontsize{11}{11}\bfseries}

\addto\captionsbahasa{%
	\renewcommand\bibname{DAFTAR PUSTAKA}%
	\renewcommand\contentsname{DAFTAR ISI}%
	\renewcommand\listtablename{DAFTAR TABEL}%
	\renewcommand\listfigurename{DAFTAR GAMBAR}%
	\renewcommand\chaptername{BAB}%
}%


\renewcommand*\thechapter{\arabic{chapter}}
\newcommand{\pic}{Gambar}
\newcommand{\tab}{Tabel}
\newcommand{\code}{Kode}

\newcommand{\judul}{}
\newcommand{\kodeTA}{}
\newcommand{\judulEnglish}{}
\newcommand{\penulis}{}
\newcommand{\nrp}{}
\newcommand{\gelar}{}
\newcommand{\jurusan}{}
\newcommand{\jurusanEnglish}{}
\newcommand{\fakultas}{}
\newcommand{\fakultasSingkatan}{}
\newcommand{\fakultasEnglish}{}
\newcommand{\prodi}{}
\newcommand{\bidangStudi}{}
\newcommand{\pembimbingSatu}{}
\newcommand{\nipPembimbingSatu}{}
\newcommand{\tahun}{\monthnamebahasa}
\newcommand{\bulan}{}

% Empty Even Page
\makeatletter
\def\emptypage@emptypage{%
     \begin{center}
     \emph{Halaman ini sengaja dikosongkan}
     \end{center}
     \newpage%
}%
\def\cleardoublepage{%
        \clearpage%
        \if@twoside%
            \ifodd\c@page%
                % do nothing
            \else%
                \emptypage@emptypage%
            \fi%
        \fi%
}%
\makeatother

% Custom \title, \author, \institution
\renewcommand{\title}[3]{%
\renewcommand{\judul}{#1}%
\renewcommand{\judulEnglish}{#2}%
\renewcommand{\kodeTA}{#3}%
}%

\renewcommand{\author}[2]{%
\renewcommand{\penulis}{#1}%
\renewcommand{\nrp}{#2}%
}%

\newcommand{\supervisorOne}[2]{
\renewcommand{\pembimbingSatu}{#1}%
\renewcommand{\nipPembimbingSatu}{#2}%
}

\newcommand{\supervisorTwo}[2]{
\newcommand{\pembimbingDua}{#1}%
\newcommand{\nipPembimbingDua}{#2}%
}

\newcommand{\degree}[8]{
\renewcommand{\gelar}{#1 }
\renewcommand{\bidangStudi}{#2 }
\renewcommand{\prodi}{#3 }
\renewcommand{\jurusan}{#4 }
\renewcommand{\jurusanEnglish}{#5 }
\renewcommand{\fakultas}{#6 }
\renewcommand{\fakultasSingkatan}{#7 }
\renewcommand{\fakultasEnglish}{#8 }
}

\renewcommand{\time}[2]{
\renewcommand{\bulan}{#1 }
\renewcommand{\tahun}{#2 }

}

\newpage
% Custom \maketitle
\makeatletter
\def\maketitle{%
\newpage%
    \newgeometry{top=7cm,left=2cm,bottom=2cm}%
    \sffamily%
    \thispagestyle{empty}%
    \color{white}%
    { \noindent TUGAS AKHIR - \kodeTA }\\*[10pt]%
    {\large\textbf{\MakeUppercase{\judul}}} \\*[32pt]%
    \MakeUppercase{\penulis} \\*%
    NRP \nrp \\*[10pt]%
    Dosen Pembimbing \\*%
    \pembimbingSatu \\
    \ifdef{\pembimbingDua}{\pembimbingDua}{} \\*[10pt]%
    JURUSAN \MakeUppercase{\jurusan} \\*%
    Fakultas \fakultas \\*%
    Institut Teknologi Sepuluh Nopember \\*%
    Surabaya, \tahun \\*%
    \AddToShipoutPictureBG*{\includegraphics[width=\paperwidth,height=\paperheight]{img/sampul.png}}%
    \rmfamily%
    \normalsize%
    \restoregeometry%
    \color{black}%
    \cleardoublepage%
\newpage%
    \newgeometry{top=7cm,left=2cm,bottom=2cm}%
    \sffamily%
    \thispagestyle{empty}%
    { \noindent TUGAS AKHIR - \kodeTA }\\*[10pt]%
    {\large\textbf{\MakeUppercase{\judul}}} \\*[32pt]%
    \MakeUppercase{\penulis} \\*%
    NRP \nrp \\*[10pt]%
    Dosen Pembimbing\\*%
    \pembimbingSatu \\%
    \ifdef{\pembimbingDua}{\pembimbingDua}{} \\*[10pt]%
    JURUSAN \MakeUppercase{\jurusan} \\*%
    Fakultas \fakultas \\*%
    Institut Teknologi Sepuluh Nopember \\*%
    Surabaya, \tahun \\*%
    \AddToShipoutPictureBG*{\includegraphics[width=\paperwidth,height=\paperheight]{img/sampulWhite.png}}%
    \rmfamily%
    \normalsize%
    \restoregeometry%
    \cleardoublepage%
\newpage%
    \newgeometry{top=7cm,left=2cm,bottom=2cm}%
    \sffamily%
    \thispagestyle{empty}%
    { \noindent UNDERGRADUATE THESIS - \kodeTA }\\*[10pt]%
    {\large\textbf{\MakeUppercase{\judulEnglish}}} \\*[32pt]%
    \MakeUppercase{\penulis} \\*%
    NRP \nrp \\*[10pt]%
    Supervisor \\*%
    \pembimbingSatu \\*[10pt]%
    \ifdef{\pembimbingDua}{\pembimbingDua}{} \\*[10pt]%
    Department of \MakeUppercase{\jurusanEnglish} \\*%
    Faculty of \fakultasEnglish \\*%
    Institut Teknologi Sepuluh Nopember \\*%
    Surabaya, \tahun \\*%
    \AddToShipoutPictureBG*{\includegraphics[width=\paperwidth,height=\paperheight]{img/sampulWhite.png}}%
    \rmfamily%
    \normalsize%
    \restoregeometry%
    \cleardoublepage%
}%
\makeatother

% lembarpengesahan
\makeatletter
\def\legalityPaper{%
\newpage%
    \begin{centering}%
        \textbf{\MakeUppercase{\judul}} \\*[10pt]%
        \textbf{\large{TUGAS AKHIR}} \\*%
        Diajukan Guna Memenuhi Salah Satu Syarat \\*%
        Memperoleh Gelar \gelar \\*%
        pada \\*%
        Bidang Studi \bidangStudi \\*%
        Program Studi \prodi  Jurusan \jurusan \\*%
        Fakultas \fakultas \\*%
        Institut Teknologi Sepuluh Nopember \\*[10pt]%
        Oleh : \\*%
        \textbf{\penulis} \\*%
        NRP: \nrp \\*[20pt]%
    \end{centering}%

    {\noindent Disetujui oleh Dosen Pembimbing Tugas Akhir :}\\*[20pt]         \pembimbingSatu \hfill \hfill   .......................... \\ NIP: \nipPembimbingSatu \hfill \hfill (Pembimbing 1) \\*[20pt]%
    %
    \ifdef{\pembimbingDua}{{\noindent \pembimbingDua  \hfill \hfill ...........................}  \\ NIP: \nipPembimbingDua \hfill \hfill (Pembimbing 2) \\*[20pt]}{}%

    \begin{centering}%
        \textbf{SURABAYA} \\*
        \textbf{\bulan \tahun} \\*%
    \end{centering}%
    \cleardoublepage%
}%
\makeatother

% Environment
% abstrak
\newenvironment{abstrak}{
\addcontentsline{toc}{chapter}{ABSTRAK}
\begin{centering}
\textbf{\MakeUppercase{\judul}}
\end{centering}

\begin{tabular}{ll}
Nama  & : \MakeUppercase{\penulis} \\
NRP & : \nrp \\
Jurusan  & : \jurusan \fakultasSingkatan \\
Pembimbing I  & : \pembimbingSatu
\ifdef{\pembimbingDua}{\\Pembimbing II  & : \pembimbingDua}{}
\end{tabular}
\\*[20pt]
\begin{centering}
\textbf{Abstrak}
\end{centering}\\
}{}

% abstract
\newenvironment{abstract}{
\addcontentsline{toc}{chapter}{ABSTRACT}
\begin{centering}
\textbf{\MakeUppercase{\judulEnglish}}
\end{centering}

\begin{tabular}{ll}
Name  & : \MakeUppercase{\penulis} \\
NRP & : \nrp \\
Major  & : \jurusanEnglish \fakultasSingkatan \\
Supervisor I  & : \pembimbingSatu
\ifdef{\pembimbingDua}{\\Supervisor II  & : \pembimbingDua}{}
\end{tabular}
\\*[20pt]
\begin{centering}
\textbf{Abstract}
\end{centering}\\
}{}

\endinput
