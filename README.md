# CSS Naked Day Rails

This gem gives Rails views a `css_naked_day?` helper that is true during [CSS Naked Day](https://css-naked-day.org/).

CSS Naked Day is April 9th, and it lasts for as long as it's April 9th somewhere on Earth. That's 50 hours, from 00:00 on April 9 in UTC+14 until 24:00 on April 9 in UTC-12 (10:00 UTC April 8 → 12:00 UTC April 10). The check doesn't depend on your server's time zone or `config.time_zone`.

Supports Rails 5.0 through 8.1.

## Installation

Add the gem to your `Gemfile` and run `bundle install`.

```ruby
gem "css_naked_day_rails"
```

## Usage

Wrap the tags that load your stylesheets in your layout:

```erb
<% unless css_naked_day? %>
  <%= stylesheet_link_tag :app, "data-turbo-track": "reload" %>
<% end %>
```

The same works for `stylesheet_pack_tag`, `javascript_include_tag` and so on. Inline `<style>` blocks and `style=""` attributes need the same treatment if you want to go fully naked.

To tell visitors what's going on:

```erb
<% if css_naked_day? %>
  <p>The website isn't broken, it's <%= link_to "CSS Naked Day!", "https://css-naked-day.org" %></p>
<% end %>
```

Outside of views, use `CssNakedDayRails.active?` (or `helpers.css_naked_day?` in a controller).

### Previewing

To see your site naked before April 9th, put this in an initializer, e.g. `config/initializers/css_naked_day.rb`:

```ruby
CssNakedDayRails.force = true if Rails.env.development?
```

Set `force` to `false` to turn the check off entirely, or leave it as `nil` to follow the calendar.

### Caching

If you cache your layout, pages or responses (fragment caching, a CDN, `expires_in`), a cached version can be served with styles during CSS Naked Day, or without them after it ends. Leave the stylesheet tags out of cached fragments, or include `css_naked_day?` in the cache key:

```erb
<% cache [:head, css_naked_day?] do %>
  ...
<% end %>
```

## Development

```sh
bundle install
bundle exec rake
```

To test against a specific Rails version:

```sh
BUNDLE_GEMFILE=gemfiles/rails_7_2.gemfile bundle install
BUNDLE_GEMFILE=gemfiles/rails_7_2.gemfile bundle exec rake
```

CI runs the tests against every Rails minor version from 5.0 to 8.1.
