class User < ActiveRecord::Base
  acts_as_authentic
  
  has_many :tasks, :dependent => :destroy
end
