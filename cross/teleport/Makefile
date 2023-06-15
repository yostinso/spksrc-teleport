PKG_NAME = teleport
PKG_VERS = 13.1.1
PKG_EXT = tar.gz
PKG_DIST_NAME = v$(PKG_VERS).$(PKG_EXT)
PKG_DIST_FILE = $(PKG_NAME)-$(PKG_DIST_NAME)
PKG_DIST_SITE = https://github.com/gravitational/teleport/archive/refs/tags
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

DEPENDS = native/go

HOMEPAGE = https://goteleport.com
COMMENT  = Teleport provides simple secure access to SSH servers, Kubernetes clusters, PostgreSQL databases and web apps behind NAT, in any environment.
LICENSE  = Apache-2.0

UNSUPPORTED_ARCHS = $(PPC_ARCHS) $(ARMv5_ARCHS) $(i686_ARCHS) $(ARMv7L_ARCHS)

GO_SRC_DIR = $(EXTRACT_PATH)/$(PKG_NAME)-$(PKG_VERS)
GO_BIN_DIR = $(GO_SRC_DIR)/build/*

GO_LDFLAGS = -s -w

CGO_ENABLED = 1


COMPILE_TARGET = teleport_compile_target

include ../../mk/spksrc.cross-go.mk

teleport_compile_target:
	$(RUN) $(MAKE) all ARCH=$(GO_ARCH) GOARM=$(GOARM)
