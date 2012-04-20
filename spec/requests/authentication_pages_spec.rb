require 'spec_helper'

describe "Authentication" do

  subject { page }
  
  before do
    @user = User.create(:name => "user", :email => "user@example.com", 
         :password =>  "foobar10", :password_confirmation => "foobar10")
  end

  describe "signin page" do
    before { visit signin_path }

    it { should have_selector('h2',    :text => 'Sign in') }
    it { should have_selector('title', :text => 'Sign in') }
  end
  
  describe "signin" do
    let(:submit) { "Login" }
    
    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "Login" }

      it { should have_selector('title', :text => 'Sign in') }
      it { should have_selector('div.alert.alert-error', :text => 'Invalid') }
    end
    
    describe "with valid information" do
      before do
        fill_in 'login_email_form',    :with => "user@example.com"
        fill_in 'login_password_form', :with => "foobar10"
        click_button submit
      end
    end
  end
end
