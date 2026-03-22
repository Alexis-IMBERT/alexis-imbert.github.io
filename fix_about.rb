content = File.read("about.md")

content = content.sub(/<style>.*$/m, "")
content = content.sub(/\.skills-section.*$/m, "")

style = <<~CSS
<style>
.skills-section { display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 1.5rem; margin-top: 1.5rem; }
.skill-category { background-color: #f8f9fa; padding: 1.5rem; border-radius: 8px; border: 1px solid #e9ecef; }
.skill-category h3 { margin-top: 0; margin-bottom: 1rem; color: #0056b3; font-size: 1.25rem; }
.skill-category ul { list-style: none; margin: 0; padding: 0; }
.skill-category li { padding: 0.4rem 0; border-bottom: 1px solid #dee2e6; color: #495057; }
.skill-category li:last-child { border-bottom: none; }

.cv-timeline { display: flex; flex-direction: column; gap: 1.5rem; margin-top: 1.5rem; margin-bottom: 2.5rem; }
.cv-item { border-left: 3px solid #0056b3; padding-left: 1.5rem; margin-left: 0.5rem; }
.cv-item-title { margin: 0 0 0.25rem 0 !important; font-size: 1.25rem !important; color: #212529 !important; }
.cv-item-meta { color: #6c757d; font-size: 0.9rem; margin-bottom: 0.5rem; font-weight: 500; }
.cv-item-desc { margin: 0; }
.cv-item-desc ul { margin-bottom: 0 !important; margin-left: 1.5rem !important; }
</style>
CSS

File.write("about.md", content.strip + "\n\n" + style + "\n")
