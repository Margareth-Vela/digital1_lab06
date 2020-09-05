module flopd1(input wire clk, reset, [3:0]d, output wire [3:0]Y);
  //reset asincrono
  always @(posedge clk, posedge reset) begin
    if (reset) Y <= 4'b0;
    else Y <= d;
endmodule

module flopd2(input wire clk, reset, [3:0]d, output wire [3:0]Y) ;
  //reset síncrono
  always @(posedge clk) begin
    if (reset)  Y <= 4'b0;
    else  Y <= d;
endmodule
