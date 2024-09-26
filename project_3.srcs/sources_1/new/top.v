module top(input clk, 
    input rst,
    output [9:0]score,
    output [1:0]on_fire,
    output [1:0]sad,
    output [2:0]pass_div,
	output [1:0]led_1,
	output [3:0]led_2,
    output  fail);
    
    wire [2:0]data_in;
    wire [1:0]choose;
    wire [9:0]score1;
    wire [1:0]on_fire1;
    wire [1:0]sad1;
    wire [2:0]pass_div1;
    wire [1:0]led_11;
    wire [3:0]led_21;
    wire fail1;
    user u(clk, rst, choose, data_in);
    sing_song_score s(clk, rst, data_in, choose, score1, on_fire1, sad1, pass_div1, led_11, led_21, fail1);
    assign score = score1;
    assign on_fire = on_fire1;
    assign sad = sad1;
    assign pass_div = pass_div1;
    assign led_1 = led_11;
    assign led_2 = led_21;
    assign fail = fail1;
endmodule
