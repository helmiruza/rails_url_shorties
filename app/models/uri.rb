class Uri < ActiveRecord::Base

	before_save :generate_short_uri
  belongs_to :user

  validates_format_of :original_uri, :with => URI::regexp(%w(http https))

  def generate_short_uri
  	self.short_uri = (0...8).map { (65 + rand(26)).chr}.join unless self.short_uri
  end

end
