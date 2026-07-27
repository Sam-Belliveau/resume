#import "../lib/lib.typ": resume, education_section, skills_section, experience_section, project_section, bullet, line
#import "../content/header.typ": entry as header
#import "../content/skills.typ": quant as skills

#import "../content/education/cornell-phd.typ": entry as phd
#import "../content/education/cornell.typ": entry as cornell
#import "../content/education/hofstra.typ": entry as hofstra
#import "../content/experience/2024-abe-davis-research-quant.typ": entry as abe-davis-quant
#import "../content/experience/2023-cuauv-software.typ": entry as cuauv
#import "../content/experience/2021-2022-reddit-software.typ": entry as reddit
#import "../content/projects/2025-smolvla.typ": entry as smolvla
#import "../content/projects/2026-llm-arithmetic-coding.typ": entry as arithmetic-coding
#import "../content/projects/2025-sound-localization.typ": entry as sound-localization

// The quant résumé shows Cornell with quant-relevant coursework appended.
// OCaml (CS 3110) is named deliberately — it is a known Jane Street signal.
// Course list verified against personal-context/CornellUniversity.pdf.
#let cornell-courses = (..cornell, bullets: (
  bullet(lead: "Coursework",
    line[Data Structures & Functional Programming (OCaml), Analysis of Algorithms, Optimal Control,],
    line[Reinforcement Learning, Advanced Machine Learning (grad), Signals & Systems, and Linear Algebra.],
  ),
))

#show: resume.with(
  header: header,
  description: "Quantitative research résumé — Sam Belliveau",
  keywords: ("Resume", "Quantitative Research", "Cornell"),
)

// Tuned to fill exactly one page. Swap candidates, in order of preference:
// projects/2023-uci-chess-engine (cut 07/2026 for breathing room at 11pt),
// projects/2026-nba-win-probability (probabilistic modeling, but stalled —
// no defensible results), experience/2023-feinstein-signal-analysis.
#education_section(phd, cornell-courses, hofstra)
#experience_section(abe-davis-quant, cuauv, reddit)
#project_section(smolvla, arithmetic-coding, sound-localization, title: "Selected Projects")
#skills_section(skills)
