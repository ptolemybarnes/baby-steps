=begin
You are given the following information, but you may prefer to do some research for yourself.

1 Jan 1900 was a Monday.
Thirty days has September,
April, June and November.
All the rest have thirty-one,
Saving February alone,
Which has twenty-eight, rain or shine.
And on leap years, twenty-nine.

A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
=end

class Calendar
attr_accessor :day_count

	def initialize
		@daysofweek = [0,0,0,0,0,0,0] #monday = 0
	end

	def count_sundays_in_range(start_year,end_year)
		current_year = start_year
		day_count = 0
		new_month_sundays = 0

		until current_year == end_year
			12.times do |month|
				if (day_count%7 == 6)
					new_month_sundays += 1
				end
				day_count += month_length(month,current_year)
			end
			current_year += 1
		end

		new_month_sundays
	end

	def month_length(month,year)
		months = [
			31, #january
			28, #february
			31, #march
			30, #april
			31, #may
			30, #june
			31, #july
			31, #august
			30, #september
			31, #october
			30, #november
			31 #december
		]

		if leapYear?(year)
			months[1] = 29
		end
		months[month]
	end

	def leapYear?(year)
		if (year % 100 == 0) && !(year % 400 == 0)
			return false
		elsif year % 4 == 0
			return true
		else
			return false
		end
	end

end

calendar = Calendar.new
puts calendar.count_sundays_in_range(1901,2000)