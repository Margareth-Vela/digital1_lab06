module ff_D(input wire clock,reset,input wire d,output reg Y); //Flip flop tipo d
  always @ (posedge clock, posedge reset) begin
    if(reset) begin
      Y <= 1'b0;
    end
    else
      Y <= d;
    end
endmodule

module FSM_Mealy(input wire A, B,clock, reset,output wire S0, S1, S0F, S1F, Y); //Ejercicio 1

    wire S11, S00; //Variables internas

    assign S0F = (~S11 & ~S00 & A);   //Determinar valores para los estados
    assign S1F = ((S00 & B) | (S11 & A & B));

    ff_D G1(clock, reset,S1F, S11); //Flip flop tipo d para obtener los siguientes estados
    ff_D G2(clock, reset,S0F, S00);
    assign S0 = S00;
    assign S1 = S11;
    assign Y = (S11 & A & B); //Salida

endmodule

module FSM_Moore(input wire A, input wire clock, reset, output wire S0, S1, S2, S0F, S1F, S2F, Y1, Y2, Y3); //Ejercicio 3
    wire S00, S11, S22;//Variables internas

    assign S0F = ~S00; //Determinar valores  para estados
    assign S1F = (~S11 & ~S00 & ~A) | (S11 & S0 & ~A) | (S11 & ~S00 & A) | (~S11 & S00 & A);
    assign S2F = (S22 & S11 & ~A) | (S22 & ~S00 & A) | (S22 & ~S11 & S00) | (~S22 & S11 & S00 & A);

    ff_D G1(clock, reset, S0F, S00);//Flip flop tipo d para obtener los siguientes estados
    ff_D G2(clock, reset, S1F, S11);
    ff_D G3(clock, reset, S2F, S22);
    assign S0 = S00;
    assign S1 = S11;
    assign S2 = S22;

    assign Y3 = S22; //Salida de 3 bits
    assign Y2 = (~S22 & S11) | (S22 & ~S11);
    assign Y1 = (S11 & ~S00) | (~S11 & S00);

endmodule
