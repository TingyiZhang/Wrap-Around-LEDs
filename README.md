# Wrap-Around-LEDs
Simple implementation of finite state machine in Verilog.  
- Hardware: Basys3 FPGA board   
- Software: Vivado  

## Inputs
- Reset
- Switch0
- Switch1
- Pause
- Max

## Outputs
- 4 1-bit LED outputs

## Functions
- When Reset is pressed, the state machine move to initial state. In my design, initial state is that all LEDs light up.
- When Switch 1 is on, the LED switch when the counter is reach the maximum value. The direction is initial state -> L0 -> L1 -> L2 -> L3 -> initial state...
- When Switch 0 is on, the direction reverse.
- At any state, when pause is pressed, the state should remain the same.

## Components
### 8-bit Counter
- When the postive edge of the clock signal arrives, counter = counter + 1. When counter == Max, it wraps around to 0.

### Clock Divider
- It receive 100MHz clock signal as input, and generate 1Hz clock signal as output.  
- In this project, we use Basys3 FPGA board, it includes a single 100MHz oscillator.

### Top module
- State machine programming

## Test waveform
