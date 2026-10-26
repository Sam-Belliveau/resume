#import "../../lib/lib.typ": bullet, experience, line

#let entry = experience(
  organization: "Reddit, Inc.",
  title: "Software Intern — Consumer Product Team",
  location: "Remote",
  dates: "July 2022 — Sept 2022",
  bullets: (
    bullet(
      line[Classified 138,000+ of the most active subreddits by purpose with the Taxonomy Group, using user surveys.],
    ),
    bullet(
      line[Built a synthetic-data generator to measure the classifiers' accuracy against known ground-truth labels.],
    ),
    bullet(
      line[Added AI safety filters to internal tools that measure how accurately moderators label rule-breaking posts.],
    ),
  ),
)
