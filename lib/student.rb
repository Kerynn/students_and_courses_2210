class Student
  attr_reader :name,
              :age,
              :scores

  def initialize(student_hash)
    @name = student_hash[:name]
    @age = student_hash[:age]
    @scores = []
  end

  def log_score(score)
    @scores << score
  end

  def total_grades
    @scores += log_score(score)
  end

  def grade
    total_grades / @scores.count
  end
end
