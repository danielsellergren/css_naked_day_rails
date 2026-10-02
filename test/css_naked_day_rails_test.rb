require "minitest/autorun"
require "time"
require "css_naked_day_rails"

class CssNakedDayRailsTest < Minitest::Test
  def teardown
    CssNakedDayRails.force = nil
  end

  def test_starts_at_midnight_april_9_in_utc_plus_14
    refute CssNakedDayRails.active?(Time.utc(2026, 4, 8, 9, 59, 59))
    assert CssNakedDayRails.active?(Time.utc(2026, 4, 8, 10))
  end

  def test_ends_at_midnight_april_10_in_utc_minus_12
    assert CssNakedDayRails.active?(Time.utc(2026, 4, 10, 11, 59, 59))
    refute CssNakedDayRails.active?(Time.utc(2026, 4, 10, 12))
  end

  def test_is_not_active_on_other_days
    refute CssNakedDayRails.active?(Time.utc(2026, 1, 1))
    refute CssNakedDayRails.active?(Time.utc(2026, 4, 9) + 365 * 24 * 60 * 60 / 2)
  end

  def test_works_every_year
    assert CssNakedDayRails.active?(Time.utc(2024, 4, 9, 12))
    assert CssNakedDayRails.active?(Time.utc(2030, 4, 9, 12))
  end

  def test_ignores_the_zone_of_the_given_time
    assert CssNakedDayRails.active?(Time.parse("2026-04-09 00:00:00 +14:00"))
    refute CssNakedDayRails.active?(Time.parse("2026-04-08 23:59:59 +14:00"))
    assert CssNakedDayRails.active?(Time.parse("2026-04-09 23:00:00 -12:00"))
    refute CssNakedDayRails.active?(Time.parse("2026-04-10 00:00:00 -12:00"))
  end

  def test_ignores_the_system_time_zone
    original = ENV["TZ"]
    %w[UTC America/New_York Pacific/Kiritimati Asia/Tokyo].each do |zone|
      ENV["TZ"] = zone
      assert CssNakedDayRails.active?(Time.utc(2026, 4, 8, 10)), zone
      refute CssNakedDayRails.active?(Time.utc(2026, 4, 10, 12)), zone
    end
  ensure
    ENV["TZ"] = original
  end

  def test_does_not_mutate_the_given_time
    time = Time.parse("2026-04-09 12:00:00 +05:00")
    CssNakedDayRails.active?(time)
    refute time.utc?
  end

  def test_force
    CssNakedDayRails.force = true
    assert CssNakedDayRails.active?(Time.utc(2026, 1, 1))

    CssNakedDayRails.force = false
    refute CssNakedDayRails.active?(Time.utc(2026, 4, 9, 12))
  end
end
