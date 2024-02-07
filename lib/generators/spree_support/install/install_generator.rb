module SpreeSupport
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root(File.expand_path(File.dirname(__FILE__)))
      class_option :migrate, type: :boolean, default: true

      def add_migrations
        run 'bundle exec rake railties:install:migrations FROM=spree_support'
      end

      def add_javascripts
        append_file 'vendor/assets/javascripts/spree/frontend/all.js', "//= require spree/frontend/support\n"
        append_file 'vendor/assets/javascripts/spree/backend/all.js', "//= require spree/backend/support\n"
      end

      def add_stylesheets
        inject_into_file 'vendor/assets/stylesheets/spree/backend/all.css', " *= require spree/backend/support_backend\n", :before => /\*\//, :verbose => true
        inject_into_file 'vendor/assets/stylesheets/spree/frontend/all.css', " *= require spree/frontend/support\n", :before => /\*\//, :verbose => true
      end

      def run_migrations
        run_migrations = options[:migrate] || ['', 'y', 'Y'].include?(ask('Would you like to run the migrations now? [Y/n]'))
        if run_migrations
          run 'bundle exec rails db:migrate'
        else
          puts 'Skipping rails db:migrate, don\'t forget to run it!'
        end
      end
    end
  end
end
