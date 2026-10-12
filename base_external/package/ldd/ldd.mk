##############################################################
#
# LDD
#
##############################################################

LDD_VERSION = main
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-DysonTheSphere.git
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

LDD_MODULE_SUBDIRS = scull misc-modules

# Install scull utility scripts
define LDD_INSTALL_TARGET_CMDS
    $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/scull INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
    $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/misc-modules INSTALL_MOD_PATH=$(TARGET_DIR) modules_install

    $(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/usr/bin/
    $(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/usr/bin/
endef

$(eval $(kernel-module))
$(eval $(generic-package))
