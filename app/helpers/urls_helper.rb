module UrlsHelper
	def shorten
		self.short_url = SecureRandom.hex(4)
	end
end
