\version "2.19.16"

\include "stylesheet.ily"

\header {
  hymnal_number = "3"
  title = "Bože před tvou velebností"
  arranger = "František Suchý"
}

global = {
  \key c \major
  \time 4/4
  \autoBeamOff
}

sopran = \relative c'' {
  \global
  g4 g a g c b8[ a] a4 g
  d' c b c8[ a] g4 fis g2
  b4 b c g f e e d
  b' b c g f e d2
  g4 g a b c d c b
  b b c d c b c2
}
alt = \relative c' {
  \global
  c1 c d2. e4 d1
  d2 c d4 c c b
  d2 c d4 c b2
  c2. f4 e4 d2.
  g4 f e d d2 e
}
tenor = \relative c {
  \global
  e4 e f e a g8[ f] f4 e g fis g4. a8 b4 a b2
  g1~ g
  g~ g
  g2 f a2. g4 d'2 c4 a g2 g
}
bas = \relative c {
  \global
  c1 c b4 a g c d2 <g g,>
  \repeat unfold 2 { g4 f e2 b4 c g2 }
  e'2 f4 d a f' fis g
  g gis a f g2 c,
}
articulations = {
  \repeat volta 2 { s1 s s s }
  s1 s \breathe
  s s \breathe
  s s \breathe
  s s \bar "|."
}

lyr = \lyricmode {
  Bo -- že před tvou ve -- leb -- nos -- tí
  na ko -- le -- na pa -- dá -- me,
}
lyrII = \lyricmode {
  za -- pal v_srd -- cích svou mi -- los -- tí,
  o -- heň lás -- ky žá -- dá -- me,

  by -- chom te -- be mi -- lo -- va -- li
  jak v_ne -- be -- sích an -- dě -- lé,
  o -- běť ti o -- bě -- to -- va -- li
  po -- dle tvé sva -- té vů -- le.
}

\score {
  \new PianoStaff <<
    \new Lyrics = "above" { s4 }
    \new Lyrics = "aboveII" { s4 }
    \new Staff <<
      \new Voice = "sopran" { \voiceOne \sopran }
      \new Voice { \voiceTwo \alt }
      \new Voice { \articulations }
    >>
    \new Staff <<
      \clef "bass"
      \new Voice { \voiceOne \tenor }
      \new Voice { \voiceTwo \bas }
      \new Voice { \articulations }
    >>
    \context Lyrics = "above" \lyricsto "sopran" \lyr
    \context Lyrics = "aboveII" \lyricsto "sopran" \lyrII
  >>
}