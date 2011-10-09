class User < ActiveRecord::Base
  acts_as_authentic
  # TODO: attr_accessible
  
  has_many :tasks, :dependent => :destroy
end
