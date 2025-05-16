module seq_detect(input logic clk,rst,in,output logic out);
 typedef enum logic [4:0]{so,so_c,s1,s1_c,s2,s2_c,s3,s3_c,s4,s4_c,s5,s5_c,s6,s6_c,s7,s7_c,s8,s8_c,s9,s9_c,s10,s10_c,
s11,s11_c,s12,deadlock,isolation}state;
 typedef enum logic [3:0]{S0,S0_C,S1,S1_C,S2,S2_C,S3,S3_C,isolation1}st;
 typedef enum logic [3:0]{CS0,CS0_C,CS1,CS1_C,CS2,CS2_C,CS3,CS3_C,CS4,CS4_C,CS5,CS5_C,deadlock1}sta;
 sta NS,CS;
 st N,C;
 state cs,ns;
 logic out1,out2;

//sequence:0000 0111 0100
//deadlock sequence:11111
//isolation sequence:1011

 always_ff@(posedge clk or negedge rst)
  begin
   if(out1)
    cs <= deadlock;
   else if(!rst)
    begin
     cs <= so;
      C <= S0;
     CS <= CS0;
    end
   else
    begin
     cs <= ns;
      C <= N;
     CS <= NS;
    end
  end

 always_comb
  begin
   out1 = 1'b0;
   NS = CS;
   unique case(CS)
          CS0 : begin
                 out1 = 1'b0;
                 if(in)
                  NS = CS0_C;
                 else
                  NS = CS0;
                end
        CS0_C :  begin
                 out1 = 1'b0;
                 if(in)
                  NS = CS1;
                 else
                  NS = CS0;
                end
          CS1 :  begin
                 out1 = 1'b0;
                 if(in)
                  NS = CS1_C;
                 else
                  NS = CS0;
                end
        CS1_C : begin
                 out1 = 1'b0;
                 if(in)
                  NS = CS2;
                 else
                  NS = CS0;
                end
          CS2 : begin
                 out1 = 1'b0;
                 if(in)
                  NS = CS2_C;
                 else
                  NS = CS0;
                end
        CS2_C : begin
                 out1 = 1'b0;
                 if(in)
                  NS = CS3;
                 else
                  NS = CS0;
                end
          CS3 : begin
                 out1 = 1'b0;
                 if(in)
                  NS = CS3_C;
                 else
                  NS = CS0;
                end
        CS3_C : begin
                 out1 = 1'b0;
                 if(in)
                  NS = CS4;
                 else
                  NS = CS0;
                end
          CS4 : begin
                 out1 = 1'b0;
                 if(in)
                  NS = CS4_C;
                 else
                  NS = CS0;
                end
        CS4_C : begin
                 out1 = 1'b0;
                 if(in)
                  NS = deadlock1;
                 else
                  NS = CS0;
                end
    deadlock1 : begin
                  NS = deadlock1;
                  out1 = 1'b1;
                end
      default : begin
                  NS = CS;
                  out1 = 1'b0;
                end
   endcase
  end
 //assign out1 = (CS==deadlock1) ? 1'b1 : 1'b0;

 always_comb
  begin
   out2 = 1'b0;
   N = C;
   unique case(C)
           S0 : begin
                 out2 = 1'b0;
                 if(in)
                  N = S0_C;
                 else
                  N = S0;
                end
         S0_C : begin
                 out2 = 1'b0;
                 if(in)
                  N = S1;
                 else
                  N = S0;
                end
           S1 :  begin
                 out2 = 1'b0;
                 if(!in)
                  N = S1_C;
                 else
                  N = S0;
                end
         S1_C : begin
                 out2 = 1'b0;
                 if(!in)
                  N = S2;
                 else
                  N = S0;
                end
           S2 : begin
                 out2 = 1'b0;
                 if(in)
                  N = S2_C;
                 else
                  N = S0;
                end
         S2_C :begin
                 out2 = 1'b0;
                 if(in)
                  N = S3;
                 else
                  N = S0;
                end
           S3 : begin
                 out2 = 1'b0;
                 if(in)
                  N = S3_C;
                 else
                  N = S0;
                end
         S3_C : begin
                 out2 = 1'b0;
                 if(in)
                  N = isolation1;
                 else
                  N = S0;
                end
   isolation1 : begin
                 out2 = 1'b1;
                 if(!rst)
                  N = S0;
                 else
                  N = isolation1;
                end
      default : begin
                 N = C;
                 out2 = 1'b0;
                end
   endcase
  end
  //assign out2 = (C==isolation1) ? 1'b1 : 1'b0;


 always_comb
  begin
   out = 1'b0;
   ns = cs;
   unique case(cs)
           so : begin
                 out = 1'b0;
                 if(out1)
                  ns = deadlock;
                 else if(out2)
                  ns = isolation;
                 else if(!in)
                  ns = so_c;
                 else
                  ns = so;
                end 
         so_c : begin
                 out = 1'b0;
                 if(!in)
                  ns = s1;
                 else
                  ns = so;
                end
           s1 : begin
                 out = 1'b0;
                 if(out1)
                  ns = deadlock;
                 else if(out2)
                  ns = isolation;
                 else if(!in)
                  ns = s1_c;
                 else
                  ns = so;
                end
         s1_c : begin
                 out = 1'b0;
                 if(!in)
                  ns = s2;
                 else
                  ns = s1;
                end
           s2 : begin
                 out = 1'b0;
                 if(out1)
                  ns = deadlock;
                 else if(out2)
                  ns = isolation;
                 else if(!in)
                  ns = s2_c;
                 else
                  ns = so;
                end
         s2_c : begin
                 out = 1'b0;
                 if(!in)
                  ns = s3;
                 else
                  ns = s2;
                end
           s3 : begin
                 out = 1'b0;
                 if(out1)
                  ns = deadlock;
                 else if(out2)
                  ns = isolation;
                 else if(!in)
                  ns = s3_c;
                 else
                  ns = so;
                end
         s3_c : begin
                 out = 1'b0;
                 if(!in)
                  ns = s4;
                 else
                  ns = s3;
                end
           s4 : begin
                 out = 1'b0;
                 if(out1)
                  ns = deadlock;
                 else if(out2)
                  ns = isolation;
                 else if(!in)
                  ns = s4_c;
                 else
                  ns = so;
                end
         s4_c : begin
                 out = 1'b0;
                 if(!in)
                  ns = s5;
                 else
                  ns = s4;
                end 
           s5 : begin
                 out = 1'b0;
                 if(out1)
                  ns = deadlock;
                 else if(out2)
                  ns = isolation;
                 else if(in)
                  ns = s5_c;
                 else
                  ns = s5;
                end
         s5_c : begin
                 out = 1'b0;
                 if(in)
                  ns = s6;
                 else
                  ns = s5;
                end 
           s6 : begin
                 out = 1'b0;
                 if(out1)
                  ns = deadlock;
                 else if(out2)
                  ns = isolation;
                 else if(in)
                  ns = s6_c;
                 else
                  ns = so;
                end
         s6_c : begin
                 out = 1'b0;
                 if(in)
                  ns = s7;
                 else
                  ns = s6;
                end 
           s7 : begin
                 out = 1'b0;
                 if(out1)
                  ns = deadlock;
                 else if(out2)
                  ns = isolation;
                 else if(in)
                  ns = s7_c;
                 else
                  ns = so;
                end
         s7_c : begin
                 out = 1'b0;
                 if(in)
                  ns = s8;
                 else
                  ns = s7;
                end 
           s8 : begin
                 out = 1'b0;
                 if(out1)
                  ns = deadlock;
                 else if(out2)
                  ns = isolation;
                 else if(!in)
                  ns = s8_c;
                 else
                  ns = so;
                end
         s8_c : begin
                 out = 1'b0;
                 if(!in)
                  ns = s9;
                 else
                  ns = s8;
                end 
           s9 : begin
                 out = 1'b0;
                 if(out1)
                  ns = deadlock;
                 else if(out2)
                  ns = isolation;
                 else if(in)
                  ns = s9_c;
                 else
                  ns = s2;
                end
         s9_c : begin
                 out = 1'b0;
                 if(in)
                  ns = s10;
                 else
                  ns = s9;
                end 
          s10 : begin
                 out = 1'b0;
                 if(out1)
                  ns = deadlock;
                 else if(out2)
                  ns = isolation;
                 else if(!in)
                  ns = s10_c;
                 else
                  ns = so;
                end
        s10_c : begin
                 out = 1'b0;
                 if(!in)
                  ns = s11;
                 else
                  ns = s10;
                end 
          s11 : begin
                 out = 1'b0;
                 if(out1)
                  ns = deadlock;
                 else if(out2)
                  ns = isolation;
                 else if(!in)
                  ns = s11_c;
                 else
                  ns = s1;
                end
        s11_c : begin
                 out = 1'b0;
                 if(!in)
                  ns = s12;
                 else
                  ns = s11;
                end 
          s12 : begin
                 out = 1'b1;
                 if(out1)
                  ns = deadlock;
                 else if(out2)
                  ns = isolation;
                 else if(!in)
                  ns = s3;
                 else
                  ns = so;
                end
     deadlock : begin
                 out = 1'b0;
                 ns = deadlock;
                end
    isolation : begin
                 out = 1'b0;
                 if(!rst)
                  ns = so;
                 else
                  ns = isolation;
                end
      default : begin 
                 ns = cs;
                 out = 1'b0;
                end
   endcase
  end
 //assign out = (cs==s12) ? 1'b1 : 1'b0;

