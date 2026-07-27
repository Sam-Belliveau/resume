#import "../../lib/lib.typ": project, bullet, line

#let entry = project(
  title: "StuyLib",
  tech: ("Java", "Control Theory", "Digital Filtering", "JitPack"),
  dates: "Jan 2020 — Aug 2022",
  link: "https://github.com/StuyPulse/StuyLib",
  bullets: (
    bullet(
      line[Created StuyLib, an award-winning control-theory and digital-filtering library adopted by many FRC teams.],
    ),
    bullet(
      line[Kept it easy to adopt and maintain with thorough JavaDocs and tagged JitPack releases other teams could pin.],
    ),
  ),
)
