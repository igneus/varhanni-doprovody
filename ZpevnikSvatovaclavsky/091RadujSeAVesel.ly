\version "2.19.16"

\include "stylesheet.ily"

\header {
  hymnal_number = "91"
  title = "Raduj se a vesel, všechno stvoření"
  arranger = "František Suchý"
}

global = {
  \time 4/4
  \key bes \major
}

sopran = \relative c' {
  \global

  \autoBeamOff

  \repeat volta 2 { f4 g f es d( f) bes2 c4 es a, c bes2 r }

  c4 c bes8[ a] g[ f] bes4 d bes2
  c4 c bes8[ a] g[ f] bes4 d bes2
  f4 g f es d( f) bes2
  c4 es a, c bes2 r
}
alt = \relative c' {
  \global
  d4 es d c d1 g2 f4 es d2 r

  es1 d es d
  d4 es d c d1 g2 f4 es d2 r
}
tenor = \relative c' {
  \global
  bes1 bes g4 c2 a4 bes2 r

  a2 c4 a bes f bes8 a g f
  a2 c4 a bes f bes8 a g f
  bes1 bes g4 c2 a4 bes2 r
}
bas = \relative c {
  \global
  bes1 bes es4 c f2 d r

  f1 bes, f' bes, bes bes es4 c f2 <f bes,> r
}
frazovani = {
  s1 s \breathe s1 s s s \breathe
  s1 s \breathe s1 s \breathe
  s1 s \bar "|."
}

lyr = \lyricmode {
  Ra -- duj se a ve -- sel,
  všech -- no stvo -- ře -- ní,
}
lyrII = \lyricmode {
  ví -- tej Kris -- ta Pá -- na
  slav -- né vzkří -- še -- ní!

  A -- le -- lu -- ja za -- pěj -- me,
  Bo -- hu dí -- ky vzdá -- vej -- me,
  Spa -- si -- te -- le své -- ho
  všich -- ni ví -- tej -- me!
}

\score {
  \new PianoStaff <<
    \new Lyrics = "above" { s4 }
    \new Lyrics = "above2" { s4 }
    \new Staff <<
      \new Voice = "sopran" { \voiceOne \sopran }
      \new Voice { \voiceTwo \alt }
      \new Voice { \frazovani }
    >>
    \new Staff <<
      \clef "bass"
      \new Voice { \voiceOne \tenor }
      \new Voice { \voiceTwo \bas }
      \new Voice { \frazovani }
    >>
    \context Lyrics = "above" \lyricsto "sopran" \lyr
    \context Lyrics = "above2" \lyricsto "sopran" \lyrII
  >>
}