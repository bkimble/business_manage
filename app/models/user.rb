class User < ActiveRecord::Base
  validates_uniqueness_of :phone, :email
  belongs_to :manager, :foreign_key => "manager_id", :class => User
  has_many :subordinates, :class => User, :foreign_key => "manager_id"

  def manager?
    is_manager
  end
  
  def self.authenticate(email)
    User.where(email: email).first
  end
  
  def can?(what, whom=nil)
    case what.to_sym
    when :edit_user
      whom == self || subordinates.include?(whom)
    when :delete_user
      whom != self && subordinates.include?(whom)      
    when :create_users
      manager?
    else
      false
    end
  end
  
end
