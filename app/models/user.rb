class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name
  # attr_accessible :title, :body

  #--------------
  # associations
  #--------------
  has_many :photos

  before_save :set_full_name

  def set_full_name
    self.full_name = "#{self.first_name} #{self.last_name}"
  end
end
