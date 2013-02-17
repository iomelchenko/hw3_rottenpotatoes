require 'spec_helper'

describe MoviesController do
  render_views

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
      
    end
  end

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  describe 'edit page for appropriate Movie' do
    it 'When I go to the edit page for the Movie, it should be loaded' do

      mock = mock('Movie')

      Movie.should_receive(:find).with('9').and_return(mock)
     
      get :edit, {:id => '9'}
      response.should be_success
    end
  end
end
