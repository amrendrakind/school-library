require_relative './../book'
require_relative './../student'
require_relative './library'

describe 'Person Tests' do
    context 'Create Object' do
      it 'Person has the correct Info' do
        name='Elio Cortes'
        age= 45
        classroom = 'Microverse'
        parent_permission = true
        student=Student.new(classroom, age, name,parent_permission)
        expect(student.name).to eq(name)
        expect(student.age).to eq(age)
      end
    end
    context 'Validate stored student' do
      library = Library.new
      it 'accepts new student' do
        name='Elio Cortes'
        age= 45
        classroom = 'Microverse'
        parent_permission = true
        library.add_student(classroom, age, name,parent_permission)
        library.get_student(name).should be_an_instance_of Student
    end
    end
end
