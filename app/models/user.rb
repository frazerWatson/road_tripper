class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_one :profile
  has_many :road_trips
  has_many :comments

  accepts_nested_attributes_for :profile      

  def profile
    super || build_profile
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, profile_attributes: [:username, :avatar, :hometown, :first_name, :last_name, :id, :user_id])
  end

end
