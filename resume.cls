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
    {\textwidth}{\textbf{#1 \vphantom{p\^{E}}}}\end{minipage}}}}

% Resume entry (used for subheading)
\newcommand{\resentry}[3][0pt]{
    \begin{tabular*}{0.9\textwidth}[t]{@{\hspace{#1}}p{5.0in-#1}@{\extracolsep{\fill}}p{0.75in}}
        #2 & #3
        \tabularnewline
    \end{tabular*}
}

% Resume entry (single column)
\newcommand{\resentrysinglecol}[2][0pt]{
    \begin{tabular*}{0.9\textwidth}[t]{@{\hspace{#1}}p{0.9\textwidth-#1}}
    %\begin{tabular}[t]{p{5.0in}@{\hfill}p{0.75in}}
        #2
        \tabularnewline
    \end{tabular*}
}

% Resume subheading
\newcommand{\ressubheading}[4]{
    \resentry{\textbf{#1} \newline #3}{#2 \newline #4}    
}

% Resume subheading with extra information
\newcommand{\ressubheadingextra}[5]{
    \resentry{\textbf{#1} \newline #3 \newline #5}{#2 \newline #4}
}

% Specific entry types:

% School:
% School, Location, Description, Degrees
\newcommand{\resschool}[3]{
    \resentry{\textbf{#1} \newline #3}{#2}
}

\newcommand{\resschoolextra}[4]{
    \resentry{\textbf{#1} \newline #3 \newline #4}{#2}
}

% Degree:
% Degree, Major, Date, Description
\newcommand{\resdegree}[3]{
    \resentry[10pt]{
\setlength{\parskip}{1ex plus 0.5ex minus 0.2ex} #1 #2}{#3}
}

\newcommand{\resdegreeextra}[4]{
    \resentry[10pt]{
\setlength{\parskip}{1ex plus 0.5ex minus 0.2ex} #1 #2 \newline \textit{#4}}{#3}
}

% Combined school and degree (plus other) entry:
% University, Degree, Major, Date, Location, Other
\newcommand{\reseducation}[6]{
    \ressubheadingextra{#1}{#5}{#2 #3}{#4}{#6}
}

% Work experience:
% Employer, Location, Description, Jobs
\newcommand{\resemployer}[4]{
    \resentry{\textbf{#1} \newline #3 \newline #4}{#2}
}

% Work experience:
% Title, Start Date, End Date, Description
\newcommand{\resjob}[4]{
    \resentry[10pt]{
\setlength{\parskip}{1ex plus 0.5ex minus 0.2ex} \textbf{#1} \newline #4}{#2 - \newline #3}
}

% Conference:
% Name, Years/roles
\newcommand{\resconference}[2]{
    \resentrysinglecol{\textbf{#1} -- #2}
}

\newcommand{\ressubconference}[2]{
    \resentrysinglecol[10pt]{\textbf{#1} -- #2}
}