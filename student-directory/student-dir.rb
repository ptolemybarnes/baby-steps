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
		STUDENTS.push self.object_id
	end

	def get_info
		puts "All information about #{@i[:name]}: "
		@i.each { |k,v| puts k.to_s + ": " + v}
	end

	def edit_student
		puts "Let's edit #{@i[:name]}'s information! Enter 'attribute: value.'"
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

	def initialize
	@students = Student::STUDENTS
	end

	def handler

		op_tree = {
				"1" => ["Display information about a student.",proc { view_or_edit_student(:get_info) }],
				"2" => ["Edit a single student's record",proc { view_or_edit_student(:edit_student)}],
				"3" => ["List all students",method(:list_all_students)],
				"4" => ["Add student to directory",method(:add_student)],
				"5" => ["Display aggregate statistics",method(:display_stats)],
				"6" => ["Save directory",method(:save_dir)],
				"7" => ["Load directory",method(:load_dir)],
			}
		quit = false

		until quit
				op_tree.each do |num, label_arr| # lays out option tree.
					puts "#{num}: #{label_arr[0]}"
				end

				input = gets.chomp

				if op_tree[input]
					op_tree[input][1].call
				elsif (input == "quit" || input == "exit")
					quit = true
				else 
					puts "\nInvalid option\n"
				end
		end
		puts "\nQuitting directory..."
	end

	def view_or_edit_student(method)
		quit = false 
		until quit
			puts "Enter student's name:"
			name_input = gets.chomp
			Student::STUDENTS.each {|id| ObjectSpace._id2ref(id).send(method) if ObjectSpace._id2ref(id).i[:name] == name_input} #looks up students by object IDs.
			if (name_input == "quit") || (name_input == "exit")
				quit = true
			end
		end
	end

	def list_all_students
		puts "\nList of all students in directory:\n"
		puts
		Student::STUDENTS.each {|id| puts ObjectSpace._id2ref(id).i[:name]}
		puts
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
	end

	def load_dir
	end

end

me = Student.new(name: "Ptolemy", hobbies: "playing volleyball", age: "26", cohort: "December")
Dave = Student.new(name: "Dave", hobbies: "collecting stamps", age: "30", cohort: "December")
dir = Directory.new
dir.handler
