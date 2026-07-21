#import "../../lib/lib.typ": experience, bullet, line

#let entry = experience(
  organization: "StuyPulse Robotics",
  title: "President of Software Engineering",
  location: "Manhattan, NY",
  dates: "Dec 2018 — June 2022",
  bullets: (
    bullet(
      line[Led a 50-member software team writing the control code for a 120 lb robot that competed at the FRC Championships.],
    ),
    bullet(
      line[Implemented, taught, and documented PID control, odometry, digital filtering, and motion profiling across the whole team.],
    ),
    bullet(
      line[Presented the software design to competition judges and won four Innovation in Control Awards across four seasons.],
    ),
  ),
)
