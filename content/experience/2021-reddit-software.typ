#import "../../lib/lib.typ": bullet, experience, line

#let entry = experience(
  organization: "Reddit, Inc.",
  title: "Software Intern — Consumer Product Team",
  location: "Remote",
  dates: "July 2021 — Sept 2021",
  bullets: (
    bullet(
      line[Built a moderator-engagement notification system, querying BigQuery and storing state in Cassandra.],
    ),
    bullet(
      line[Wrote the unit-test suite for the team's user-feedback analysis pipeline, catching regressions before deploy.],
    ),
  ),
)
