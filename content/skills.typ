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
  category("Languages",
    [#emph[Proficient] — C++, Python, Swift, Rust#h(1em)#emph[Familiar] — C, C\#, Go, Java, JavaScript]),
  category("ML & Perception",
    "PyTorch", "NumPy", "SciPy", "Apple Vision", "Computer Vision", "Signal Processing"),
  category("Graphics & GPU",
    "GLSL", "OpenGL", "CUDA", "SFML", "Real-Time Rendering"),
  category("Systems & Embedded",
    "ROS", "HLS / FPGA", "Verilog HDL", "RP2040 / DMA", "Linux", "Docker", "Git"),
)
