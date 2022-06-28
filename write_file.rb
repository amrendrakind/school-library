class Write_File
    def initialize
     @person_json = File.write("person.json", mode: "a")
    end
end