# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  image_url       :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'spec_helper'

  describe User do 
    it { should have_many(:comments) }
    it { should have_many(:events) }
    # it { should have_many(:rsvps) }
 
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:username) }

    before do 
      @user = User.new(username: "Example_user", email: "user@example.com")      
    end

    subject {@user}

    it { should respond_to(:username) }
    it { should respond_to(:email) }
    it { should respond_to(:password_digest) }
    # it { should respond_to(:password) }
    # it { should respond_to(:password_confirmation) }

    #username validations
    describe "when username is too long" do 
      before {@user.username = "a" * 51}
      it { should_not be_valid }
    end

    it { should validate_uniqueness_of(:username) }


    #email validations
    describe "when email format is invalid" do 
      it "should be invalid" do 
        addresses = %w[user@foo,com user_at_foo.org example.user@foo.foo@bar_baz.com foo@bar+baz.com]
        addresses.each do |invalid_address|
          @user.email = invalid_address
          expect(@user).not_to be_valid
        end
      end
    end

    describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
        end
      end
    end

    describe "when email address is already taken" do 
      before do 
        user_with_same_email = @user.dup
        user_with_same_email.email = @user.email.upcase
        user_with_same_email.save
      end

      it { should_not be_valid}
    end


end
