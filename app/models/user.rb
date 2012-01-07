class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.validate_login_field = false
    c.require_password_confirmation = false
    c.login_field = :email
    c.validates_length_of_password_field_options(:minimum => 8, :if => :require_password?, :too_short => "Password requires minimum 8 characters")
    c.merge_validates_confirmation_of_password_field_options(:message => "Your passwords don't match")
    c.merge_validates_format_of_email_field_options(:message => "Can you check this… it doesn't seem right", :unless => :skip_email)
    c.merge_validates_length_of_email_field_options(:message => "Can you check this… it doesn't seem right", :unless => :skip_email)
    c.merge_validates_uniqueness_of_email_field_options(:unless => :skip_email, :message => "Email has already been taken", :case_sensitive => false)
  end

end
