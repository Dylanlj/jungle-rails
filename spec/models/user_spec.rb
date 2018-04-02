require 'rails_helper'

RSpec.describe User, type: :model do


  describe '.authenticate_with_credentials' do
    before :each do
      @user = User.new(
        first_name: "Sterling",
        last_name: "Archer",
        email: "spy@spy.com",
        password: "danger_zone",
        password_confirmation: "danger_zone")
      @user.save
    end

    it "should authenticate without error" do
      expect(User.authenticate_with_credentials("spy@spy.com", "danger_zone")).to be_truthy
    end
    it "should return nil due to incorrect email" do
      expect(User.authenticate_with_credentials("phrasing", "danger_zone")).to be_falsy
    end
    it "should return nil due to incorrect password" do
      expect(User.authenticate_with_credentials("spy@spy.com", "this is how you get ants")).to be_falsy
    end

    it "should ignore spaces in the email" do
      expect(User.authenticate_with_credentials("  spy@spy.com ", "danger_zone")).to be_truthy
    end
   it "should ignore incorrect casing in emails" do
      expect(User.authenticate_with_credentials("  SPY@SPY.com ", "danger_zone")).to be_truthy
    end

  end


  describe "Validations" do
    before :each do
      @user = User.new(
        first_name: "Sterling",
        last_name: "Archer",
        email: "spy@spy.com",
        password: "danger_zone",
        password_confirmation: "danger_zone")
    end


    it "should create user with without error" do
      @user.save
      expect(@user.errors.full_messages.any?).to be_falsy
    end
    it "should have a first name" do
      @user.first_name = nil
      @user.save
      expect(@user.errors.full_messages.any?).to be_truthy
    end
    it "should have a last name" do
      @user.last_name = nil
      @user.save
      expect(@user.errors.full_messages.any?).to be_truthy
    end
    it "should have a email" do
      @user.email = nil
      @user.save
      expect(@user.errors.full_messages.any?).to be_truthy
    end
    it "should have a password" do
      @user.password = nil
      @user.save
      expect(@user.errors.full_messages.any?).to be_truthy
    end
    it "should have a password" do
      @user.password = nil
      @user.save
      expect(@user.errors.full_messages.any?).to be_truthy
    end

    it "should have a unique case insensitive email" do
      @first_user = User.new(
        first_name: "Sterling",
        last_name: "Archer",
        email: "SPY@SPY.com",
        password: "danger_zone",
        password_confirmation: "danger_zone")
      @first_user.save
      @user.save
      expect(@user.errors.full_messages.any?).to be_truthy
    end
    it "password has a minimum length" do
      @user.password = "bang"
      @user.save
      expect(@user.errors.full_messages.any?).to be_truthy
    end
  end
end














