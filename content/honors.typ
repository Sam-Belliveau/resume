#import "../lib/lib.typ": awards, award

#let entry = awards(
  award("Featured in Hackaday",
    detail: link("https://hackaday.com/2025/06/27/audio-localization-gear-built-on-the-cheap/")[Audio Localization Gear Built On The Cheap],
    date: "2025"),
  award("Innovation in Control Award", detail: "FIRST Robotics, four-time recipient", date: "2019 — 2022"),
  // Add a fellowship once awarded, e.g.:
  // award("NSF Graduate Research Fellowship", date: "2026"),
)
