require './lib/course'
require './lib/student'

RSpec.describe Course do
  it 'can create a new course' do
    course = Course.new("Calculus", 2)

    expect(course).to be_a(Course)
  end

  it 'can show the name of the course' do
    course = Course.new("Calculus", 2)

    expect(course.name).to eq("Calculus")
  end

  it 'shows the capacity of the course' do
    course = Course.new("Calculus", 2)

    expect(course.capacity).to eq(2)
  end

  it 'starts with no students as an empty array' do
    course = Course.new("Calculus", 2)

    expect(course.students).to eq([])
  end

  it 'starts as not full' do
    course = Course.new("Calculus", 2)

    expect(course.full?).to be false
  end

  it 'can add students to the course' do
    course = Course.new("Calculus", 2)
    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "Jordan", age: 29})

    course.enroll(student1)
    course.enroll(student2)

    expect(course.students).to eq([student1, student2])
  end

  it 'shows full to be true when at capacity' do
    course = Course.new("Calculus", 2)
    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "Jordan", age: 29})

    course.enroll(student1)
    course.enroll(student2)

    expect(course.full?).to be true
  end
end
