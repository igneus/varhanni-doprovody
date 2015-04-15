\version "2.19.16"

\paper {
  #(set-paper-size "a4" 'landscape)

  left-margin = 1.5\cm
  right-margin = 1.5\cm
  top-margin = 1\cm
  bottom-margin = 1\cm

  myStaffSize = #20

  #(define fonts
    (make-pango-font-tree
                          "Linux Libertine O"
                          "VL Gothic"
                          "Courier"
     (/ myStaffSize 20)))

  bookTitleMarkup = \markup {
    \override #'(baseline-skip . 3.5)
    \column {
      \fill-line { \fromproperty #'header:dedication }
      \override #'(baseline-skip . 3.5)
      \column {
        \fill-line {
          \huge \larger \larger \bold
            \fromproperty #'header:hymnal_number
          \huge \larger \larger \bold
            \fromproperty #'header:title
          ""
        }
        \fill-line {
          \large \bold
          \fromproperty #'header:subtitle
        }
        \fill-line {
          \smaller \bold
          \fromproperty #'header:subsubtitle
        }
        \fill-line {
          \fromproperty #'header:poet
          { \large \bold \fromproperty #'header:instrument }
          \fromproperty #'header:composer
        }
        \fill-line {
          \fromproperty #'header:meter
          \fromproperty #'header:arranger
        }
      }
    }
  }
}