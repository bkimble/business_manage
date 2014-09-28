class User < ActiveRecord::Base
  validates_uniqueness_of :phone, :email
  belongs_to :manager, :foreign_key => "manager_id", :class => User
  has_many :subordinates, :class => User, :foreign_key => "manager_id"

  def manager?
    subordinates.count >0 
  end
  
  def self.authenticate(email)
    User.where(email: email).first
  end
end
