class Product < ActiveRecord::Base
  validates_presence_of :name, :description
  
  before_validation :fill_in_missing_description
  
  private
  
  def fill_in_missing_description
      self.description = self.name if description.blank?
  end

end
# == Schema Information
#
# Table name: products
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  cost        :decimal(, )
#  stock       :integer
#  created_at  :datetime
#  updated_at  :datetime
#

