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
rythm = {}

lyr = \lyricmode {
}

\score {
  \new PianoStaff <<
    \new Lyrics = "above" { s4 }
    \new Staff <<
      \new Voice = "sopran" { \voiceOne \sopran }
      \new Voice { \voiceTwo \alt }
      \new Voice { \voiceTwo \rythm }
    >>
    \new Staff <<
      \clef "bass"
      \new Voice { \voiceOne \tenor }
      \new Voice { \voiceTwo \bas }
      \new Voice { \voiceTwo \rythm }
    >>
    \context Lyrics = "above" \lyricsto "sopran" \lyr
  >>
}