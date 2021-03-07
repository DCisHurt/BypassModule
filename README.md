# MatrixColorSensor
Firmware for MatrixColorSensor.

# Requirement
GNU-make
STM32CubeMX
STM32CubeMX-IDE
STM32CubeMX-Programmer
arm-none-eabi-gcc

## Getting Started

### Step 1: Vscode Setting

##### c_cpp_properties.json
```json
{
    "configurations": [
        {
            "name": "STM32",
            "includePath": [
                "${workspaceFolder}/**",
                "${workspaceFolder}/Core/Inc",
                "${workspaceFolder}/Drivers/STM32G0xx_HAL_Driver/Inc" ,
                "${workspaceFolder}/Drivers/STM32G0xx_HAL_Driver/Inc/Legacy",
                "${workspaceFolder}/Drivers/CMSIS/Device/ST/STM32G0xx/Include",
                "${workspaceFolder}/Drivers/CMSIS/Include",
                "${workspaceFolder}/Drivers/SENSOR"
            ],
            "defines": [
                "_DEBUG",
                "UNICODE",
                "_UNICODE",
                "USE_HAL_DRIVER",
                "STM32G031xx"
            ],
            "compilerPath": "C:/Program Files (x86)/GCC/gcc-arm/bin/arm-none-eabi-gcc.exe", //your arm-gcc path
            "cStandard": "c11",
            "cppStandard": "c++17",
            "intelliSenseMode": "gcc-x64"
        }
    ],
    "version": 4
}
```

##### launch.json
```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "(gdb) Launch",
            "type": "cppdbg",
            "request": "launch",
            "program": "${workspaceFolder}/build/STM32-ColorSensor.elf",
            "args": [],
            "stopAtEntry": false,
            "cwd": "${workspaceFolder}",
            "environment": [],
            "externalConsole": true,
            "MIMode": "gdb",
            "miDebuggerPath": "C:/Program Files (x86)/GCC/gcc-arm/bin/arm-none-eabi-gdb.exe", //your arm-gdb path
            "miDebuggerServerAddress": "localhost:61234",
            "setupCommands": [
                {
                    "description": "Enable pretty-printing for gdb",
                    "text": "-enable-pretty-printing",
                    "ignoreFailures": true
                }
            ]
        }
    ]
}
```

### Step 2: Build & Upload

```shell
make -j8

STM32_Programmer_CLI -c port=SWD freq=4000 -w build/STM32-ColorSensor.hex
```

### Step 3: Debug

```shell
ST-LINK_gdbserver.exe -cp "C:\Program Files\STMicroelectronics\STM32Cube\STM32CubeProgrammer\bin" --swd -el "build\STM32-ColorSensor.elf"
```