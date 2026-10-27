#import "../../lib/lib.typ": experience, bullet, line

// NDSEG-angled view of the Davis-lab work, for ARL-BAA-0008 (Information
// Processing & Fusion): frames CaptureGraph as closed-loop, human-in-the-loop
// collaborative sensing. Facts follow the CaptureGraph repo and the NSF GRFP
// research plan (Oct 2026).
#let entry = experience(
  organization: "Cornell University — Prof. Abe Davis Lab",
  title: "Undergraduate Researcher → Ph.D. Student",
  location: "Ithaca, NY",
  dates: "06/2023 — Present",
  bullets: (
    bullet(lead: "CaptureGraph (Project Lead)",
      line[Lead a general-purpose system that guides people as they collect field data:],
      line[each study declares the data it needs, and a server steers every participant's phone toward what is still missing.],
    ),
    bullet(
      line[Field data is biased toward when and where people happen to go, so the server requests the conditions least],
      line[covered so far (sun, weather, place, time); in simulation, batching nearby requests gave 1.8× photos per hour.],
    ),
    bullet(
      line[With agriculture researchers, several people's scans of a maize field merged into one 3D model. On campus,],
      line[40 routine outings left a gap in sun positions; once the app showed it, 15 more nearly closed it (18,408 photos).],
    ),
    bullet(
      line[A Cornell team working with Weill Cornell physicians adopted its protocol format and Python library],
      line[to turn medical documents into step-by-step procedures that first responders complete while treating patients.],
    ),
  ),
)
