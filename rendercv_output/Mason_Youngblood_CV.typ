
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Mason Youngblood"
#let locale-catalog-page-numbering-style = context { "Mason Youngblood - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Last updated in July 2025"
#let locale-catalog-language = "en"
#let design-page-size = "us-letter"
#let design-colors-text = rgb(0, 0, 0)
#let design-colors-section-titles = rgb(0, 0, 0)
#let design-colors-last-updated-date-and-page-numbering = rgb(0, 0, 0)
#let design-colors-name = rgb(0, 0, 0)
#let design-colors-connections = rgb(0, 0, 0)
#let design-colors-links = rgb(58, 134, 255)
#let design-section-titles-font-family = "IBM Plex Mono"
#let design-section-titles-bold = true
#let design-section-titles-line-thickness = 0.5pt
#let design-section-titles-font-size = 1.4em
#let design-section-titles-type = "with-partial-line"
#let design-section-titles-vertical-space-above = 0.5cm
#let design-section-titles-vertical-space-below = 0.3cm
#let design-section-titles-small-caps = false
#let design-links-use-external-link-icon = true
#let design-text-font-size = 8pt
#let design-text-leading = 0.6em
#let design-text-font-family = "IBM Plex Mono"
#let design-text-alignment = "justified"
#let design-text-date-and-location-column-alignment = right
#let design-header-photo-width = 3.5cm
#let design-header-use-icons-for-connections = true
#let design-header-name-font-family = "IBM Plex Mono"
#let design-header-name-font-size = 20pt
#let design-header-name-bold = true
#let design-header-small-caps-for-name = false
#let design-header-connections-font-family = "IBM Plex Mono"
#let design-header-vertical-space-between-name-and-connections = 0.7cm
#let design-header-vertical-space-between-connections-and-first-section = 0.7cm
#let design-header-use-icons-for-connections = true
#let design-header-horizontal-space-between-connections = 0.5cm
#let design-header-separator-between-connections = ""
#let design-header-alignment = center
#let design-highlights-summary-left-margin = 0cm
#let design-highlights-bullet = "•"
#let design-highlights-nested-bullet = "-"
#let design-highlights-top-margin = 0.25cm
#let design-highlights-left-margin = 0.4cm
#let design-highlights-vertical-space-between-highlights = 0.25cm
#let design-highlights-horizontal-space-between-bullet-and-highlights = 0.5em
#let design-entries-vertical-space-between-entries = 1.2em
#let design-entries-date-and-location-width = 4.15cm
#let design-entries-allow-page-break-in-entries = true
#let design-entries-horizontal-space-between-columns = 0.1cm
#let design-entries-left-and-right-margin = 0.2cm
#let design-page-top-margin = 1.6cm
#let design-page-bottom-margin = 1.6cm
#let design-page-left-margin = 1cm
#let design-page-right-margin = 1cm
#let design-page-show-last-updated-date = true
#let design-page-show-page-numbering = true
#let design-links-underline = false
#let design-entry-types-education-entry-degree-column-width = 1cm
#let date = datetime.today()

// Metadata:
#set document(author: name, title: name + "'s CV", date: date)

// Page settings:
#set page(
  margin: (
    top: design-page-top-margin,
    bottom: design-page-bottom-margin,
    left: design-page-left-margin,
    right: design-page-right-margin,
  ),
  paper: design-page-size,
  footer: if design-page-show-page-numbering {
    text(
      fill: design-colors-last-updated-date-and-page-numbering,
      align(center, [_#locale-catalog-page-numbering-style _]),
      size: 0.9em,
    )
  } else {
    none
  },
  footer-descent: 0% - 0.3em + design-page-bottom-margin / 2,
)
// Text settings:
#let justify
#let hyphenate
#if design-text-alignment == "justified" {
  justify = true
  hyphenate = true
} else if design-text-alignment == "left" {
  justify = false
  hyphenate = false
} else if design-text-alignment == "justified-with-no-hyphenation" {
  justify = true
  hyphenate = false
}
#set text(
  font: design-text-font-family,
  size: design-text-font-size,
  lang: locale-catalog-language,
  hyphenate: hyphenate,
  fill: design-colors-text,
  // Disable ligatures for better ATS compatibility:
  ligatures: true,
)
#set par(
  spacing: 0pt,
  leading: design-text-leading,
  justify: justify,
)
#set enum(
  spacing: design-entries-vertical-space-between-entries,
)

// Highlights settings:
#let highlights(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: design-highlights-vertical-space-between-highlights,
    indent: design-highlights-left-margin,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#show list: set list(
  marker: design-highlights-nested-bullet,
  spacing: design-highlights-vertical-space-between-highlights,
  indent: 0pt,
  body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
)

// Entry utilities:
#let bullet-entry(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: 0pt,
    indent: 0pt,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#let three-col(
  left-column-width: 1fr,
  middle-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (auto, auto, auto),
) = [
  #block(
    grid(
      columns: (left-column-width, middle-column-width, right-column-width),
      column-gutter: design-entries-horizontal-space-between-columns,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #middle-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

#let two-col(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, auto),
  column-gutter: design-entries-horizontal-space-between-columns,
) = [
  #block(
    grid(
      columns: (left-column-width, right-column-width),
      column-gutter: column-gutter,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

// Main heading settings:
#let header-font-weight
#if design-header-name-bold {
  header-font-weight = 700
} else {
  header-font-weight = 400
}
#show heading.where(level: 1): it => [
  #set par(spacing: 0pt)
  #set align(design-header-alignment)
  #set text(
    font: design-header-name-font-family,
    weight: header-font-weight,
    size: design-header-name-font-size,
    fill: design-colors-name,
  )
  #if design-header-small-caps-for-name [
    #smallcaps(it.body)
  ] else [
    #it.body
  ]
  // Vertical space after the name
  #v(design-header-vertical-space-between-name-and-connections)
]

#let section-title-font-weight
#if design-section-titles-bold {
  section-title-font-weight = 700
} else {
  section-title-font-weight = 400
}

