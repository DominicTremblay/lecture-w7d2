# W7D2 - Lecture

## ORM

- Object Relation Mapper

### What is an ORM

- Tool allowing us to use an OO approach with databases
- Data stored is actually transforms into objects
- i.e. database tables are treated as classes and table columns as properties
- Each table row is an object

[ORM - Visual Representation](./pictures/orm.jpg)

Benefits:

- You're working with the database with a paradigm you already know. The ORM is going to create all the SQL queries for us.
- You don't have to care about the different implementations of database systems. You're still using the same code, Active Record in this case.

### Knex vs ActiveRecord

- What does knex help us do?
- What is it? Knex is a query builder or an SQL builder

#### knex with Active Record

- knex allows you to build your queries using javascript
- knex will translate your queries into SQL
- knex will not create objects instantiated from classes

### Ruby Gems

- Ruby has a packaging system. Ruby gems
- A gem is a library that provides additional functionality
- gems can be found at [rubygems.org](https://rubygems.org)
- Gems are included in a Gemfile => equivalent to package.json

#### Creating Gemfile

- install bundler

`gem install bundler`

- gems are installed in a common folder of the ruby version you are using
- add gems to your gemfile

  - activerecord
  - pg
  - faker
  - byebug (or pry)

- run `bundle install`
- a Gemfile.lock gets creating locking the versions number of the gems that have been intalled

## Creating the database

[iTune Music Library](./pictures/schema.png)
