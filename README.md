# Parser
A script that returns 
* list of webpages with most page views ordered from most pages views to less page views
* list of webpages with most unique page views also ordered

## Assumptions
* A page visit is a single entry in the log file 
* A unique page visit is the amount of unique addresses for a single page 

## Execute
Make sure you have ruby 2.6.3 installed on the machine and run `bin/parser webserver.log`

## Tests
Make sure you have ruby 2.6.3 installed on the machine and run `bundle install` to install the necessary gems and then run 
`rspec`
 