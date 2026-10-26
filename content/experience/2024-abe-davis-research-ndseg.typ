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
      line[Lead development of a closed-loop field-sensing system: each study declares],
      line[the data distribution it needs, and a server directs every participant's phone toward what is still missing.],
    ),
    bullet(
      line[Adapted void-and-cluster sampling to request the least-covered conditions across sun position, weather,],
      line[location, and time of day; in simulation, routing nearby requests together yields 1.8× the photos per hour.],
    ),
    bullet(
      line[Merged several people's ARKit scans of a maize field into one 3D model, each scan aligned to a shared anchor;],
      line[at a campus site, three participants took 18,408 RAW photos of one view over three weeks, from dawn to dusk.],
    ),
    bullet(
      line[There, 40 unguided outings left a gap in sun positions that 15 guided outings nearly closed. A Cornell team],
      line[working with Weill Cornell physicians adopted its protocol format and Python library for emergency care.],
    ),
  ),
)
