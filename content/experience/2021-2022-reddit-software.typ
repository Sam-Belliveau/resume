#import "../../lib/lib.typ": bullet, experience, line

// Combined view of the two Reddit summers — one entry header instead of two,
// with dated leads making the separate stints (and the return offer) explicit.
// The swe variant still uses the two standalone entries.
#let entry = experience(
  organization: "Reddit, Inc.",
  title: "Software Intern — Consumer Product Team",
  location: "Remote",
  dates: "Summers 2021 & 2022",
  bullets: (
    bullet(lead: "2021",
      line[Built a notification system for moderator-engagement campaigns, querying BigQuery and storing state in Cassandra,],
      line[and wrote the unit-test suite for a user-feedback analysis pipeline to catch regressions before they reached production.],
    ),
    bullet(lead: "2022",
      line[Invited back to join the Taxonomy Group: classified more than 138,000 of the most active subreddits, and built a],
      line[synthetic-data generation script to measure the classification models' accuracy against known ground-truth labels.],
    ),
    bullet(
      line[Added live statistical metrics to the content-moderation dashboard so reviewers could spot harmful content sooner.],
    ),
  ),
)
