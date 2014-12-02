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
	attr_reader :name, :cohort, :age, :hobbies
	STUDENTS = []

	def initialize(name: "unknown",age: false,cohort: false, hobbies: false)
		@name = name; @age = age; @cohort = cohort; @hobbies = hobbies;
		STUDENTS.push self.object_id
	end

	def get_info
		output = []
		output << " is #{@age} years old" if @age
		output << "is in the #{@cohort} cohort" if @cohort
		output << "likes #{@hobbies}" if @hobbies
		output[-1].prepend("and ") if output.length > 2
		output = output.join(", ") << "."
		output.prepend("#{name}")
		puts output
	end

	def edit_student
		puts "Let's edit #{@name}'s entry! Enter 'attribute: value.'"
		edit_done = false
		until edit_done
			input = gets.chomp

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
			Student::STUDENTS.each {|id| ObjectSpace._id2ref(id).send(method) if ObjectSpace._id2ref(id).name == name_input} #looks up students by object IDs.
			if (name_input == "quit") || (name_input == "exit")
				quit = true
			end
		end
	end

	def list_all_students
		puts "\nList of all students in directory:\n"
		Student::STUDENTS.each {|id| puts ObjectSpace._id2ref(id).name}
		puts
	end

	def add_student
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