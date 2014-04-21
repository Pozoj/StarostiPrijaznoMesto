# Starosti Prijazno Mesto

## Setup

1. `brew install rbenv` and `brew install ruby-build`
2. `echo 'eval "$(rbenv init -)"' >> ~/.bash_profile`
3. `rbenv install 1.9.3`
4. `rbenv rehash`
5. `gem install bundler`
6. `bundle install`
7. `rake db:create db:schema:load db:seed`
8. `rails server`
