require "css_naked_day_rails/version"
require "css_naked_day_rails/helper"

module CssNakedDayRails
  # CSS Naked Day is April 9th, and it lasts for as long as it is April 9th
  # anywhere on Earth: from 00:00 April 9 in UTC+14 to 24:00 April 9 in UTC-12.
  # That is 50 hours, from 10:00 April 8 UTC to 12:00 April 10 UTC.
  # https://css-naked-day.org
  START_OFFSET = -14 * 60 * 60
  END_OFFSET = (24 + 12) * 60 * 60

  class << self
    # Set to true or false to override the date check, e.g. to preview your
    # site naked in development. Leave as nil to follow the calendar.
    attr_accessor :force

    def active?(time = Time.now)
      return force unless force.nil?

      now = time.to_time.getutc
      april_9 = Time.utc(now.year, 4, 9)
      now >= april_9 + START_OFFSET && now < april_9 + END_OFFSET
    end
  end
end

require "css_naked_day_rails/railtie" if defined?(Rails::Railtie)
