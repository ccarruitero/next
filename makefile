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
	shotgun -o 0.0.0.0

test:
	cutest test/**/*.rb
