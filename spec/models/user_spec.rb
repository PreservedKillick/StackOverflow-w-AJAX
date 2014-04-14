require 'spec_helper'

describe User do

  it { should have_secure_password }
  it { should validate_presence_of :username }
  it { should validate_uniqueness_of :username }
  it { should have_many :questions }
  it {should have_many :answers }
end
