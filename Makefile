MCU=stm8
DEVICE=stm8l051f3
FLASHER=stlinkv2
CFLAGS=-I libs -DSTM8l051 -c
CC=sdcc
LIB=stm8l_gpio.rel stm8l_clk.rel stm8l_tim4.rel stm8l_usart.rel
OBJ=main.rel
TARGET=tm_stm8_wd

.PHONY: all clean

%.rel:  %.c | build
	$(CC) -m$(MCU)  $(CFLAGS) $(LDFLAGS) $< -o build/$@

%.rel:  libs/%.c | build
	$(CC) -m$(MCU)  $(CFLAGS) $(LDFLAGS) $< -o build/$@

all:  $(OBJ) $(LIB)
	$(CC) -m$(MCU) -o build/$(TARGET).ihx $(addprefix build/, $(OBJ)) $(addprefix build/, $(LIB)) 

download:
	stm8flash -c $(FLASHER) -p $(DEVICE) -w build/$(TARGET).ihx
clean:
	@rm -rvf build

build:
	mkdir $@
