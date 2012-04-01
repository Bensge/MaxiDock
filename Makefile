export GO_EASY_ON_ME=1
export THEOS_DEVICE_IP=127.0.0.1
export THEOS_DEVICE_PORT=2222
include theos/makefiles/common.mk

TWEAK_NAME = maxidock
maxidock_FILES = Tweak.xm
maxidock_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk
