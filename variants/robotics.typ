#import "../lib/lib.typ": resume, education_section, skills_section, experience_section, project_section, bullet, line
#import "../content/header.typ": entry as header
#import "../content/skills.typ": robotics as skills

#import "../content/education/cornell.typ": entry as cornell
#import "../content/experience/2024-abe-davis-research.typ": entry as abe-davis
#import "../content/experience/2023-cuauv-software.typ": entry as cuauv
#import "../content/experience/2023-feinstein-signal-analysis.typ": entry as feinstein
#import "../content/experience/2022-vex-robotics.typ": entry as vex
#import "../content/experience/2018-stuypulse-robotics.typ": entry as stuypulse
#import "../content/projects/2023-uci-chess-engine.typ": entry as chess
#import "../content/projects/2020-stuylib.typ": entry as stuylib

// The robotics résumé shows Cornell with relevant coursework appended.
#let cornell-courses = (..cornell, bullets: (
  bullet(lead: "Coursework",
    line[Computer Science I–III, Digital Logic & Computer Organization, Signals & Systems, Fast Robots,],
    line[Linear Algebra, Differential Equations, Embedded Systems, Microcontrollers, Optimal Control, Data Science.],
  ),
))

#show: resume.with(
  header: header,
  description: "Robotics & embedded systems résumé — Sam Belliveau",
  keywords: ("Resume", "Robotics Engineer", "Cornell"),
)

#education_section(cornell-courses)
#skills_section(skills)
#experience_section(abe-davis, cuauv, feinstein, vex, stuypulse)
#project_section(chess, stuylib)
