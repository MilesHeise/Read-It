# Read-It

A Reddit clone on the Rails framework. Taught myself RSpec testing, Object Relational Mapping and SQL, and writing authorizations on Rails. Got experience using gems including Figaro and Sendgrid.

## Trying it out

- get the gem dependencies by running `bundle install`

- create and seed a sample database to populate the app using `rake db:create` and `rake db:setup`

- run the app with `rails s` and navigate your browser to `localhost:3000`

## Other things to know

- you can sign up your own user if you like, but to save time there are pre-seeded `member@example.com` and `admin@example.com` (both with password "helloworld") to view the page as a standard user or an admin.

- there is also a heroku deployment for quickly checking it out, available at <https://ancient-tor-38658.herokuapp.com/> but this may not always be as up to date for features and bug fixes. The same seeded users should work, so you can still use the admin login for admin powers like creating your own new topics.
