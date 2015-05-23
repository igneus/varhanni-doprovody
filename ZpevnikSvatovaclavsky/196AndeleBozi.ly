\version "2.19.16"

\include "stylesheet.ily"

\header {
  hymnal_number = "196"
  title = "Anděle Boží, strážce můj"
  subtitle = "K sv. Andělu strážci. (Prvá neděle v září)."
  arranger = "František Suchý"
}

global = {
  \time 4/4
  \key es \major
  \autoBeamOff
}

sopran = \relative c'' {
  \global
  \repeat unfold 2 { g4 g8 as bes4 g8[ bes] as4 f8[ as] g2 }
  f4 f8 f f4 g8[ as] as4 g f2
  bes4 bes8 es c4 c8 bes
  as4 as8 c bes[ c] bes as
  g4 f es2
}
alt = \relative c' {
  \global
  es1 d2 es
  es1 d2 es
  d4 es d es f es d2
  es2 s4 es8[ d]
  d4. es8 es2
  es4 d es2
}
tenor = \relative c' {
  \global
  bes1 bes
  bes bes
  bes4 a bes2 bes1
  bes2 as4. bes8
  bes4. as8 g[ as g c]
  bes4 as g2
}
bas = \relative c {
  \global
  \repeat unfold 2 { es4 es8[ f] g4 es8[ g] f2 es }
  bes4 c bes es8[ g] d4 es bes2
  g'2 as4. g8
  f4. as8 es2
  es4 bes es2
}
rythm = {
  s1 s \breathe s s s s \breathe s s s \bar "|."
}

lyr = \lyricmode {
  An -- dě -- le Bo -- ží, stráž -- ce můj!
  Rač vždyc -- ky být o -- chrán -- ce můj,
  mne vždyc -- ky řiď a na -- pra -- vuj,
  ke vše -- mu do -- bré -- mu
  ke vše -- mu do -- bré -- mu
  mne vzbu -- zuj.
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