#show heading.where(level: 2): it => [
  #set align(left)
  #set text(size: (1em / 1.2)) // reset
  #set text(
    font: design-section-titles-font-family,
    size: (design-section-titles-font-size),
    weight: section-title-font-weight,
    fill: design-colors-section-titles,
  )
  #let section-title = (
    if design-section-titles-small-caps [
      #smallcaps(it.body)
    ] else [
      #it.body
    ]
  )
  // Vertical space above the section title
  #v(design-section-titles-vertical-space-above, weak: true)
  #block(
    breakable: false,
    width: 100%,
    [
      #if design-section-titles-type == "moderncv" [
        #two-col(
          alignments: (right, left),
          left-column-width: design-entries-date-and-location-width,
          right-column-width: 1fr,
          left-content: [
            #align(horizon, box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles))
          ],
          right-content: [
            #section-title
          ]
        )

      ] else [
        #box(
          [
            #section-title
            #if design-section-titles-type == "with-partial-line" [
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ] else if design-section-titles-type == "with-full-line" [

              #v(design-text-font-size * 0.4)
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ]
          ]
        )
      ]
     ] + v(1em),
  )
  #v(-1em)
  // Vertical space after the section title
  #v(design-section-titles-vertical-space-below - 0.5em)
]

// Links:
#let original-link = link
#let link(url, body) = {
  body = [#if design-links-underline [#underline(body)] else [#body]]
  body = [#if design-links-use-external-link-icon [#body#h(design-text-font-size/4)#box(
        fa-icon("external-link", size: 0.7em),
        baseline: -10%,
      )] else [#body]]
  body = [#set text(fill: design-colors-links);#body]
  original-link(url, body)
}

// Last updated date text:
#if design-page-show-last-updated-date {
  let dx
  if design-section-titles-type == "moderncv" {
    dx = 0cm
  } else {
    dx = -design-entries-left-and-right-margin
  }
  place(
    top + right,
    dy: -design-page-top-margin / 2,
    dx: dx,
    text(
      [_#locale-catalog-last-updated-date-style _],
      fill: design-colors-last-updated-date-and-page-numbering,
      size: 0.9em,
    ),
  )
}

#let connections(connections-list) = context {
  set text(fill: design-colors-connections, font: design-header-connections-font-family)
  set par(leading: design-text-leading*1.7, justify: false)
  let list-of-connections = ()
  let separator = (
    h(design-header-horizontal-space-between-connections / 2, weak: true)
      + design-header-separator-between-connections
      + h(design-header-horizontal-space-between-connections / 2, weak: true)
  )
  let starting-index = 0
  while (starting-index < connections-list.len()) {
    let left-sum-right-margin
    if type(page.margin) == "dictionary" {
      left-sum-right-margin = page.margin.left + page.margin.right
    } else {
      left-sum-right-margin = page.margin * 4
    }

    let ending-index = starting-index + 1
    while (
      measure(connections-list.slice(starting-index, ending-index).join(separator)).width
        < page.width - left-sum-right-margin
    ) {
      ending-index = ending-index + 1
      if ending-index > connections-list.len() {
        break
      }
    }
    if ending-index > connections-list.len() {
      ending-index = connections-list.len()
    }
    list-of-connections.push(connections-list.slice(starting-index, ending-index).join(separator))
    starting-index = ending-index
  }
  align(list-of-connections.join(linebreak()), design-header-alignment)
  v(design-header-vertical-space-between-connections-and-first-section - design-section-titles-vertical-space-above)
}

#let three-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (left, auto, right),
) = (
  if design-section-titles-type == "moderncv" [
    #three-col(
      left-column-width: right-column-width,
      middle-column-width: left-column-width,
      right-column-width: 1fr,
      left-content: right-content,
      middle-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      right-content: middle-content,
      alignments: (design-text-date-and-location-column-alignment, left, auto),
    )
  ] else [
    #block(
      [
        #three-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          middle-content: middle-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let two-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, design-text-date-and-location-column-alignment),
  column-gutter: design-entries-horizontal-space-between-columns,
) = (
  if design-section-titles-type == "moderncv" [
    #two-col(
      left-column-width: right-column-width,
      right-column-width: left-column-width,
      left-content: right-content,
      right-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      alignments: (design-text-date-and-location-column-alignment, auto),
    )
  ] else [
    #block(
      [
        #two-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let one-col-entry(content: "") = [
  #let left-space = design-entries-left-and-right-margin
  #if design-section-titles-type == "moderncv" [
    #(left-space = left-space + design-entries-date-and-location-width + design-entries-horizontal-space-between-columns)
  ]
  #block(
    [#set par(spacing: design-text-leading); #content],
    breakable: design-entries-allow-page-break-in-entries,
    inset: (
      left: left-space,
      right: design-entries-left-and-right-margin,
    ),
    width: 100%,
  )
]

= Mason Youngblood

// Print connections:
#let connections-list = (
  [#fa-icon("location-dot", size: 0.9em) #h(0.05cm)Brooklyn, NY],
  [#box(original-link("mailto:masonyoungblood@gmail.com")[#fa-icon("envelope", size: 0.9em) #h(0.05cm)masonyoungblood\@gmail.com])],
  [#box(original-link("tel:+1-843-307-7074")[#fa-icon("phone", size: 0.9em) #h(0.05cm)\(843\) 307-7074])],
  [#box(original-link("https://masonyoungblood.com/")[#fa-icon("link", size: 0.9em) #h(0.05cm)masonyoungblood.com])],
)
#connections(connections-list)



== Positions


#two-col-entry(
  left-content: [
    #strong[Stony Brook University, Institute for Advanced Computational Science]
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Postdoctoral Fellow])], column-gutter: 0cm)
  ],
  right-content: [
    Stony Brook, NY

Aug 2023 – present
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Max Planck Institute for Geoanthropology, Minds & Traditions Research Group]
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Postdoctoral Researcher])], column-gutter: 0cm)
  ],
  right-content: [
    Jena, DE

May 2021 – May 2023
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[Other Affiliations]

    #v(-design-text-leading)
    #v(design-highlights-top-margin);#highlights([#strong[University of Tennessee, Center for the Dynamics of Cultural Complexity]\

#v(-design-text-leading)\

#v(-design-text-leading)External Researcher \(May 2025 -- present\)],)
  ],
)



== Education


