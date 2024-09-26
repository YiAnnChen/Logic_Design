module user(
    input clk,
    input rst,
    output reg[1:0]choose,
    output reg[2:0]data_in);
    wire [2:0]user[0:79];
    reg [5:0] count;
    assign user[0]=3'd1; 
    assign user[1]=3'd0;
    assign user[2]=3'd4;
    assign user[3]=3'd4;
    assign user[4]=3'd5;
    assign user[5]=3'd5;
    assign user[6]=3'd4;
    assign user[7]=3'd3;
    assign user[8]=3'd3;
    assign user[9]=3'd2;
    assign user[10]=3'd2;
    assign user[11]=3'd1;
    assign user[12]=3'd1;
    assign user[13]=3'd0;
    assign user[14]=3'd4;
    assign user[15]=3'd4;
    assign user[16]=3'd3;
    assign user[17]=3'd3;
    assign user[18]=3'd2;
    assign user[19]=3'd2;
    assign user[20]=3'd4;
    assign user[21]=3'd2;
    assign user[22]=3'd2;
    assign user[23]=3'd3;
    assign user[24]=3'd1;
    assign user[25]=3'd1;
    assign user[26]=3'd0;
    assign user[27]=3'd1;
    assign user[28]=3'd2;
    assign user[29]=3'd3;
    assign user[30]=3'd4;
    assign user[32]=3'd4;
    assign user[33]=3'd4;
    assign user[34]=3'd2;
    assign user[35]=3'd2;
    assign user[36]=3'd3;
    assign user[37]=3'd1;
    assign user[38]=3'd1;
    assign user[39]=3'd0;
    assign user[40]=3'b100;
    assign user[41]=3'b000;
    assign user[42]=3'b000;
    assign user[43]=3'b010;
    assign user[44]=3'b001;
    assign user[45]=3'b000;
    assign user[46]=3'b000;
    assign user[47]=3'b100;
    assign user[48]=3'b000;
    assign user[49]=3'b010;
    assign user[50]=3'b100;
    assign user[51]=3'b100;
    assign user[52]=3'b000;
    assign user[53]=3'b001;
    assign user[54]=3'b010;
    assign user[55]=3'b101;
    assign user[56]=3'b011;
    assign user[57]=3'b011;
    assign user[58]=3'b011;
    assign user[59]=3'b101;
    assign user[60]=3'b100;
    assign user[61]=3'b101;
    assign user[62]=3'b000;
    assign user[63]=3'b000;
    assign user[64]=3'b000;
    assign user[65]=3'b101;
    assign user[66]=3'b000;
    assign user[67]=3'b010;
    assign user[68]=3'b100;
    assign user[69]=3'b010;
    assign user[70]=3'b001;
    assign user[71]=3'b001;
    assign user[72]=3'b010;
    assign user[73]=3'b001;
    assign user[74]=3'b010;
    assign user[75]=3'b001;
    assign user[76]=3'b000;
    assign user[77]=3'b101;
    assign user[78]=3'b100;
    assign user[79]=3'b101;
  always@(posedge clk or posedge rst)
    begin
    if(rst)begin 
        data_in <= 5'b00000;
        count <= 5'b00000;
    end
    else begin
        data_in <= user[count+1];
        count <= count +1;
    end   
 
 end
 
 always@(posedge clk or posedge rst)begin
    if(rst)
        choose <= 2'b00;
    else begin
        if(count % 20 == 19)begin
            case(choose)
                2'b00: choose <= 2'b01;
                2'b01: choose <= 2'b10;
                2'b10: choose <= 2'b11;
                2'b11: choose <= 2'b00;
            endcase
         end
    end
end
                
endmodule