#import "../lib/lib.typ": skills, category

#let _languages = category("Languages",
  "C", "C++", "C#", "Python", "Java", "Rust", "Swift", "Go",
  "JavaScript", "Verilog HDL", "SQL", "HTML", "GLSL", "Bash / ZSH")

#let swe = skills(
  _languages,
  category("Technologies",
    "Git", "Linux", "Docker", "VS Code", "ROS", "Cassandra",
    "BigQuery", "NumPy", "SciPy", "PyTorch", "GenAI"),
)

#let robotics = skills(
  _languages,
  category("Technologies",
    "Git", "Linux", "Docker", "VS Code", "ROS", "Cassandra",
    "BigQuery", "NumPy", "SciPy", "PyTorch"),
)

#let research = skills(
  _languages,
  category("ML & Vision", "PyTorch", "NumPy", "SciPy", "Apple Vision", "GenAI"),
  category("Systems & Embedded", "CUDA", "ROS", "RP2040 / DMA", "HLS / FPGA"),
  category("Graphics & Tools", "GLSL", "OpenGL", "SFML", "Git", "Linux", "Docker"),
)
