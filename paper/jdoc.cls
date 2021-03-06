%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Classe        : JDoc.cls,
% Auteur        : OUATTARA Djomangan Adama, Irccyn.
% Email         : Pour toutes question : djomangan-adama.ouattara@irccyn.ec-nantes.fr,
% Labo          : Irccyn (Ecole Centrale Nantes),
% Version       : 1.0.0,
% Date          : vendredi 04-Février-2005,
%
% Description   : Style LaTex pour la soumission des articles à la JDoc,
% Utilisation   :
%                           \documentstyle[options]{JDoc}                % pour ceux qui rédigent en français
%                                                                        % options = 'fr' ou 'en'.  
%                           \ed{..}                                      % nom de l'école doctorale
%                           \spec{..}                                    % spécialité
%                           \labo{..}                                    % laboratoire
%                           \title{..}                                   % titre de l'article
%                           \author{..}                                  % nom de l'auteur
%                           \directeur{..}                               % directeur de thèse
%                           \codirecteur{..}                             % co-directeur de thèse
%                           \codirecteurs{..}                            % ou co-directeurs de thèse, s'il y en a plusieurs
%                           \makehead                                    % construit l'entête (ed, spec, labo, title, auteur, ..)                      
%
%                           \begin{abstract}...\end{abstract}            % résumé de l'article (abstract)
%                           \begin{keywords}...\end{keywords}            % mots clés (keywords)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\typeout{Document Style `JDoc' version 1.0, le 04/02/2005.}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jdoc}[05/02/2005 v1.0 Journée de Doctorants, Nantes]
\LoadClass{article}                                                      % charge le document en mode 'article', '10pt', 1 colonne, ...

%============================ Variables booléennes ======================%
\newif\if@fr      \@frtrue
\newif\if@en      \@enfalse

\newif\if@ed      \@edfalse
\newif\if@spec    \@specfalse
\newif\if@labo    \@labofalse
\newif\if@equipe  \@equipefalse

\newif\if@title   \@titlefalse
\newif\if@author  \@authorfalse
\newif\if@email   \@emailfalse

\newif\if@dir     \@dirfalse
\newif\if@codir   \@codirfalse
\newif\if@codirs  \@codirsfalse 

\def\fr{\@frtrue \@enfalse \def\@fr}
\def\en{\@entrue \@frfalse \def\@en}

%========================== Options de mise en page =====================%
\DeclareOption{fr}
   {\fr}
\DeclareOption{en}
   {\en}
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
    
\DeclareOption{10pt}{\renewcommand{\@ptsize}{0}}
\DeclareOption{11pt}{\renewcommand{\@ptsize}{1}}
\DeclareOption{12pt}{\renewcommand{\@ptsize}{2}}
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{onecolumn}{\@twocolumnfalse}
\DeclareOption{twocolumn}{\@twocolumntrue}

\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}

\ExecuteOptions{a4paper,10pt,onecolumn,twoside}                          % force le style par defaut en 10pt, onecolumn, ...
\ProcessOptions                                                          % lance les options passés pas paramètres                                             

%========================== packages utilisés par défaut ================%
\usepackage{amsmath,amsfonts,mathrsfs,amssymb}                           % packages pour les maths
\usepackage[utf8]{inputenc}                                            % gestion des caractères spéciaux (avec accents)
\usepackage[T1]{fontenc}                                                 % gestion des caractères spéciaux (avec accents)
\usepackage{graphicx}                                                    % gestion des des graphiques
\usepackage{multicol}                                                    % gestion des multicols
\usepackage{color}                                                       % gestion des couleurs
%\usepackage[colorlinks=false,urlcolor=blue]{hyperref}                    % gestion des liens hypertextes avec couleur
\if@fr
    \usepackage[french]{babel}                                           % si on veut ecrire en français
\else
    \usepackage[english]{babel}                                          % si on veut ecrire en anglais
\fi

\pagestyle{empty}                                                        % laisse l'entête et pied de page vide (pas de numéros)
\bibliographystyle{unsrt}                                                 % charge le style bibliographique
%============================= Entête de l'article ======================%
\def\makehead
{
   \begingroup
      \@makehead
   \endgroup
}
\def\@makehead
{
   \setlength{\unitlength}{1cm}
   \setlength{\columnsep}{0cm}        
   \begin{multicols}{2}
     \begin{flushleft}
        \begin{tabular}{p{5cm}}
           \if@ed
              \@ed
           \else
              Ecole Doctorale ???
           \fi
         \end{tabular}
     \end{flushleft}
     \begin{flushright}
        \begin{tabular}{p{7cm}}
           \if@spec
              {\bf Spécialité : }\@spec\\
           \else
              Spécialité : ???\\
           \fi
           \if@labo
              {\bf Laboratoire : }\@labo\\
           \else
              Laboratoire : ???\\
           \fi
           \if@equipe
              {\bf Equipe : }\@equipe
           \else
              Equipe : ???
           \fi
        \end{tabular}
     \end{flushright}
   \end{multicols}
   \vskip 1.5em
   \maketitle
}
%Balise 'ed' (Ecole Doctorale)
\def\ed
{
  \@edtrue
  \def\@ed
}
%Balise 'spec' (spécialité)
\def\spec
{
  \@spectrue
  \def\@spec
}
%Balise 'labo' (nom du labo)
\def\labo
{
  \@labotrue
  \def\@labo
}
%Balise 'equipe' (nom de l'équipe)
\def\equipe
{
  \@equipetrue
  \def\@equipe
}
%================ Titre, Auteurs, Directeur, Co-directeur(s) ============%
\def\maketitle
{
   \normalsize
   \begingroup
      \@maketitle
   \endgroup
}
\def\@maketitle
{   
   \begin{center}
      \if@title
        {\bf\@title\par}\vskip .5em
      \else
        {\bf TITRE DE L'ARTICLE \par}
      \fi
      
      \if@author
        {\@author\par}
      \else
        {\it Auteur : ???}\par
      \fi
      
      \if@email
        {Mél : \@email\par}
      \else
        {\it Mél : ???}\par
      \fi
      
      \if@dir
         {{\it Directeur de thèse :} \@directeur\par}
      \else
         %{{\it Directeur de thèse : ???}\par}
      \fi
      
      \if@codir
         {{\it Co-directeur :} \@codirecteur}
      \fi
      \if@codirs
         {{\it Co-directeurs :} \@codirecteurs}
      \fi
   \end{center}
   \normalsize
}
%Balise 'EMAIL'
\def\email
{
  \@emailtrue
  \def\@email
}
%Balises 'DIRECTEUR'
\def\directeur
{
  \@dirtrue
  \def\@directeur
}
%Balises 'CO-DIRECTEUR'
\def\codirecteur
{
  \@codirtrue
  \def\@codirecteur
}
%Balises 'CO-DIRECTEURS'
\def\codirecteurs
{
  \@codirstrue
  \def\@codirecteurs
}
%Balise 'TITLE'
\def\title
{
  \@titletrue
  \def\@title
}
%Balise 'AUTHOR'
\def\author
{
  \@authortrue
  \def\@author
}
%==================== Résumé, Mots clés, Collaboration ================%

%Balise 'ABSTRACT'
\def\abstract
{
   \if@fr   
      \noindent{\bf Résumé :$\,$}$\!$
   \else
      \noindent{\bf Abstract:}$\!$
   \fi
}
\def\endabstract{\vspace{1.0em}}
  
%Balise 'KEYWORDS'
\def\keywords
{
   \if@fr   
      \noindent{\bf Mots clés :$\,$}$\!$ \it
   \else
      \noindent{\bf Keywords:}$\!$ \it
   \fi
}
\def\endkeywords{\vspace{0.0em}}

%Balise 'COLLABORATIONS'
\def\collaborations
{
   \noindent{\bf Collaborations :$\,$}$\!$
}
\def\endcollaboration{\vspace{0.0em}}   

%============================= mise en page  ============================%
%\renewcommand{\baselinestretch}{1}
\topmargin          -10.0mm                                              %marge de haut                       (2.5cm)
\oddsidemargin      5.0mm                                                %marge de gauche des pages impaires   (2cm + 1cm de réliure)
\evensidemargin     -5.0mm                                              %marge de gauche des pages paires     (2cm + 1cm de réliure) 

\textheight         247.0mm                                              %hauteur du text
\textwidth          160.0mm                                              %largeur du text

\parindent          1.00em                                               %indentation des paragraphes
\headheight         12pt                                                 %hauteur de l'entête
\headsep            5.0mm                                                %distance entre la dernière ligne d'entête et la première ligne du doc.
\lineskip           1pt                                                  %hauteur d'un saut de ligne
\normallineskip     1pt                                                  %hauteur d'un saut de ligne normal
\footskip           6.0mm                                                %distance entre le texte et la note de bas de page
%\columnsep                                                              %distances entre les colonnes en 'multicols' (pas utile ici)
%========================================================================%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                           Fin du fichier JDoc.cls                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
