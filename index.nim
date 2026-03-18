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

template bouncing(body: untyped) =
  nbRawHtml: hlHtml"""
<style>
    @keyframes bounce {
        0%, 100% { transform: translateY(0); }
        50% { transform: translateY(-30px); }
    }
    .bounce-question {
        animation: bounce 2s infinite;
        color: #e74c3c;
    }
</style>
<div class="bounce-question">
"""
  body
  nbRawHtml: "</div>"

template heartbeat(body: untyped) =
  nbRawHtml: hlHtml"""
<style>
    @keyframes pulse {
        0% { transform: scale(1); }
        50% { transform: scale(1.2); }
        100% { transform: scale(1); }
    }
    .pulse-effect {
        color: #e74c3c;
        animation: pulse 1.5s infinite ease-in-out;
        display: inline-block;
    }
</style>
<div class="pulse-effect">
"""
  body
  nbRawHtml: "</div>"

template rubberband(body: untyped) =
  nbRawHtml: hlHtml"""
    <style>
        @keyframes squish-only {
            0% { transform: scale(1, 1); }
            25% { transform: scale(1, 0.75); } /* Compressed to 75% height, width stays normal */
            40% { transform: scale(1, 0.9); }  /* Recovering slightly */
            60% { transform: scale(1, 1); }    /* Back to normal */
            75% { transform: scale(1, 0.95); } /* Small secondary squish */
            100% { transform: scale(1, 1); }
        }
        .squish-effect {
            color: #3498db;
            animation: squish-only 2s infinite;
            display: inline-block;
        }
    </style>
<div class="squish-effect">
"""
  body
  nbRawHtml: "</div>"

template swing(body: untyped) =
  nbRawHtml: hlHtml"""
    <style>
        @keyframes swing {
            20% { transform: rotate3d(0, 0, 1, 15deg); }
            40% { transform: rotate3d(0, 0, 1, -10deg); }
            60% { transform: rotate3d(0, 0, 1, 5deg); }
            80% { transform: rotate3d(0, 0, 1, -5deg); }
            100% { transform: rotate3d(0, 0, 1, 0deg); }
        }
        .swing-effect {
            color: #f1c40f;
            transform-origin: top center;
            animation: swing 3s infinite ease-in-out;
            display: inline-block;
        }
    </style>
    <div class="swing-effect">
"""
  body
  nbRawHtml: "</div>"

template slowRotate(body: untyped) =
  nbRawHtml: hlHtml"""
    <style>
    @keyframes slowRotate {
        from { transform: rotate(0deg); }
        to { transform: rotate(360deg); }
    }
    .rotate-slow {
        color: #3498db;
        /* 10s duration, linear timing for constant speed */
        animation: slowRotate 10s linear infinite;
        display: inline-block; /* Required for rotation to work on text */
    }
    </style>
    <div class="rotate-slow">
  """
  body
  nbRawHtml: "</div>"

template jello(body: untyped) =
  nbRawHtml: hlHtml"""
    <style>
        @keyframes jello {
            0%, 11.1%, 100% { transform: none; }
            22.2% { transform: skewX(-12.5deg) skewY(-12.5deg); }
            33.3% { transform: skewX(6.25deg) skewY(6.25deg); }
            44.4% { transform: skewX(-3.125deg) skewY(-3.125deg); }
            55.5% { transform: skewX(1.5625deg) skewY(1.5625deg); }
            66.6% { transform: skewX(-0.78125deg) skewY(-0.78125deg); }
            77.7% { transform: skewX(0.390625deg) skewY(0.390625deg); }
            88.8% { transform: skewX(-0.1953125deg) skewY(-0.1953125deg); }
        }
        .jello-effect {
            color: #e67e22;
            animation: jello 3s infinite;
            display: inline-block;
            transform-origin: center center;
        }
    </style>
    <div class="jello-effect">
  """
  body
  nbRawHtml: "</div>"

template ufoFloat(body: untyped) =
  nbRawHtml: hlHtml"""
    <style>
        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-25px); }
            100% { transform: translateY(0px); }
        }
        .float-effect {
            color: #2ecc71;
            text-shadow: 0 0 20px #2ecc71;
            animation: float 4s ease-in-out infinite;
            display: inline-block;
        }
    </style>
    <div class="float-effect">
  """
  body
  nbRawHtml: "</div>"

template tada(body: untyped) =
  nbRawHtml: hlHtml"""
    <style>
        @keyframes tada {
            0% { transform: scale3d(1, 1, 1) rotate(0); }
            10%, 20% { transform: scale3d(.9, .9, .9) rotate(-3deg); }
            30%, 50%, 70%, 90% { transform: scale3d(1.1, 1.1, 1.1) rotate(3deg); }
            40%, 60%, 80% { transform: scale3d(1.1, 1.1, 1.1) rotate(-3deg); }
            100% { transform: scale3d(1, 1, 1) rotate(0); }
        }
        .tada-effect {
            color: #f1c40f;
            animation: tada 3s infinite;
            display: inline-block;
        }
    </style>
    <div class="tada-effect">
  """
  body
  nbRawHtml: "</div>"

template questions =
  slide:
    jello:
      bigText: "Frågor?"
  slide:
    ufoFloat:
      bigText: "Frågor?"
  slide:
    tada:
      bigText: "Frågor?"
  slide:
    slowRotate:
      bigText: "Frågor?"
  slide:
    bouncing:
      bigText: "Frågor?"
  slide:
    heartbeat:
      bigText: "Frågor?"
  slide:
    rubberband:
      bigText: "Frågor?"
  slide:
    swing:
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

questions()
intro()
studies()
exjobb()
jobSearch()
firstJob()
ai()
avslutning()



nbSave