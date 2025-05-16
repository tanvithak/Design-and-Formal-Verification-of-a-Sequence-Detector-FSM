module seq_tb;
 logic clk=1'b0;
 logic rst=1'b1;
 logic in;
 logic out;

 seq_detect dut(clk,rst,in,out);

 always forever #5 clk = ~clk;

 initial
  begin
   @(negedge clk);
   @(negedge clk);
   @(negedge clk) rst = 1'b0;
   @(negedge clk) rst = 1'b1;
   @(negedge clk) in = 1'b0;
   @(negedge clk) in = 1'b0;
   @(negedge clk) in = 1'b0;
   @(negedge clk) in = 1'b0;
   @(negedge clk) in = 1'b0;
   @(negedge clk) in = 1'b0;
   @(negedge clk) in = 1'b0;
   @(negedge clk) in = 1'b0;

   @(negedge clk) in = 1'b0;
   @(negedge clk) in = 1'b0;
   @(negedge clk) in = 1'b1;
   @(negedge clk) in = 1'b1;
   @(negedge clk) in = 1'b1;
   @(negedge clk) in = 1'b1;
   @(negedge clk) in = 1'b1;
   @(negedge clk) in = 1'b1;

   @(negedge clk) in = 1'b0;
   @(negedge clk) in = 1'b0;
   @(negedge clk) in = 1'b1;
   @(negedge clk) in = 1'b1;
   @(negedge clk) in = 1'b0;
   @(negedge clk) in = 1'b0;
   @(negedge clk) in = 1'b0;
   @(negedge clk) in = 1'b0;
//next
   @(negedge clk) in = 1'b1;
   @(negedge clk) in = 1'b1;
   @(negedge clk) in = 1'b0;
   @(negedge clk) in = 1'b0;
   @(negedge clk) in = 1'b1;
   @(negedge clk) in = 1'b1;
   @(negedge clk) in = 1'b1;
   @(negedge clk) in = 1'b1;
   @(negedge clk) in = 1'b0;
   @(negedge clk) in = 1'b0;
   @(negedge clk) in = 1'b0;
   @(negedge clk) in = 1'b1;
   @(negedge clk) rst = 1'b0;
   @(negedge clk) rst = 1'b1;
//next
   @(negedge clk) in = 1'b0;
   @(negedge clk) in = 1'b0;
   @(negedge clk) in = 1'b1;
   @(negedge clk) in = 1'b1;
   @(negedge clk) in = 1'b1;
   @(negedge clk) in = 1'b1;
   @(negedge clk) in = 1'b1;
   @(negedge clk) in = 1'b1;
   @(negedge clk) in = 1'b1;
   @(negedge clk) in = 1'b1;
   @(negedge clk) in = 1'b1;
   @(negedge clk) in = 1'b1;

   @(negedge clk) in = 1'b0;
   @(negedge clk) in = 1'b0;
   @(negedge clk) in = 1'b1;
   @(negedge clk) in = 1'b1;
   @(negedge clk) in = 1'b0;
   @(negedge clk) in = 1'b0;
   @(negedge clk) in = 1'b0;
   @(negedge clk) in = 1'b0;

   #2000;
   $finish();
  end
endmodule
