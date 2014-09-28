require 'rails_helper'
RSpec.describe UserController, :type => :controller do
  
  context "logged in manager" do
    describe "index" do
      it "should return subordiates and manager" do
      end      
    end
    
    describe "update" do
      it "should update the user it the manager" do
      end
      
      it "should update if the user is a subordinate of the manager" do
      end
      
      it "should not update if the user is not  a subordinate of the manager" do        
      end

      it "should not update if the user is not  a subordinate of the manager" do        
      end  
      
      
      it "should not update the user if there are form errors" do
      end    
    end    
    
    describe "create" do
      it "should create and assign the user to the manager" do
      end
      
      it "should not create the user if there are form errors" do
      end
    end
    
      # etc etc etc
  end
  
  
  context "logged in subordinate" do 
    describe "index" do
      it "should return logged in subordinate and their manager" do
      end      
    end
    
    # etc etc etc
  end
  
  
end
