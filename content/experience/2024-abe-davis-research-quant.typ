#import "../../lib/lib.typ": experience, bullet, line

// Quant-angled view of the Davis-lab work: leads with the sampling core of
// CaptureGraph rather than the AR/graphics side. Facts verified against the
// CaptureGraph repo and the NSF GRFP research plan (Oct 2026).
#let entry = experience(
  organization: "Cornell University — Prof. Abe Davis Lab",
  title: "Undergraduate Researcher → Ph.D. Student",
  location: "Ithaca, NY",
  dates: "06/2023 — Present",
  bullets: (
    bullet(lead: "CaptureGraph (First Author)",
      line[Lead a general-purpose system for scientific field data collection: each study],
      line[declares the data distribution it needs, and a server decides what each participant's phone captures next.],
    ),
    bullet(
      line[Treated scheduling as a sampling problem: people's routines bias what they collect, so the server adapts],
      line[void-and-cluster blue-noise sampling to request the conditions least covered so far (sun, weather, place, time).],
    ),
    bullet(
      line[In simulation, batching nearby requests into one walk yields 1.8× the photos per hour of one at a time; at a],
      line[campus site, 40 routine outings left a gap in sun positions that 15 more nearly closed once the app showed it.],
    ),
    bullet(lead: "CineCraft (CHI 2026)",
      line[Second author; built the real-time capture loop and its filter for tracking–zoom jitter.],
    ),
  ),
)
