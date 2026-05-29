#import "../../lib/lib.typ": experience, bullet, line

#let entry = experience(
  organization: "Cornell University Autonomous Underwater Vehicles",
  title: "Robotics Software Engineer",
  location: "Ithaca, NY",
  dates: "Nov 2023 — Present",
  bullets: (
    bullet(
      line[Cut CPU usage by 80% by offloading the heavy Kalman-filter computations onto the GPU using NVIDIA's CUDA framework.],
    ),
    bullet(
      line[Improved autonomous navigation precision by implementing least-squares optimization for dynamic thruster allocation.],
    ),
  ),
)
