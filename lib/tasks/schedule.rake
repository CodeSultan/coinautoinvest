
namespace :crono do
  desc "Cron jobs are working on my rails app now."

  task :hello => :environment do
    puts "hello"
  end
end