#import "../../lib/lib.typ": bullet, experience, line

#let entry = experience(
  organization: "Reddit, Inc.",
  title: "Software Intern — Consumer Product Team",
  location: "Remote",
  dates: "July 2021 — Sept 2021",
  bullets: (
    bullet(
      line[Authored comprehensive unit tests to ensure reliability and prevent regressions in user feedback analysis before deployment.],
    ),
    bullet(
      line[Leveraged BigQuery and Cassandra to architect a scalable notification system for moderator-engagement campaigns.],
    ),
  ),
)
