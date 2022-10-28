################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include Drivers/STM32F4xx_HAL_Driver/subdir.mk
-include Drivers/CMSIS/subdir.mk
-include Application/User/Startup/subdir.mk
-include Application/User/Core/subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

OPTIONAL_TOOL_DEPS := \
$(wildcard ../makefile.defs) \
$(wildcard ../makefile.init) \
$(wildcard ../makefile.targets) \


BUILD_ARTIFACT_NAME := Lesson_ESE_Work1_TIM
BUILD_ARTIFACT_EXTENSION := elf
BUILD_ARTIFACT_PREFIX :=
BUILD_ARTIFACT := $(BUILD_ARTIFACT_PREFIX)$(BUILD_ARTIFACT_NAME)$(if $(BUILD_ARTIFACT_EXTENSION),.$(BUILD_ARTIFACT_EXTENSION),)

# Add inputs and outputs from these tool invocations to the build variables 
EXECUTABLES += \
Lesson_ESE_Work1_TIM.elf \

MAP_FILES += \
Lesson_ESE_Work1_TIM.map \

SIZE_OUTPUT += \
default.size.stdout \

OBJDUMP_LIST += \
Lesson_ESE_Work1_TIM.list \

OBJCOPY_HEX += \
Lesson_ESE_Work1_TIM.hex \

OBJCOPY_BIN += \
Lesson_ESE_Work1_TIM.bin \

OBJCOPY_VERILOG += \
Lesson_ESE_Work1_TIM.verilog \

OBJCOPY_SREC += \
Lesson_ESE_Work1_TIM.srec \

OBJCOPY_SYMBOLSREC += \
Lesson_ESE_Work1_TIM.symbolsrec \


# All Target
all: main-build

# Main-build Target
main-build: Lesson_ESE_Work1_TIM.elf secondary-outputs

# Tool invocations
Lesson_ESE_Work1_TIM.elf Lesson_ESE_Work1_TIM.map: $(OBJS) $(USER_OBJS) E:\OneDrive\Personal\OneDrive\WorkPlaces\Lesson_ESE_Work1_TIM\STM32CubeIDE\STM32F429IGTX_FLASH.ld makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-gcc -o "Lesson_ESE_Work1_TIM.elf" @"objects.list" $(USER_OBJS) $(LIBS) -mcpu=cortex-m4 -T"E:\OneDrive\Personal\OneDrive\WorkPlaces\Lesson_ESE_Work1_TIM\STM32CubeIDE\STM32F429IGTX_FLASH.ld" --specs=nosys.specs -Wl,-Map="Lesson_ESE_Work1_TIM.map" -Wl,--gc-sections -static --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -Wl,--start-group -lc -lm -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

default.size.stdout: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-size  $(EXECUTABLES)
	@echo 'Finished building: $@'
	@echo ' '

Lesson_ESE_Work1_TIM.list: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objdump -h -S $(EXECUTABLES) > "Lesson_ESE_Work1_TIM.list"
	@echo 'Finished building: $@'
	@echo ' '

Lesson_ESE_Work1_TIM.hex: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objcopy  -O ihex $(EXECUTABLES) "Lesson_ESE_Work1_TIM.hex"
	@echo 'Finished building: $@'
	@echo ' '

Lesson_ESE_Work1_TIM.bin: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objcopy  -O binary $(EXECUTABLES) "Lesson_ESE_Work1_TIM.bin"
	@echo 'Finished building: $@'
	@echo ' '

Lesson_ESE_Work1_TIM.verilog: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objcopy  -O verilog $(EXECUTABLES) "Lesson_ESE_Work1_TIM.verilog"
	@echo 'Finished building: $@'
	@echo ' '

Lesson_ESE_Work1_TIM.srec: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objcopy  -O srec $(EXECUTABLES) "Lesson_ESE_Work1_TIM.srec"
	@echo 'Finished building: $@'
	@echo ' '

Lesson_ESE_Work1_TIM.symbolsrec: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objcopy  -O symbolsrec $(EXECUTABLES) "Lesson_ESE_Work1_TIM.symbolsrec"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) Lesson_ESE_Work1_TIM.bin Lesson_ESE_Work1_TIM.elf Lesson_ESE_Work1_TIM.hex Lesson_ESE_Work1_TIM.list Lesson_ESE_Work1_TIM.map Lesson_ESE_Work1_TIM.srec Lesson_ESE_Work1_TIM.symbolsrec Lesson_ESE_Work1_TIM.verilog default.size.stdout
	-@echo ' '

secondary-outputs: $(SIZE_OUTPUT) $(OBJDUMP_LIST) $(OBJCOPY_HEX) $(OBJCOPY_BIN) $(OBJCOPY_VERILOG) $(OBJCOPY_SREC) $(OBJCOPY_SYMBOLSREC)

fail-specified-linker-script-missing:
	@echo 'Error: Cannot find the specified linker script. Check the linker settings in the build configuration.'
	@exit 2

warn-no-linker-script-specified:
	@echo 'Warning: No linker script specified. Check the linker settings in the build configuration.'

.PHONY: all clean dependents main-build fail-specified-linker-script-missing warn-no-linker-script-specified

-include ../makefile.targets
