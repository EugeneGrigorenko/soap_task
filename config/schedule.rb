set :environment, "development"
set :output, "log/cron.log"

every 5.minutes do
  runner "CountriesData.instance.update"
end

every 1.day, at: '12:01 am' do
  runner "TripsVisitor.instacne.mark_visited_countries"
end
