#import "../../lib/lib.typ": bullet, experience, line

#let entry = experience(
  organization: "Reddit, Inc.",
  title: "Software Intern — Consumer Product Team",
  location: "Remote",
  dates: "July 2022 — Sept 2022",
  bullets: (
    bullet(
      line[Worked with the Taxonomy Group to classify 138,000+ of the most active subreddits and vet each for safety.],
    ),
    bullet(
      line[Built a synthetic-data generation script to measure the classifiers' accuracy against ground-truth labels.],
    ),
    bullet(
      line[Added live statistics to the content-moderation dashboard so reviewers could spot harmful content sooner.],
    ),
  ),
)
