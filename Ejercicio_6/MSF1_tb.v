module testbench();

  reg clk,reset, clock, reset1;
  reg A, B, A1;
  wire S0, S1, S0F, S1F, Y, S00, S11, S22, S0F1, S1F1, S2F1, Y1, Y2, Y3;

  always
    begin
      clk <= 1;
      #1 clk <= ~clk;// se realiza el cambio del reloj
      #1;
  end

  FSM_Mealy G1(A, B,clk,reset,S0,S1, S0F, S1F, Y);

  always
    begin
      clock <= 1;
      #1 clock <= ~clock;// se realiza el cambio del reloj
      #1;
  end

 FSM_Moore G2(A1, clock, reset1, S00, S11, S22, S0F1, S1F1, S2F1, Y1, Y2, Y3);// Ejercicio 3

  initial begin //Ejercicio 1
    $display("\n");
    $display("Ejercicio 1 - Mealy");
    $display(" S1 S0  | A B | S1F S0F | Y");
    $display(" --------------------------- ");
    $monitor(" %b %b     %b  %b     %b  %b    %b ", S1, S0, A, B, S1F, S0F, Y );
       A = 0; B = 0;
    #1 A = 1; B = 0;
    #1 A = 1; B = 1;
    #1 A = 1; B = 1;
    #1 A = 1; B = 1;
    #1 A = 0; B = 0;
    #1 A = 1; B = 0;
    #1 A = 0; B = 0;
  end

  initial begin
       #15
       $display("\n");
       $display(" Ejercicio 3 - Escala de gray ");
       $display(" S2 S1 S0 | A | S2F S1F S0F | Y3 Y2 Y1");
       $display(" ---------------------------");
       $monitor(" %b %b %b    %b   %b  %b  %b   %b %b %b ", S22, S11, S00, A1, S2F1, S1F1, S0F1, Y3, Y2, Y1);

       A1 = 1;
      #1 reset1 = 1;
      #1 reset1 = 0;
      #14 A1 = 0;
      #14 A1 = 1;
     end

     initial
      #60 $finish;

  initial begin
        $dumpfile("MSF1_tb.vcd");
        $dumpvars(0, testbench);
      end

endmodule
