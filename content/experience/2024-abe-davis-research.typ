#import "../../lib/lib.typ": experience, bullet, line

#let entry = experience(
  organization: "Cornell University — Prof. Abe Davis Lab",
  title: "Undergraduate Researcher",
  location: "Ithaca, NY",
  dates: "06/2023 — Present",
  bullets: (
    bullet(lead: "CaptureGraph (System Architect)",
      line[Built a framework where a capture procedure is a typed graph in a Python DSL and an iOS],
      line[runtime executes it — guiding capture with AR, validating data live, and scheduling the statistically valuable samples.],
    ),
    bullet(lead: "ReCapture (Modernization)",
      line[Reworked over 7,000 lines of legacy Swift to add HDR and RAW capture, hitting firsthand the],
      line[rigidity of single-purpose capture apps — the experience that motivated the programmable CaptureGraph framework.],
    ),
    bullet(lead: "CineCraft (Mobile Vision)",
      line[Wrote a real-time stabilization filter on Apple's Vision framework that resolves the tension],
      line[between subject tracking and zoom automation, enabling a smooth, handheld cinematic virtual focus puller (CHI 2026).],
    ),
  ),
)
