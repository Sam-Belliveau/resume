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
    "BigQuery", "NumPy", "SciPy", "PyTorch", "JAX", "CUDA"),
)

#let quant = skills(
  category("Languages",
    [#emph[Proficient] — Python, C, C++, Java, Rust, Swift#h(1em)#emph[Familiar] — OCaml, Go, SQL, Verilog HDL, Bash]),
  category("Numerics & ML",
    "NumPy", "SciPy", "JAX", "PyTorch", "Monte-Carlo Simulation", "Least-Squares & Convex Optimization"),
  category("Signal Processing",
    "Kalman Filters", "Adaptive Filters (LMS / RLS)", "Spectral Analysis", "Cross-Correlation / TDOA"),
  category("Systems",
    "CUDA", "HLS / FPGA (Allo, Alveo U280)", "RP2040 / DMA", "Embedded C", "SQLite", "Linux", "Docker", "Git"),
)

#let research = skills(
  category("Languages",
    [#emph[Proficient] — C, C++, Python, Swift, Rust, Java#h(1em)#emph[Familiar] — C\#, Go, JavaScript, OCaml, SQL, Bash]),
  category("ML & Perception",
    "PyTorch", "JAX", "NumPy", "SciPy", "ARKit", "Apple Vision", "Computer Vision", "Signal Processing"),
  category("Graphics & GPU",
    "GLSL", "OpenGL", "Metal", "CUDA", "SFML", "Real-Time Rendering", "HDR Output", "Image Resampling"),
  category("Systems & Embedded",
    "ROS", "HLS / FPGA", "Verilog HDL", "RP2040 / DMA", "iOS", "SQLite", "Linux", "Docker", "Git"),
)

#let ndseg = skills(
  category("Sensing & Estimation",
    "Kalman Filters", "LMS / RLS Adaptive Filters", "TDOA Cross-Correlation", "Blue-Noise Sampling"),
  category("ML & Vision",
    "PyTorch", "JAX", "NumPy", "SciPy", "ARKit", "Apple Vision", "Structure from Motion", "Gaussian Splatting"),
  category("Systems",
    "CUDA", "HLS / FPGA (Allo)", "RP2040 / DMA", "Embedded C", "iOS", "ROS", "SQLite", "CMake", "Linux", "Docker", "Git"),
  category("Languages",
    [#emph[Proficient] — Python, C, C++, Swift, Java, Rust#h(1em)#emph[Familiar] — OCaml, Go, SQL, Verilog HDL, Bash]),
)
