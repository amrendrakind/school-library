class Read_File
    def initialize
     @person_json = File.open("person.json", "w")
    end
end