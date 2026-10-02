module CssNakedDayRails
  class Railtie < ::Rails::Railtie
    initializer "css_naked_day_rails.helper" do
      ActiveSupport.on_load(:action_view) do
        include CssNakedDayRails::Helper
      end
    end
  end
end
