require 'csv'

csv = CSV.read('db/fixtures/teacher.csv')
csv.each do |teacher|
  id = teacher[0]
  name = teacher[1]
  
  Teacher.seed(:id) do |s|
    s.id = id
    s.name = name
  end
end