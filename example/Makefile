CC := "arm-linux-androideabi-gcc"

TARGET  = app.o
CFLAGS  = -Wall -I. -Wno-initializer-overrides
OBJ     = main.o
HEADERS =

INSTALL_DEST = /usr/local/bin

.PHONY: default all clean install uninstall

default: all
all: $(TARGET) $(OBJ)

install: $(TARGET)
	adb push ./$(TARGET) /sdcard/$(TARGET)
	adb shell su -c mv /sdcard/$(TARGET) /data/local/$(TARGET)
	adb shell su -c chmod +x /data/local/$(TARGET)

run: $(TARGET)
	adb push ./$(TARGET) /sdcard/$(TARGET)
	adb shell su -c mv /sdcard/$(TARGET) /data/local/$(TARGET)
	adb shell su -c chmod +x /data/local/$(TARGET)
	adb shell su -c /data/local/$(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(OBJ) $(CFLAGS) -o $@
	disable-pie $@

debug: $(OBJ)
	$(CC) $(OBJ) $(CFLAGS) -g -o $(TARGET)-debug

%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	$(RM) *.o
	$(RM) $(TARGET)-debug
	$(RM) -r $(TARGET)-debug.dSYM
	$(RM) $(TARGET)
