require './lib/student'

RSpec.describe Student do
  it 'creates a student' do
    student = Student.new({name: "Morgan", age: 21})

    expect(student).to be_a(Student)
  end

  it 'has a student name' do
    student = Student.new({name: "Morgan", age: 21})

    expect(student.name).to eq("Morgan")
  end

  it 'has the student age' do
    student = Student.new({name: "Morgan", age: 21})

    expect(student.age).to eq(21)
  end

  it 'has the student scores which starts with empty array' do
    student = Student.new({name: "Morgan", age: 21})

    expect(student.scores).to eq([])
  end

  it 'has the student scores which starts with empty array' do
    student = Student.new({name: "Morgan", age: 21})
    student.log_score(89)
    student.log_score(78)

    expect(student.scores).to eq([89, 78])
  end

  xit 'can average all of the student scores' do
    student = Student.new({name: "Morgan", age: 21})
    student.log_score(89)
    student.log_score(78)

    expect(student.grade).to eq(83.5)
  end
end
