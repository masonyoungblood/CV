((* if entry.index *))
// HAS INDEX NUMBER
#three-col-entry(
  left-column-width: 2em,
  right-column-width: 4em,
  left-content: [<<entry.index>>.],
  middle-content: [
    <<entry.new>> <<entry.title>>. #emph[<<entry.journal>>]. <<main_column_second_row_template>>
  ],
  right-content: [
    <<date_and_location_column_template>>
  ],
)
((* else *))
// NO INDEX NUMBER
#two-col-entry(
  left-content: [
    #text(weight: "bold")[<<entry.title>>]
  ],
  right-content: [
    <<date_and_location_column_template>>
  ],
)
((* endif *))