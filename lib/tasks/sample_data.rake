namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:name => "Don Page",
                         :email => "goodies4uall@gmail.com",
                         :password => "2514witzkerg",
                         :password_confirmation => "2514witzkerg")
    admin.toggle!(:admin)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end
    #Fill in lessons for first 6 users
    User.all(:limit => 6).each do |user|
      5.times do
        user.lessons.create!(:title => Faker::Lorem.words(4), :content => Faker::Lorem.paragraph(5))
      end
    end

  end
end
