.PHONY: test

setup:
	gem list gs -i || gem install gs

	if test -d .gs; \
	then gs; \
	else gs init; \
	fi

install:
	gem list dep -i || gem install dep
	dep install

server:
	env $$(cat env.sh) shotgun -o 0.0.0.0

console:
	env $$(cat env.sh) pry -r ./app

test:
	env $$(cat env.sh) cutest test/**/*.rb

db:
	env $$(cat env.sh) ruby seed.rb
