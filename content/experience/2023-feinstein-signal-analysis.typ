#import "../../lib/lib.typ": experience, bullet, line

#let entry = experience(
  organization: "Feinstein Institute for Medical Research",
  title: "Signal Analysis Intern",
  location: "Manhasset, NY",
  dates: "Jan 2023 — May 2023",
  bullets: (
    bullet(
      line[Built an automated sharp-wave-ripple detector in Python and SciPy to pull candidate events out of large EEG datasets.],
    ),
    bullet(
      line[Analyzed the characteristics of detected ripples to tune the detector and sharpen the lab's seizure-prediction models.],
    ),
  ),
)
