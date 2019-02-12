class Instrument < ApplicationRecord
	has_many :quota_values, :dependent => :destroy
end
