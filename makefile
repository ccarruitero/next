setup:
	gem list gs -i || gem install gs
	
	if test -d .gs; \
	then gs; \
	else gs init; \
	fi

install:
	gem list dep -i || gem install dep
	dep install
