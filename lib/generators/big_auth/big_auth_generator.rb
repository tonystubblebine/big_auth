require 'rails/generators'
require 'rails/generators/migration'
require 'big_library/generators'
module BigAuth
  module Generators
    class BigAuthGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      include BigLibrary::Generators
      desc 'Creates an big_auth initializer and migration, and copies image and CSS assets.'

      def self.source_root
        File.join(File.dirname(__FILE__), 'templates')
      end

      # http://github.com/rails/rails/blob/master/activerecord/lib/generators/active_record.rb
      def self.next_migration_number(dirname)
        if ActiveRecord::Base.timestamped_migrations
          Time.now.utc.strftime("%Y%m%d%H%M%S")
        else
          "%.3d" % (current_migration_number(dirname) + 1)
        end
      end

      def create_migration_files
        %w{create_roles create_roles_users create_big_auth_tables add_email_to_accounts add_remote_token_to_login_accounts_migration}.each do |migration|
          create_migration_file(migration)
        end
      end

      def copy_initializer
        template 'big_auth.rb', 'config/initializers/big_auth.rb'
      end
      
      def copy_user_model
        template 'user.rb', 'app/models/user.rb'
      end

      def copy_fixtures
        copy_file 'user_fixture.yml', 'test/fixtures/users.yml'
        copy_file 'account_fixture.yml', 'test/fixtures/accounts.yml'
      end

      def copy_assets
        copy_file 'assets/stylesheets/big_auth.css',  'public/stylesheets/big_auth.css'
        copy_file 'assets/images/signin_twitter.png',   'public/images/big_auth/signin_twitter.png'
        copy_file 'assets/images/signin_facebook.png',  'public/images/big_auth/signin_facebook.png'
      end

      def copy_javascripts
        copy_javascript
      end
      
      def show_readme
        readme 'README' if behavior == :invoke
      end
    end
  end
end
