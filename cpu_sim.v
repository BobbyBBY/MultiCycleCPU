//  https://blog.csdn.net/linwh8/article/details/71728160
module cpu_sim;

    // Inputs
    reg CLK;
    reg RST;
    reg [31:0] outside_pc;

    // Outputs
    wire [31:0] ins, now_pc;

    // Instantiate the Unit Under Test (UUT)
    Main uut (
        .CLK(CLK), 
        .RST(RST), 
        .outside_pc(outside_pc), 
        .ins(ins),
        .now_pc(now_pc)
    );

    initial begin
        // Initialize Inputs
      CLK = 0;
      RST = 1;
      outside_pc = 0; // 这里设置外部pc
      #50; // 刚开始设置pc为0
          CLK = !CLK;
      #50;
          RST = 0;
      forever #50 begin // 产生时钟信号
          CLK = !CLK;
      end
    end
endmodule
