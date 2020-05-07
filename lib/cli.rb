class CommandLineInterface

    def greet
        puts "Hello and welcome to the World of Webtoons!"
    end

    def run
        self.greet
        title_break
        puts "Please let us know if you are joining us today as a", "1. returning writer", "2. returning reader", "3. new writer", "4. new reader"
        print "Please enter the corresponding number: "
        while input = gets.chomp.downcase
            break if input == "exit"
            case input
            when "1"
                self.ret_writer_start
                break
            when "2"
                self.ret_reader_start
                break
            when "3"
                self.new_writer_start
                break
            when "4"
                self.new_reader_start
                break
            when "exit"
                puts "Have a nice day and please come back!"
            else
                puts "Please double check you have entered a valid response or enter 'exit' to leave the app."
            end
        end
    end

    #returning writer
    def ret_writer_start
        title_break
        puts "Hello Writer! Please tell us your name so we can assist you accordingly!"
        print "Please enter your name: "
        writer_input = gets.chomp.titleize
        if Writer.find_by(name: writer_input)
            puts "Welcome #{writer_input}!"
            self.writer_options(writer_input)
        else
            puts "Please make sure you are a returning writer or contact customer service for additional help"
            self.run
        end
    end

    #writer main menu
    def writer_options(writer_input)
        line_break
        puts "Please select from the options listed", "1) Find all my Webtoons", "2) Add a new Webtoon", "3) Delete a Webtoon", "4) Update release day of my Webtoon"
        print "Please select the corresponding number: "
        while input = gets.chomp.downcase
            break if input == "exit"
            case input
            when "1"
                self.writer_webtoons(writer_input)
                break
            when "2"
                self.writer_new_webtoon(writer_input)
                break
            when "3"
                self.writer_del_webtoon(writer_input)
                break
            when "4"
                self.writer_day_webtoon(writer_input)
                break
            else
                puts "Please double check you entered the correct # or enter 'exit' to leave the app."
            end
        end
    end

    #writer option 1
    def writer_webtoons(writer_input)
        line_break
        x = Writer.find_by(name: writer_input)
        x.webtoons.each do |y|
            y.title
            puts y.title
        end
        puts "Here is your list of Webtoons!"
        writer_options(writer_input)
    end
    
    #writer option 2
    def writer_new_webtoon(writer_input)
        line_break
        puts "Congratulations on a new Webtoon. Could you please provide the title and release day of the Webtoon?"
        print "Title: "
        title_input = gets.chomp.downcase
        print "Release Day: "
        release_input = gets.chomp.downcase
        x = Writer.find_by(name: writer_input)
        # binding.pry
        Webtoon.create(title: title_input, writer_id: x.id, release_day: release_input)
        puts "Congratulations on your new Webtoon #{title_input.titleize} that releases weekly on #{release_input.capitalize}!"
        writer_options(writer_input)
    end

    #writer option 3
    def writer_del_webtoon(writer_input)
        line_break
        puts "Could you please advise which Webtoon you will no longer write?"
        print "Title: "
        title_input = gets.chomp.downcase
        x = Webtoon.find_by(title: title_input)
        x.delete
        puts "You have successfully removed #{title_input.titleize}."
        writer_options(writer_input)
    end

    #writer option 4
    def writer_day_webtoon(writer_input)
        line_break
        puts "Could you please advise which Webtoon you would like to update the release day for and the new release day?"
        puts "Title: "
        title_input = gets.chomp.downcase
        puts "Release Day(Monday-Saturday): "
        day_input = gets.chomp.downcase
        x = Webtoon.find_by(title: title_input)
        x.update(release_day: day_input)
        puts "Congratulations! Your Webtoon #{title_input.titleize} has a new release day on #{day_input.capitalize}!"
        writer_option(writer_input)
    end

    #new writer
    def new_writer_start
        title_break
        puts "Hello Writer! Please tell us your name and years of experience so we can create a profile for you."
        print "Name: "
        name_input = gets.chomp.titleize
        print "Years of Experience: "
        yoe_input = gets.chomp.to_i
        Writer.create(name: name_input, years_of_experience: yoe_input)
        puts "Congratulations #{name_input} on joining our Webtoon Writer family!"
        writer_options(writer_input)
    end




    #returning reader
    def ret_reader_start
        title_break
        puts "Hello Reader! Please tell us your name so we can assist you accordingly!"
        print "Please enter your name: "
        reader_input = gets.chomp.titleize
        if Reader.find_by(name: reader_input)
            puts "Welcome #{reader_input}!"
            self.reader_options(reader_input)
        else
            puts "Please make sure you are a returning reader or contact customer service for additional help."
            self.run
        end
    end

    #reader main menu
    def reader_options(reader_input)
        title_break
        puts "Please select from the options listed", "1) Find all Webtoons I am reading", "2) Find the Writer of your favorite Webtoon"
        print "Please select the corresponding number: "
        while input = gets.chomp.downcase
            break if input == "exit"
            case input
            when 1
                self.reader_webtoons(reader_input)
                break
            when 2
                self.reader_writer(reader_input)
                break
            when "exit"
                puts "Have a nice day and come back soon!"
            else
                puts "Please double check you entered the correct # or enter 'exit' to leave the app."
            end
        end
    end

    def reader_webtoons(reader_input)
        line_break
        x = Reader.find_by(name: reader_input)
        x.webtoons.each do |y|
            y.title
            puts y.title
        end
        puts "Here is a list of all the Webtoons you are currently reading!"
        reader_options(reader_input)
    end

    def reader_writer(reader_input)
        line_break
        puts "Please provide the title of your favorite Webtoon!"
        print "Webtoon title: "
        title_input = gets.chomp.downcase
        x = Webtoon.find_by(title: title_input)
        y = x.writer_id
        z = Writer.find_by(id: y)
        z.name
        puts "Your favorite Webtoon's writer is #{z.name}!"
        reader_options(reader_input)
    end

    #new reader
    def new_reader_start
        title_break
        puts "Hello Reader! Please tell us your name and age so we can create a profile for you."
        puts "Name: "
        name_input = gets.chomp.titleize
        puts "Age: "
        age_input = gets.chomp.to_i
        Reader.create(name: name_input, age: age_input)
        puts "Congratulations on joining our Webtoon Reader family!"
        reader_options(name_input)
    end


    def title_break
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",
        "----------------------------------------------------------------------------------",
        "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    end

    def line_break
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 
        "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    end

end
