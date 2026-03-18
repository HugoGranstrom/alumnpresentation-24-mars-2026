import std / [strutils, algorithm, strformat]
import nimiSlides, nimib

nbInit(theme = revealTheme)

template nimConfTheme*() =
  setSlidesTheme(Black)
  let nimYellow = "#FFE953"
  nb.addStyle: """
:root {
  --r-background-color: #181922;
  --r-heading-color: $1;
  --r-link-color: $1;
  --r-main-font-size: 37px;
}
.reveal ul, .reveal ol {
  display: block;
  text-align: left;
}
li::marker {
  color: $1;
  content: "»";
}
li {
  padding-left: 12px;
}

.link-button {
  text-decoration: none;
  font-weight: bold;
  letter-spacing: 1px;
  color: $1;
  background-color: #181922;
  padding: 15px 50px;
  border-radius: 5px;
  border: 1px solid $1
}
""" % [nimYellow]

nimConfTheme()

slide:
  nbText: hlMd"""
### Hugo Granström
Alumnveckan 2026
"""

nbSave