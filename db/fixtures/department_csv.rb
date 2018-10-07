require 'csv'

csv = CSV.read('db/fixtures/department.csv')
csv.each do |department|
  id = department[0]
  name = department[1]
  
  Department.seed(:id) do |s|
    s.id = id
    s.name = name
  end
end