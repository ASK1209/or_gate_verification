// Code your testbench here
// or browse Examples
//module and_gate_tb;
    //logic a, b, y;

    // Instantiate the Unit Under Test (UUT)
    //and_gate dut (.a(a), .b(b), .y(y));

    // Functional Coverage Group
    /*covergroup cg;
        option.per_instance = 1;
        cp_a: coverpoint a;
        cp_b: coverpoint b;
        cross_ab: cross cp_a, cp_b; // Ensures all 4 combinations (00, 01, 10, 11) are tested
    endgroup*/

    /*initial begin
        cg cov_inst = new();
        $display("Time\t A \t B \t Y");
        $monitor("%0t\t %b \t %b \t %b", $time, a, b, y);

        // Apply all 4 input combinations
        a = 0; b = 0; #10; cov_inst.sample();
        a = 0; b = 1; #10; cov_inst.sample();
        a = 1; b = 0; #10; cov_inst.sample();
        a = 1; b = 1; #10; cov_inst.sample();

        $display("Final Coverage: %.2f%%", cov_inst.get_inst_coverage());
        $finish;
    end
endmodule*/
// 1. Define a transaction class for randomization
class or_transaction;
    rand bit a;
    rand bit b;
    
    // Optional: Add constraints if needed
    // constraint only_ones { a == 1; } 
endclass

module or_gate_tb;
    logic a, b, y;
    or_transaction trans; // Class handle

    // Instantiate DUT
    or_gate dut (.a(a), .b(b), .y(y));

    // Coverage group to track if all combinations are hit
    covergroup cg;
        option.per_instance = 1;
        cp_a: coverpoint a;
        cp_b: coverpoint b;
        cross_ab: cross cp_a, cp_b;
    endgroup

    initial begin
        cg cov_inst = new();
        trans = new(); // Initialize the class object
        
        $display("Time\t A \t B \t Y");
        
        // 2. Run 20 random test cases
        repeat(20) begin
            if (!trans.randomize()) begin
                $error("Randomization failed!");
            end
            
            // Drive the randomized values to the DUT ports
            a = trans.a;
            b = trans.b;
            
            #10;// Wait for logic to settle
          assert (y === (a | b)) 
            else $error("Assertion Failed! A=%b, B=%b, Expected=%b, Got=%b", a, b, (a|b), y);  
          cov_inst.sample();
            $display("%0t\t %b \t %b \t %b", $time, a, b, y);
        end

        $display("Final Functional Coverage: %.2f%%", cov_inst.get_inst_coverage());
      $dumpfile("dump.vcd"); 
      $dumpvars(0, or_gate_tb);
        $finish;
    end
endmodule
