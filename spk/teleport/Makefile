SPK_NAME = teleport
SPK_VERS = 13.1.0
SPK_REV = 1

MAINTAINER = yostinso
DESCRIPTION  = Teleport provides simple secure access to SSH servers, Kubernetes clusters, PostgreSQL databases and web apps behind NAT, in any environment.
DISPLAY_NAME = Teleport
CHANGELOG = "First release"

LICENSE = Apache-2.0

DEPENDS = cross/$(SPK_NAME)

SERVICE_USER         = auto
SERVICE_SETUP        = src/service-setup.sh
STARTABLE            = yes
WIZARDS_DIR          = src/wizard

POST_STRIP_TARGET = teleport_extra_install

include ../../mk/spksrc.spk.mk

teleport_extra_install:
	mkdir -p $(STAGING_DIR)/scripts
	cp src/start.sh $(STAGING_DIR)/scripts/start
