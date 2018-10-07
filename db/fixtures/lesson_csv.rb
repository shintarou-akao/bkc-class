require 'csv'

csv = CSV.read('db/fixtures/lesson.csv')
csv.each do |lesson|
  id = lesson[0]
  name = lesson[1]
  
  Lesson.seed(:id) do |s|
    s.id = id
    s.name = name
  end
end