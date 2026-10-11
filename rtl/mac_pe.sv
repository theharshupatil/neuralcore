`timescale 1ns/1ps

module mac_pe (
    input  logic               clk,
    input  logic               rst_n,
    input  logic               en,
    input  logic signed [7:0]  a,
    input  logic signed [7:0]  w,
    output logic signed [31:0]  acc
);
    logic signed [15:0] product;

    always_comb product = a * w;

    always_ff @(posedge clk) begin
        if (!rst_n)
            acc <= 32'sd0;
        else if (en)
            acc <= acc + {{16{product[15]}}, product};
    end
endmodule
