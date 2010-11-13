% (c) 2002 Matthew Boedicker <mboedick@mboedick.org> (original author)
%       http://mboedick.org
% (c) 2003-2007 David J. Grant <davidgrant-at-gmail.com>
%       http://www.davidgrant.ca
% (c) 2007 Todd C. Miller <Todd.Miller@courtesan.com>
%       http://www.courtesan.com/todd
% (c) 2009-2010 George R. Louthan IV <georgerlouth@nthefourth.com>
%       http://georgerloutha.nthefourth.com
%
% This work is licensed under the Creative Commons Attribution-Noncommercial-
% Share Alike 2.5 License. To view a copy of this license, visit
% http://creativecommons.org/licenses/by-nc-sa/2.5/ or send a letter to:
%
% Creative Commons
% 543 Howard Street
% 5th Floor
% San Francisco, CA 94105

% --Identification--
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tucv}[2010/11/11 v0.1 TU-style CV class]

% --Preliminary declarations--

% --Options--
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions

% --More declarations--
\LoadClass[letterpaper,11pt]{article}

% Package requirements
\RequirePackage{array}
\RequirePackage{color}
\RequirePackage{calc}
\RequirePackage{fancyhdr}
%\RequirePackage{xparse}
\usepackage{xparse}

% Color definition
\definecolor{tucvheading}{gray}{0.85}
% No line for the fancy header/footer
\renewcommand{\headrulewidth}{0pt}

% Margin setup
\setlength{\voffset}{0.1in}
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
\pagestyle{fancy}
\fancyhead{}
\fancyfoot{}

% Custom commands

% Resume heading. Heading inside a shaded box.
\NewDocumentCommand\resheading{m}{{\large \colorbox{tucvheading}{\begin{minipage}
    {\textwidth-6.0pt}{\textbf{#1 \vphantom{p\^{E}}}}\end{minipage}}}}


%Raw two-column resume entry

\NewDocumentCommand\resentry{O{0pt}mm}{
    \begin{tabular*}{0.9\textwidth}[t]{@{\hspace{#1}}p{5.0in-#1}@{\extracolsep{\fill}}p{0.75in}}
        \raggedright #2 & #3
        \tabularnewline
    \end{tabular*}
}

% Raw indented two-column resume entry
\NewDocumentCommand\ressubentry{mm}{
    \resentry[10pt]{
        \setlength{\parskip}{1ex plus 0.5ex minus 0.2ex}
        #1}{#2}
}

% Raw single-column resume entry
\NewDocumentCommand\resentrysinglecol{O{0pt}m}{
    \begin{tabular*}{0.9\textwidth}[t]{@{\hspace{#1}}p{0.9\textwidth-#1}}
        #2
        \tabularnewline
    \end{tabular*}
}

% Raw indented one-column resume entry
\NewDocumentCommand\ressubentrysinglecol{m}{
    \resentrysinglecol[10pt]{
        \setlength{\parskip}{1ex plus 0.5ex minus 0.2ex}
        #1}
}

% Raw resume subheading:
\NewDocumentCommand\ressubheading{ommmm}{
    \resentry{\textbf{#2} \newline #4
    \IfNoValueTF{#1}
    {}
    {\newline #1}
    }{#3 \newline #5}    
}

% Specific entry types:

% Education:

% School entry:
% [Description,] School, Location
\NewDocumentCommand\resschool{omm}{
    \resentry{\textbf{#2}
    \IfNoValueTF{#1}
    {}
    {\newline \textit{#1}}
    }{#3}
}

% Degree entry:
% [Description,] Degree, Major, Date
\NewDocumentCommand\resdegree{ommm}{
    \ressubentry{#2 in #3
    \IfNoValueTF{#1}
    {}
    {\newline \textit{#1}}
    }{#4}
    %\ressubentry{#2 in #3}{#4}
}

% Combined school and degree (plus other) entry:
% University, Degree, Major, Date, Location, Other
\NewDocumentCommand\reseducation{mmmmmm}{
    \ressubheading[#6]{#1}{#5}{#2 #3}{#4}
}

% Work experience:
% Employer entry:
% [Description,] Employer, Location
\NewDocumentCommand\resemployer{omm}{
    \resentry{\textbf{#2} 
    \IfNoValueTF{#1}
    {}
    {\newline #1}
    }{#3}
}

% Job entry (part of an employer block):
% [Description,] Title, Start Date, End Date
\NewDocumentCommand\resjob{ommm}{
    \resentry[10pt]{
\setlength{\parskip}{1ex plus 0.5ex minus 0.2ex} \textbf{#2} 
    \IfNoValueTF{#1}
    {}
    {\newline #1}
    }{#3 -- \newline #4}
}

% Conference:
% Name, Years/roles
% TODO: Add description
\NewDocumentCommand\resconference{omm}{
    \resentrysinglecol{\raggedright \textbf{#2} #3}
}

% Subconference (use under a conference for workshops, etc.):
% Name, Years/roles
% TODO: Add description
\NewDocumentCommand\ressubconference{omm}{
    \resentrysinglecol[10pt]{\textbf{#2} #3}
}

% Single column item/description pair:
\NewDocumentCommand\resdesc{mm}{
    \resentrysinglecol{\raggedright \textbf{#1} #2}
}

% Single column bib pair:
\NewDocumentCommand\resbib{mm}{
    \resentrysinglecol{\raggedright \textbf{#1} #2}
}