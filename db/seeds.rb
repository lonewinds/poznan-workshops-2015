puts "Seeds: start"
TEACHER_TITLES = %w(Dr. Prof. TA)
User.create!(email: 'admin@admin.com',password: 'adminadmin')

3.times do
  Teacher.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    academic_title: TEACHER_TITLES.sample
  )
end

teachers = Teacher.all
5.times do
  SubjectItem.create!(
    title: Faker::Lorem.sentence,
    teacher: teachers.sample
  )
end

25.times do
  Student.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthday: Faker::Date.birthday
  )
  student = Student.last!
  Payment.create!(
             january: Faker::Date.between(Date.new(2015, 01, 01).to_s, Date.new(2015, 01, 31).to_s),
             february: Faker::Date.between(Date.new(2015, 02, 01).to_s, Date.new(2015, 02, 28).to_s),
             march: Faker::Date.between(Date.new(2015, 03, 01).to_s, Date.new(2015, 03, 31).to_s),
             april: Faker::Date.between(Date.new(2015, 04, 01).to_s, Date.new(2015, 04, 30).to_s),
             may: Faker::Date.between(Date.new(2015, 05, 01).to_s, Date.new(2015, 05, 31).to_s),
             june: Faker::Date.between(Date.new(2015, 06, 01).to_s, Date.new(2015, 06, 30).to_s),
             july: Faker::Date.between(Date.new(2015, 07, 01).to_s, Date.new(2015, 07, 31).to_s),
             august: nil,
             september: nil,
             october:  nil,
             november:  nil,
             december:  nil,
             student_id: student.id,
  )
end

students = Student.all
SubjectItem.all.each do |subject_item|
  subject_item.students << students.sample(rand(1..4))
end

SubjectItem.all.each do |subject_item|
  subject_item.students.each do |student|
    rand(1..5).times do
      subject_item.subject_item_notes << SubjectItemNote.create(student: student,
                                                                subject_item: subject_item,
                                                                value: rand(1..6))
    end
  end
end

puts "Seeds: done"