`ifdef tanvitha
 assert property(
  @(posedge clk) (cs == s12) |-> (out == 1)); //1

 assert property(
  @(posedge clk) (cs == s3 && in == 1) |-> (ns == so)); //2

 assert property(
  @(posedge clk) (cs == s2_c && in == 0) |-> (ns == s3)); //3

 assert property(
  @(posedge clk) (cs == s6 && in == 1) |-> (ns == s6_c)); //4

 assert property(
  @(posedge clk) (cs == s3 && in == 0) |-> (ns == s3_c)); //5

 assert property(
  @(posedge clk) (cs == s4_c && in == 0) |-> (ns == s5)); //6

 assert property(
  @(posedge clk) (cs == s4_c && in == 1) |-> (ns == s4)); //7

 assert property(
  @(posedge clk) (cs == s3_c &&  in == 0) |-> (ns == s4)); //8

 assert property(
  @(posedge clk) (cs == deadlock && !($isunknown(in)) |-> (ns == deadlock))); //9

 assert property(
  @(posedge clk) (cs == s7_c &&  in == 1) |-> (ns == s8)); //10

 assert property(
  @(posedge clk) (cs == isolation && !($isunknown(in)) |-> (ns == isolation))); //11

 assert property(
  @(posedge clk) (cs == s5_c && in == 1) |-> (ns == s6)); //12

 assert property(
  @(posedge clk) (cs == s9_c && in == 1) |-> (ns == s10)); //13

 assert property(
  @(posedge clk) (cs == s11 && in == 0) |-> (ns == s11_c)); //14

 assert property(
  @(posedge clk) (cs == s8_c && in == 0) |-> (ns == s9)); //15
`endif

endmodule
