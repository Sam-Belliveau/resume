#import "../../lib/lib.typ": experience, bullet, line

#let entry = experience(
  organization: "Cornell University Autonomous Underwater Vehicles",
  title: "Robotics Software Engineer",
  location: "Ithaca, NY",
  dates: "11/2023 — 05/2026",
  bullets: (
    bullet(
      line[Cut CPU usage by 80% by moving the vehicle's Kalman-filter state estimation onto the GPU with CUDA.],
    ),
    bullet(
      line[Improved navigation precision by recasting thruster allocation as real-time least-squares optimization.],
    ),
  ),
)
