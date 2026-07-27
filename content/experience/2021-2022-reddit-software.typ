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
      line[Built a moderator-engagement notification system, querying BigQuery and saving state in Cassandra.],
    ),
    bullet(lead: "2022",
      line[Invited back to join the Taxonomy Group: classified 138,000+ of the most active subreddits, and built a],
      line[synthetic-data generation script to measure the classifiers' accuracy against known ground-truth labels.],
    ),
  ),
)
