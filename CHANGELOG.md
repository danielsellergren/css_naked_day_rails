# Changelog

## 1.0.0

- Fix: the gem no longer defines `ApplicationHelper`, which stopped apps on Rails 6+ (Zeitwerk) from loading their own `app/helpers/application_helper.rb`. The helper is now added to all views through a Railtie.
- Fix: the time window now matches the official 50 hours (10:00 UTC April 8 → 12:00 UTC April 10). It was previously 3 hours late to start, 1 hour late to end, and shifted by the server's system time zone.
- Add `CssNakedDayRails.active?` for use outside of views.
- Add `CssNakedDayRails.force` for previewing.
- Declare supported Rails versions (5.0–8.1) and add tests run against each in CI.

## 0.0.2

- Initial release.
