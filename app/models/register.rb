class Register < ActiveRecord::Base
  SCREEN_NAME_SIZE       = 20
  PASSWORD_SIZE          = 10
  QUESTION1_SIZE         = 30
  QUESTION2_SIZE         = 30
  QUESTION3_SIZE         = 30
  SCREEN_NAME_MIN_LENGTH = 4
  SCREEN_NAME_MAX_LENGTH = 20
  PASSWORD_MIN_LENGTH    = 4
  PASSWORD_MAX_LENGTH    = 40
  QUESTION1_MIN_LENGTH   = 4
  QUESTION1_MAX_LENGTH   = 40
  QUESTION2_MIN_LENGTH   = 4
  QUESTION2_MAX_LENGTH   = 40
  QUESTION3_MIN_LENGTH   = 4
  QUESTION3_MAX_LENGTH   = 40
  SCREEN_NAME_RANGE      = SCREEN_NAME_MIN_LENGTH..SCREEN_NAME_MAX_LENGTH
  PASSWORD_RANGE         = PASSWORD_MIN_LENGTH..PASSWORD_MAX_LENGTH
  QUESTION1_RANGE        = QUESTION1_MIN_LENGTH..QUESTION1_MAX_LENGTH
  QUESTION2_RANGE        = QUESTION2_MIN_LENGTH..QUESTION2_MAX_LENGTH
  QUESTION3_RANGE        = QUESTION3_MIN_LENGTH..QUESTION3_MAX_LENGTH
 
  validates_uniqueness_of   :username
 
  validates_length_of           :username, :within  => SCREEN_NAME_RANGE
  validates_length_of           :password, :within  => PASSWORD_RANGE
  validates_length_of           :q1, :within =>QUESTION1_RANGE
  validates_length_of           :q2, :within =>QUESTION2_RANGE
  validates_length_of           :q3, :within =>QUESTION3_RANGE
 
  validates_format_of         :username,
                              :with => /\A[A-Z0-9._%-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}\z/i,
                              :message => "must be a valid email address"
 
  validates_format_of       :password,
                            :with => /\A[A-Z0-9_]*\z/i,
                            :message => "must contain only letters, numbers, and underscores"
   validates_format_of      :q1,
                            :with => /\A[A-Z0-9_]*\z/i,
                            :message => "must contain only letters, numbers, and underscores"
  validates_format_of       :q2,
                            :with => /\A[A-Z0-9_]*\z/i,
                            :message => "must contain only letters, numbers, and underscores"
   validates_format_of      :q3,
                            :with => /\A[A-Z0-9_]*\z/i,
                            :message => "must contain only letters, numbers, and underscores"

   attr_accessor :question_id , :answer
end
