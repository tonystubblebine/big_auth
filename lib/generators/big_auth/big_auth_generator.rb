require 'rails/generators'
require 'rails/generators/migration'

module BigAuth
  module Generators
    class BigAuthGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      
      desc 'Creates an big_auth initializer and migration, and copies image and CSS assets.'

      def self.source_root
        File.join(File.dirname(__FILE__), 'templates')
      end

      # Implement the required interface for Rails::Generators::Migration:
      # http://github.com/rails/rails/blob/master/activerecord/lib/generators/active_record.rb
      def self.next_migration_number(dirname)
        if ActiveRecord::Base.timestamped_migrations
          Time.now.utc.strftime("%Y%m%d%H%M%S")
        else
          "%.3d" % (current_migration_number(dirname) + 1)
        end
      end

      def create_migration_file
        migration_template 'migration.rb', 'db/migrate/create_big_auth_tables.rb'
      end
      
      def copy_initializer
        template 'big_auth.rb', 'config/initializers/big_auth.rb'
      end
      
      def copy_user_model
        template 'user.rb', 'app/models/user.rb'
      end
      
      def copy_assets
        copy_file 'assets/stylesheets/big_auth.css',  'public/stylesheets/big_auth.css'
        copy_file 'assets/images/twitter.gif',          'public/images/big_auth/twitter.gif'
        copy_file 'assets/images/facebook.png',         'public/images/big_auth/facebook.png'
        copy_file 'assets/images/signin_twitter.png',   'public/images/big_auth/signin_twitter.png'
        copy_file 'assets/images/signin_facebook.png',  'public/images/big_auth/signin_facebook.png'
      end
      
      def show_readme
        readme 'README' if behavior == :invoke
      end
    end
  end
end
