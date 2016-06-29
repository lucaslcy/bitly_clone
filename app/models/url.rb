class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!

	validates :short_url, :long_url, uniqueness: {case_sensitive: false}
	validates_format_of :long_url, :with => /(https?:\/\/.*|w{3}.*)/, :message => "Invalid_URL! Please insert valid URL starting with http:// or https:// or www."

	def self.shorten
		short_url = rand(36**rand(5..8)).to_s(36)
	end

end
