.PHONY: test

install:
	gem list dep -i || gem install dep
	dep install

server:
	shotgun -o 0.0.0.0

console:
	pry -r ./app

test:
	cutest test/**/*.rb

db:
	ruby seed.rb
