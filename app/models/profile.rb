class Profile < ActiveRecord::Base
  attr_accessible :company, :email, :home_page
  EMAIL_FORMAT = /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/
  
  belongs_to :user
  after_create :send_welcome_email
  
  protected
  
  def send_welcome_email
    UserMailer.welcome_email(user_id).deliver if email?
  end
end