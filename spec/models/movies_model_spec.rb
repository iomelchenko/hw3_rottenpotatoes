require 'spec_helper'

describe Movie  do
	
	before :each do
       @movie = Movie.new('title' => 'Titanic', 'rating' => 'G')
	end	
  describe "#new" do
     
     it "returns a new movie object" do
       @movie.should be_an_instance_of Movie
     end	

  end	

  describe "#title" do
     
     it "returns the cottect title" do
       @movie.title.should eql 'Titanic'
     end	

  end  

  describe "#rating" do
     
     it "returns the cottect rating" do
       @movie.rating.should eql 'G'
     end	

  end  

    describe 'searching similar directors' do
    it 'should call Movie with director' do
      Movie.should_receive(:similar_directors).with('Star Wars1')
      Movie.similar_directors('Star Wars1')
      #binding.pry
    end
  end

end