# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
[
    {id: 1, name: 'sa', email: 'sa@gmail.com', password: 'abcd1234', user_type: 'admin'}
].each do |param|
  User.where(id: param[:id]).first_or_create(name: param[:name], email: param[:email], password: param[:password], user_type: param[:user_type])
end

[
    {:id => 1, :name => 'user'},
    {:id => 2, :name => 'manager'}
].each do |param|
  UserRoleType.where(id: param[:id], name: param[:name]).first_or_create
end