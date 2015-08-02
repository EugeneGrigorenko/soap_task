set :environment, "development"
set :output, "log/cron.log"

every 5.minutes do
  runner "CountriesData.instance.update"
end