// NO DATE, YES DEGREE
#two-col-entry(
  left-column-width: 1cm,
  right-column-width: 1fr,
  alignments: (left, left),
  left-content: [
    
  ],
  right-content: [
     #pad(left: -4em)[(#emph[CUNY = City University of New York])]
  ],
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[PhD]],
  middle-content: [
    #strong[Graduate Center, CUNY], Animal Behavior and Comparative Psychology
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Dissertation: \"From psychology to phylogeny: bridging levels of analysis in cultural evolution\"])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Finalist, Richerson Award for Best PhD in Cultural Evolution \(2022\)],)
  ],
  right-content: [
    New York, NY

Apr 2021
  ],
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[MPhil]],
  middle-content: [
    #strong[Graduate Center, CUNY], Psychology

    
  ],
  right-content: [
    New York, NY

Feb 2020
  ],
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[MA]],
  middle-content: [
    #strong[Hunter College, CUNY], Psychology

    
  ],
  right-content: [
    New York, NY

Jan 2018
  ],
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[BS]],
  middle-content: [
    #strong[University of South Carolina, Honors College], Biology
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Minors in Neuroscience and Anthropology],[3.87 GPA],)
  ],
  right-content: [
    Columbia, SC

May 2015
  ],
)



== Teaching


#two-col-entry(
  left-content: [
    #strong[Queens College, CUNY]
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Teaching Assistant])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Introduction to College Biology \(BIOL 011\): Spring 2020 \(3 credits\), Fall 2019 \(3 credits\), Spring 2019 \(6 credits\)],[Principles of Evolutionary Biology \(BIOL 287 & 587\): Fall 2020 \(6 credits\), Fall 2019 \(3 credits\), Fall 2018 \(6 credits\), Fall 2017 \(3 credits\)],[Animal Behavior \(BIOL 345W & 685\): Spring 2021 \(3 credits\), Spring 2018 \(4 credits\)],)
  ],
  right-content: [
    Flushing, NY

Fall 2017 -- Spring 2021
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Hunter College, CUNY]
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Instructor])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([General Experimental Psychology \(PSYCH 25000\): Spring 2017 \(4 credits\), Fall 2016 \(4 credits\)],)
  ],
  right-content: [
    New York, NY

Fall 2016 -- Spring 2017
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Hunter College, CUNY]
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Teaching Assistant])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([General Experimental Psychology \(PSYCH 25000\): Spring 2016 \(4 credits\), Fall 2015 \(4 credits\)],[Neuroscience \(PSYCH 22400\): Spring 2016 \(3 credits\)],[Personality Psychology \(PSYCH 22000\): Fall 2015 \(3 credits\)],)
  ],
  right-content: [
    New York, NY

Fall 2015 --  Spring 2016
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[Guest Teaching \(Lectures\)]

    #v(-design-text-leading)
    #v(design-highlights-top-margin);#highlights([Stony Brook University, Philosophy of Technology \(Stony Brook, NY, Dec 2023\): Negativity bias in the spread of voter fraud conspiracy theory tweets during the 2020 US election],[Keio University, Evolution and Music \(Tokyo, JP, Dec 2023\): Cultural evolutionary approaches to the study of contemporary music],[Queens College, CUNY, Animal Behavior \(Flushing, NY, May 2021\): Cultural evolution],[Queens College, CUNY, Principles of Evolutionary Biology \(Flushing, NY, Nov 2020\): Cultural evolution],[Queens College, CUNY, Principles of Evolutionary Biology \(Flushing, NY, Sept 2018\): Genes, development, and environment],[Queens College, CUNY, Principles of Evolutionary Biology \(Flushing, NY, Nov 2017\): Cultural evolution],)
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[Guest Teaching \(Coding Workshops\)]

    #v(-design-text-leading)
    #v(design-highlights-top-margin);#highlights([Genspace, Community Biology Lab \(Brooklyn, NY, Jan 2023\): Models of cultural transmission in human populations],[University of Amsterdam, Social Learning Across the Lifespan and Generations \(5th ESLR Workshop\) \(Amsterdam, NL, July 2022\): Biased transmission and transformation in the cultural evolution of birdsong],[École Normale Supérieure, École des Hautes Études en Sciences Sociales \(Paris, FR, Apr 2022\): Biased transmission and transformation in the cultural evolution of birdsong],[Genspace, Community Biology Lab \(Brooklyn, NY, Mar 2022\): Models of cultural transmission in human populations],[Genspace, Community Biology Lab \(Brooklyn, NY, May 2021\): Models of cultural transmission in human populations],)
  ],
)



== Publications


// NO INDEX NUMBER
#two-col-entry(
  left-content: [
    #text(weight: "bold")[JOURNAL ARTICLES]
  ],
  right-content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
// HAS INDEX NUMBER
#three-col-entry(
  left-column-width: 2em,
  right-column-width: 4em,
  left-content: [1.],
  middle-content: [
    Whiten, A. and #strong[Youngblood, M.] Convergent evolution in whale and human vocal cultures. #emph[Science]. #link("https://doi.org/10.1126/science.adv2318")[10.1126/science.adv2318]
  ],
  right-content: [
    2025
  ],
)

#v(design-entries-vertical-space-between-entries)
// HAS INDEX NUMBER
#three-col-entry(
  left-column-width: 2em,
  right-column-width: 4em,
  left-content: [2.],
  middle-content: [
    #strong[Youngblood, M.] Language-like efficiency in whale communication. #emph[Science Advances]. #link("https://doi.org/10.1126/sciadv.ads6014")[10.1126/sciadv.ads6014]
  ],
  right-content: [
    2025
  ],
)

#v(design-entries-vertical-space-between-entries)
// HAS INDEX NUMBER
#three-col-entry(
  left-column-width: 2em,
  right-column-width: 4em,
  left-content: [3.],
  middle-content: [
    Pitocchelli, J., Albina, A., Bentley, R.A., Guerra, D., and #strong[Youngblood, M.] Temporal stability in songs across the breeding range of #emph[Geothlypis philadelphia] \(mourning warbler\) may be due to learning fidelity and transmission biases. #emph[Ornithology]. #link("https://doi.org/10.1093/ornithology/ukae046")[10.1093/ornithology/ukae046]
  ],
  right-content: [
    2025
  ],
)

#v(design-entries-vertical-space-between-entries)
// HAS INDEX NUMBER
#three-col-entry(
  left-column-width: 2em,
  right-column-width: 4em,
  left-content: [4.],
  middle-content: [
    Kornreich, A., Partridge, D., #strong[Youngblood, M.], and Parkins, K. Rehabilitation outcomes of bird-building collision victims in the Northeastern United States. #emph[PLoS ONE]. #link("https://doi.org/10.1371/journal.pone.0306362")[10.1371/journal.pone.0306362]
  ],
  right-content: [
    2024
  ],
)

