#import "../../lib/lib.typ": experience, bullet, line

#let entry = experience(
  organization: "Cornell University Autonomous Underwater Vehicles",
  title: "Robotics Software Engineer",
  location: "Ithaca, NY",
  dates: "Nov 2023 — Present",
  bullets: (
    bullet(
      line[Cut CPU usage by 80% by moving the vehicle's Kalman-filter state estimation onto the GPU with NVIDIA's CUDA toolkit.],
    ),
    bullet(
      line[Improved the sub's navigation precision by recasting dynamic thruster allocation as a real-time least-squares optimization.],
    ),
  ),
)
