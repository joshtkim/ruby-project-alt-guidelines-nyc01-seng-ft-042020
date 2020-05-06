class CommandLineInterface

    def greet
        puts "Hello and welcome to the world of Webtoons!"
    end



    def run
        self.greet
        puts "Please let us know if you are joining us today as a 'writer' or a 'reader'!"
        print "Please enter below:
"
        while input = gets.chomp.downcase
            break if input == "exit"
            case input
            when "writer"
                self.writer
                break
            when "reader"
                self.reader
                break
            when "exit"
                puts "Have a nice day and please come back!"
            else
                puts "Please enter a valid response or enter 'exit' to leave the app."
            end
        end
    end


    def writer
        puts "Hello Writer! Please tell us your name so we can assist you accordingly!"
        print "Please enter your name: "
        input = gets.chomp.capitalize
        if Writer.find_by(name: input)
            "you are a writer"
        else
            "you are a new writer"
        end
    end

    def reader
        puts "Hello Writer! Please tell us your name so we can assist you accordingly!"
        print "Please enter name: "
        input = gets.chomp.downcase
        Reader.find_by(name: input)
    end




end
