update:
	git pull --rebase

GITCONFIG_PREFIX = $(shell pwd)

install:
	@echo "Remove old gitconfig settings, you should see an ignored Error 5 for new install."
	-git config --global --unset-all include.path "$(GITCONFIG_PREFIX)/config"
	@if [ $$? -ne 0 ] && [ $$? -ne 5 ] ; then\
		exit $$?;\
	fi
	git config --global --add include.path "$(GITCONFIG_PREFIX)/config"

Makefile: ; # Do not remake makefile.

.PHONY: all update install clean
