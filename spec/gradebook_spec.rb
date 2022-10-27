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

  it 'can list students below grading threshold' do
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

    morgan.log_score(92)
    morgan.log_score(78)
    jim.log_score(100)
    jim.log_score(54)
    jim.log_score(64)
    nicole.log_score(80)
    nicole.log_score(72)
    sam.log_score(93)
    sam.log_score(96)
    sam.log_score(89)
    
    expect(gradebook.grade_threshold).to eq([jim, nicole])
  end
end
