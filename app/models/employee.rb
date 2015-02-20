class Employee < ActiveRecord::Base
  mount_uploader :profile_picture, ImageUploader

  validates :employ_name, presence: true, :length => {:maximum => 30}

  validates :phone_no, presence: true, :format => { with: /\A\d{10}/ }, :length => {:maximum => 10}

  validates :department, presence: true

  validates :employ_information, :length => {:maximum => 320}

end
