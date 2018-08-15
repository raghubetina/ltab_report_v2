class User < ApplicationRecord
  # Direct associations

  has_many   :coachings,
             :dependent => :destroy

  # Indirect associations

  has_many   :teams,
             :through => :coachings,
             :source => :team

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
