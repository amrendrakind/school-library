require './person'

class Student < Person
  attr_reader :classroom

  # Style/OptionalBooleanParameter
  def initialize(classroom, age, name = 'Unknown', parent_permission = true) # rubocop:disable Style/OptionalBooleanParameter
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
