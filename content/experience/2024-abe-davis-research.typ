#import "../../lib/lib.typ": experience, bullet, line

// Facts follow the CaptureGraph NSF GRFP statements (Oct 2026), which supersede
// older résumé wording. Lead with the problem and the system, not the tools:
// field data is scarce and biased because people collect it on their own
// routines, and CaptureGraph closes the loop between data collected and guidance.
#let entry = experience(
  organization: "Cornell University — Prof. Abe Davis Lab",
  title: "Undergraduate Researcher → Ph.D. Student",
  location: "Ithaca, NY",
  dates: "06/2023 — Present",
  bullets: (
    bullet(lead: "CaptureGraph (Project Lead)",
      line[Lead a general-purpose system for collecting scientific field data with phones:],
      line[a researcher writes a capture protocol, and one app guides anyone through it, with no custom app per study.],
    ),
    bullet(
      line[Each study declares the data it needs, and every phone's guidance updates as data arrives to show what is],
      line[still missing, so people's limited time goes to the gaps rather than to wherever their routines take them.],
    ),
    bullet(
      line[Ran it in a maize field with agriculture researchers and in a three-week, 18,408-photo campus stress test.],
      line[A Cornell team working with Weill Cornell doctors adopted its protocol format and library for emergency care.],
    ),
    bullet(lead: "CineCraft (CHI 2026)",
      line[Built the capture loop for an app that guides solo filmmakers through planned shots.],
    ),
  ),
)
