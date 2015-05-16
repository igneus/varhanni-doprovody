\version "2.19.16"

\include "stylesheet.ily"

\header {
  hymnal_number = "5"
  title = "Pozdvihni se, duše z prachu"
  arranger = "František Suchý"
}

global = {
  \key a \major
  \time 4/4
  \autoBeamOff
}

sopran = \relative c' {
  \global
  e4 a fis b a gis b a
  cis b a gis a fis e2

  gis4 a b cis d cis cis b
  gis a b cis d cis b2
  e,4 a fis b gis8[ a] b[ cis] b4 a
  a4 gis fis d'8[ b] a4 gis a2
}
alt = \relative c' {
  \global
  cis4 e d fis e2 d4 cis
  e2 dis4 e cis dis e2

  e1 e
  e e
  cis4 e d fis e2 d4 cis
  e4 eis fis2 e <e cis>
}
tenor = \relative c' {
  \global
  a2. fis4 b2 gis4 a
  a b b2 a gis

  b4 a gis a gis a a gis
  b a gis a gis a gis2
  a2. fis4 b8[ a] gis4 gis a
  a4 b a b cis b a2
}
bas = \relative c {
  \global
  a4 cis d2 e2. <e a,>4
  a4 gis fis e fis b, e2

  \repeat unfold 2 { e4 cis e a, b a e'2 }
  a,4 cis d2 e2 eis4 fis
  cis2 d4 b8[ d] e2 a,
}
rythm = {
  \repeat volta 2 { s1 s s s }
  s1 s s s \breathe
  s1 s \breathe
  s1 s \bar "|."
}

lyr = \lyricmode {
  Po -- zdvih -- ni se, du -- še z_pra -- chu,
  za -- leť k_raj -- ským kon -- či -- nám
}
lyrII = \lyricmode {
  z_báz -- ní, a -- le be -- ze stra -- chu
  vstup tam v_o -- nen věč -- ný chrám!
  Onť tam jenž tě o -- stří -- há -- vá
  ja -- ko své zří -- tel -- ni -- ce,
  jenž tě pod svá kříd -- la brá -- vá,
  ja -- ko plod svůj or -- li -- ce.
}

\score {
  \new PianoStaff <<
    \new Lyrics = "above" { s4 }
    \new Lyrics = "aboveII" { s4 }
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
    \context Lyrics = "aboveII" \lyricsto "sopran" \lyrII
  >>
}