#import "../../lib/lib.typ": experience, bullet, line

#let entry = experience(
  organization: "Feinstein Institute for Medical Research",
  title: "Signal Analysis Intern",
  location: "Manhasset, NY",
  dates: "Jan 2023 — May 2023",
  bullets: (
    bullet(
      line[Engineered an automated Sharp-Wave-Ripple detection pipeline in Python and SciPy to process large EEG datasets.],
    ),
    bullet(
      line[Analyzed ripple characteristics to refine the detection algorithms and directly improve seizure-prediction models.],
    ),
  ),
)
