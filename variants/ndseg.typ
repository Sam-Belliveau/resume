#import "../lib/lib.typ": resume, education_section, experience_section, publication_section, project_section, awards_section, skills_section, bullet, line
#import "../content/header.typ": entry as header
#import "../content/skills.typ": ndseg as skills

#import "../content/education/cornell-phd.typ": entry as phd
#import "../content/education/cornell.typ": entry as cornell
#import "../content/experience/2024-abe-davis-research-ndseg.typ": entry as abe-davis
#import "../content/publications/2026-capturegraph.typ": entry as capturegraph
#import "../content/publications/2026-genflows.typ": entry as genflows
#import "../content/publications/2025-cinecraft.typ": entry as cinecraft
#import "../content/projects/2025-sound-localization.typ": entry as sound-localization
#import "../content/experience/2026-ta-cs-4787.typ": entry as ta-ml
#import "../content/experience/2025-ta-ece-4760.typ": entry as ta-mcu
#import "../content/honors.typ": entry as honors

// NDSEG fellowship CV, written for the ARL research topic ARL-BAA-0008,
// Information Processing & Fusion — chiefly its "Active and Collaborative
// Sensing" thrust (acquire the most informative data, user in the loop) and
// "Data and Information Fusion". The research-focus line and the NDSEG lab
// entry use the same facts as the GRFP research plan, in ARL's vocabulary.
// CUAUV and Feinstein are left out: Sam considers them minor (Oct 2026).
#let phd-focus = (..phd, bullets: (
  bullet(lead: "Focus",
    line[Active, collaborative sensing: AR and adaptive sampling that guide people to the data a study needs.],
  ),
))

#let cornell-courses = (..cornell, bullets: (
  bullet(lead: "Coursework",
    line[Signals & Systems, Optimal Control, Reinforcement Learning, Advanced Machine Learning,],
    line[Analysis of Algorithms, Computer Architecture, High-Level Synthesis, Microcontrollers, and Linear Algebra.],
  ),
))

#show: resume.with(
  header: header,
  description: "NDSEG fellowship CV (ARL information processing & fusion) — Sam Belliveau",
  keywords: ("CV", "NDSEG", "Active Sensing", "Data Fusion", "Cornell"),
)

#education_section(phd-focus, cornell-courses)
#experience_section(abe-davis, title: "Research Experience")
#publication_section(capturegraph, genflows, cinecraft)
#project_section(sound-localization, title: "Selected Project")
// Two bullets keep the older TA entry short: the 3D extension of the acoustic
// camera matters more here than the documentation work.
#let ta-mcu-short = (..ta-mcu, bullets: ta-mcu.bullets.slice(0, 2))

#experience_section(ta-ml, ta-mcu-short, title: "Teaching")
// The robotics award is left out: Sam finds it a weak fit for NDSEG (Oct 2026).
#awards_section((..honors, items: honors.items.slice(0, 1)), title: "Recognition")
#skills_section(skills)
