module sing_song_score(
    input clk,
    input reset,
    input [2:0]data_in,
    input [1:0]choose,
    output reg[9:0]score,
    output reg[1:0]on_fire,
    output reg[1:0]sad,
    output reg[2:0]pass_div,
	output reg[1:0]led_1,
	output reg[3:0]led_2,
    output reg fail);
 reg flag=1'b0;
 reg [1:0]count=2'b00;

wire [2:0]answer0[0:19];
wire [2:0]answer1[0:19];
wire [2:0]answer2[0:19];
wire [2:0]answer3[0:19];

reg [4:0] i=5'b00000;
reg [8:0] a=9'b001010000;//80

reg [4:0] on_fire_detect=5'b00000;
reg [4:0] sad_detect=5'b00000;
reg [5:0] pass_detect=6'b000000;

wire fail_way;
assign fail_way = (score <a && i == 20 && score != 0) ? 1 : 0;
always@(*)
	fail = fail_way;
    
always@(posedge clk  or posedge reset)begin
	if(reset)begin 
		score<=9'b00000000; 
		i<=5'b0000; 
		pass_div<=3'b001; 
		on_fire<=2'b00;  
		sad<=2'b00; 
		flag<=1'b0; 
		count<=2'b00;
	end
	else begin
		if(score<a || i < 5'b10100)begin
			case(choose)
				2'b00:begin
					if(data_in==answer0[i])begin
						score<=score+9'b000000101;
						on_fire_detect<=on_fire_detect+5'b00001;
						sad_detect<=5'b00000;
						pass_detect <= pass_detect+6'b000001;
						flag<=1'b1;
					end
					else begin
						if(score < 9'b000000101)begin
							score<=9'b000000000;
						end
						else begin
							score <=score-9'b000000101;
							sad_detect<=sad_detect+5'b0001;
							on_fire_detect<=5'b00000;
							pass_detect <= pass_detect;
							flag<=1'b0;
						end
					end
				end
				2'b01:begin
					if(data_in==answer1[i])begin
						score<=score+9'b000000101;
						on_fire_detect<=on_fire_detect+5'b00001;
						sad_detect<=5'b00000;
						pass_detect <= pass_detect+6'b000001;
						flag<=1'b1;
					end
					else begin
						if(score < 9'b000000101)begin
							score <= 9'b000000000;
						end
						else begin
							score<=score-9'b000000101;
							sad_detect<=sad_detect+5'b0001;
							on_fire_detect<=5'b00000;
							pass_detect <= pass_detect;
							flag<=1'b0;
						end
					end
				end
				2'b10:begin 
					if(data_in==answer2[i])begin
						score<=score+9'b000000101;
						on_fire_detect<=on_fire_detect+5'b0001;
						sad_detect<=5'b00000;
						pass_detect <= pass_detect+6'b000001;
						flag=1'b1;
					end
					else begin
						if(score < 9'b000000101)begin
							score <= 9'b000000000;
						end
						else begin
							score<=score-9'b000000101;
							sad_detect<=sad_detect+5'b0001;
							on_fire_detect<=5'b00000;
							pass_detect <= pass_detect;
							flag<=1'b0;
						end
					end
				end   
				2'b11:begin
					if(data_in==answer3[i])begin
						score<=score+9'b000000101;
						on_fire_detect<=on_fire_detect+5'b0001;
						sad_detect<=5'b00000;
						pass_detect <= pass_detect+6'b000001;
						flag<=1'b1;
					end
					else begin
						if(score < 9'b000000101)begin
							score <= 9'b000000000;
						end
						else begin
							score<=score-9'b000000101;
							sad_detect<=sad_detect+5'b0001;
							on_fire_detect<=5'b00000;
							pass_detect <= pass_detect;
							flag<=1'b0;
						end
					end
				end
			endcase
			i<=i+5'b00001;
		end
		if(i==5'b10100)begin
			i<=5'b00000;
			on_fire_detect<=5'b0000;
			sad_detect<=5'b0000;
			pass_detect <= pass_detect;
			a<=a+9'b001010000;
		end
		else if(score==a)begin
			
			count<=count+2'b01;
		end
	end
end

 
    
always@(on_fire_detect or sad_detect or pass_detect)
begin
   if(on_fire_detect==5'b10100)
   begin
    on_fire=2'b11;
   end
   else if(on_fire_detect>=5'b01110 && on_fire_detect<5'b10100)
   begin
    on_fire=2'b10;
   end
   else if(on_fire_detect>=5'b01010 && on_fire_detect<5'b01110)
   begin
    on_fire=2'b01;
   end
   else if(on_fire_detect<5'b01010)
   begin
    on_fire=2'b00;
   end
   if(sad_detect>=5'b01010)
   begin
    sad=2'b11;
   end
   else if(sad_detect>=5'b00111 && sad_detect<5'b01010)
   begin
    sad=2'b10;
   end
   else if(sad_detect>=5'b00011 && sad_detect<5'b00111)
   begin
    sad=2'b01;
   end
   else if(sad_detect<5'b00011)
   begin
    sad=2'b00;
   end
   
   if(pass_detect >= 6'b111111)
   begin
    pass_div=3'b101;
   end
   else if(pass_detect>6'b101111 && pass_detect<=6'b111111) //48~63
   begin
    pass_div=3'b100;

   end
   else if(pass_detect>6'b011111 && pass_detect<=6'b101111) //32~47
   begin
    pass_div=3'b011;

   end
   else if(pass_detect>6'b001111 && pass_detect<=6'b011111) //16~31 
   begin
    pass_div=3'b010;
   
   end
   else if(pass_detect>=6'b000000 && pass_detect<=6'b001111) //0~15 -->16­Ó
   begin
    pass_div=3'b001;
     
    
   end
//   else if(pass_detect==5'b000)
//   begin
//    pass<=3'b000;
//   end
end


assign answer0[0]=3'd1, 
       answer0[1]=3'd0,
       answer0[2]=3'd4,
       answer0[3]=3'd4,
       answer0[4]=3'd5,
       answer0[5]=3'd5,
       answer0[6]=3'd4,
       answer0[7]=3'd3,
       answer0[8]=3'd3,
       answer0[9]=3'd2,
       answer0[10]=3'd2,
       answer0[11]=3'd1,
       answer0[12]=3'd1,
       answer0[13]=3'd0,
       answer0[14]=3'd4,
       answer0[15]=3'd4,
       answer0[16]=3'd3,
       answer0[17]=3'd3,
       answer0[18]=3'd2,
       answer0[19]=3'd2;

assign answer1[0]=3'd4,
       answer1[1]=3'd2,
       answer1[2]=3'd2,
       answer1[3]=3'd3,
       answer1[4]=3'd1,
       answer1[5]=3'd1,
       answer1[6]=3'd0,
       answer1[7]=3'd1,
       answer1[8]=3'd2,
       answer1[9]=3'd3,
       answer1[10]=3'd4,
       answer1[11]=3'd4,
       answer1[12]=3'd4,
       answer1[13]=3'd4,
       answer1[14]=3'd2,
       answer1[15]=3'd2,
       answer1[16]=3'd3,
       answer1[17]=3'd1,
       answer1[18]=3'd1,
       answer1[19]=3'd0;

assign answer2[0]=3'd4,
       answer2[1]=3'd0,
       answer2[2]=3'd0,
       answer2[3]=3'd2,
       answer2[4]=3'd1,
       answer2[5]=3'd0,
       answer2[6]=3'd0,
       answer2[7]=3'd4,
       answer2[8]=3'd0,
       answer2[9]=3'd0,
       answer2[10]=3'd4,
       answer2[11]=3'd4,
       answer2[12]=3'd0,
       answer2[13]=3'd1,
       answer2[14]=3'd2,
       answer2[15]=3'd5,
       answer2[16]=3'd3,
       answer2[17]=3'd3,
       answer2[18]=3'd3,
       answer2[19]=3'd5;

assign answer3[0]=3'd4,
       answer3[1]=3'd5,
       answer3[2]=3'd0,
       answer3[3]=3'd0,
       answer3[4]=3'd0,
       answer3[5]=3'd5,
       answer3[6]=3'd0,
       answer3[7]=3'd2,
       answer3[8]=3'd4,
       answer3[9]=3'd2,
       answer3[10]=3'd1,
       answer3[11]=3'd1,
       answer3[12]=3'd2,
       answer3[13]=3'd1,
       answer3[14]=3'd2,
       answer3[15]=3'd1,
       answer3[16]=3'd0,
       answer3[17]=3'd5,
       answer3[18]=3'd4,
       answer3[19]=3'd5;
       

always @(*)begin  //§ï±¼*
    if (flag) begin
		led_1 = 2'b10;
		
    end
	else
	begin
		led_1 = 2'b01;  
		
	end
end

always@(pass_div)begin
    case(pass_div)
      3'b000: led_2 = 4'b0001;
      3'b001: led_2 = 4'b0011;
      3'b010: led_2 = 4'b0000;
      3'b011: led_2 = 4'b0000;
    endcase
 end
endmodule


  
