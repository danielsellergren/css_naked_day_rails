# CSS Naked Day Rails

This gem provides a simple helper that tells you whether it is currently [CSS Naked Day](https://css-naked-day.github.io/).

This has been tested with Rails 6 but should work for some older versions. I made this for my personal website in about 30 minutes so if my math is wrong or anything let me know, I'm not a timezone expert or anything.

## Installation

Add the gem to your `Gemfile`.

    gem 'css_naked_day_rails'

Install the gem.

    bundle

## Usage

Inside your layouts where you are loading your stylesheets or JavaScript packs.

    <%= stylesheet_pack_tag('application', media: 'all') if !css_naked_day? %>
    <%= javascript_pack_tag 'application' if !css_naked_day? %>

If you want to add a message about CSS Naked Day to one of your views.

    <% if css_naked_day? -%>
      <p>The website isn't broken, it's <%= link_to 'CSS Naked Day!', 'https://css-naked-day.github.io' %></p>
    <% end -%>

## References

* [CSS Naked Day](https://css-naked-day.github.io/)
* [List of UTC time offsets](https://en.wikipedia.org/wiki/List_of_UTC_time_offsets)