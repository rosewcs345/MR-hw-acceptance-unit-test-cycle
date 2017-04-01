# Add a declarative step here for populating the DB with movies.

When /I (un)?check the following movie ratings: (.*)/ do |uncheck, rating_string|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  #fail "Unimplemented"
  rating_string.split().each do |rating| 
    step %Q{I #{uncheck}check "ratings[#{rating}]"}
  end
end

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie)
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  end
  #fail "Unimplemented"
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "([^"]*)" before "([^"]*)"/ do |title1, title2|
  expect(page.body).to match(/.*#{title1}.*#{title2}.*/m)
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"




Then /I should see all the movies: (.*)/ do |title_string|
  title_string.split(", ").each do |title|
    step %Q{I should see "#{title}"} 
  end
  # Make sure that all the movies in the app are visible in the table
  #fail "Unimplemented"
end

Then /^I should (not )?see the following movies: (.*)$/ do |do_not, title_string|
  title_string.split(", ").each do |title|
      step %Q{I should #{do_not}see "#{title}"}
  end
end

Then /^the director of "([^"]*)" should be "([^"]*)"$/ do |movie_title, director|
  expect(page.body).to match(/.*Details about #{movie_title}.*Director:.*#{director}/m)
end

When /I check all the ratings: (.*)/ do |rating_string|
  rating_string.split().each do |rating| 
    step %Q{I check "ratings[#{rating}]"}
  end
end


