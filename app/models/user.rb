class User < ApplicationRecord
  # Callback after_create
  after_create :set_statistic
  # Validation
  validates :first_name, :last_name, presence: true, length: {minimum:3}, on: :update
    
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Virtual field 
  def full_name
    [self.first_name,self.last_name].join(' ')
  end

  #  Associations
  has_one :user_profile, :dependent => :destroy
  # Nested fields
  accepts_nested_attributes_for :user_profile, reject_if: :all_blank
  
  
  # Private methods
  private

  def set_statistic
    AdminStatistic.set_event(AdminStatistic::EVENTS[:total_users])
  end
end
