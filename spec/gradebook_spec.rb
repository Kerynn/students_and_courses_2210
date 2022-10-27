require './lib/course'
require './lib/student'
require './lib/gradebook'

RSpec.describe Gradebook do
  it 'has a gradebook' do
    gradebook = Gradebook.new("Ms. Moore")

    expect(gradebook).to be_a(Gradebook)
  end

  it 'has an instructor with the gradebook' do
    gradebook = Gradebook.new("Ms. Moore")

    expect(gradebook.instructor).to eq("Ms. Moore")
  end

  it 'starts out with no courses' do
    gradebook = Gradebook.new("Ms. Moore")
    calculus = Course.new("Calculus", 2)
    english = Course.new("English", 3)
    history = Course.new("History", 4)

    expect(gradebook.courses).to eq([])
  end

  it 'can add courses' do
    gradebook = Gradebook.new("Ms. Moore")
    calculus = Course.new("Calculus", 2)
    english = Course.new("English", 3)
    history = Course.new("History", 4)

    gradebook.add_course(calculus)
    gradebook.add_course(english)
    gradebook.add_course(history)

    expect(gradebook.courses).to eq([calculus, english, history])
  end

  it 'can list the students in the courses' do
    gradebook = Gradebook.new("Ms. Moore")
    calculus = Course.new("Calculus", 2)
    english = Course.new("English", 3)
    morgan = Student.new({name: "Morgan", age: 21})
    jim = Student.new({name: "Jim", age: 16})
    nicole = Student.new({name: "Nicole", age: 19})
    sam = Student.new({name: "Sam", age: 24})

    gradebook.add_course(calculus)
    gradebook.add_course(english)

    calculus.enroll(morgan)
    calculus.enroll(jim)
    english.enroll(nicole)
    english.enroll(sam)

    expect(gradebook.student_names).to eq({
      "Calculus" => [morgan, jim],
      "English" => [nicole, sam]
      })
  end


end
