##########################################################################################################################################
##########################################################################################################################################
########  																																																										    ########
########  The goal is to make a student directory with the following features: 																								    ########
########  																																																										    ########
########  	Show the list of all students 																																										    ########
########  	ordered by names 																								    																									########
########  	grouped by cohort (as an exercise) 																								    																########
########  	Add new students by asking the user to input the names 																								    						########
########  	Show information about a given student 																								    														########
########  	Add information related to a particular student (e.g. hobbies) 																								    		########
########  	Interactive menu to ask the user what he or she would like to do 																								    	########
########  	Displaying aggregate info (statistics) 																								    														########
########  	Saving this data to a file 																								    																				########
########  	Loading it from the file 																								   																					  ########
########  																																																										    ########
##########################################################################################################################################
##########################################################################################################################################

class Student
	attr_reader :i
	STUDENTS = []

	def initialize(information)
		information.default = false
		@i = information
		STUDENTS.push self
	end

	def get_info
		puts "All information about #{@i[:name]}: "
		@i.each { |k,v| puts k.to_s + ": " + v}
	end

	def edit_student
		puts "Enter 'attribute: value.'"
		edit_done = false
		until edit_done
			input = gets.chomp
			input = input[/(.*):+\s*(.*)/]
			if $1 && $2
				@i[$1.to_sym] = $2
				puts "Edition successful!\n"
				edit_done = true
			elsif input == "quit"
				puts "\nQuitting...\n"
				edit_done = true
			else
				puts "Invalid input in edit_student"
			end
		end
	end

end

class Directory
	attr_reader

	def initialize
	end

	def handler

		puts("########################################################################################".red.center(100))
		puts("############################ WELCOME TO THE STUDENT DIRECTORY ##########################".red.center(100))
		puts("########################################################################################".red.center(100))
		puts("Select an option".center(100))

		menu_options = [
				["Display information about a student.",proc { view_or_edit_student(:get_info)}],
				["Edit a single student's record",proc { view_or_edit_student(:edit_student)}],
				["List all students",method(:list_all_students)],
				["Add student to directory",method(:add_student)],
				["Display aggregate statistics",method(:display_stats)],
				["Save directory",method(:save_dir)],
				["Load directory",method(:load_dir)],
			]
		
		until quit
				menu_options.each_with_index do |label_arr, number| # lays out menu options
					puts "#{number + 1}: #{label_arr[0]}".margin(5)
				end

				input = gets.chomp

				if input.quit?
					quit = true 
				elsif input.respond_to?(:to_i) && menu_options[input.to_i-1]
					menu_options[input.to_i-1][1].call
				else 
					puts "\nInvalid option\n"
				end
		end
		puts "\nQuitting directory..."
	end

	# methods for manipulating student data from within directory.

	def view_or_edit_student(method)
		quit = false

		until quit
			puts "Enter student's name:"
			name_input = gets.chomp
			Student::STUDENTS.each {|student| student.send(method) if student.i[:name] == name_input}
			quit = true if name_input.quit?
		end
	end

	def list_all_students
		puts "List students by " + get_keys.join(", ") + ". Please choose:"
		
		quit = false
		until quit
			list_criterion = get_list_criterion
			order_hash = {}
			Student::STUDENTS.each {|student| order_hash[student.i[:name]] = student.i[list_criterion]}
			order_hash = order_hash.each {|key, val| order_hash[key] = "?????" if val == false } #gives std "????" val if val is not present for order criterion.
			puts "List of students by #{list_criterion}:"
			order_hash.values.uniq.sort.each do |val| 
				puts val + ":"
				print " " + order_hash.select {|key,value| value == val }.keys.join(", ") + "\n" unless list_criterion == :name # ensures names are not printed twice if :name is the order criterion.
			end
		end
	end

	def get_list_criterion
		list_by = false
			until list_by
				input = gets.chomp
				if get_keys.include?(input.intern)
					list_by = input 
				elsif input.quit?
					puts "Quitting"
					exit!
				else
					puts "#{input} is not a valid list criterion."
				end
			end
		list_by
	end

	def add_student
		add_done = false
		puts "Let's add a student!"
		puts "Enter the student's name:"
		until add_done
			input = gets.chomp
			if input.match(/\S/)
				Student.new(name: input)
				puts "Student added!"
				add_done = true
			else
				puts "Invalid input"
			end
		end
	end

	def display_stats
	end

	def save_dir
		puts "Let's save the directory!"
		saved_dirs = File.open('./saved.txt', "w")
		Student::STUDENTS.each do |student|
			saved_dirs.puts student.i
			puts student.i[:name] + " was saved to file!"
		end
	end

	def load_dir
		puts "Let's load a directory! Clearing current directory..."
		Student::STUDENTS.clear
		students = File.open("./saved.txt", "r"){|datafile|
				datafile.readlines
		}
		students.each {|line| Student.new(eval(line))}
	end

	def get_keys
		keys_array = Student::STUDENTS.collect {|student| student.i.keys}.flatten.uniq #gets all attributes in existence.
		keys_array.collect {|key| key.intern }
	end

end

class String # does colours.
	def red
	"\e[31m" + self + "\e[0m"
	end
	def blue
	"\e[34m" + self + "\e[0m"
	end

	def quit?
		(self == "quit" || self == "exit")
	end

	def margin(width)
		self.prepend(" "*width)
	end
end

dir = Directory.new
dir.handler
