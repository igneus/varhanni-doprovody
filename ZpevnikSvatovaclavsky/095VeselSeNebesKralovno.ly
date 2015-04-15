\version "2.19.16"

\include "stylesheet.ily"

\header {
  hymnal_number = "95"
  title = "Vesel se nebes Královno"
  arranger = "František Suchý"
}

global = {
  \time 3/4
  \key bes \major
}

sopran = \relative c'' {
  \global
  bes4 bes bes a2 g4 a2 bes4 c2 r4 a bes g f2 r4
  d'4 d d c2 bes4 a2 bes4 c2 r4 d es c bes2 r4 \bar "|."
}
alt = \relative c' {
  \global
  d4 f d f2 e4 f2. f2 r4 f4 d e f2 r4
  f2. f2 d8 e f2. f2 r4 f4 g es d2 r4
}
tenor = \relative c' {
  \global
  bes2. c c2 bes4 a2 r4 c4 bes2 a r4
  bes2. a2 bes4 c2 bes4 a2 r4 bes2 a4 bes2 r4
}
bas = \relative c {
  \global
  bes4 d bes f'2 c4 f2. f2 r4 f4 g c, f2 r4
  bes,4 d bes f'2 g4 f2. f2 r4 bes,4 es f bes,2 r4
}

lyr = \lyricmode {
  Ve -- sel se ne -- bes Krá -- lov -- no, a -- le -- lu -- ja,
  ple -- sej svě -- tu všech ko -- ru -- no, a -- le -- lu -- ja.
}

\score {
  \new PianoStaff <<
    \new Lyrics = "above" { s4 }
    \new Staff <<
      \new Voice = "sopran" { \voiceOne \sopran }
      \new Voice { \voiceTwo \alt }
    >>
    \new Staff <<
      \clef "bass"
      \new Voice { \voiceOne \tenor }
      \new Voice { \voiceTwo \bas }
    >>
    \context Lyrics = "above" \lyricsto "sopran" \lyr
  >>
}