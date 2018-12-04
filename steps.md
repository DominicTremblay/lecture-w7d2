# steps

## create setup file

require

- 'active_record'
- 'faker'
- 'byebug'

## Create the schema

`ActiveRecord::Schema.define do`

[iTune Music Library](./pictures/schema.png)

- what table we should start off with?

one side table...Artist table

- Create the tables

```
create_table :artist, force: true do |t|
  t.string :name, null: false
  t.timestamps
end
```

- Create the model for the database Table
- Require the model file

- Create 10 artists
- Review the code on the screen
- do some AR commands on artists

- Create albums table
- Create a model for album
- Create the relationships
- Require the model

- Create tracks table
- Create a model
- Creqte relationship
- require the model
