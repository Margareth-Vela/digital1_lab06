module ejercicio1(input wire clk, reset, a, b, output reg Y);

  typedef enum reg {S0, S1} statetype;
  statetype state.nextstate;

  always @(posedge clk, posedge reset) begin
    if (reset) state <= S0;
    else state <= nextstate;
  end

  always @(a or b) begin
    case (state)
      S0: if(a) nextstate = S0;
      else nextstate = S1;
      S1: if(a) nextstate = S0;
      else nextstate = S1;
      default: nextstate = S0;
    endcase

  assign Y = ()
