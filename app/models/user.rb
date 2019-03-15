class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :bugs
  has_many :user_projects
  has_many :projects , through: :user_projects 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
end