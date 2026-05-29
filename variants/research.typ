#import "../lib/lib.typ": resume, education_section, experience_section, publication_section, awards_section, skills_section, project_section
#import "../content/header.typ": entry as header
#import "../content/skills.typ": research as skills

#import "../content/education/cornell-phd.typ": entry as phd
#import "../content/education/cornell.typ": entry as cornell
#import "../content/education/hofstra.typ": entry as hofstra
#import "../content/publications/2026-capturegraph.typ": entry as capturegraph
#import "../content/publications/2025-cinecraft.typ": entry as cinecraft
#import "../content/publications/2025-dynabox.typ": entry as dynabox
#import "../content/experience/2024-abe-davis-research.typ": entry as abe-davis
#import "../content/experience/2025-ta-ece-4760.typ": entry as ta
#import "../content/experience/2022-vex-robotics.typ": entry as vex
#import "../content/honors.typ": entry as honors
#import "../content/projects/2025-sound-localization.typ": entry as sound-localization
#import "../content/projects/2025-smolvla.typ": entry as smolvla

#show: resume.with(
  header: header,
  description: "Research résumé (computer graphics & vision) — Sam Belliveau",
  keywords: ("Resume", "PhD Student", "Cornell"),
)

// Standard research-résumé order, tuned to fill exactly one page. To trim first
// drop the SmolVLA project, then the VEX teaching entry, then Hofstra.
#education_section(phd, cornell, hofstra)
#experience_section(abe-davis, title: "Research Experience")
#publication_section(capturegraph, cinecraft, dynabox)
#experience_section(ta, vex, title: "Teaching Experience")
#project_section(sound-localization, smolvla, title: "Selected Projects")
#awards_section(honors)
#skills_section(skills)
