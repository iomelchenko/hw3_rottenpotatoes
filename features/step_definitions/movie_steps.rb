# Add a declarative step here for populating the DB with movies.

 Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create!(movie)
  end
# assert false, "Unimplmemented"
end


# Make it easier to express checking or unchecking several boxes at once
# "When I uncheck the following ratings: PG, G, R"
# "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  # iterate over the ratings and reuse the "When I check..." or
  # "When I uncheck..." steps in lines 89-95 of web_steps.rb

  rate = rating_list.gsub(",", "").split

  if uncheck == nil
    
    rate.each_with_index do |field, index|
        #binding.pry
          step %Q{I check "ratings[#{field}]"}
    end
  else
    
    rate.each_with_index do |field, index|
        #binding.pry

          step %Q{I uncheck "ratings[#{field}]"}
    end
  
  end
   #binding.pry
end

Then /I should see all of the movies/ do
       
Movie.find(:all).count.should == page.all('table tbody tr').count

end


Then /I should see "(.*)" before "(.*)"/ do |a, b|
    assert page.body =~ /(.)*#{Regexp.escape(a)}(.)*#{Regexp.escape(b)}/im
  #binding.pry
  
end

Then /I should see sort movies alphabetically/ do
   
   Movie.all(:order => :title).each_cons(2) do |a, b|

      step %Q{I should see "#{a.title}" before "#{b.title}"}
     
   end

end

Then /the director of "(.*)" should be "(.*)"/ do |title, director|

  Movie.find_by_title(title).director.should == director

end  