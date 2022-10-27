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
end
