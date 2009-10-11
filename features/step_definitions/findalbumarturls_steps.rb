gem "fakeweb"
require "fakeweb"

Before do 
  FakeWeb.allow_net_connect = false
end


Given /^that i want to find artwork for the album "([^\"]*)"$/ do |query| end
