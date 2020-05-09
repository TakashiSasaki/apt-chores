#!/usr/bin/make -f
.PHONY: SHBANG test-test do-release-upgrade
SHBANG: $(MAKEFILE_LIST)
	@echo -n

do-release-upgrade:
	sed -i -e 's/^Prompt=lts$/Prompt=normal/' /etc/update-manager/release-upgrades
	apt-get install -y ubuntu-release-upgrader-core
	apt-get update -y
	apt-get upgrade -y
	apt-get dist-upgrade -y
	do-release-upgrade
