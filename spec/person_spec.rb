require_relative './../book'
require_relative './../student'
require_relative './../teacher'
require_relative './library'

describe 'Student Tests' do
  context 'Create Object' do
    it 'Student has the correct Info' do
      name = 'Elio Cortes'
      age = 45
      classroom = 'Microverse'
      parent_permission = true
      student = Student.new(classroom, age, name, parent_permission)
      expect(student.name).to eq(name)
      expect(student.age).to eq(age)
    end
  end
  context 'Validate stored student' do
    library = Library.new
    it 'accepts new student' do
      name = 'Elio Cortes'
      age = 45
      classroom = 'Microverse'
      parent_permission = true
      library.add_student(classroom, age, name, parent_permission)
      library.get_student(name).should be_an_instance_of Student
    end
  end
end

describe 'Teacher Tests' do
  context 'Create Object' do
    it 'Teacher has the correct Info' do
      name = 'Hiro Mataba'
      age = 24
      specialization = 'Code Review'
      teacher = Teacher.new(specialization, age, name)
      expect(teacher.name).to eq(name)
      expect(teacher.age).to eq(age)
    end
  end
  context 'Validate stored teacher' do
    library = Library.new
    it 'accepts new teacher' do
      name = 'Hiro Mataba'
      age = 24
      specialization = 'Code Review'
      library.add_teacher(specialization, age, name)
      library.get_teacher(name).should be_an_instance_of Teacher
    end
  end
end

describe 'Person Tests' do
  context 'Create Object' do
    it 'Person has the correct Info' do
      name = 'Elio Cortes'
      age = 45
      parent_permission = true
      person = Person.new(age, name, parent_permission)
      expect(person.name).to eq(name)
      expect(person.age).to eq(age)
    end
  end

  context 'Check can_use_services? method' do
    it 'Person can use service.' do
      name = 'Elio Cortes'
      age = 45
      parent_permission = true
      person = Person.new(age, name, parent_permission)
      expect(person.can_use_services?).to eq(true)
    end

    it 'Person can not use service.' do
      name = 'Amrendra K'
      age = 15
      parent_permission = false
      person = Person.new(age, name, parent_permission)
      expect(person.can_use_services?).to eq(false)
    end
  end
end
