namespace :greetings do

  desc "This greets you in style"
  task :hello do
    puts "Hello"
  end

  task :drink do
    puts "Have a drink"
  end
  
  desc "Goodbye"
  task :goodbye => [:hello, :drink] do
    puts "Goodbye"
  end

end

task :hello => "greetings:hello"