#v(design-entries-vertical-space-between-entries)
// HAS INDEX NUMBER
#three-col-entry(
  left-column-width: 2em,
  right-column-width: 4em,
  left-content: [5.],
  middle-content: [
    Sobchuk, O., #strong[Youngblood, M.], and Morin, O. First-mover advantage in music. #emph[EPJ Data Science]. #link("https://doi.org/10.1140/epjds/s13688-024-00476-z")[10.1140/epjds/s13688-024-00476-z]
  ],
  right-content: [
    2024
  ],
)

#v(design-entries-vertical-space-between-entries)
// HAS INDEX NUMBER
#three-col-entry(
  left-column-width: 2em,
  right-column-width: 4em,
  left-content: [6.],
  middle-content: [
    #strong[Youngblood, M.] Language-like efficiency and structure in house finch song. #emph[Proceedings of the Royal Society B]. #link("https://doi.org/10.1098/rspb.2024.0250")[10.1098/rspb.2024.0250]
  ],
  right-content: [
    2024
  ],
)

#v(design-entries-vertical-space-between-entries)
// HAS INDEX NUMBER
#three-col-entry(
  left-column-width: 2em,
  right-column-width: 4em,
  left-content: [7.],
  middle-content: [
    #strong[Youngblood, M.], Stubbersfield, J.M., Morin, O., Glassman, R., and Acerbi, A. Negativity bias in the spread of voter fraud conspiracy theory tweets during the 2020 US election. #emph[Humanities and Social Sciences Communications]. #link("https://doi.org/10.1057/s41599-023-02106-x")[10.1057/s41599-023-02106-x]
  ],
  right-content: [
    2023
  ],
)

#v(design-entries-vertical-space-between-entries)
// HAS INDEX NUMBER
#three-col-entry(
  left-column-width: 2em,
  right-column-width: 4em,
  left-content: [8.],
  middle-content: [
    #strong[Youngblood, M.], Miton, H., and Morin, O. Statistical signals of copying are robust to time-and space-averaging. #emph[Evolutionary Human Sciences]. #link("https://doi.org/10.1017/ehs.2023.5")[10.1017/ehs.2023.5]
  ],
  right-content: [
    2023
  ],
)

#v(design-entries-vertical-space-between-entries)
// HAS INDEX NUMBER
#three-col-entry(
  left-column-width: 2em,
  right-column-width: 4em,
  left-content: [9.],
  middle-content: [
    Benjamin, F.J. et al... and #strong[Youngblood, M.] All intelligence is collective intelligence. #emph[Journal of Multiscale Neuroscience]. #link("https://doi.org/10.56280/1564736810")[10.56280/1564736810]
  ],
  right-content: [
    2023
  ],
)

#v(design-entries-vertical-space-between-entries)
// HAS INDEX NUMBER
#three-col-entry(
  left-column-width: 2em,
  right-column-width: 4em,
  left-content: [10.],
  middle-content: [
    #strong[Youngblood, M.] and Lahti, D.C. Content bias in the cultural evolution of house finch song. #emph[Animal Behaviour]. #link("https://doi.org/10.1016/j.anbehav.2021.12.012")[10.1016/j.anbehav.2021.12.012]
  ],
  right-content: [
    2022
  ],
)

#v(design-entries-vertical-space-between-entries)
// HAS INDEX NUMBER
#three-col-entry(
  left-column-width: 2em,
  right-column-width: 4em,
  left-content: [11.],
  middle-content: [
    #strong[Youngblood, M.], Baraghith, K., and Savage, P.E. Phylogenetic reconstruction of the cultural evolution of electronic music via dynamic community detection \(1975--1999\). #emph[Evolution & Human Behavior]. #link("https://doi.org/10.1016/j.evolhumbehav.2021.06.002")[10.1016/j.evolhumbehav.2021.06.002]
  ],
  right-content: [
    2021
  ],
)

#v(design-entries-vertical-space-between-entries)
// HAS INDEX NUMBER
#three-col-entry(
  left-column-width: 2em,
  right-column-width: 4em,
  left-content: [12.],
  middle-content: [
    Kornreich, A., #strong[Youngblood, M.], Mundinger, P.C., and Lahti, D.C. Female song can be as long and complex as male song in wild house finches \(#emph[Haemorhous mexicanus]\). #emph[The Wilson Journal of Ornithology]. #link("https://doi.org/10.1676/19-00126")[10.1676/19-00126]
  ],
  right-content: [
    2020
  ],
)

#v(design-entries-vertical-space-between-entries)
// HAS INDEX NUMBER
#three-col-entry(
  left-column-width: 2em,
  right-column-width: 4em,
  left-content: [13.],
  middle-content: [
    #strong[Youngblood, M.] Extremist ideology as a complex contagion: the spread of far-right radicalization in the United States between 2005 and 2017. #emph[Humanities & Social Sciences Communications]. #link("https://doi.org/10.1057/s41599-020-00546-3")[10.1057/s41599-020-00546-3]
  ],
  right-content: [
    2020
  ],
)

#v(design-entries-vertical-space-between-entries)
// HAS INDEX NUMBER
#three-col-entry(
  left-column-width: 2em,
  right-column-width: 4em,
  left-content: [14.],
  middle-content: [
    #strong[Youngblood, M.] A Raspberry Pi-based, RFID-equipped birdfeeder for the remote monitoring of wild bird populations. #emph[Ringing & Migration]. #link("https://doi.org/10.1080/03078698.2019.1759908")[10.1080/03078698.2019.1759908]
  ],
  right-content: [
    2019
  ],
)

#v(design-entries-vertical-space-between-entries)
// HAS INDEX NUMBER
#three-col-entry(
  left-column-width: 2em,
  right-column-width: 4em,
  left-content: [15.],
  middle-content: [
    #strong[Youngblood, M.] Conformity bias in the cultural transmission of music sampling traditions. #emph[Royal Society Open Science]. #link("https://doi.org/10.1098/rsos.191149")[10.1098/rsos.191149]
  ],
  right-content: [
    2019
  ],
)

#v(design-entries-vertical-space-between-entries)
// HAS INDEX NUMBER
#three-col-entry(
  left-column-width: 2em,
  right-column-width: 4em,
  left-content: [16.],
  middle-content: [
    #strong[Youngblood, M.] Cultural transmission modes of music sampling traditions remain stable despite delocalization in the digital age. #emph[PLoS ONE]. #link("https://doi.org/10.1371/journal.pone.0211860")[10.1371/journal.pone.0211860]
  ],
  right-content: [
    2019
  ],
)

