make -j8

STM32_Programmer_CLI -c port=SWD freq=4000 -w build/BypassModule.hex
