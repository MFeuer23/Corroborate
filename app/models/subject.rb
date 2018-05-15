class Subject < ActiveRecord::Base
  has_many :claims

  include Slugifiable
  extend Findable
end
