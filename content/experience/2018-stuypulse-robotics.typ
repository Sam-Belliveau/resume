#import "../../lib/lib.typ": experience, bullet, line

#let entry = experience(
  organization: "StuyPulse Robotics",
  title: "President of Software Engineering",
  location: "Manhattan, NY",
  dates: "Dec 2018 — June 2022",
  bullets: (
    bullet(
      line[Led and taught a 50-member software team writing the controls for a 120 lb robot competing in FRC Championships.],
    ),
    bullet(
      line[Implemented, taught, and documented PID control, odometry, digital filtering, and motion profiling for the team.],
    ),
    bullet(
      line[Communicated the software design to competition judges and won four Innovation in Control Awards across seasons.],
    ),
  ),
)
