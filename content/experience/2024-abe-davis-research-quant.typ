#import "../../lib/lib.typ": experience, bullet, line

// Quant-angled view of the Davis-lab work: leads with the importance-sampling
// core of CaptureGraph rather than the AR/graphics side. Facts verified against
// the CaptureGraph repo (scheduling/ package, git history, figure notebooks).
#let entry = experience(
  organization: "Cornell University — Prof. Abe Davis Lab",
  title: "Undergraduate Researcher",
  location: "Ithaca, NY",
  dates: "06/2023 — Present",
  bullets: (
    bullet(lead: "CaptureGraph (First Author)",
      line[Built a distribution-aware data-collection framework in 900+ commits —],
      line[a Python DSL, iOS runtime, and team server — scheduling captures by their marginal statistical value.],
    ),
    bullet(
      line[Adapted Void-and-Cluster blue-noise sampling into an importance sampler over Gaussian-kernel energies,],
      line[combining solar geometry, weather, location, and time-of-day distances under one shared L2 metric.],
    ),
    bullet(
      line[Validated the sampler in a year-long Monte-Carlo simulation of four captures per day, measuring max-min],
      line[solar-angle coverage against random baselines and two human timelapse datasets of 945 and 409 captures.],
    ),
    bullet(lead: "CineCraft (CHI 2026)",
      line[Second author; designed and built the real-time subject-tracking and stabilization loop.],
    ),
  ),
)
