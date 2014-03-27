class DealTag < ActiveRecord::Base
  belongs_to :deal
  belongs_to :tag
end
