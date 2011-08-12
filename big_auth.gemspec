# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{big_auth}
  s.version = "0.0.11"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tony Stubblebine"]
  s.date = %q{2011-08-11}
  s.email = %q{tony+bigauth@tonystubblebine.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    "app/controllers/big_auth/accounts_controller.rb",
    "app/controllers/big_auth/auth_controller.rb",
    "app/controllers/big_auth/roles_controller.rb",
    "app/controllers/big_auth/roles_users_controller.rb",
    "app/controllers/big_auth/users_controller.rb",
    "app/helpers/accounts_helper.rb",
    "app/helpers/big_auth/auth_helper.rb",
    "app/helpers/big_auth/users_helper.rb",
    "app/helpers/roles_helper.rb",
    "app/helpers/roles_users_helper.rb",
    "app/models/big_auth/account.rb",
    "app/models/big_auth/facebook_account.rb",
    "app/models/big_auth/login_account.rb",
    "app/models/big_auth/role.rb",
    "app/models/big_auth/roles_user.rb",
    "app/models/big_auth/twitter_account.rb",
    "app/models/big_auth/user.rb",
    "app/views/big_auth/accounts/edit.html.erb",
    "app/views/big_auth/auth/_links.html.erb",
    "app/views/big_auth/auth/new.html.erb",
    "app/views/big_auth/roles/_form.html.erb",
    "app/views/big_auth/roles/edit.html.erb",
    "app/views/big_auth/roles/index.html.erb",
    "app/views/big_auth/roles/new.html.erb",
    "app/views/big_auth/roles/show.html.erb",
    "app/views/big_auth/roles_users/_form.html.erb",
    "app/views/big_auth/roles_users/edit.html.erb",
    "app/views/big_auth/roles_users/index.html.erb",
    "app/views/big_auth/roles_users/new.html.erb",
    "app/views/big_auth/roles_users/show.html.erb",
    "app/views/big_auth/users/_form.html.erb",
    "app/views/big_auth/users/edit.html.erb",
    "app/views/big_auth/users/index.html.erb",
    "app/views/big_auth/users/new.html.erb",
    "app/views/big_auth/users/show.html.erb",
    "app/views/layouts/admin.html.erb",
    "config/application.rb",
    "config/boot.rb",
    "config/environment.rb",
    "config/routes.rb",
    "lib/big_auth.rb",
    "lib/big_auth/action_controller_ext.rb",
    "lib/big_auth/engine.rb",
    "lib/big_auth/railties/tasks.rake",
    "lib/big_auth/service_config.rb",
    "lib/big_auth/test_helper.rb",
    "lib/generators/big_auth/big_auth_generator.rb",
    "lib/generators/big_auth/templates/README",
    "lib/generators/big_auth/templates/account_fixture.yml",
    "lib/generators/big_auth/templates/add_email_to_accounts_migration.rb",
    "lib/generators/big_auth/templates/assets/images/facebook.png",
    "lib/generators/big_auth/templates/assets/images/signin_facebook.png",
    "lib/generators/big_auth/templates/assets/images/signin_twitter.png",
    "lib/generators/big_auth/templates/assets/images/twitter.gif",
    "lib/generators/big_auth/templates/assets/javascripts/big_lib.js",
    "lib/generators/big_auth/templates/assets/javascripts/rails.js",
    "lib/generators/big_auth/templates/assets/stylesheets/big_auth.css",
    "lib/generators/big_auth/templates/big_auth.rb",
    "lib/generators/big_auth/templates/create_big_auth_tables_migration.rb",
    "lib/generators/big_auth/templates/create_roles_migration.rb",
    "lib/generators/big_auth/templates/create_roles_users_migration.rb",
    "lib/generators/big_auth/templates/user.rb",
    "lib/generators/big_auth/templates/user_fixture.yml"
  ]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Rails engine for handling authentication.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["> 3.0.0"])
      s.add_runtime_dependency(%q<oa-core>, [">= 0"])
      s.add_runtime_dependency(%q<oa-oauth>, [">= 0"])
      s.add_runtime_dependency(%q<bcrypt-ruby>, [">= 0"])
      s.add_runtime_dependency(%q<big_library>, [">= 0"])
    else
      s.add_dependency(%q<rails>, ["> 3.0.0"])
      s.add_dependency(%q<oa-core>, [">= 0"])
      s.add_dependency(%q<oa-oauth>, [">= 0"])
      s.add_dependency(%q<bcrypt-ruby>, [">= 0"])
      s.add_dependency(%q<big_library>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, ["> 3.0.0"])
    s.add_dependency(%q<oa-core>, [">= 0"])
    s.add_dependency(%q<oa-oauth>, [">= 0"])
    s.add_dependency(%q<bcrypt-ruby>, [">= 0"])
    s.add_dependency(%q<big_library>, [">= 0"])
  end
end

