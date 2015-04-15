\version "2.19.16"

\include "stylesheet.ily"

\header {
  hymnal_number = "101"
  title = "Přijď o Duše přesvatý"
  arranger = "František Suchý"
}

global = {
  \time 6/4
  \key d \major
}

sopran = \relative c'' {
  \global
  a4( fis) g a2 b4 e,( fis) g fis2 r4
  e4( a) b cis( d) cis a( fis) gis a2 r4
  d4( a) b a( g) fis e( fis) e d2 r4 \bar "|."
}
alt = \relative c' {
  \global
  d2. d cis2 s4 d2 r4
  cis4 e2 e4 fis e d2. cis2 r4
  d2. d4 e d d4 cis2 d2 r4
}
tenor = \relative c {
  \global
  fis4 a g fis2 g4 g fis e d2 r4
  a'2 g4 a2. fis4 b2 a r4
  a2 g4 a2. gis4 a g fis2 r4
}
bas = \relative c {
  \global
  d2. d2 g,4 a2. d2 r4
  a4 cis eis a2. d,2 e4 a,2 r4
  fis'2 g4 fis cis d b a2 d r4
}

lyr = \lyricmode {
  Přijď o Du -- še pře -- sva -- tý,
  rač pa -- pr -- sek bo -- ha -- tý
  svě -- tla své -- ho v_nás vy -- lít.
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