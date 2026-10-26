#import "../../lib/lib.typ": experience, bullet, line

// Facts follow the CaptureGraph NSF GRFP statements (Oct 2026), which supersede
// older résumé wording: field sites, the 18,408-photo campus study, and the
// emergency-medicine adoption all come from there.
#let entry = experience(
  organization: "Cornell University — Prof. Abe Davis Lab",
  title: "Undergraduate Researcher → Ph.D. Student",
  location: "Ithaca, NY",
  dates: "06/2023 — Present",
  bullets: (
    bullet(lead: "CaptureGraph (Project Lead)",
      line[Lead a system in which researchers write field-capture protocols in],
      line[Python and one iOS app runs any of them, guiding people with AR and requesting the data a study still lacks.],
    ),
    bullet(
      line[Took it into a maize field and to a campus site, where three participants took 18,408 RAW photos over three],
      line[weeks. A Cornell team working with Weill Cornell physicians adopted its protocol format for emergency care.],
    ),
    bullet(lead: "CineCraft (CHI 2026)",
      line[Built the real-time capture loop for a phone app that guides solo filmmakers],
      line[through planned shots, with a filter that keeps subject tracking and auto-zoom from making the guide jitter.],
    ),
  ),
)
