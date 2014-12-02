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
	attr_accessor :name, :cohort, :age, :hobbies
	attr_reader
	STUDENTS = []

	def initialize(name: "unknown",age: false,cohort: false, hobbies: false)
		@name = name; @age = age; @cohort = cohort; @hobbies = hobbies;

	end

	def get_info
		output = []
		output << " is #{@age} years old" if @age
		output << "is in the #{@cohort} cohort" if @cohort
		output << "likes #{@hobbies}" if @hobbies
		output[-1].prepend("and ") if output.length > 2
		output = output.join(", ") << "."
		output.prepend("#{name}")
		output
	end

end

class Directory

	def initialize
	@students = Student::STUDENTS
	end

	def handler

		op_tree = {
				"1" => ["Display information about a student.",method(:get_student_info)],
				"2" => ["List all students",method(:list_all_students)],
				"3" => ["Add student to directory",method(:add_student)],
				"4" => ["Edit a single student's record",method(:edit_student)],
				"5" => ["Display aggregate statistics",method(:display_stats)],
				"6" => ["Save directory",method(:save_dir)],
				"7" => ["Load directory",method(:load_dir)],
			}
		quit = false

		until quit
				op_tree.each do |num, label_arr|
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

	def get_student_info
		puts "Enter student's name:"

	end

	def list_all_students
	end

	def add_student
	end

	def edit_student
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