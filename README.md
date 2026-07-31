# Smart Environmental Hazard Detection & Alert System

## Introduction

This project is an FPGA-based environmental monitoring system developed using the DE0-Nano FPGA board. It monitors flame, gas leakage, and temperature using different sensors. Based on the sensor inputs, the FPGA controls LEDs and a buzzer to indicate hazardous conditions. 

## Objectives
- Detect flame using a flame sensor.
- Detect gas leakage using an MQ-135 sensor.
- Monitor temperature using an LM35 sensor.
- Provide visual and audible alerts when a hazard is detected.

## Hardware Used
- DE0-Nano FPGA Board
- Flame Sensor
- MQ-135 Gas Sensor
- LM35 Temperature Sensor
- ADC128S022
- LEDs
- Active Buzzer
- Breadboard and Jumper Wires
- USB Blaster

## Software Used
- Verilog HDL
- Intel Quartus Prime Lite

## Working
The flame, gas, and temperature sensors continuously monitor the environment. Their outputs are given to the FPGA. The FPGA checks the sensor values and turns on the corresponding LEDs when a hazard is detected. If all hazard conditions occur together, the buzzer is activated to alert the user.


## Applications
- Fire detection systems
- Gas leakage monitoring
- Industrial safety
- Environmental monitoring
- Smart buildings

## Future Scope
- IoT-based monitoring
- Mobile application support
- Cloud data logging
- Additional environmental sensors

