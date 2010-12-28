# -*- coding: utf-8 -*-
# == Schema Information
# Schema version: 20101228004006
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  attr_accessible :name, :email

  # \A: match the expression only against the start of the target string, not lines within it.(start)
  # \z: match the expression only against the end of the target string.(end)
  # i : If you wanted to ignore case entirely in your search, you could also use the i modifier.(대소문자 구분 x)
  # . : Match any character.
  # \-: escape char of '-'.
  # \w: Matches word characters: A-Z, a-z, and 0-9.
  # \d: Matches any digit.(Just 0-9)
  # \.: escape char of '.'.
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name,  :presence   => true,
                    :length     => { :maximum => 50 }
  validates :email, :presence   => true,
                    :format     => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }

end
