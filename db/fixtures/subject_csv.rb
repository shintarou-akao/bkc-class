require 'csv'

csv = CSV.read('db/fixtures/subject.csv')
csv.each do |subject|
  id = subject[0]
  name = subject[1]
  
  Subject.seed(:id) do |s|
    s.id = id
    s.name = name
  end
end