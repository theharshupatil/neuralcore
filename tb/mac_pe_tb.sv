`timescale 1ns/1ps

module mac_pe_tb;
    logic clk = 0;
    logic rst_n = 0;
    logic en = 0;
    logic signed [7:0] a = 0;
    logic signed [7:0] w = 0;
    logic signed [31:0] acc;

    mac_pe dut(.clk(clk), .rst_n(rst_n), .en(en), .a(a), .w(w), .acc(acc));
    always #5 clk = ~clk;

    task automatic tick;
        @(posedge clk); #1;
    endtask

    initial begin
        tick();
        if (acc !== 0) $fatal(1, "reset failed: acc=%0d", acc);
        rst_n = 1;
        en = 1; a = 3; w = 4; tick();
        if (acc !== 12) $fatal(1, "3*4 expected 12, got %0d", acc);
        a = -2; w = 5; tick();
        if (acc !== 2) $fatal(1, "12 + (-2*5) expected 2, got %0d", acc);
        en = 0; a = 100; w = 100; tick();
        if (acc !== 2) $fatal(1, "disabled PE changed accumulator");
        $display("PASS: mac_pe smoke tests");
        $finish;
    end
endmodule
