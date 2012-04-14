require 'spec_helper'

describe "User pages" do
  subject { page }
  
  before do
    @user = User.create(:name => "user", :email => "user@example.com", 
         :password =>  "foobar10", :password_confirmation => "foobar10")
  end

  describe "signup page" do
    before { visit signup_path }

    #it { should have_selector('h1',    :text => 'Sign up') }
    it { should have_selector('title', :text => full_title('Sign up')) }
  end
  
  describe "profile page" do
	# Code to make a user variable
	before { visit user_path(@user) }
	
	it { should have_selector('h1',    :text => @user.name) }
	it { should have_selector('title', :text => @user.name) }
  end
  
  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Submit" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
      
      describe "error messages" do
        before { click_button submit }

        it { should have_selector('title', :text => 'Sign up') }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do
      before do
        fill_in 'email_form',        :with => "user@example.com"
        fill_in 'password_form',     :with => "foobar10"
        fill_in 'password_confirmation_form', :with => "foobar10"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(0)
      end
    end
  end
end
