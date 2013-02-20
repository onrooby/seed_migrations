[![Gem Version](https://badge.fury.io/rb/seed_migrations.png)](http://badge.fury.io/rb/seed_migrations)

Welcome to SeedMigrations
=========================

SeedMigrations is an extension for Ruby on Rails to make seeding behave like migrating.

Seeds are stored in db/seed and follow the naming convention of migrations (e.g. db/seed/20110630710959\_add\_bananas.rb).

All seeds are meant to be loaded once.

The default behaviour of the rake task db:seed is to load the db/seed.rb file every time you invoke it.
The rake task is just extended with additional behaviour, so the default behaviour still works.

Installation
------------

Just add the gem to your Gemfile and:

    $ bundle install

Usage
-----

**Create a seed**    
To create a seed use the seed generator (**rails g seed_migration <name>**) and write your code in its method named 'up'.

**Load new seeds**    
To load new seeds use the rake task **db:seed**.    
A seed will be performed if there is no entry in the database table named seed\_migrations with the name of the seed (without ending).    
After successful performance an entry is created.    
Seeds are executed within a transaction (so if an exception occurs, the changes made by the seed are rolled back).    
**Caution:** The default behaviour of the rake task still works. The file db/seeds.rb is loaded whenever you invoke it. Think about what fits you most (probably leave the file empty).

**Migrating from old behaviour**    
If you used the default seeding behaviour but want your code to be executed just once, move it to an initial seed and keep db/seed.rb empty.

**Reload the last seed**    
To **reload the last successfully performed seed** use the rake task **db:seed:last**. This seed will be performed even if it was performed before.

This project rocks and uses MIT-LICENSE.
