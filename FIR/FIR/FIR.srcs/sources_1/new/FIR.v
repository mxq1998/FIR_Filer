`timescale 1ms / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/28 09:07:31
// Design Name: 
// Module Name: FIR
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FIR(
    input [7:0] FIR_IN,
    input CLK,
    input RSTn,
    output reg[15:0] FIR_OUT
    );
    reg[7:0] delay_pipeline1;
    reg[7:0] delay_pipeline2;
    reg[7:0] delay_pipeline3;
    reg[7:0] delay_pipeline4;
    reg[7:0] delay_pipeline5;
    reg[7:0] delay_pipeline6;
    reg[7:0] delay_pipeline7;
    reg[7:0] delay_pipeline8;
    reg[7:0] delay_pipeline9;
    
    always@(posedge CLK or negedge RSTn)
        if(!RSTn)
            begin
                delay_pipeline1 <= 8'b0;
                delay_pipeline2 <= 8'b0;
                delay_pipeline3 <= 8'b0;
                delay_pipeline4 <= 8'b0;
                delay_pipeline5 <= 8'b0;
                delay_pipeline6 <= 8'b0;
                delay_pipeline7 <= 8'b0;
                delay_pipeline8 <= 8'b0;
                delay_pipeline9 <= 8'b0;
            end
        else
            begin
                delay_pipeline1 <= FIR_IN;
                delay_pipeline2 <= delay_pipeline1;
                delay_pipeline3 <= delay_pipeline2;
                delay_pipeline4 <= delay_pipeline3;
                delay_pipeline5 <= delay_pipeline4;
                delay_pipeline6 <= delay_pipeline5;
                delay_pipeline7 <= delay_pipeline6;
                delay_pipeline8 <= delay_pipeline7;
                delay_pipeline9 <= delay_pipeline8;
            end
    //滤波器系数
    wire [7:0] coeff1 = 8'd7;
    wire [7:0] coeff2 = 8'd5;
    wire [7:0] coeff3 = 8'd51;
    wire [7:0] coeff4 = 8'd135;
    wire [7:0] coeff5 = 8'd179;
    wire [7:0] coeff6 = 8'd135;
    wire [7:0] coeff7 = 8'd51;
    wire [7:0] coeff8 = 8'd5;
    wire [7:0] coeff9 = 8'd7;
    //乘积结果保存寄存器
    reg signed [16:0] multi_data1;
    reg signed [16:0] multi_data2;
    reg signed [16:0] multi_data3;
    reg signed [16:0] multi_data4;
    reg signed [16:0] multi_data5;
    reg signed [16:0] multi_data6;
    reg signed [16:0] multi_data7;
    reg signed [16:0] multi_data8;
    reg signed [16:0] multi_data9;
    //x(n)*h(n-k)
    always@(posedge CLK or negedge RSTn)
        if(!RSTn)
            begin
                multi_data1 <= 17'b0;
            end
        else
            begin
                multi_data1 <= delay_pipeline1*coeff1;
            end
    //x(1)*h(1)
    always@(posedge CLK or negedge RSTn)
        if(!RSTn)
            multi_data2 <= 16'b0;
        else
            multi_data2 <= delay_pipeline2*coeff2;
    //x(2)*h(2)
    always@(posedge CLK or negedge RSTn)
        if(!RSTn)
            multi_data3 <= 16'b0;
        else
            multi_data3 <= delay_pipeline3*coeff3;
    //x(3)*h(3)
    always@(posedge CLK or negedge RSTn)
        if(!RSTn)
            multi_data4 <= 16'b0;
        else
            multi_data4 <= delay_pipeline4*coeff4;
    //x(4)*h(4)
    always@(posedge CLK or negedge RSTn)
        if(!RSTn)
            multi_data5 <= 16'b0;
        else
            multi_data5 <= delay_pipeline5*coeff5;
    //x(5)*h(5)
    always@(posedge CLK or negedge RSTn)
        if(!RSTn)
            multi_data6 <= 16'b0;
        else
            multi_data6 <= delay_pipeline6*coeff6;
    //x(6)*h(6)
    always@(posedge CLK or negedge RSTn)
        if(!RSTn)
            multi_data7 <= 16'b0;
        else
            multi_data7 <= delay_pipeline7*coeff7;
    //x(7)*h(7)
    always@(posedge CLK or negedge RSTn)
        if(!RSTn)
            multi_data8 <= 16'b0;
        else
            multi_data8 <= delay_pipeline8*coeff8;
    //x(8)*h(8)
    always@(posedge CLK or negedge RSTn)
        if(!RSTn)
            multi_data9 <= 16'b0;
        else
            multi_data9 <= delay_pipeline9*coeff9; 
    //将乘积累加，累加的结果为滤波后的信号
    always@(posedge CLK or negedge RSTn)
        if(!RSTn)
            FIR_OUT<=16'b0;
        else
            FIR_OUT<=multi_data1 + multi_data2 + multi_data3 + multi_data4 + multi_data5 + multi_data6 + multi_data7 + multi_data8 + multi_data9;
endmodule
