################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/Third_Party/EdgeImpulse_accelerometer_MachineLearning/edgeimpulse/edge-impulse-sdk/tensorflow/lite/c/common.c 

C_DEPS += \
./Middlewares/Third_Party/EdgeImpulse_accelerometer_MachineLearning/edgeimpulse/edge-impulse-sdk/tensorflow/lite/c/common.d 

OBJS += \
./Middlewares/Third_Party/EdgeImpulse_accelerometer_MachineLearning/edgeimpulse/edge-impulse-sdk/tensorflow/lite/c/common.o 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/Third_Party/EdgeImpulse_accelerometer_MachineLearning/edgeimpulse/edge-impulse-sdk/tensorflow/lite/c/common.o: ../Middlewares/Third_Party/EdgeImpulse_accelerometer_MachineLearning/edgeimpulse/edge-impulse-sdk/tensorflow/lite/c/common.c Middlewares/Third_Party/EdgeImpulse_accelerometer_MachineLearning/edgeimpulse/edge-impulse-sdk/tensorflow/lite/c/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/EdgeImpulse_accelerometer_MachineLearning/edgeimpulse/ -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Middlewares/Third_Party/EdgeImpulse_accelerometer_MachineLearning/edgeimpulse/edge-impulse-sdk/tensorflow/lite/c/common.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

