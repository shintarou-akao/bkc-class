require 'csv'

csv = CSV.read('db/fixtures/grade.csv')
csv.each do |grade|
  id = grade[0]
  year = grade[1]
  
  Grade.seed(:id) do |s|
    s.id = id
    s.year = year
  end
end