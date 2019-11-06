#
# Copyright (C) 2014-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-DockerManager
PKG_VERSION:=v0.0.5-beta
PKG_RELEASE:=2019-11-5

PKG_SOURCE:=$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/lisaac/luci-app-docker/archive/$(PKG_VERSION).tar.gz
PKG_HASH:=????
PKG_MAINTAINER:=lisaac <lisaac.cn@gmail.com>

LUCI_TITLE:=LuCI support for Docker Manager
LUCI_DEPENDS:=+luci-lib-docker
LUCI_PKGARCH:=all


include $(INCLUDE_DIR)/package.mk


define Package/$(PKG_NAME)
 	SECTION:=luci
	CATEGORY:=LuCI
	SUBMENU:=3. Applications
	TITLE:=LuCI Support for Docker Manager
	PKGARCH:=all
endef

define Package/$(PKG_NAME)/Default/description
 Docker Manager interface for LuCI
endef

define Build/Prepare
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci
	cp -pR ./luasrc/* $(1)/usr/lib/lua/luci
	$(INSTALL_DIR) $(1)/
	cp -pR ./root/* $(1)/
endef

#define Package/$(PKG_NAME)/prerm
#!/bin/sh
#if [ -z "$${IPKG_INSTROOT}" ]; then
#     /etc/init.d/dockerd  disable
#     /etc/init.d/dockerd  stop
#fi
#exit 0
#endef

$(eval $(call BuildPackage,$(PKG_NAME)))
