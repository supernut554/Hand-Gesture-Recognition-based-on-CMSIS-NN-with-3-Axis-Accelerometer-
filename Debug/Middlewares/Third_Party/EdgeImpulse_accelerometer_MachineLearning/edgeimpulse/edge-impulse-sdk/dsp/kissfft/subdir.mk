################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../Middlewares/Third_Party/EdgeImpulse_accelerometer_MachineLearning/edgeimpulse/edge-impulse-sdk/dsp/kissfft/kiss_fft.cpp \
../Middlewares/Third_Party/EdgeImpulse_accelerometer_MachineLearning/edgeimpulse/edge-impulse-sdk/dsp/kissfft/kiss_fftr.cpp 

OBJS += \
./Middlewares/Third_Party/EdgeImpulse_accelerometer_MachineLearning/edgeimpulse/edge-impulse-sdk/dsp/kissfft/kiss_fft.o \
./Middlewares/Third_Party/EdgeImpulse_accelerometer_MachineLearning/edgeimpulse/edge-impulse-sdk/dsp/kissfft/kiss_fftr.o 

CPP_DEPS += \
./Middlewares/Third_Party/EdgeImpulse_accelerometer_MachineLearning/edgeimpulse/edge-impulse-sdk/dsp/kissfft/kiss_fft.d \
./Middlewares/Third_Party/EdgeImpulse_accelerometer_MachineLearning/edgeimpulse/edge-impulse-sdk/dsp/kissfft/kiss_fftr.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/Third_Party/EdgeImpulse_accelerometer_MachineLearning/edgeimpulse/edge-impulse-sdk/dsp/kissfft/kiss_fft.o: ../Middlewares/Third_Party/EdgeImpulse_accelerometer_MachineLearning/edgeimpulse/edge-impulse-sdk/dsp/kissfft/kiss_fft.cpp Middlewares/Third_Party/EdgeImpulse_accelerometer_MachineLearning/edgeimpulse/edge-impulse-sdk/dsp/kissfft/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m4 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/EdgeImpulse_accelerometer_MachineLearning/edgeimpulse/ -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -MMD -MP -MF"Middlewares/Third_Party/EdgeImpulse_accelerometer_MachineLearning/edgeimpulse/edge-impulse-sdk/dsp/kissfft/kiss_fft.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Middlewares/Third_Party/EdgeImpulse_accelerometer_MachineLearning/edgeimpulse/edge-impulse-sdk/dsp/kissfft/kiss_fftr.o: ../Middlewares/Third_Party/EdgeImpulse_accelerometer_MachineLearning/edgeimpulse/edge-impulse-sdk/dsp/kissfft/kiss_fftr.cpp Middlewares/Third_Party/EdgeImpulse_accelerometer_MachineLearning/edgeimpulse/edge-impulse-sdk/dsp/kissfft/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m4 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/EdgeImpulse_accelerometer_MachineLearning/edgeimpulse/ -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -MMD -MP -MF"Middlewares/Third_Party/EdgeImpulse_accelerometer_MachineLearning/edgeimpulse/edge-impulse-sdk/dsp/kissfft/kiss_fftr.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

