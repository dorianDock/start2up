require 'faker'

namespace :db do
  desc 'Populate db with users'
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    User.create!(:name => 'Dorian',
                 :email => 'dd@dd.dd',
                 :password => 'aaaaaaaa')
    99.times do |n|
      nom  = Faker::Name.name
      email = "dorian-#{n+1}@dorian.org"
      password  = 'truite'
      User.create!(:name => nom,
                   :email => email,
                   :password => password)
    end
  end
end

