Nothing to see here. I cloned this as part of my goal to have a set of bloated reusable engines for all of my projects. But for now, this is just a slightly modified, unsupported, version of OmniSocial. Check that out instead: [http://github.com/icelab/omnisocial](http://github.com/icelab/omnisocial)

# OmniSocial

A Rails 3 engine for Twitter and Facebook logins using [OmniAuth](http://github.com/intridea/omniauth)

## Installation

To use OmniSocial in a Rails 3 application:

1. Require it in the Gemfile: `gem 'omnisocial'`

2. Install it by running `bundle`.

3. Run `rails g omnisocial` to copy an initializer, database migration and some CSS and image assets into your base application directory.

4. Edit `config/initializers/omnisocial.rb` and include your application's Twitter and Facebook OAuth configuration.

5. Run `rake db:migrate` to create the user and login_account tables.

6. Test that the logins work by accessing `/login` inside your application.

7. Add "big_auth/auth/links" partial to your layouts in order to have login/logout links on all of your pages.

8. Include big_auth in your tests, include BigAuth::TestHelper which implements login_as(:one)
Some more detailed installation instructions are in the [project announcement article](http://icelab.com.au/articles/welcome-to-the-omnisocial/).

## Copyright & License

OmniSocial is Copyright (c) 2010 [Tim Riley](http://openmonkey.com/) and [Icelab](http://icelab.com.au/), and is released under MIT License.

The "Sign in with Twitter/Facebook" buttons are from [Komodo Media](http://www.komodomedia.com/blog/2009/05/sign-in-with-twitter-and-facebook-buttons/), distributeed under the [Creative Commons Attribution-Share Alike 3.0 Unported License](http://creativecommons.org/licenses/by-sa/3.0/).

The twitter bird image is courtesy of [Pasquale D’Silva](http://wefunction.com/2008/07/freebie-twitter-icons-illustration/).

