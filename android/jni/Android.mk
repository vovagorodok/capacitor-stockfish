LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE := scan
LOCAL_C_INCLUDES := $(LOCAL_PATH)/../../scan/src/ $(LOCAL_PATH)/../../lib/
LOCAL_SRC_FILES := \
	scan-jni.cpp \
	filestream.cpp \
	../../scan/src/bb_base.cpp \
	../../scan/src/bb_comp.cpp \
	../../scan/src/bb_index.cpp \
	../../scan/src/bit.cpp \
	../../scan/src/book.cpp \
	../../scan/src/common.cpp \
	../../scan/src/eval.cpp \
	../../scan/src/fen.cpp \
	../../scan/src/game.cpp \
	../../scan/src/gen.cpp \
	../../scan/src/hash.cpp \
	../../scan/src/hub.cpp \
	../../scan/src/libmy.cpp \
	../../scan/src/list.cpp \
	../../scan/src/main.cpp \
	../../scan/src/move.cpp \
	../../scan/src/pos.cpp \
	../../scan/src/score.cpp \
	../../scan/src/search.cpp \
	../../scan/src/sort.cpp \
	../../scan/src/thread.cpp \
	../../scan/src/tt.cpp \
	../../scan/src/util.cpp \
	../../scan/src/var.cpp
LOCAL_LDLIBS := -llog -landroid
LOCAL_ARM_NEON := true

include $(BUILD_SHARED_LIBRARY)
