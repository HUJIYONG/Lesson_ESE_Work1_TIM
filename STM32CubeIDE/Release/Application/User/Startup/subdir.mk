################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../Application/User/Startup/startup_stm32f429igtx.s 

S_DEPS += \
./Application/User/Startup/startup_stm32f429igtx.d 

OBJS += \
./Application/User/Startup/startup_stm32f429igtx.o 


# Each subdirectory must supply rules for building sources it contributes
Application/User/Startup/%.o: ../Application/User/Startup/%.s Application/User/Startup/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-Application-2f-User-2f-Startup

clean-Application-2f-User-2f-Startup:
	-$(RM) ./Application/User/Startup/startup_stm32f429igtx.d ./Application/User/Startup/startup_stm32f429igtx.o

.PHONY: clean-Application-2f-User-2f-Startup

