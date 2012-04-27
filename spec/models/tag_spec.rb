require 'spec_helper'

describe Tag do
  before do
    @user = User.create( :name => "user", :email => "user@example.com", 
         :password =>  "foobar10", :password_confirmation => "foobar10")
  end
  
  before { @blog = @user.blogs.build(name: "Test Blog") }
  
  before { @tag = @blog.tags.build(name: "test tag") }
  
  subject { @tag }

  it { should respond_to(:name) }
  it { should respond_to(:blog_id) }
  
  describe "accessible attributes" do
    it "should not allow access to blog_id" do
      expect do
        Tag.new(blog_id: @blog.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end
  
end
