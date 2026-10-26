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
      line[Lead a field data-collection system (900+ commits) in which each study],
      line[declares the data distribution it needs and a server decides what each participant's phone captures next.],
    ),
    bullet(
      line[Adapted void-and-cluster blue-noise sampling into the request scheduler: a Gaussian-kernel density over sun],
      line[position, weather, location, and time, combined under one L2 metric, finds the least-covered conditions.],
    ),
    bullet(
      line[In simulation, routing nearby requests together yields 1.8× the photos per hour of sending them one at a time;],
      line[at a campus site, 40 unguided outings left a gap in sun positions that 15 guided outings nearly closed.],
    ),
    bullet(lead: "CineCraft (CHI 2026)",
      line[Second author; built the real-time capture loop and its filter for tracking–zoom jitter.],
    ),
  ),
)
