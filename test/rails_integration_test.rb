require "minitest/autorun"
require "fileutils"
require "tmpdir"
require "logger"
require "action_controller/railtie"
require "css_naked_day_rails"

APP_ROOT = Dir.mktmpdir("css_naked_day_rails")
FileUtils.mkdir_p(File.join(APP_ROOT, "app/helpers"))
FileUtils.mkdir_p(File.join(APP_ROOT, "app/controllers"))
File.write(File.join(APP_ROOT, "app/helpers/application_helper.rb"), <<-RUBY)
  module ApplicationHelper
    def app_helper
      "from the app"
    end
  end
RUBY
File.write(File.join(APP_ROOT, "app/controllers/application_controller.rb"), <<-RUBY)
  class ApplicationController < ActionController::Base
  end
RUBY

class TestApp < Rails::Application
  config.root = APP_ROOT
  config.eager_load = false
  config.logger = Logger.new(nil)
  config.secret_key_base = "test"
end
TestApp.initialize!

Minitest.after_run { FileUtils.rm_rf(APP_ROOT) }

class RailsIntegrationTest < Minitest::Test
  def teardown
    CssNakedDayRails.force = nil
  end

  def test_helper_is_available_in_views
    CssNakedDayRails.force = true
    assert_equal "true", render("<%= css_naked_day? %>")

    CssNakedDayRails.force = false
    assert_equal "false", render("<%= css_naked_day? %>")
  end

  def test_application_helper_from_the_app_still_loads
    assert_equal "from the app", render("<%= app_helper %>")
  end

  private

  def render(template)
    ApplicationController.render(inline: template)
  end
end
