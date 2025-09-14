#import "./template.typ": *

#let primary-color = "#000000"
#let secondary-color = "#555555"
#let accent-color = "#00ab44"
#let icon-color = "#53bb84"
#let link-color = "#1155cc"

// Set these to match the colors above for a more colorful resume
#let template-secondary-color = "#222222"
#let template-accent-color = "#000000"

#show: resume.with(
  author: "Krishnan Shankar",
  location: "Fairfax, VA",
  email: "krishnans2006@gmail.com",
  phone: "703-559-0131",
  github: "krishnans2006",
  linkedin: "krishnan-shankar",
  personal-site: "krishy.dev",

  primary-color: primary-color,
  secondary-color: template-secondary-color,
  accent-color: template-accent-color,
  icon-color: icon-color,
  link-color: link-color,
)

#let accent(value) = {
  set text(fill: rgb(accent-color))
  strong(value)
}

#let plainlink(url, value) = {
  show link: set text(
    fill: rgb(primary-color)
  )
  link(url)[#value]
}

== Education

#edu(
  institution: "University of Illinois Urbana-Champaign",
  degree: "Bachelor of Science in Computer Engineering",
  top: "Expected Graduation: May 2027",
  bottom: [GPA: *4.0/4.0*],
)
- Current Coursework: #accent[ECE 391] Computer Systems/OS Design, #accent[ECE 385] Digital Systems/FPGA Lab
- Past Coursework: #accent[CS 225] Data Structures, #accent[ECE 220H] Computer Systems Programming, #accent[ECE 198H] Honors Project

#edu(
  institution: "Thomas Jefferson High School for Science & Technology",
  degree: "Fairfax County Public Schools, Advanced Studies Diploma",
  top: "Fairfax, VA",
  bottom: [GPA: *4.467/4.0*],
)
- Coursework: Artificial Intelligence 1 & 2 (#accent[A],#accent[A]), Machine Learning 1 & 2 (#accent[A],#accent[A]), Robotic Systems (#accent[A]),
  \
  Robot Automation (#accent[A]), Digital Electronics (#accent[A]), Analog Electronics (#accent[A]), Engineering Senior Research Project (#accent[A])

== Work Experience

#work(
  title: "Quantum Computing Student Researcher",
  location: "McLean, VA",
  company: plainlink("https://mitre.org")[The MITRE Corporation],
  dates: dates-helper(start-date: "June 2025", end-date: "Present"),
)
- Derived a model (with 15+ variables) from scratch to relate quantum computer characteristics to real-world effectiveness
- Determined quantitative requirements for quantum computers to #accent[crack RSA 2048 encryption]
- Presented this research in multiple company-wide briefings, and started writing a research paper

#work(
  title: "Networking/Telecommunications Student Researcher",
  location: "McLean, VA",
  company: plainlink("https://mitre.org")[The MITRE Corporation],
  dates: dates-helper(start-date: "June 2023", end-date: "May 2025"),
)
- Designed and built a #accent[novel 5G proxy] to improve speed/bandwidth for non-5G access to 5G networks
- Integrated the proxy into a real US government application, achieving a #accent[99.93% reduction] in connection time
- Used Ansible, Python, and Bash scripting to automate deployment of the proxy (and other parts of 5G infrastructure)
- Presented this innovation in numerous company-wide briefings and sponsor presentations

#work(
  title: "Lead Student Systems Administrator",
  location: "Alexandria, VA",
  company: [#plainlink("https://sysadmins.tjhsst.edu")[TJ Computer Systems Lab], Fairfax County Public Schools],
  dates: dates-helper(start-date: "Jun 2021", end-date: "Present"),
)
- Configured a high-availability, triple-replicated network filesystem across 5 servers using Ceph and NFS
  - The system now serves over #accent[2000 teachers/students] and securely stores over #accent[200TB of data]
- Developed #link("https://github.com/tjcsl/tin")[Turn-In], a code autograder built with Django that is now used in every computer science class at TJ
  - Over #accent[460,000 student submissions] have been automatically graded since September 2022
- Managed and improved the #link("https://github.com/tjcsl/ion")[TJ Intranet], a school-wide hub used for club signups, free printing, bus tracking, and more
- Also responsible for a 50+ node compute cluster, a Docker-based website hosting platform, and self-hosted mailservers

== Extracurricular Activities

#mini(
  title: "Chair",
  company: plainlink("https://glug.acm.illinois.edu")[GNU/Linux User Group \@ UIUC],
  dates: dates-helper(start-date: "May 2025", end-date: "Present"),
)

#mini(
  title: "Helper",
  company: plainlink("https://sigpwny.com")[SIGPwny (Cybersecurity \@ UIUC)],
  dates: dates-helper(start-date: "Apr 2025", end-date: "Present"),
)
- Helped build a #link("https://github.com/sigpwny/2025-ectf-uiuc")[secure satellite TV system], using Rust, for MITRE's eCTF competition (placed 5th internationally)

#mini(
  title: "Club President",
  company: plainlink("https://tjuav.org")[TJ Unmanned Aerial Vehicle],
  dates: dates-helper(start-date: "Feb 2021", end-date: "Aug 2024"),
)
- Designed and integrated a #accent[triple-radio communications system] for reliable flight control and fast image transfer
- Developed a #link("https://github.com/tj-uav/GroundStation")[custom ground station] using Flask and React for telemetry, object detection/classification, and payload drop

== Projects
#set list(indent: 0em, spacing: 0.8em)
- A #link("https://github.com/krishnans2006/nixos-config")[custom NixOS configuration] to declaratively manage the OS, software, and dotfiles for my PC and laptop
- #link("https://github.com/krishnans2006/strife")[Strife], an open-source clone of modern chat apps like Discord/Slack, built from scratch with Django and websockets
- 20+ #link("https://github.com/stars/krishnans2006/lists/my-hackathon-projects")[Hackathon projects] (built with a team), 15+ #link("https://github.com/stars/krishnans2006/lists/my-games")[desktop/terminal games], 10+ #link("https://github.com/stars/krishnans2006/lists/my-websites")[custom websites], and #link("https://github.com/stars/krishnans2006/lists/my-school-projects")[so] #link("https://github.com/stars/krishnans2006/lists/electric-plug-my-pcbs")[much] #link("https://github.com/stars/krishnans2006/lists/my-discord-bots")[more]!

== Technical Skills
#set list(indent: 0em, spacing: 0.8em)
- *Languages*: #accent[Python] (Django, Flask, PyTorch), #accent[Rust], Nix, SystemVerilog, C, C++, Bash, JavaScript, Go, Java
- *Technologies*: #accent[Linux] (NixOS, Debian/Ubuntu, RHEL, Raspberry Pi), #accent[Git] (GitHub, GitLab), Ansible, Docker, Kubernetes
- *Full-Stack Web Development*: Django/Flask, NodeJS, Svelte, React, HTML/CSS/JavaScript, SQL, Firebase
