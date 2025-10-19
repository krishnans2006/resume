// Adapted from https://github.com/stuxf/basic-typst-resume-template

#let resume(
  author: "",
  author-position: center,
  personal-info-position: center,
  email: "",
  phone: "",
  location: "",
  github: "",
  linkedin: "",
  personal-site: "",
  primary-color: "#000000",
  secondary-color: "#222222",
  accent-color: "#000000",
  icon-color: "#53bb84",
  link-color: "#1155cc",
  font: "New Computer Modern",
  paper: "us-letter",
  author-font-size: 19pt,
  font-size: 10pt,
  margin: 0.45in,
  lang: "en",
  body,
) = {
  // Sets document metadata
  set document(author: author, title: author)
  
  // Document-wide formatting, including font and margins
  set text(
    // LaTeX style font
    font: font,
    size: font-size,
    lang: lang,
    // Disable ligatures so ATS systems do not get confused when parsing fonts.
    ligatures: false,
  )
  
  // Reccomended to have 0.5in margin on all sides
  set page(
    margin: margin,
    paper: paper,
  )
  
  // Link styles
  show link: underline
  
  // List styles
  set list(indent: 0.75em)
  
  // Small caps for section titles
  show heading.where(level: 2): it => [
    #pad(top: 0pt, bottom: -10pt, [#smallcaps(it.body)])
    #line(length: 100%, stroke: 1pt + rgb(accent-color))
  ]
  
  // Accent Color Styling
  show heading: set text(
    fill: rgb(accent-color),
  )
  
  show link: set text(
    fill: rgb(link-color),
  )
  
  // Name will be aligned left, bold and big
  show heading.where(level: 1): it => [
    #set align(author-position)
    #set text(
      weight: 700,
      size: author-font-size,
    )
    #pad(it.body, bottom: -0.2em)
  ]
  
  // Level 1 Heading
  [= #(author)]
  
  // Personal Info Helper
  let contact-item(value, prefix: "", link-type: "", suffix: "") = {
    if value != "" {
      if link-type != "" {
        prefix + link(link-type + value)[#(value)] + suffix
      } else {
        prefix + value + suffix
      }
    }
  }
  
  let colorize(svg, color) = {
    let blk = black.to-hex()
    if svg.contains(blk) {
      // Just replace
      svg.replace(blk, color.to-hex())
    } else {
      // Explicitly state color
      svg.replace("<svg ", "<svg fill=\"" + color.to-hex() + "\" ")
    }
  }
  
  let svg-icon(path, color) = {
    let svg = read(path)
    let svg = colorize(svg, color)
    [#box(image(bytes(svg), width: 1.1em), baseline: 20%) ]
  }
  
  // Personal Info
  pad(
    top: 0.25em,
    align(personal-info-position)[
      #show link: set text(fill: rgb(secondary-color))
      #set text(fill: rgb(secondary-color))
      #{
        let items = (
          contact-item(
            email,
            prefix: svg-icon("icons/email.svg", rgb(icon-color)),
            link-type: "mailto:",
          ),
          contact-item(
            phone,
            prefix: svg-icon("icons/phone.svg", rgb(icon-color)),
            link-type: "tel:",
          ),
          contact-item(
            location,
            prefix: svg-icon("icons/location.svg", rgb(icon-color)),
          ),
      // Uncomment below to split personal info section into two lines
      //   )
      //   items.filter(x => x != none).join(" | ")
      // }
      // \
      // #{
      //   let items = (
          contact-item(
            github,
            prefix: svg-icon("icons/github.svg", rgb(icon-color)),
            link-type: "https://github.com/",
          ),
          contact-item(
            linkedin,
            prefix: svg-icon("icons/linkedin.svg", rgb(icon-color)),
            link-type: "https://linkedin.com/in/",
          ),
          contact-item(
            personal-site,
            prefix: svg-icon("icons/link.svg", rgb(icon-color)),
            link-type: "https://",
          ),
        )
        items.filter(x => x != none).join(" | ")
      }
    ],
  )
  
  // Main body.
  set par(justify: true)
  
  body
}

// "Add space after list item"
#let gap = v(10pt, weak: true)

// Generic two by two component for resume
#let generic-two-by-two(
  top-left: "",
  top-right: "",
  bottom-left: "",
  bottom-right: "",
) = {
  [
    #top-left #h(1fr) #top-right \
    #bottom-left #h(1fr) #bottom-right
  ]
}

// Generic one by two component for resume
#let generic-one-by-two(
  left: "",
  right: "",
) = {
  [
    #left #h(1fr) #right
  ]
}

// Cannot just use normal --- ligature becuase ligatures are disabled for good reasons
#let dates-helper(
  start-date: "",
  end-date: "",
) = {
  start-date + " " + $dash.em$ + " " + end-date
}

// Section components below
#let edu(
  institution: "",
  degree: "",
  top: "",
  bottom: "",
) = {
  generic-two-by-two(
    top-left: strong(institution),
    bottom-left: emph(degree),
    top-right: top,
    bottom-right: bottom,
  )
}

#let work(
  title: "",
  dates: "",
  company: "",
  location: "",
) = {
  generic-two-by-two(
    top-left: strong(title),
    top-right: dates,
    bottom-left: company,
    bottom-right: emph(location),
  )
}

#let mini(
  title: "",
  company: "",
  dates: "",
) = {
  generic-one-by-two(
    left: {
      if title == "" {
        [*#company*]
      } else {
        [*#title* - #company]
      }
    },
    right: {
      if dates != "" {
        dates
      }
    },
  )
}

// #let certificates(
//   name: "",
//   issuer: "",
//   url: "",
//   date: "",
// ) = {
//   [
//     *#name*, #issuer
//     #if url != "" {
//       [ (#link("https://" + url)[#url])]
//     }
//     #h(1fr) #date
//   ]
// }

// #let extracurriculars(
//   activity: "",
//   dates: "",
// ) = {
//   generic-one-by-two(
//     left: strong(activity),
//     right: dates,
//  )
// }
