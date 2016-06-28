class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!

	validates :short_url, uniqueness: true
	validates :long_url, uniqueness: true

	def self.shorten
		short_url = rand(36**rand(5..8)).to_s(36)
	end

end