#v(design-entries-vertical-space-between-entries)
// HAS INDEX NUMBER
#three-col-entry(
  left-column-width: 2em,
  right-column-width: 4em,
  left-content: [17.],
  middle-content: [
    #strong[Youngblood, M.] and Lahti, D. A bibliometric analysis of the interdisciplinary field of cultural evolution. #emph[Palgrave Communications]. #link("https://doi.org/10.1057/s41599-018-0175-8")[10.1057/s41599-018-0175-8]
  ],
  right-content: [
    2018
  ],
)

#v(design-entries-vertical-space-between-entries)
// NO INDEX NUMBER
#two-col-entry(
  left-content: [
    #text(weight: "bold")[BOOK CHAPTERS]
  ],
  right-content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
// HAS INDEX NUMBER
#three-col-entry(
  left-column-width: 2em,
  right-column-width: 4em,
  left-content: [18.],
  middle-content: [
    #strong[Youngblood, M.], Ozaki, Y., and Savage, P.E. Cultural evolution and music. #emph[The Oxford Handbook of Cultural Evolution]. #link("https://doi.org/10.1093/oxfordhb/9780198869252.013.42")[10.1093/oxfordhb/9780198869252.013.42]
  ],
  right-content: [
    2023
  ],
)

#v(design-entries-vertical-space-between-entries)
// NO INDEX NUMBER
#two-col-entry(
  left-content: [
    #text(weight: "bold")[PREPRINTS]
  ],
  right-content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
// HAS INDEX NUMBER
#three-col-entry(
  left-column-width: 2em,
  right-column-width: 4em,
  left-content: [19.],
  middle-content: [
    #strong[Youngblood, M.] Zebra finches transform random songs to exhibit linguistic laws. #emph[PsyArXiv]. #link("https://doi.org/10.31234/osf.io/m6z23_v1")[10.31234/osf.io/m6z23_v1]
  ],
  right-content: [
    2025
  ],
)

#v(design-entries-vertical-space-between-entries)
// HAS INDEX NUMBER
#three-col-entry(
  left-column-width: 2em,
  right-column-width: 4em,
  left-content: [20.],
  middle-content: [
    Wascher, C. and #strong[Youngblood, M.] Vocal efficiency in crows. #emph[bioRxiv]. #link("https://doi.org/10.1101/2025.07.03.663010")[10.1101/2025.07.03.663010]
  ],
  right-content: [
    2025
  ],
)

#v(design-entries-vertical-space-between-entries)
// HAS INDEX NUMBER
#three-col-entry(
  left-column-width: 2em,
  right-column-width: 4em,
  left-content: [21.],
  middle-content: [
    #strong[Youngblood, M.], Marie, A., and Morin, O. Status quo conservatism: A theory and a model. #emph[SocArXiv]. #link("https://doi.org/10.31234/osf.io/ngb58")[10.31234/osf.io/ngb58]
  ],
  right-content: [
    2025
  ],
)

#v(design-entries-vertical-space-between-entries)
// HAS INDEX NUMBER
#three-col-entry(
  left-column-width: 2em,
  right-column-width: 4em,
  left-content: [22.],
  middle-content: [
    Savage, P.E. et al... #strong[Youngblood, M.]... Does singing enhance cooperation more than speaking does? A global experimental Stage 1 Registered Report. #emph[PsyArXiv]. #link("https://doi.org/10.31234/osf.io/pv3m9")[10.31234/osf.io/pv3m9]
  ],
  right-content: [
    2024
  ],
)

#v(design-entries-vertical-space-between-entries)
// HAS INDEX NUMBER
#three-col-entry(
  left-column-width: 2em,
  right-column-width: 4em,
  left-content: [23.],
  middle-content: [
    #strong[Youngblood, M.] and Passmore, S. Simulation-based inference with deep learning shows speed climbers combine innovation and copying to improve performance. #emph[PsyArXiv]. #link("https://doi.org/10.31234/osf.io/n3rvk")[10.31234/osf.io/n3rvk]
  ],
  right-content: [
    2024
  ],
)

#v(design-entries-vertical-space-between-entries)
// HAS INDEX NUMBER
#three-col-entry(
  left-column-width: 2em,
  right-column-width: 4em,
  left-content: [24.],
  middle-content: [
    GomezdelaTorre Clavel, Macarena G, #strong[Youngblood, M.], and Lahti, D. Relationship between personality and cognitive traits in domestic rabbits \(#emph[Oryctolagus cuniculus]\). #emph[bioRxiv]. #link("https://doi.org/10.1101/2020.10.12.336024")[10.1101/2020.10.12.336024]
  ],
  right-content: [
    2020
  ],
)



== Presentations



