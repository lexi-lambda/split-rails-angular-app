class User < ActiveRecord::Base
  devise :confirmable, :database_authenticatable, :recoverable, :registerable,
         :rememberable, :trackable, :validatable
end
