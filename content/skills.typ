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

#let quant = skills(
  category("Languages",
    [#emph[Proficient] — Python, C, C++, Java, Rust, Swift#h(1em)#emph[Familiar] — OCaml, SQL, Verilog HDL]),
  category("Numerics & ML",
    "NumPy", "SciPy", "JAX", "PyTorch", "Monte-Carlo Simulation", "Least-Squares & Convex Optimization"),
  category("Signal Processing",
    "Kalman Filters", "Adaptive Filters (LMS / RLS)", "Spectral Analysis", "Cross-Correlation / TDOA"),
  category("Systems",
    "CUDA", "HLS / FPGA", "RP2040 / DMA", "Linux", "Docker", "Git"),
)

#let research = skills(
  category("Languages",
    [#emph[Proficient] — C, C++, Python, Swift, Rust, Java#h(1em)#emph[Familiar] — C\#, Go, JavaScript]),
  category("ML & Perception",
    "PyTorch", "NumPy", "SciPy", "Apple Vision", "Computer Vision", "Signal Processing"),
  category("Graphics & GPU",
    "GLSL", "OpenGL", "CUDA", "SFML", "Real-Time Rendering"),
  category("Systems & Embedded",
    "ROS", "HLS / FPGA", "Verilog HDL", "RP2040 / DMA", "Linux", "Docker", "Git"),
)