#one-col-entry(
  content: [
    #strong[Invited Talks]

    #v(-design-text-leading)
    #v(design-highlights-top-margin);#highlights([Santa Fe Institute, Building a Science of Cultural Evolution for the 21st Century \(Santa Fe, NM, May 2025\): Social learning biases---from theory to inference],[Stony Brook University, Institute for Advanced Computational Science, Collective Creativity Workshop \(Stony Brook, NY, Apr 2025\): Creativity and innovation in cultural evolution],[Graduate Center, CUNY, Cognitive and Comparative Psychology Colloquium \(New York, NY, Feb 2025\): Complexity and efficiency in animal communication],[University of Miami \(Coral Gables, FL, Feb 2025\): Lyrai: building digital twin for acoustic design],[Goldsmiths, University of London, Science of the Creative and Performing Arts Group \(London, UK, Sept 2024\): Complexity in birdsong---using science to illuminate its origins, and art to motivate its conservation],[University of Oxford, Edward Grey Institute of Field Ornithology \(Oxford, UK, Sept 2024\): Complexity in birdsong---using science to illuminate its origins, and art to motivate its conservation],[Diverse Intelligences Summer Institute, Storyteller Salon \(St. Andrews, UK, July 2024\): Synthesizing imagined songs of extinct species],[Max Planck Institute for Evolutionary Anthropology, Linguistics and Cognitive Science Meet Diversity Workshop \(Leipzig, DE, July 2024\): Language-like efficiency and structure in house finch song],[Institut Jean Nicod, Évolution & Cognition Sociale \(Paris, FR, Mar 2024\): Cultural conservatism: a theory and model],[Stony Brook University, Ecology and Evolution Colloquium \(Stony Brook, NY, Mar 2024\): Complexity and efficiency in birdsong],[Mercy University, Animal Behavior Seminar \(Bronx, NY, Feb 2024\): The evolution of complexity in birdsong],[Max Planck Institute for Evolutionary Anthropology, Cultural Evolution of the Arts Workshop \(Leipzig, DE, Nov 2023\): Towards a cultural phylogeny of English-language fiction],[University of Bristol, Technology, Cognition, and Democracy Group \(Bristol, UK, Oct 2023\): Negativity bias in the spread of voter fraud conspiracy theory tweets during the 2020 US election],[Stony Brook University, Institute for Advanced Computational Science \(Stony Brook, NY, Sept 2023\): Language-like efficiency and structure in house finch song],[Max Planck Institute for Geoanthropology, Cognitive Technologies Workshop \(Leipzig, DE, Apr 2023\): Collective decision-making, discovery dynamics, and the emergence of open-ended techological growth \(presentation of working paper by James Winters and Mathieu Charbonneau\)],[Max Planck Institute for Geoanthropology, Communicative Efficiency Workshop \(Leipzig, DE, Apr 2023\): Efficiency and complexity in house finch song],[Max Planck Institute for Evolutionary Anthropology, Department of Human Behavior, Ecology, and Culture \(Leipzig, DE, Apr 2023\): Status quo conservatism in coordination games: the role of negotiation costs and bargaining power],[Max Planck Institute for Empirical Aesthetics, Computational Auditory Perception Research Group \(Frankfurt, DE, Nov 2022\): Cultural evolutionary approaches to the study of contemporary music],[Institut Jean Nicod, Évolution & Cognition Sociale \(Paris, FR, Oct 2022\): Signals of random copying in the cultural evolution of cattle brands are boosted by time- and space-averaging],[Max Planck Institute for the Study of Human History, From Cultural Evolution to Computational Humanities: Building a Bridge Workshop \(Jena, DE, June 2022\): Cultural evolutionary approaches to the study of contemporary music],[Vrije Universiteit Amsterdam, Social Psychology Section \(Amsterdam, NL, June 2022\): Negativity bias in the spread of voter fraud conspiracy theory tweets during the 2020 US election],[University of Tennessee, Center for the Dynamics of Social Complexity \(Knoxville, TN, Apr 2022\): From psychology to phylogeny: bridging levels of analysis in cultural evolution],[Max Planck Institute for Evolutionary Anthropology, Department of Human Behavior, Ecology, and Culture \(Leipzig, DE, Apr 2022\): Distinctiveness, copying, and complexity in the cultural evolution of cattle brands],[Institut Jean Nicod, Évolution & Cognition Sociale \(Paris, FR, Feb 2022\): From psychology to phylogeny: bridging levels of analysis in cultural evolution],[Queens College, Biology Department Colloquium \(Flushing, NY, Oct 2021\): From psychology to phylogeny: bridging levels of analysis in cultural evolution],[Early Career Social Learning Researcher's Society \(Virtual Meeting, Oct 2021\): Cultural transmission bias in the spread of voter fraud conspiracy theories on Twitter during the 2020 US election],[Max Planck Institute for Evolutionary Anthropology, Theory in Cultural Evolution Lab \(Leipzig, DE, Sept 2021\): Cultural transmission bias in the spread of voter fraud conspiracy theories on Twitter during the 2020 US election],[Max Planck Institute for Evolutionary Anthropology, Department of Linguistic and Cultural Evolution \(Leipzig, DE, Sept 2021\): From psychology to phylogeny: bridging levels of analysis in cultural evolution],[University of Pennsylvania, Social and Cultural Evolution Working Group \(Philadelphia, PA, Sept 2021\): From psychology to phylogeny: bridging levels of analysis in cultural evolution],[International Council on Systems Engineering, Social Systems Working Group \(Virtual Meeting, May 2021\): Agent-based modeling and generative inference in cultural evolution],[Thinking About the Cultural Evolution of Thinking Workshop \(Düsseldorf, DE, Jan 2021\): Inferring cognitive phenomena from cultural evolutionary patterns],[Stony Brook University, Institute for Advanced Computational Science \(Stony Brook, NY, Jan 2021\): Bridging pattern and process in cultural evolution and social behavior],[The Graduate Center, CUNY, Cognition and Comparative Psychology Colloquium \(New York, NY, Sept 2018\): Pattern and process in cultural evolution],[Queens College, CUNY, Biology Symposium \(Flushing, NY, Jan 2018\): A bibliometric analysis of interdisciplinary collaboration in the field of cultural evolution],)
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[Conference Talks]

    #v(-design-text-leading)
    #v(design-highlights-top-margin);#highlights([Cultural Evolution Society Conference \(Durham, UK, Sept 2024\): Language-like efficiency and structure in house finch song],[European Association of Archaeology Conference \(Rome IT, Aug 2024\): Statistical signals of copying are robust to time- and space-averaging],[Cultural Evolution Society Conference \(Aarhus, DK, Sept 2022\): Signals of random copying in the cultural evolution of cattle brands are robust to time- and space-averaging],[New America Foundation, Digging into the Data on Jan 6 \(Washington, DC, Dec 2021\): Cultural transmission bias in the spread of voter fraud conspiracy theories on Twitter during the 2020 US election],[Cultural Evolution Society Conference \(Virtual Meeting, June 2021\): Content bias in the cultural evolution of house finch song],[European Human Behaviour and Evolution Association \(Virtual Conference, Mar 2021\): Phylogenetic reconstruction of the cultural evolution of electronic music via dynamic community detection \(1975--1999\)],[Animal Behavior Society \(Virtual Conference, July 2020\): A Raspberry Pi-based, RFID-equipped birdfeeder for the remote monitoring of wild bird populations],[Cultural Evolution Society Conference \(Tempe, AZ, Oct 2018\): The cultural transmission of sampling traditions in a network of musical collaborators],[Cultural Evolution Society Conference \(Tempe, AZ, Oct 2018\): A bibliometric analysis of interdisciplinary collaboration in the field of cultural evolution],[International Behavioral Ecology Congress \(Minneapolis, MN, Aug 2018\): A bibliometric analysis of interdisciplinary collaboration in the field of cultural evolution],[Applications in Cultural Evolution Conference \(Tartu, EE, June 2018\): The cultural transmission of sampling traditions in a network of musical collaborators],[Applications in Cultural Evolution Conference \(Tartu, EE, June 2018\): A bibliometric analysis of interdisciplinary collaboration in the field of cultural evolution],[Cultural Evolution Society Conference \(Jena, DE, Sept 2017\): A bibliometric analysis of interdisciplinary collaboration in the field of cultural evolution],)
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[Conference Posters]

    #v(-design-text-leading)
    #v(design-highlights-top-margin);#highlights([European Human Behaviour and Evolution Association \(Virtual Conference, Apr 2022\): Cultural transmission bias in the spread of voter fraud conspiracy theories on Twitter during the 2020 US election],[Animal Behavior Society \(Twitter Conference, Jan 2021\): Transmission bias in the cultural evolution of house finch song],[Psychology Research Day at the Graduate Center \(New York, NY, Mar 2019\): Cultural transmission modes of music sampling traditions remain stable despite delocalization in the digital age],[SNAK Acoustic Communication Symposium \(Faaborg, DE, Aug 2017\): A bibliometric analysis of interdisciplinary collaboration in the field of cultural evolution],[Queens College Biology Symposium \(Flushing, NY, Jan 2017\): A bibliometric analysis of interdisciplinary collaboration in the field of cultural evolution],)
  ],
)



