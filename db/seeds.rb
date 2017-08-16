# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

q1 = Question.create(question: '2+2=')
vars = ['1', '2', '3', '4']
ans = '4'
vars.each do |v|
  var = Variant.create(text: v, is_answer: v == ans)
  q1.variants << var
end
