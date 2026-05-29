#import "../../lib/lib.typ": experience, bullet, line

#let entry = experience(
  organization: "Cornell University — Prof. Abe Davis Lab",
  title: "Undergraduate Researcher",
  location: "Ithaca, NY",
  dates: "June 2023 — Present",
  bullets: (
    bullet(lead: "CaptureGraph (System Architect)",
      line[Built a DSL that serializes experimental procedures into a reusable graph data model;],
      line[a companion iOS runtime interprets that graph to deliver state-aware AR guidance and validate captured data in real time.],
    ),
    bullet(lead: "ReCapture (Modernization)",
      line[Refactored over 7,000 lines of legacy Swift to add HDR and RAW photographic capture, exposing],
      line[the rigidity in those bespoke apps that ultimately motivated the pivot to the programmable CaptureGraph framework.],
    ),
    bullet(lead: "CineCraft (Mobile Vision)",
      line[Engineered a real-time stabilization filter on Apple's Vision framework that cleanly resolves],
      line[the longstanding conflict between subject tracking and zoom automation, enabling a smooth cinematic virtual focus puller.],
    ),
  ),
)
