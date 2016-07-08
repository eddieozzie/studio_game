require_relative 'auditable'

class LoadedDie

	include Auditable

	attr_reader :number
	
	def roll 
		numbers = [1,2,3,4,5,6]
		@number = numbers.sample
		audit
		@number
	end

end