== Awards, Grants, & Fellowships



#one-col-entry(
  content: [
    

    #v(-design-text-leading)
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [\(#sym.ast.basic#h(0pt, weak: true) #emph[personnel not PI]\)])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[Awards]

    #v(-design-text-leading)
    #v(design-highlights-top-margin);#highlights([Finalist, Richerson Award for Best PhD in Cultural Evolution \(2022\)],)
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[Fellowships]

    #v(-design-text-leading)
    #v(design-highlights-top-margin);#highlights([Postdoctoral Fellowship, Institute for Advanced Computational Science \(2023-present\)],[Science Undergraduate Research Fellowship \(2012-2014\): The epigenetic expression of dopamine receptor D4 in the deer mouse \(#emph[Peromyscus]\)],)
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[Grants]

    #v(-design-text-leading)
    #v(design-highlights-top-margin);#highlights([Institute for Advanced Computational Science, Seed Grant \(2024, \$249,421\): Dynamics of creativity in complex social networks],[Advancing Cultural Evolution, Outreach Grant \(2023, \$1,625\): Non-human cultural extinction],[Cultural Evolution Society Transformation Fund \(2023, £17,774\): Phylogenies of literature],[Sigma Xi Grant-In-Aid of Research \(2018, \$1,000\): The neural basis and spatiotemporal dynamics of female preferences for male bird song],[Doctoral Student Mini-Grant, Queens College \(2018, \$500\): A Raspberry Pi-based, RFID-equipped birdfeeder for the remote monitoring of wild bird populations],[Doctoral Student Research Grant, Graduate Center \(2018, \$1,000\): The neural basis and spatiotemporal dynamics of female preferences for male bird song],[Research Enhancement Award, Queens College \(2017, \$6,000\): The neural basis and spatiotemporal dynamics of female preferences for male bird song],[#sym.ast.basic#h(0pt, weak: true) John Templeton Foundation \(2016-2018, \$89,000\): Towards a new synthesis for cultural evolution],[Summer Research Training, Methods in the Neuroscience of Drug Abuse, University of Texas at El Paso \(2013\): The role of dopamine D2 receptor in brain development and ethanol-induced behavioral disinhibition],)
  ],
)



== Advising



#one-col-entry(
  content: [
    #strong[Masters Students]

    #v(-design-text-leading)
    #v(design-highlights-top-margin);#highlights([Agnes Dietrich \(2021-2022\): MA in African Verbal and Visual Arts, University of Bayreuth],[Macarena G. GomezdelaTorre Clavel \(2019-2020\): MA in Biology, Queens College, CUNY --- Relationship between personality and congitive traits in domestic rabbits \(#emph[Oryctolagus cuniculus]\)],[Wendy Castillo \(2019-2021\): MA in Biology, Queens College, CUNY --- Cultural variation in the birdsong of Hawaiian house finches \(#emph[Haemorhous mexicanus]\)],)
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[Undergraduate & Postbaccalaureate Students]

    #v(-design-text-leading)
    #v(design-highlights-top-margin);#highlights([Lilia Kurnosova \(2021-2022\): Friedrich Schiller University Jena],[Elia Weber \(2021-2022\): Friedrich Schiller University Jena],[Joderick Castillo \(2019-2021\): BA in Biology, Queens College, CUNY],[Ratna Kanhai \(2019-2021\): BA in Biology, Queens College, CUNY],[Rahhid Khan \(2019\): BA in Biology, Queens College, CUNY],[Sheila Gogineni \(2019\): BA in Psychology, Queens College, CUNY],[Christina Takos \(2019\): BA in Biology, Queens College, CUNY],[Sachin Surendra \(2018-2019\): BA in Biology, Queens College, CUNY],[Andrea Lopez \(2018-2020\): BA in Biology, Queens College, CUNY],[Shari Zimmerman \(2017-2020\): BA in Biology, Queens College, CUNY],[Ar Kornreich \(2017-2019\): BA in Biology, Queens College, CUNY],)
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[Committee Membership]

    #v(-design-text-leading)
    #v(design-highlights-top-margin);#highlights([Macarena G. GomezdelaTorre Clavel \(2019-2020\): MA in Biology, Queens College, CUNY --- Relationship between personality and congitive traits in domestic rabbits \(#emph[Oryctolagus cuniculus]\)],)
  ],
)



== Bootcamps & Summer Schools


#two-col-entry(
  left-content: [
    #strong[New York University Startup Accelerator Program]
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Hosted by the New York University Entrepreneurial Institute])], column-gutter: 0cm)
  ],
  right-content: [
    New York, NY

Mar 2025 – Apr 2025
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Diverse Intelligences Summer Institute]
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Fellow, hosted by the University of St. Andrews])], column-gutter: 0cm)
  ],
  right-content: [
    St. Andrews, UK

July 2022 – Aug 2022
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Statistical Rethinking: A Bayesian Course with Examples in R and Stan]
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Hosted by the Max Planck Institute for Evolutionary Anthropology])], column-gutter: 0cm)
  ],
  right-content: [
    Leipzig, DE

Spring 2022
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Acoustic Communication: Methods and Techniques for Studying Animal Sound]
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Hosted by the University of Southern Denmark])], column-gutter: 0cm)
  ],
  right-content: [
    Odense, DK

Aug 2017
  ],
)



