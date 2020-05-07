class CommandLineInterface

    def greet
        puts "", "Hello and welcome to the World of Webtoons!".black.on_white
    end

    def run
        self.greet
        title_break
        puts "Please let us know if you are joining us today as a".blue.on_white, "", "1. returning writer", "2. returning reader", "3. new writer", "4. new reader", "5. exit", ""
        print "Please enter the corresponding number: "
        while input = gets.chomp.to_i
            case input
            when 1
                self.ret_writer_start
                break
            when 2
                self.ret_reader_start
                break
            when 3
                self.new_writer_confirm
                break
            when 4
                self.new_reader_confirm
                break
            when 5
                self.user_exit
                break
            else
                puts "", "Please double check you have entered a valid response or enter '5' to leave the app.".red, ""
                self.run
                break
            end
        end
    end

    #returning writer
    def ret_writer_start
        title_break
        puts "Hello Writer! Please tell us your name so we can assist you accordingly!".blue.on_white,""
        print "Please enter your name: "
        writer_input = gets.chomp.titleize
        if Writer.find_by(name: writer_input)
            puts "", "Welcome #{writer_input}!"
            self.writer_options(writer_input)
        else
            puts "", "Please make sure you are a returning writer or contact customer service for additional help".red, ""
            self.run
        end
    end

    #writer main menu
    def writer_options(writer_input)
        line_break
        puts "Writer's Main Menu".blue.on_white, "", "Please select from the options listed", "1) Find all my Webtoons", "2) Add a new Webtoon", "3) Delete a Webtoon", "4) Update release day of my Webtoon", "5) Exit", ""
        print "Please select the corresponding number: "
        while input = gets.chomp.to_i
            break if input == "exit"
            case input
            when 1
                self.writer_webtoons(writer_input)
                break
            when 2
                self.new_webtoon_confirm(writer_input)
                break
            when 3
                self.del_webtoon_confirm(writer_input)
                break
            when 4
                self.webtoon_day_confirm(writer_input)
                break
            when 5
                self.user_exit
                break
            else
                puts "Please double check you entered the correct # or enter '5' to leave the app.".red
                writer_options(writer_input)
                break
            end
        end
    end

    #writer option 1
    def writer_webtoons(writer_input)
        line_break
        puts "Here is your list of Webtoons!".magenta.on_white, ""
        x = Writer.find_by(name: writer_input)
        x.webtoons.each do |y|
            y.title
            puts y.title.titleize
        end
        writer_options(writer_input)
    end
    
    #new webtoon confirmation
    def new_webtoon_confirm(writer_input)
        line_break
        puts "Hello! Please confirm that you would like to create a new Webtoon!", ""
        print "y/n: "
        valid_input = gets.chomp.downcase
        if valid_input == "y"
            writer_new_webtoon(writer_input)
        else valid_input == "n"
            puts "", "We will return you to the Writer's menu!"
            writer_options(writer_input)
        end
    end

    #writer option 2
    def writer_new_webtoon(writer_input)
        line_break
        puts "Congratulations on a new Webtoon. Could you please provide the title and release day of the Webtoon?", ""
        print "Title: "
        title_input = gets.chomp.downcase
        print "Release Day(Monday-Saturday): "
        release_input = gets.chomp.downcase
        x = Writer.find_by(name: writer_input)
        # binding.pry
        Webtoon.create(title: title_input, writer_id: x.id, release_day: release_input)
        puts "Congratulations on your new Webtoon #{title_input.titleize} that releases weekly on #{release_input.capitalize}!"
        writer_options(writer_input)
    end

    #del webtoon confirmation
    def del_webtoon_confirm(writer_input)
        line_break
        puts "Hello! Please confirm that you would like to delete a Webtoon!".red.on_white, ""
        print "y/n: "
        valid_input = gets.chomp.downcase
        if valid_input == "y"
            writer_del_webtoon(writer_input)
        else valid_input == "n"
            puts "", "We will return you to the Writer's menu!"
            writer_options(writer_input)
        end
    end

    #writer option 3
    def writer_del_webtoon(writer_input)
        line_break
        puts "Could you please advise which Webtoon you will no longer write?"
        print "Title: "
        title_input = gets.chomp.downcase
        if x = Webtoon.find_by(title: title_input)
            x.delete
            puts "You have successfully removed #{title_input.titleize}."
            writer_options(writer_input)
        else
            puts "We could not locate that title. We will send you back to the Writer's menu. Please double check and confirm"
            writer_options(writer_input)
        end
    end

    #webtoon day confirmation
    def webtoon_day_confirm(writer_input)
        line_break
        puts "Hello! Please confirm that you would like to change the release day of your Webtoon!", ""
        print "y/n: "
        valid_input = gets.chomp.downcase
        if valid_input == "y"
            writer_day_webtoon(writer_input)
        else valid_input == "n"
            puts "", "We will return you to the Writer's menu!"
            writer_options(writer_input)
        end
    end    

    #writer option 4
    def writer_day_webtoon(writer_input)
        line_break
        puts "Could you please advise which Webtoon you would like to update the release day for and the new release day?"
        print "Title: "
        title_input = gets.chomp.downcase
        print "Release Day(Monday-Saturday): "
        day_input = gets.chomp.downcase
        x = Webtoon.find_by(title: title_input)
        x.update(release_day: day_input)
        puts "Congratulations! Your Webtoon #{title_input.titleize} has a new release day on #{day_input.capitalize}!"
        writer_options(writer_input)
    end

    #new writer confirmation
    def new_writer_confirm
        line_break
        puts "Hello! Please confirm that you are a new writer and would like to create a new profile!", ""
        print "y/n: "
        valid_input = gets.chomp.downcase
        if valid_input == "y"
            new_writer_start
        else valid_input == "n"
            puts "", "We will return you to the main menu!"
            run
        end
    end
    
    #new writer
    def new_writer_start
        title_break
        puts "Hello Writer! Please tell us your name and years of experience so we can create a profile for you.", ""
        print "Name: "
        name_input = gets.chomp.titleize
        print "Years of Experience(num): "
        yoe_input = gets.chomp.to_i
        Writer.create(name: name_input, years_of_experience: yoe_input)
        puts "Congratulations #{name_input} on joining our Webtoon Writer family!"
        writer_options(name_input)
    end




    #returning reader
    def ret_reader_start
        title_break
        puts "Hello Reader! Please tell us your name so we can assist you accordingly!",""
        print "Please enter your name: "
        reader_input = gets.chomp.titleize
        if Reader.find_by(name: reader_input)
            puts "Welcome #{reader_input}!"
            self.reader_options(reader_input)
        else
            puts "", "Please make sure you are a returning reader or contact customer service for additional help.".red, ""
            self.run
        end
    end

    #reader main menu
    def reader_options(reader_input)
        title_break
        puts "Please select from the options listed", "1) Find all Webtoons I am reading", "2) Find the Writer of your favorite Webtoon", "3) Exit", ""
        print "Please select the corresponding number: "
        while input = gets.chomp.to_i
            case input
            when 1
                self.reader_webtoons(reader_input)
                break
            when 2
                self.reader_writer(reader_input)
                break
            when 3
                self.user_exit
            else
                puts "Please double check you entered the correct # or enter '3' to leave the app.".red
                reader_options(reader_input)
                break
            end
        end
    end

    def reader_webtoons(reader_input)
        line_break
        puts "Here is a list of all the Webtoons you are currently reading!".blue.on_white
        x = Reader.find_by(name: reader_input)
        x.webtoons.each do |y|
            y.title
            puts y.title
        end
        reader_options(reader_input)
    end

    def reader_writer(reader_input)
        line_break
        puts "Please provide the title of your favorite Webtoon!", ""
        print "Webtoon title: "
        title_input = gets.chomp.downcase
        x = Webtoon.find_by(title: title_input)
        y = x.writer_id
        z = Writer.find_by(id: y)
        z.name
        puts "Your favorite Webtoon's writer is #{z.name}!"
        reader_options(reader_input)
    end

    #new reader confirmation
    def new_reader_confirm
        line_break
        puts "Hello! Please confirm that you are a new reader and would like to create a new profile!", ""
        print "y/n: "
        valid_input = gets.chomp.downcase
        if valid_input == "y"
            new_reader_start
        else valid_input == "n"
            puts "", "We will return you to the main menu!".red
            run
        end
    end    

    #new reader
    def new_reader_start
        title_break
        puts "Hello Reader! Please tell us your name and age so we can create a profile for you.", ""
        print "Name: "
        name_input = gets.chomp.titleize
        print "Age: "
        age_input = gets.chomp.to_i
        if Reader.create(name: name_input, age: age_input)
        puts "Congratulations on joining our Webtoon Reader family!"
        reader_options(name_input)
        elsif name_input = "Exit"
            puts "We will return you to the main menu!"
            run
        end
    end

    def user_exit
        puts "Have a nice day and come back soon!"
    end

    def title_break
        puts "", "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",
        "----------------------------------------------------------------------------------", ""
    end

    def line_break
        puts "", "**********************************************************************************", ""
    end

end
