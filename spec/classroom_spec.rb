require_relative './../classroom'
require_relative './library'

describe 'Classroom Tests' do
  context 'Create Object' do
    it 'Classroom has the correct Info' do
      label = 'A1'
      classroom = Classroom.new(label)
      expect(classroom.label).to eq(label)
    end
  end
end
