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
  bullet(line(expand: false)[\$20 sound-locating acoustic camera featured by a widely read electronics news site (2025)]),
)

#list_section("Publications",
  bullet(lead: "Second author, peer-reviewed HCI conference (2026)",
    line[Shot planning, capture, and post-processing for mobile],
    line[cinematography. Built the real-time capture loop and a filter that steadies its subject-tracking auto-zoom.],
  ),
  bullet(lead: "First author, in preparation",
    line[A framework that steers field data capture toward the conditions a dataset lacks.],
    line[Designed and built the system: each study declares the data it needs, so a new study needs no new phone app.],
  ),
  bullet(lead: "Second author, medical AI journal, in preparation",
    line[Turning medical flowcharts into executable procedures.],
    line[Contributed the procedure format and library of the system I lead, which each flowchart is compiled into.],
  ),
)

// Both current positions end "Present"; the research position leads as the
// longer-running one.
#let research = (..abe-davis,
  title: "Undergraduate Researcher → Ph.D. Student, Graphics, Vision & Interaction Lab",
  bullets: (
    bullet(
      line[Lead the development of a general-purpose system that guides people as they collect scientific field data:],
      line[each study is a procedure declaring the data it needs, and a server steers every phone toward what is missing.],
    ),
    ..abe-davis.bullets.slice(1, 3),
    bullet(
      line[A university team working with physicians adopted its procedure format and library for emergency care,],
      line[turning medical documents into step-by-step procedures that first responders follow while treating patients.],
    ),
  ),
)

#position_section(
  research,
  (..ta-ml, title: "Teaching Assistant — Large-Scale Machine Learning Systems"),
  (..ta-mcu, title: "Teaching Assistant — Microcontrollers", bullets: (
    bullet(
      line[Graded weekly labs, helped groups debug hardware and software, and improved the pin and equipment docs.],
    ),
  )),
  // The 3D extension moves here: in this order the device is described below the TA entry.
  (..sound-localization, title: "Project Lead — Real-Time Sound Localization System", bullets: (
    ..sound-localization.bullets,
    bullet(
      line[A later group I taught as a TA extended it to 3D with four mics; I explained its design and helped them debug.],
    ),
  )),
)
