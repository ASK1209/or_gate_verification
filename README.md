# OR Gate Verification Project
A SystemVerilog verification environment for a basic 2-input OR gate, implemented and simulated on **EDA Playground** using **Aldec Riviera Pro**.

## 🚀 Quick Run
You can view and run this project directly in your browser here:
https://www.edaplayground.com/x/Yyvb

## 🛠️ Verification Features
- **Randomized Stimulus**: Uses a SystemVerilog class with `rand` variables to generate 20 random test cases.
- **Functional Coverage**: Includes a `covergroup` to ensure all 4 input combinations (00, 01, 10, 11) are tested.
- **Assertions (SVA)**: Immediate assertions verify that the output `y` matches the expected logic `a | b`.
- **Waveform Analysis**: Configured for **EPWave** to visualize signal transitions.

## 📁 Project Structure
- `rtl.sv`: The RTL code for the OR gate.
- `tb.sv`: The SystemVerilog testbench containing the randomization and coverage logic.
- `run.do`: TCL script for Aldec Riviera Pro to enable coverage and generate reports.

## 📊 How to View Coverage
The simulation generates a text-based coverage report in the console. 
1. Run the simulation.
2. Scroll to the bottom of the log to see the **Functional Coverage** percentage.
3. Check `cov_report.txt` in the results pane for detailed analysis.

## 🐞 Deliberate Bug Testing
To the design  a deliberate bug can be added (AND logic instead of OR) to demonstrate the power of **SystemVerilog Assertions**. You will see assertion failures in the log indicating mismatches.
