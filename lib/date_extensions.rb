class Time

	def cweek
		return self.strftime("%W").to_i + 1
	end

end