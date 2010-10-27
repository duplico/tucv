\ProvidesClass{resume}
\LoadClass[letterpaper,11pt]{article}

% Margin setup
\setlength{\voffset}{0.1in}
\setlength{\paperwidth}{8.5in}
\setlength{\paperheight}{11in}
\setlength{\headheight}{0in}
\setlength{\headsep}{0in}
\setlength{\textheight}{11in}
\setlength{\textheight}{9.5in}
\setlength{\topmargin}{-0.25in}
\setlength{\textwidth}{7in}
\setlength{\oddsidemargin}{-0.25in}
\setlength{\evensidemargin}{-0.25in}
\raggedbottom
\raggedright
\setlength{\tabcolsep}{0in}
\pagestyle{empty}

% Package requirements
%\usepackage{tabularx}
\usepackage{array}
\usepackage{color}
\usepackage{calc}

% Color definition
\definecolor{mygrey}{gray}{0.85}

% Custom commands

% Resume heading. Heading inside a shaded box.
\newcommand{\resheading}[1]{{\large \colorbox{mygrey}{\begin{minipage}
    {\textwidth-6.0pt}{\textbf{#1 \vphantom{p\^{E}}}}\end{minipage}}}}

% Raw two-column resume entry
\newcommand{\resentry}[3][0pt]{
    \begin{tabular*}{0.9\textwidth}[t]{@{\hspace{#1}}p{5.0in-#1}@{\extracolsep{\fill}}p{0.75in}}
        \raggedright #2 & #3
        \tabularnewline
    \end{tabular*}
}

% Raw indented two-column resume entry
\newcommand{\ressubentry}[2]{
    \resentry[10pt]{
        \setlength{\parskip}{1ex plus 0.5ex minus 0.2ex}
        #1}{#2}
}

% Raw single-column resume entry
\newcommand{\resentrysinglecol}[2][0pt]{
    \begin{tabular*}{0.9\textwidth}[t]{@{\hspace{#1}}p{0.9\textwidth-#1}}
        #2
        \tabularnewline
    \end{tabular*}
}

% Raw indented one-column resume entry
\newcommand{\ressubentrysinglecol}[1]{
    \resentrysinglecol[10pt]{
        \setlength{\parskip}{1ex plus 0.5ex minus 0.2ex}
        #1}
}

% Resume subheading:
\newcommand{\ressubheading}[4]{
    \resentry{\textbf{#1} \newline #3}{#2 \newline #4}    
}

% Resume subheading with extra information (trailing in left column)
\newcommand{\ressubheadingextra}[5]{
    \resentry{\textbf{#1} \newline #3 \newline #5}{#2 \newline #4}
}

% Specific entry types:

% Education:

% School entry:
% School, Location
\newcommand{\resschool}[2]{
    \resentry{\textbf{#1}}{#2}
}

% School entry with extra description:
% School, Location, Description
\newcommand{\resschoolextra}[3]{
    \resentry{\textbf{#1} \newline #3}{#2}
}

% Degree entry:
% Degree, Major, Date
\newcommand{\resdegree}[3]{
    \ressubentry{#1 in #2}{#3}
}

% Degree entry with extra description:
% Degree, Major, Date, Description
\newcommand{\resdegreeextra}[4]{
    \ressubentry{#1 in #2 \newline \textit{#4}}{#3}
}

% Combined school and degree (plus other) entry:
% University, Degree, Major, Date, Location, Other
\newcommand{\reseducation}[6]{
    \ressubheadingextra{#1}{#5}{#2 #3}{#4}{#6}
}

% Work experience:
% Employer entry:
% Employer, Location, Description
\newcommand{\resemployer}[3]{
    \resentry{\textbf{#1} \newline #3}{#2}
}

% Job entry (part of an employer block):
% Title, Start Date, End Date, Description
\newcommand{\resjob}[4]{
    \resentry[10pt]{
\setlength{\parskip}{1ex plus 0.5ex minus 0.2ex} \textbf{#1} \newline #4}{#2 -- \newline #3}
}

% Conference:
% Name, Years/roles
\newcommand{\resconference}[2]{
    \resentrysinglecol{\raggedright \textbf{#1} #2}
}

% Subconference (use under a conference for workshops, etc.):
% Name, Years/roles
\newcommand{\ressubconference}[2]{
    \resentrysinglecol[10pt]{\textbf{#1} #2}
}

% Single column item/description pair:
\newcommand{\resdesc}[2]{
    \resentrysinglecol{\raggedright \textbf{#1} #2}
}

% Single column bib pair:
\newcommand{\resbib}[2]{
    \resentrysinglecol{\raggedright \textbf{#1} #2}
}