class Url < ApplicationRecord
	validates :long_url, uniqueness: true
	validates :long_url, format: {with: (URI::regexp(['http','https'])), message: "invalid surl"}
	validates :short_url, uniqueness: true
end
