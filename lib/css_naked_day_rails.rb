module ApplicationHelper
  # CSS Naked Day is supposed to last for 48 hours because it's April 9th
  # somewhere in the world for that period of time. This is the best I've
  # come up with based on the furthest UTC offsets on April 9th.
  # https://css-naked-day.github.io
  # https://en.wikipedia.org/wiki/List_of_UTC_time_offsets
  def css_naked_day?
    css_naked_day = Date.parse('April 9').to_time
    css_naked_day_earliest = css_naked_day.beginning_of_day.utc - 11.hours
    css_naked_day_latest = css_naked_day.end_of_day.utc + 13.hours

    Time.zone.now.between?(css_naked_day_earliest, css_naked_day_latest)
  end
end