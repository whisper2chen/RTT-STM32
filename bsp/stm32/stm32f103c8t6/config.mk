RTT_ROOT ?= ../../..
BSP_ROOT ?= .

CROSS_COMPILE ?=arm-none-eabi-

CFLAGS := -mcpu=cortex-m3 -mthumb -ffunction-sections -fdata-sections -Dgcc -O0 -gdwarf-2 -g
AFLAGS := -c -mcpu=cortex-m3 -mthumb -ffunction-sections -fdata-sections -x assembler-with-cpp -Wa,-mimplicit-it=thumb  -gdwarf-2
LFLAGS := -mcpu=cortex-m3 -mthumb -ffunction-sections -fdata-sections -Wl,--gc-sections,-Map=rt-thread.map,-cref,-u,Reset_Handler -T board/linker_scripts/link.lds
CXXFLAGS := -mcpu=cortex-m3 -mthumb -ffunction-sections -fdata-sections -Dgcc -O0 -gdwarf-2 -g

CPPPATHS :=-I$(RTT_ROOT)/bsp/stm32/libraries/HAL_Drivers \
	-I$(RTT_ROOT)/bsp/stm32/libraries/HAL_Drivers/config \
	-I$(RTT_ROOT)/bsp/stm32/libraries/STM32F1xx_HAL/CMSIS/Device/ST/STM32F1xx/Include \
	-I$(RTT_ROOT)/bsp/stm32/libraries/STM32F1xx_HAL/CMSIS/Include \
	-I$(RTT_ROOT)/bsp/stm32/libraries/STM32F1xx_HAL/STM32F1xx_HAL_Driver/Inc \
	-I$(BSP_ROOT) \
	-I$(BSP_ROOT)/applications \
	-I$(BSP_ROOT)/board \
	-I$(BSP_ROOT)/board/CubeMX_Config/Inc \
	-I$(RTT_ROOT)/components/drivers/include \
	-I$(RTT_ROOT)/components/finsh \
	-I$(RTT_ROOT)/components/libc/compilers/minilibc \
	-I$(RTT_ROOT)/include \
	-I$(RTT_ROOT)/libcpu/arm/common \
	-I$(RTT_ROOT)/libcpu/arm/cortex-m3 

DEFINES := -DHAVE_CCONFIG_H -DRT_USING_MINILIBC -DSTM32F103xB -DUSE_HAL_DRIVER
