require 'spec_helper'

describe "StaticPages" do
  subject { page }
  
  describe "About page" do
  	before { visit about_path }
  
  	it { should have_selector('title', :text => full_title('About')) }
    it { should have_selector('h1', :text => 'About') }
  end
  
  describe "Contact page" do
	before { visit contact_path }
	
    it { should have_selector('title', :text => full_title('Contact')) }
    it { should have_selector('h1', :text => "Contact") }
  end
end
