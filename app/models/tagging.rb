class Tagging < ActiveRecord::Base
  belongs_to :blog
  belongs_to :tag
end
