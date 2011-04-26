require 'spec_helper'

describe RegistrationsController do
  render_views

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'edit'" do

    before(:each) do
      @user = Factory(:user)
      test_sign_in(@user)
      @registration = Factory(:registration)
    end  	
   
    it "should be successful" do
      get :edit, :id => @registration
      response.should be_success
    end
  end

  describe "GET 'update'" do

    before(:each) do
      @user = Factory(:user)
      test_sign_in(@user)
      @registration = Factory(:registration)
    end  	
   
    it "should be successful" do
      get :update, :id => @registration
      response.should be_success
    end
  end

  describe "GET 'show'" do

    before(:each) do
      @user = Factory(:user)
      test_sign_in(@user)
      @registration = Factory(:registration)
    end  	

    it "should be successful" do
      get :show, :id => @registration
      response.should be_success
    end
  end

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'destroy'" do
    it "should be successful" do
      get 'destroy'
      response.should be_success
    end
  end

  describe "GET 'create'" do

    before(:each) do
      @user = Factory(:user)
      test_sign_in(@user)
      @registration = Factory(:registration)
    end  	
   
    it "should be successful" do
      get :create, :id => @registration
      response.should be_success
    end
  end

end
