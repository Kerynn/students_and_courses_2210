class Gradebook
  attr_reader :instructor,
              :courses

  def initialize(instructor)
    @instructor = instructor
    @courses = []
  end

  def add_course(course)
    @courses << course
  end

  def student_names
    names = {}
    @courses.each do |course|
      names[course.name] = []
      course.students.each do |student|
        names[course.name] << student
      end
    end
    names
  end

  def grade_threshold
    below_threshold = []
    @courses.each do |course|
      if course.students.grade < 80
        below_threshold << student
      end
    end
    below_threshold
  end
end
