#import "../lib/lib.typ": resume, education_section, publication_section, experience_section, project_section
#import "../content/header.typ": entry as header

#import "../content/education/cornell.typ": entry as cornell
#import "../content/education/hofstra.typ": entry as hofstra
#import "../content/publications/2026-capturegraph.typ": entry as capturegraph
#import "../content/publications/2025-cinecraft.typ": entry as cinecraft
#import "../content/publications/2025-dynabox.typ": entry as dynabox
#import "../content/experience/2025-ta-ece-4760.typ": entry as ta
#import "../content/experience/2024-abe-davis-research.typ": entry as abe-davis
#import "../content/projects/2025-sound-localization.typ": entry as sound-localization
#import "../content/projects/2025-smolvla.typ": entry as smolvla

#show: resume.with(header: header)

#education_section(cornell, hofstra)
#publication_section(capturegraph, cinecraft, dynabox, title: "Publications & Manuscripts")
#experience_section(ta, abe-davis, title: "Research Experience")
#project_section(sound-localization, smolvla)
