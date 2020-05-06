class CommandLineInterface

    def greet
        puts "Hello and welcome to the world of Webtoons!"
    end

    def run
        self.greet
        puts "Please let us know if you are joining us today as a 'returning writer', 'returning reader', 'new writer', or a 'new reader'!"
        print "Please enter below:
"
        while input = gets.chomp.downcase
            break if input == "exit"
            case input
            when "returning writer"
                self.ret_writer_start
                break
            when "returning reader"
                self.ret_reader_start
                break
            when "new writer"
                self.new_writer_start
                break
            when "new reader"
                self.new_reader_start
                break
            when "exit"
                puts "Have a nice day and please come back!"
            else
                puts "Please double check you have entered a valid response or enter 'exit' to leave the app."
            end
        end
    end

    def ret_writer_start
        puts "Hello Writer! Please tell us your name so we can assist you accordingly!"
        print "Please enter your name: "
        writer_input = gets.chomp.titleize
        if Writer.find_by(name: writer_input)
            puts "Welcome #{writer_input}!"
            self.writer_options(writer_input)
        else
            print "Please make sure you are a returning writer or contact customer service for additional help"
        end
    end

    def writer_options(writer_input)
        print "Please select from the options listed 1) Find all my Webtoons 2) Add a new Webtoon 3) Delete a Webtoon 4) Update release day of my Webtoon
        : "
        while input = gets.chomp.to_i
            case input
            when 1
                self.writer_webtoons(writer_input)
                break
            when 2
                self.writer_new_webtoon(writer_input)
                break
            when 3
                puts "Deleted one"
                break
            when 4
                puts "New day"
                break
            else
                puts "Please double check you entered the correct # or enter 'exit' to leave the app."
            end
        end
    end

    def writer_webtoons(writer_input)
        # binding.pry
        x = Writer.find_by(name: writer_input)
        x.webtoons.each do |y|
            y.title
            puts y.title
        end
    end
    
    def writer_new_webtoon(writer_input)
        puts "Congratulations on a new Webtoon. Could you please provide the title and release day of the Webtoon?"
        print "title: "
        title_input = gets.chomp
        print "release day: "
        release_input = gets.chomp
        x = Writer.find_by(name: writer_input)
        # binding.pry
        Webtoon.create(title: title_input, writer_id: x.id, release_day: release_input)
    end




    def new_writer_start
        puts "Hello Writer! Please tell us your name and years of experience so we can create a profile for you."
        print "Name: "
        name_input = gets.chomp.titleize
        print "Years of Experience: "
        yoe_input = gets.chomp.to_i
        Writer.create(name: name_input, years_of_experience: yoe_input)
    end

    def ret_reader_start
        puts "Hello Reader! Please tell us your name so we can assist you accordingly!"
        print "Please enter your name: "
        reader_input = gets.chomp.titleize
        if Reader.find_by(name: reader_input)
            print "Welcome #{reader_input}!"
            self.reader_options(reader_input)
        else
            print "Please make sure you are a returning reader or contact customer service for additional help"
        end
    end

    def new_reader_start
        puts "Hello Reader! Please tell us your name and age so we can create a profile for you."
        print "Name: "
        name_input = gets.chomp.titleize
        print "Age: "
        age_input = gets.chomp.to_i
        Reader.create(name: name_input, age: age_input)
    end


        # print "Hello #{input}, please choose an option from the list below
        # 1. I am a new writer 
        # 2. Find all my released Webtoons
        # 3. Add a new Webtoon
        # 4. Delete a Webtoon
        # 5. Update the release day of my Webtoon
        # please enter a valid #: "
        # while input = gets.chomp.to_i
        #     break if input == "exit"
        #     case input
        #     when 1
        #         self.writer_new
        #         break
        #     when 2
        #         self.webtoon_list
        #         break
        #     when 3 
        #         puts "test 3"
        #         break
        #     when 4
        #         puts "test 4"
        #         break
        #     when 5
        #         puts "test 5"
        #         break
        #     else
        #         puts "Please enter a valid number or enter 'exit' to leave the app"
        #     end
        # end


    #writer option 1
    def writer_new
        Writer.new(self, years_of_experience)
    end

    #writer option 2
    def webtoon_list
        self.webtoons
    end

    def reader
        puts "Hello Writer! Please tell us your name so we can assist you accordingly!"
        print "Please enter name: "
        input = gets.chomp.downcase
        Reader.find_by(name: input)
    end



end
