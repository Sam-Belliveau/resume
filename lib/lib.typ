// Public API. Content files and variants import everything they need from here.
// `line` deliberately shadows Typst's built-in line element within this scope;
// content never draws rules, and section rules use the built-in directly inside
// sections.typ (which does not import this shadow).

#import "schema.typ": header, education, experience, project, publication, skills, category, award, awards
#import "engine.typ": line, bullet
#import "sections.typ": education_section, experience_section, project_section, publication_section, skills_section, awards_section
#import "resume.typ": resume