== Professional Service



#one-col-entry(
  content: [
    #strong[Journal Editing]

    #v(-design-text-leading)
    #v(design-highlights-top-margin);#highlights([Special collection on the Cultural Evolution of the Arts in #emph[Evolutionary Human Sciences] \(Co-edited with Oleg Sobchuk\): Oct 2023 -- present],)
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[Society Leadership]

    #v(-design-text-leading)
    #v(design-highlights-top-margin);#highlights([The Association of Early-Career Social Learning Researchers \(ESLR\): Web Secretary and Committee Member: Nov 2021 -- July 2025],[Animal Behavior Society: Twitter Management: Mar 2019 -- Aug 2020],)
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[Event Organizing]

    #v(-design-text-leading)
    #v(design-highlights-top-margin);#highlights([Collective Creativity \[3-Day Workshop\] \(Stony Brook, NY\): Apr 2025],[ESLR and Cultural Evolution Society Seminar Series \[Weekly\] \(Virtual\): May-June 2024],[ESLR Seminar Series \[Weekly\] \(Virtual\): May-June 2023],[Max Planck Institute for Geoanthropology, The Evolution of Cognitive Technologies \[3-Day Workshop\] \(Leipzig, DE\): Apr 2023],[Max Planck Institute for the Study of Human History, From Cultural Evolution to Computational Humanities: Building a Bridge \[3-Day Workshop\] \(Jena, DE\): June 2022],)
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[Peer Reviewing]

    #v(-design-text-leading)
    #v(design-highlights-top-margin);#highlights([Journals: #emph[Nature Communications, Proceedings of the Royal Society B, Philosophical Transactions of the Royal Society B, Poetics, Royal Society Interface, PLOS Computational Biology, Frontiers in Psychology, Cognitive Science, Royal Society Open Science, Animal Behaviour, Ecology and Evolution, Methods in Ecology and Evolution, Journal of Animal Ecology, Journal of Language Evolution, PLOS ONE, Ornithology, npj Complexity, Animal Cognition, Journal of Complex Networks, Biology and Philosophy, Humanities and Social Sciences Communications, Palgrave Communications, International Journal of Infectious Diseases, Qeios]],[Themed issue proposals: #emph[Philosophical Transactions of the Royal Society B]],[Grants: Cultural Evolution Society Transformation Fund \(John Templeton Foundation\)],[Conferences: Computational Humanities Research Conference \(2023\)],)
  ],
)



== Consulting & Freelance


#two-col-entry(
  left-content: [
    #strong[Arclet]
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Lead AI Engineer])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Public health start-up creating communications tools for providers: #link("https://www.arclet.com/")[https:\/\/www.arclet.com\/]],[My focus: building agentic AI systems for culturally-sensitive public health communications],)
  ],
  right-content: [
    Asheville, NC

Aug 2024 – present
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Critica]
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Chief Technology Officer])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Non-profit fighting health-related misinformation: #link("https://criticascience.org")[https:\/\/criticascience.org]],[My focus: designing and assessing infodemiology interventions],)
  ],
  right-content: [
    New York, NY

July 2024 – present
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Lyrai]
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Chief Architect])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Start-up creating digital acoustic twins of architectural spaces: #link("https://lyrai.tech/")[https:\/\/lyrai.tech\/]],[My focus: building deep learning models of sound propagation in complex environments],)
  ],
  right-content: [
    Stony Brook, NY

Sept 2023 – present
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Critica]
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Research Scientist])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Non-profit fighting health-related misinformation: #link("https://criticascience.org")[https:\/\/criticascience.org]],[My focus: using statistical modeling and natural language processing to assess conversation quality],)
  ],
  right-content: [
    New York, NY

July 2023 – July 2024
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[We Are Listen]
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Research Scientist])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Design firm specializing in sonic branding: #link("https://wearelisten.com")[https:\/\/wearelisten.com]],[My focus: reviewing the scientific literature of the psychology of sound and music, to directly inform the sonic design of a luxury electric vehicle for Ford Motor Company],)
  ],
  right-content: [
    Brooklyn, NY

Sept 2021 – Oct 2021
  ],
)



== Artistic Output



#one-col-entry(
  content: [
    #strong[Installations]

    #v(-design-text-leading)
    #v(design-highlights-top-margin);#highlights([Alaka’i 1777 \(2025\): an immersive sound installation that reconstructs the lost song culture of the Kaua’i ’ō’ō, an extinct Hawaiian bird, by weaving together archival recordings with interacting artificial agents. Debuted at the Reforesters Laboratory in Brooklyn in June 2025.],)
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[Workshops]

    #v(-design-text-leading)
    #v(design-highlights-top-margin);#highlights([The Bakery, Project Art Space \(Brooklyn, NY, Apr 2025\): Deep listening for nonhuman perspective-taking],[Hex House, Community Art Space \(Brooklyn, NY, Dec 2024\): Deep listening for nonhuman perspective-taking],[Diverse Intelligences Summer Institute \(St. Andrews, UK, July 2024\): Deep listening for nonhuman perspective-taking],)
  ],
)



== Artist Residencies & Incubators


#two-col-entry(
  left-content: [
    #strong[ṆEW INC]
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Member of Creative Science cohort, hosted by the New Museum])], column-gutter: 0cm)
  ],
  right-content: [
    New York, NY

Sept 2025 – Aug 2026
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Reforesters Laboratory]
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Artist-in-residence])], column-gutter: 0cm)
  ],
  right-content: [
    Brooklyn, NY

June 2025 – July 2025
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Diverse Intelligences Summer Institute]
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Storyteller, hosted by the University of St. Andrews])], column-gutter: 0cm)
  ],
  right-content: [
    St. Andrews, UK

July 2024 – Aug 2024
  ],
)



== Programming Skills


#one-col-entry(
  content: [#strong[Languages:] R, Python, C++, Bash, Markdown]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Machine Learning & AI:] PyTorch, TensorFlow, Stan]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[High-Performance & Cloud Computing:] Slurm, AWS, Google Cloud Platform]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Web Technologies:] HTML\/CSS, WordPress, GitHub, APIs]
)


