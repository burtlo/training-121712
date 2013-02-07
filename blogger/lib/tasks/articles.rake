namespace :articles do

  task first: :environment do
    puts "Article: #{Article.first.title}"
  end

  task show: :environment do
    number = ENV["ARTICLE"] || 1
    article = Article.find(number)
    puts "Showing Article: #{article}"
  end
  
end