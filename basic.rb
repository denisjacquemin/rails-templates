# remove unused files
run "rm public/images/rails.png"

# initialize the git repository
git :init

# create a .gitignore file
file ".gitignore", <<-END
.DS_Store
log/*.log
tmp/**/*
config/database.yml
db/*.sqlite3
db/schema.rb
END

# make some directories visible to the git repository commit
run "touch tmp/.gitignore log/.gitignore vendor/.gitignore"

# keep database.yml as an example
run "mv config/database.yml config/database.yml.example"

# configure database for development only
file 'config/database.yml',
%q{development:
  adapter: sqlite3
  database: db/development.sqlite3
  pool: 5
  timeout: 5000
}

# add all the files in the git repository
# and commit everything
git :add => "."
git :commit => "-m 'initial commit by basic.rb template'"

# install some usefull plugins
plugin "haml", :git => "git://github.com/nex3/haml.git"
git :add => "."
git :commit => "-m 'haml plugin added'"

# Success!
puts "SUCCESS!"