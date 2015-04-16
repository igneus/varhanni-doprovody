\version "2.19.16"

\include "stylesheet.ily"

\paper {
  #(set-paper-size "a4" 'landscape)
}

\header {
  hymnal_number = "70"
  title = "Kristus příklad pokory"
  arranger = "František Suchý"
}

global = {
  \time 4/4
  \key e \phrygian
}

articulations = {
  s1 s4 s s\fermata \breathe s1 s4 s1
  s1 s4 s s\fermata \breathe s1 s4 s1
  s1 s4 s s\fermata \breathe s1 s4 s1
  s1 s4 s s\fermata \breathe s1 s4 s1
}

sopran = \relative c' {
  e4 e f f e e d d g g f f e2 r
  g4 g a a b b c c a a a gis a2 r
  d4 d b b c c a a g g f f e2 r
  e4 e d d c d e e g g f f e2 r \bar "|."
}
alt = \relative c' {
  b2 d4 c b2 d4 d d cis d2 cis r
  d4 e f a a gis a e f2 e e r
  a2 g g f4 f e2 d4 c b2 r
  c2 b a4 b c c c2 d4 c c2 r
}
tenor = \relative c' {
  gis2 a a4 gis a a bes a8 g a2 a r
  bes2 c e e4 c c d b2 c r
  d1 c2 c4 c c b a2 gis2 r
  g!1 e4 g g g g2 a gis r
}
bas = \relative c {
  e2 d e f4 f e2 d a r
  g'2 f e a4 a f d f2 f r
  f2 g e f4 f c2 d e r
  c2 g a4 g c c e2 d e r
}

lyr = \lyricmode {
  Kris -- tus pří -- klad po -- ko -- ry,
  Bůh náš mi -- los -- ti -- vý,
  Ot -- ce své -- ho Syn mi -- lý a jed -- no -- ro -- ze -- ný,
  pro hříš -- né -- ho člo -- vě -- ka rá -- čil bý -- ti chu -- dý,
  ač jsa o -- de vděč -- nos -- ti % sic
  Bo -- hu Ot -- ci rov -- ný.
}

\score {
  \new PianoStaff <<
    \new Lyrics = "above" { s4 }
    \new Staff <<
      \new Voice {
        \voiceOne
        \override Script.Y-offset = 4
        \articulations
      }
      \new Voice = "sopran" { \voiceOne \sopran }
      \new Voice { \voiceTwo \alt }
    >>
    \new Staff <<
      \clef "bass"
      \new Voice { \voiceOne \tenor }
      \new Voice { \voiceTwo \bas }
      \new Voice {
        \voiceTwo
        \override Script.Y-offset = -4
        \articulations
      }
    >>
    \context Lyrics = "above" \lyricsto "sopran" \lyr
  >>
}