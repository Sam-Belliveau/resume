#import "../lib/lib.typ": resume, skills_section, position_section, list_section, prose_section, bullet, line
#import "../content/skills.typ": ndseg as skills

#import "../content/experience/2024-abe-davis-research-ndseg.typ": entry as abe-davis
#import "../content/experience/2026-ta-cs-4787.typ": entry as ta-ml
#import "../content/experience/2025-ta-ece-4760.typ": entry as ta-mcu
#import "../content/projects/2025-sound-localization.typ": entry as sound-localization

// Redacted twin of ndseg.typ, laid out like NDSEG's "Redacted Resume/CV"
// template: Applicant Summary, Education & Certifications (chronological),
// Skills, Awards, Publications, Experience (reverse chronological). NDSEG bars
// names of people, organizations, and institutions, and any detail that ties
// back to the applicant — so no header, no school / lab / advisor / course
// numbers / venue / project names, and no co-authors. Facts are the same as
// in ndseg.typ, only made anonymous. Upload as Redacted_Resume.pdf.

#show: resume.with(
  description: "NDSEG redacted résumé",
  keywords: ("CV", "NDSEG", "Active Sensing", "Data Fusion"),
)

#prose_section("NDSEG Applicant Summary",
  line[Computer science Ph.D. student (B.S., electrical & computer engineering, 2026) who builds systems that guide],
  line[people to collect the field data a study needs. I lead a general-purpose system in which each study declares the],
  line[data it needs and phones guide participants, with augmented reality, toward what is missing. My research asks],
  line(expand: false)[how to coordinate many people's limited time so that together they collect the most informative data.],
)

#list_section("Education & Certifications",
  bullet(line(expand: false)[2026, B.S., Electrical & Computer Engineering — Cum Laude, GPA 3.7 / 4.3]),
  bullet(lead: "Coursework",
    line[Signals & Systems, Optimal Control, Reinforcement Learning, Advanced Machine Learning,],
    line[Analysis of Algorithms, Computer Architecture, High-Level Synthesis, Microcontrollers, and Linear Algebra.],
  ),
  bullet(line(expand: false)[2031 (expected), Ph.D., Computer Science — began 08/2026]),
)

#skills_section(skills)

#list_section("Awards",
  bullet(line(expand: false)[Acoustic camera project featured by a widely read electronics news site (2025)]),
  bullet(line(expand: false)[Innovation in Control Award, four-time recipient, international high-school robotics competition (2020 & 2022)]),
)

#list_section("Publications",
  bullet(lead: "First author, in preparation",
    line[A distribution-aware, programmable framework for guided field data capture.],
    line[Designed and built the system, which separates what a study needs from how people are guided in the field.],
  ),
  bullet(lead: "Second author, peer-reviewed HCI conference (2026)",
    line[Shot planning, capture, and post-processing for mobile],
    line[cinematography. Built the real-time capture loop and a filter that removes the guide's tracking–zoom jitter.],
  ),
)

// Both current positions end "Present"; the research position leads as the
// longer-running one.
#let research = (..abe-davis,
  title: "Undergraduate Researcher → Ph.D. Student, Graphics, Vision & Interaction Lab",
  bullets: (
    bullet(
      line[Lead the development of a general-purpose system that guides people as they collect scientific field data:],
      line[each study declares the data it needs, and a server steers every participant's phone toward what is still missing.],
    ),
    ..abe-davis.bullets.slice(1, 3),
    bullet(
      line[A university team working with physicians adopted its protocol format and library for emergency care,],
      line[turning medical documents into step-by-step procedures that first responders follow while treating patients.],
    ),
  ),
)

#position_section(
  research,
  (..ta-ml, title: "Teaching Assistant — Large-Scale Machine Learning Systems"),
  (..ta-mcu, title: "Teaching Assistant — Microcontrollers", bullets: ta-mcu.bullets.slice(0, 2)),
  (..sound-localization, title: "Project Lead — Real-Time Sound Localization System"),
)
