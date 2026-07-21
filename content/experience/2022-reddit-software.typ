#import "../../lib/lib.typ": bullet, experience, line

#let entry = experience(
  organization: "Reddit, Inc.",
  title: "Software Intern — Consumer Product Team",
  location: "Remote",
  dates: "July 2022 — Sept 2022",
  bullets: (
    bullet(
      line[Worked with the Taxonomy Group to classify more than 138,000 of the most active subreddits and vet each for safety.],
    ),
    bullet(
      line[Built a synthetic-data generation script to measure the classification models' accuracy against known ground-truth labels.],
    ),
    bullet(
      line[Added live statistical metrics to the content-moderation dashboard so reviewers could spot harmful content sooner.],
    ),
  ),
)
