#import "../../lib/lib.typ": bullet, experience, line

#let entry = experience(
  organization: "Reddit, Inc.",
  title: "Software Intern — Consumer Product Team",
  location: "Remote",
  dates: "July 2022 — Sept 2022",
  bullets: (
    bullet(
      line[Collaborated with the Taxonomy Group to classify and ensure the safety of more than 138,000 active subreddits.],
    ),
    bullet(
      line[Designed and built a synthetic data generation script to rigorously validate the accuracy of the classification models.],
    ),
    bullet(
      line[Integrated real-time statistical metrics into the content-moderation dashboard to speed detection of harmful content.],
    ),
  ),
)
