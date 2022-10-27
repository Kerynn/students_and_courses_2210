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

  def grade
    avg_grade = 0
    @scores.each do |score|
      avg_grade += score
    end
    avg_grade / @scores.count.to_f
  end
end
