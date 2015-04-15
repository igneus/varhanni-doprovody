\version "2.19.16"

\include "stylesheet.ily"

\header {
  hymnal_number = ""
  title = ""
  arranger = "František Suchý"
}

global = {
  \time 4/4
}

sopran = \relative c' {
  \global
}
alt = \relative c' {
  \global
}
tenor = \relative c' {
  \global
}
bas = \relative c {
  \global
}

lyr = \lyricmode {
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