#import "../lib/lib.typ": resume, education_section, skills_section, experience_section, project_section
#import "../content/header.typ": entry as header
#import "../content/skills.typ": swe as skills

#import "../content/education/cornell.typ": entry as cornell
#import "../content/experience/2023-cuauv-software.typ": entry as cuauv
#import "../content/experience/2023-feinstein-signal-analysis.typ": entry as feinstein
#import "../content/experience/2022-reddit-software.typ": entry as reddit-2022
#import "../content/experience/2021-reddit-software.typ": entry as reddit-2021
#import "../content/projects/2023-uci-chess-engine.typ": entry as chess
#import "../content/projects/2022-dolphin-emu.typ": entry as dolphin
#import "../content/projects/2021-gameboy-emulator.typ": entry as gameboy

#show: resume.with(header: header)

#education_section(cornell)
#skills_section(skills)
#experience_section(cuauv, feinstein, reddit-2022, reddit-2021)
#project_section(chess, dolphin, gameboy)
