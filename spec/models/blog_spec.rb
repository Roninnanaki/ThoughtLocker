require 'spec_helper'

describe Blog do

  before do
    @user = User.create( :name => "user", :email => "user@example.com", 
         :password =>  "foobar10", :password_confirmation => "foobar10")
  end
  
  before { @blog = @user.blogs.build(name: "Lorem ipsum") }

  subject { @blog }

  it { should respond_to(:name) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  it { should respond_to(:tags) }
  its(:user) { should == @user }
  it { should be_valid }

  describe "when user_id is not present" do
    before { @blog.user_id = nil }
    it { should_not be_valid }
  end
  
  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Blog.new(user_id: @user.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end
  
  describe "when user_id is not present" do
    before { @blog.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before  { @blog.name = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @blog.name = "a" * 101 }
    it { should_not be_valid }
  end
end
