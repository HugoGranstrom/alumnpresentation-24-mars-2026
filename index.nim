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

template liText(text: string) =
  listItem:
    nbText: text

template questions =
  slide:
    bigText: "Frågor?"

template intro =
  slide:
    slide:
      nbText: hlMd"""
### Hugo Granström
Alumnveckan 2026
"""
    slide:
      nbText: "### Agenda"
      unorderedList:
        liText: "Studietiden"
        liText: "Exjobb"
        liText: "Jakten på det första jobbet"
        liText: "Första jobbet"
        liText: "AI"

template studies =
  slide:
    slide:
      nbText: "Studietiden"
    questions()

template exjobb =
  slide:
    slide:
      nbText: "Exjobb"
    questions()

template jobSearch =
  slide:
    slide:
      nbText: "Jobsökande"
    questions()

template firstJob =
  slide:
    slide:
      nbText: "Första jobbet"
    questions()

template ai =
  slide:
    slide:
      nbText: "AI"
    questions()

template avslutning =
  slide:
    slide:
      nbText: "Tack och bock"
    questions()

intro()
studies()
exjobb()
jobSearch()
firstJob()
ai()
avslutning()



nbSave