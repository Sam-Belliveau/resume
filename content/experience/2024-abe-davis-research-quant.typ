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
      line[Built a distribution-aware data-collection framework in over 900 commits — a Python DSL, an iOS],
      line[runtime, and a team server — that schedules future captures by the marginal statistical value of each new observation.],
    ),
    bullet(
      line[Adapted Void-and-Cluster blue-noise sampling into an importance sampler over Gaussian-kernel energies, combining],
      line[solar geometry, weather, location, and time-of-day distances under one shared L2 metric; a lazy, column-wise vectorized],
      line[NumPy engine keeps O(n²) energy updates fast on large candidate grids without materializing the full pairwise matrix.],
    ),
    bullet(
      line[Validated the sampler in a year-long, four-captures-per-day Monte-Carlo simulation, measuring max-min solar-angle],
      line[coverage against random-sampling baselines and two human-collected timelapse datasets of 945 and 409 captures.],
    ),
    bullet(lead: "CineCraft (CHI 2026)",
      line[Second author on the accepted paper; designed and built its real-time subject-tracking and stabilization],
      line[loop — causal filtering and perspective math that reconcile subject tracking with zoom automation on a handheld phone.],
    ),
  ),
)
