# Effect Pedal Bypass Module
This is the firmware for the effect pedal bypass module.<br>
The whole project was done using official ST tools.

# Requirement
GNU-make<br>
STM32CubeMX<br>
STM32CubeMX-IDE<br>
STM32CubeMX-Programmer<br>
arm-none-eabi-gcc<br>
vscode extension 'Cortex-Debug'<br>

## Getting Started
* [Schematic](Schematic/Bypass_Module.pdf)</br>

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
                "${workspaceFolder}/Drivers/CMSIS/Include"
            ],
            "defines": [
                "_DEBUG",
                "UNICODE",
                "_UNICODE",
                "USE_HAL_DRIVER",
                "STM32G031xx"
            ],
            "compilerPath": "C:/Program Files (x86)/GCC/gcc-arm/bin/arm-none-eabi-gcc.exe",
            "cStandard": "c11",
            "cppStandard": "c++17",
            "intelliSenseMode": "gcc-arm"
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
            "type": "cortex-debug",
            "request": "launch",
            "name": "Debug (ST-Link)",
            "runToMain": true,
            "servertype": "stlink",
            "cwd": "${workspaceRoot}",
            "preLaunchTask": "${defaultBuildTask}",
            "postDebugTask": "reset",
            "executable": "${workspaceFolder}/build/${workspaceFolderBasename}.elf"
        }
    ]
}
```
##### tasks.json
```json
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "make",
            "type": "shell",
            "command": "make",
            "args": [
                "-j8"
            ],
            "isBackground": true,
            "group": "build"
        },
        {
            "label": "upload",
            "type": "shell",
            "command": "C:/Program Files/STMicroelectronics/STM32Cube/STM32CubeProgrammer/bin/STM32_Programmer_CLI.exe",
            "args": [
                "-c",
                "port=SWD",
                "freq=4000",
                "-w",
                "build/${workspaceFolderBasename}.hex"
            ],
            "group": "build",
            "isBackground": true,
            "dependsOn":["make"]
        },
        {
            "label": "Build & Upload",
            "type": "shell",
            "command": "C:/Program Files/STMicroelectronics/STM32Cube/STM32CubeProgrammer/bin/STM32_Programmer_CLI.exe",
            "args": [
                "-c",
                "port=SWD",
                "-hardRst"
            ],
            "group": {
                "kind": "build",
                "isDefault": true
            },
            "dependsOn": ["upload"]
        },
        {
            "label": "reset",
            "type": "shell",
            "command": "C:/Program Files/STMicroelectronics/STM32Cube/STM32CubeProgrammer/bin/STM32_Programmer_CLI.exe",
            "args": [
                "-c",
                "port=SWD",
                "-hardRst"
            ]
        }
    ]
}
```
### Step 2: config toolchain path

add your toolchain path to vscode user setting.json<br> 

example as below:

##### setting.json
```json
{
    "cortex-debug.armToolchainPath": "C:/Program Files (x86)/GCC/gcc-arm/bin",
    "cortex-debug.stm32cubeprogrammer": "C:/Program Files/STMicroelectronics/STM32Cube/STM32CubeProgrammer/bin",
    "cortex-debug.gdbPath": "C:/Program Files (x86)/GCC/gcc-arm/bin/arm-none-eabi-gdb.exe",
    "cortex-debug.stlinkPath": "C:/Program Files/STMicroelectronics/STM32Cube/STM32CubeIDE/plugins/com.st.stm32cube.ide.mcu.externaltools.stlink-gdb-server.win32_1.6.0.202101291314/tools/bin/ST-LINK_gdbserver.exe"
}
```
### Step 3: Build & Upload

press 'Ctrl+Shift+B' to engage build & upload

### Step 4: Debug

press F5 to start debug mode

# License
MIT