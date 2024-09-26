`timescale 1ns/1ps
module sing_song_score_tb;
reg clk,reset;
//reg [1:0] choose;
wire [9:0]score;
wire [2:0]pass_div;
wire [1:0]on_fire;
wire [1:0]sad;
wire [1:0]led_1;
wire [3:0]led_2;
wire fail_way;

top tooo(clk, reset, score, on_fire, sad, pass_div, led_1, led_2, fail_way);
//sing_song_score s1 (.choose(choose),.data_in(data),.clk(clk),.reset(reset)
//			         ,.score(score),.pass_div(pass_div),
//					.on_fire(on_fire),.sad(sad),.led_1(led_1), .led_2(led_2), .fail(fail_way)); //?ˆª???.data_in(data_in)
//initial begin
//	$fsdbDumpfile("demo.fsdb");
//	$fsdbDumpvars();
//	$fsdbDumpMDA();
//end
//reg[4:0]count = 0;

always #10 clk = ~clk;

//always@(posedge clk or posedge reset)begin
//	if(reset) 
//		data_in <= song1[0];
//        //data_in<=3'b000;
//	else begin
//		case(choose)
//			2'b00: data_in <= song1[count+1];
//			2'b01: data_in <= song2[count];
//			2'b10: data_in <= song3[count];
//			2'b11: data_in <= song4[count];
//		endcase
//	end
//end

//always@(posedge clk or posedge reset)begin
//	if(reset) 
//		count <= 0;
//	else if(count == 19) 
//		count <= 0;
//	else 
//		count <= count + 1;
//end
always@(posedge clk or posedge reset)begin
    if(fail_way == 1) $finish;
end
//always@(posedge clk or posedge reset)begin
//	if(reset)
//		choose <= 0;
//	else if(count == 19)begin
//		case(choose)
//			2'b00: choose <= 2'b01;
//			2'b01: choose <= 2'b10;
//			2'b10: choose <= 2'b11;
//			2'b11: choose <= 2'b00;
//		endcase
//	end
//end

initial begin
	clk = 0;
	reset = 1;
    //choose = 2'b00;
//    {song1[0], song1[1], song1[2], song1[3], song1[4]} = {3'd1, 3'd0, 3'd4, 3'd4, 3'd5};
//    {song1[5], song1[6], song1[7], song1[8], song1[9]} = {3'd5, 3'd4, 3'd3, 3'd3, 3'd2};
//    {song1[10], song1[11], song1[12], song1[13], song1[14]} = {3'd2, 3'd1, 3'd1, 3'd0, 3'd4};
//    {song1[15], song1[16], song1[17], song1[18], song1[19]} = {3'd4, 3'd3, 3'd3, 3'd2, 3'd2};
    

//    {song2[0], song2[1], song2[2], song2[3], song2[4]} = {3'd4, 3'd2, 3'd2, 3'd3, 3'd1};
//    {song2[5], song2[6], song2[7], song2[8], song2[9]} = {3'd1, 3'd0, 3'd1, 3'd2, 3'd3};
//    {song2[10], song2[11], song2[12], song2[13], song2[14]} = {3'd4, 3'd4, 3'd4, 3'd4, 3'd2};
//    {song2[15], song2[16], song2[17], song2[18], song2[19]} = {3'd2, 3'd3, 3'd1, 3'd1, 3'd0};

//    {song3[0], song3[1], song3[2], song3[3], song3[4]} = {3'd1, 3'd2, 3'd3, 3'd4, 3'd5};
//    {song3[5], song3[6], song3[7], song3[8], song3[9]} = {3'd1, 3'd2, 3'd3, 3'd4, 3'd5};
//    {song3[10], song3[11], song3[12], song3[13], song3[14]} = {3'd1, 3'd2, 3'd3, 3'd4, 3'd5};
//    {song3[15], song3[16], song3[17], song3[18], song3[19]} = {3'd1, 3'd2, 3'd3, 3'd4, 3'd5};

//    {song4[0], song4[1], song4[2], song4[3], song4[4]} = {3'd1, 3'd2, 3'd3, 3'd4, 3'd5};
//    {song4[5], song4[6], song4[7], song4[8], song4[9]} = {3'd1, 3'd2, 3'd3, 3'd4, 3'd5};
//    {song4[10], song4[11], song4[12], song4[13], song4[14]} = {3'd1, 3'd2, 3'd3, 3'd4, 3'd5};
//    {song4[15], song4[16], song4[17], song4[18], song4[19]} = {3'd1, 3'd2, 3'd3, 3'd4, 3'd5};

    #10; reset = 1;
    #10; reset = 0;
end
//the third competitor
//start of first song
//#10  clk=1; reset=0; data_in=3'd1;
//#10  clk=0; reset=0; data_in=3'd1;
//#10  clk=1; reset=0; data_in=3'd2;
//#10  clk=0; reset=0; data_in=3'd2;
//#10  clk=1; reset=0; data_in=3'd3;
//#10  clk=0; reset=0; data_in=3'd3;
//#10  clk=1; reset=0; data_in=3'd3;
//#10  clk=0; reset=0; data_in=3'd3;
//#10  clk=1; reset=0; data_in=3'd2;
//#10  clk=0; reset=0; data_in=3'd2;
//#10  clk=1; reset=0; data_in=3'd3;
//#10  clk=0; reset=0; data_in=3'd3;
//#10  clk=1; reset=0; data_in=3'd4;
//#10  clk=0; reset=0; data_in=3'd4;
//#10  clk=1; reset=0; data_in=3'd4;
//#10  clk=0; reset=0; data_in=3'd4;
//#10  clk=1; reset=0; data_in=3'd3;
//#10  clk=0; reset=0; data_in=3'd3;
//#10  clk=1; reset=0; data_in=3'd4;
//#10  clk=0; reset=0; data_in=3'd4;
//#10  clk=1; reset=0; data_in=3'd5;
//#10  clk=0; reset=0; data_in=3'd5;
//#10  clk=1; reset=0; data_in=3'd5;
//#10  clk=0; reset=0; data_in=3'd5;
//#10  clk=1; reset=0; data_in=3'd1;
//#10  clk=0; reset=0; data_in=3'd1;
//#10  clk=1; reset=0; data_in=3'd6;
//#10  clk=0; reset=0; data_in=3'd6;
//#10  clk=1; reset=0; data_in=3'd7;
//#10  clk=0; reset=0; data_in=3'd7;
//#10  clk=1; reset=0; data_in=3'd1;
//#10  clk=0; reset=0; data_in=3'd1;
//#10  clk=1; reset=0; data_in=3'd1;
//#10  clk=0; reset=0; data_in=3'd1;
//#10  clk=1; reset=0; data_in=3'd2;
//#10  clk=0; reset=0; data_in=3'd2;
//#10  clk=1; reset=0; data_in=3'd1;
//#10  clk=0; reset=0; data_in=3'd1;
//#10  clk=1; reset=0; data_in=3'd2;
//#10  clk=0; reset=0; data_in=3'd2;
//end of first song
//#10  clk=1; reset=0; data_in=3'd0;
//#10  clk=0; reset=0; data_in=3'd0;
//start of second song
//#10  clk=1; reset=0; data_in=3'd0;choose=2'b01;
//#10  clk=0; reset=0; data_in=3'd0;
//#10  clk=1; reset=0; data_in=3'd1;
//#10  clk=0; reset=0; data_in=3'd1;
//#10  clk=1; reset=0; data_in=3'd1;
//#10  clk=0; reset=0; data_in=3'd1;
//#10  clk=1; reset=0; data_in=3'd1;
//#10  clk=0; reset=0; data_in=3'd1;
//#10  clk=1; reset=0; data_in=3'd2;
//#10  clk=0; reset=0; data_in=3'd2;
//#10  clk=1; reset=0; data_in=3'd1;
//#10  clk=0; reset=0; data_in=3'd1;
//#10  clk=1; reset=0; data_in=3'd1;
//#10  clk=0; reset=0; data_in=3'd1;
//#10  clk=1; reset=0; data_in=3'd5;
//#10  clk=0; reset=0; data_in=3'd5;
//#10  clk=1; reset=0; data_in=3'd1;
//#10  clk=0; reset=0; data_in=3'd1;
//#10  clk=1; reset=0; data_in=3'd1;
//#10  clk=0; reset=0; data_in=3'd1;
//#10  clk=1; reset=0; data_in=3'd2;
//#10  clk=0; reset=0; data_in=3'd2;
//#10  clk=1; reset=0; data_in=3'd1;
//#10  clk=0; reset=0; data_in=3'd1;
//#10  clk=1; reset=0; data_in=3'd1;
//#10  clk=0; reset=0; data_in=3'd1;
//#10  clk=1; reset=0; data_in=3'd6;
//#10  clk=0; reset=0; data_in=3'd6;
//#10  clk=1; reset=0; data_in=3'd1;
//#10  clk=0; reset=0; data_in=3'd1;
//#10  clk=1; reset=0; data_in=3'd1;
//#10  clk=0; reset=0; data_in=3'd1;
//#10  clk=1; reset=0; data_in=3'd7;
//#10  clk=0; reset=0; data_in=3'd7;
//#10  clk=1; reset=0; data_in=3'd5;
//#10  clk=0; reset=0; data_in=3'd5;
//#10  clk=1; reset=0; data_in=3'd5;
//#10  clk=0; reset=0; data_in=3'd5;
//#10  clk=1; reset=0; data_in=3'd0;
//#10  clk=0; reset=0; data_in=3'd0;
////end of second song
////#10  clk=1; reset=0; data_in=3'd0;
////#10  clk=0; reset=0; data_in=3'd0;
////start of third song
//#10  clk=1; reset=0; data_in=3'd2;choose=2'b10;
//#10  clk=0; reset=0; data_in=3'd2;
//#10  clk=1; reset=0; data_in=3'd2;
//#10  clk=0; reset=0; data_in=3'd2;
//#10  clk=1; reset=0; data_in=3'd5;
//#10  clk=0; reset=0; data_in=3'd5;
//#10  clk=1; reset=0; data_in=3'd4;
//#10  clk=0; reset=0; data_in=3'd4;
//#10  clk=1; reset=0; data_in=3'd5;
//#10  clk=0; reset=0; data_in=3'd5;
//#10  clk=1; reset=0; data_in=3'd0;
//#10  clk=0; reset=0; data_in=3'd0;
//#10  clk=1; reset=0; data_in=3'd2;
//#10  clk=0; reset=0; data_in=3'd2;
//#10  clk=1; reset=0; data_in=3'd2;
//#10  clk=0; reset=0; data_in=3'd2;
//#10  clk=1; reset=0; data_in=3'd0;
//#10  clk=0; reset=0; data_in=3'd0;
//#10  clk=1; reset=0; data_in=3'd4;
//#10  clk=0; reset=0; data_in=3'd4;
//#10  clk=1; reset=0; data_in=3'd5;
//#10  clk=0; reset=0; data_in=3'd5;
//#10  clk=1; reset=0; data_in=3'd2;
//#10  clk=0; reset=0; data_in=3'd2;
//#10  clk=1; reset=0; data_in=3'd0;
//#10  clk=0; reset=0; data_in=3'd0;
//#10  clk=1; reset=0; data_in=3'd0;
//#10  clk=0; reset=0; data_in=3'd0;
//#10  clk=1; reset=0; data_in=3'd2;
//#10  clk=0; reset=0; data_in=3'd2;
//#10  clk=1; reset=0; data_in=3'd2;
//#10  clk=0; reset=0; data_in=3'd2;
//#10  clk=1; reset=0; data_in=3'd0;
//#10  clk=0; reset=0; data_in=3'd0;
//#10  clk=1; reset=0; data_in=3'd0;
//#10  clk=0; reset=0; data_in=3'd0;
//#10  clk=1; reset=0; data_in=3'd6;
//#10  clk=0; reset=0; data_in=3'd6;
//#10  clk=1; reset=0; data_in=3'd7;
//#10  clk=0; reset=0; data_in=3'd7;
////end of third song
////#10  clk=1; reset=0; data_in=3'd0;
////#10  clk=0; reset=0; data_in=3'd0;
////start of forth song
//#10  clk=1; reset=0; data_in=3'd3;choose=2'b11;
//#10  clk=0; reset=0; data_in=3'd3;
//#10  clk=1; reset=0; data_in=3'd2;
//#10  clk=0; reset=0; data_in=3'd2;
//#10  clk=1; reset=0; data_in=3'd4;
//#10  clk=0; reset=0; data_in=3'd4;
//#10  clk=1; reset=0; data_in=3'd0;
//#10  clk=0; reset=0; data_in=3'd0;
//#10  clk=1; reset=0; data_in=3'd2;
//#10  clk=0; reset=0; data_in=3'd2;
//#10  clk=1; reset=0; data_in=3'd2;
//#10  clk=0; reset=0; data_in=3'd2;
//#10  clk=1; reset=0; data_in=3'd1;
//#10  clk=0; reset=0; data_in=3'd1;
//#10  clk=1; reset=0; data_in=3'd3;
//#10  clk=0; reset=0; data_in=3'd3;
//#10  clk=1; reset=0; data_in=3'd0;
//#10  clk=0; reset=0; data_in=3'd0;
//#10  clk=1; reset=0; data_in=3'd6;
//#10  clk=0; reset=0; data_in=3'd6;
//#10  clk=1; reset=0; data_in=3'd3;
//#10  clk=0; reset=0; data_in=3'd3;
//#10  clk=1; reset=0; data_in=3'd6;
//#10  clk=0; reset=0; data_in=3'd6;
//#10  clk=1; reset=0; data_in=3'd1;
//#10  clk=0; reset=0; data_in=3'd1;
//#10  clk=1; reset=0; data_in=3'd1;
//#10  clk=0; reset=0; data_in=3'd1;
//#10  clk=1; reset=0; data_in=3'd1;
//#10  clk=0; reset=0; data_in=3'd1;
//#10  clk=1; reset=0; data_in=3'd2;
//#10  clk=0; reset=0; data_in=3'd2;
//#10  clk=1; reset=0; data_in=3'd2;
//#10  clk=0; reset=0; data_in=3'd2;
//#10  clk=1; reset=0; data_in=3'd1;
//#10  clk=0; reset=0; data_in=3'd1;
//#10  clk=1; reset=0; data_in=3'd5;
//#10  clk=0; reset=0; data_in=3'd5;
//#10  clk=1; reset=0; data_in=3'd2;
//#10  clk=0; reset=0; data_in=3'd2;
//end of forth song


endmodule
