class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  
  has_many :roles
  has_many :groups, through: :roles
  has_many :posts, :dependent => :destroy
  accepts_nested_attributes_for :posts
  #has_many :journals
end
