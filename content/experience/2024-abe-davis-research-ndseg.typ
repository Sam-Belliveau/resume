#import "../../lib/lib.typ": experience, bullet, line

// NDSEG-angled view of the Davis-lab work, for ARL-BAA-0008 (Information
// Processing & Fusion): frames CaptureGraph as closed-loop, human-in-the-loop
// collaborative sensing. Facts follow the CaptureGraph repo and the NSF GRFP
// research plan (Oct 2026).
#let entry = experience(
  organization: "Cornell University — Prof. Abe Davis Lab",
  title: "Undergraduate Researcher → Ph.D. Student",
  location: "Ithaca, NY",
  dates: "06/2024 — Present",
  bullets: (
    bullet(lead: "CaptureGraph (Project Lead)",
      line[Lead a general-purpose system that guides people as they collect field data:],
      line[each study is a procedure declaring the data it needs, and a server steers every phone toward what is missing.],
    ),
    bullet(
      line[Field data is biased toward when and where people happen to go, so the server requests the conditions least],
      line[covered so far (sun, weather, place, time). In simulation, sending each person to the nearest of 16 requests],
      line(expand: false)[instead of the single least-covered one gave 1.8× the photos per hour at similar coverage.],
    ),
    bullet(
      line[In a maize field, three people's phones aligned to one anchor scan, so their scans merged into one 3D model.],
      line[On campus, 40 routine outings left a gap in sun positions; 15 guided ones nearly closed it (18,408 photos in all).],
    ),
    bullet(
      line[A Cornell team working with Weill Cornell physicians adopted its procedure format and Python library],
      line[to turn medical documents into step-by-step procedures that first responders complete while treating patients.],
    ),
  ),
)
