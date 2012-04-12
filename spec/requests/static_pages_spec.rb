require 'spec_helper'

describe "StaticPages" do

  describe "Home page" do

    it "should have the base title" do
      visit '/static_pages/home'
      page.should have_selector('title',
                        :text => "ThoughtLocker")
    end

    it "should have a custom page title" do
      visit '/static_pages/home'
      page.should have_selector('title', :text => '| User Home')
    end
  end
  
  describe "About page" do
  
  	it "should have the h1 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector('h1', :text => 'About Us')
    end

    it "should have the title 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector('title',
        :text => ' | About Us')
    end
  end
end
