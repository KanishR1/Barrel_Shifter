`timescale 1ps/1ps
module tb();
    reg [3 : 0]data_in;
    reg right; //To mention shift Right or left
    reg arith; //To perform arithmetic or logical shift
    reg [1  :0]sa; //Shift amount, For eight bit data only 7 shifts can be done
    wire [3 : 0]data_out;
    
    barrel_shifter #(.DATA_LENGTH(4)) DUT(.data_in(data_in), .right(right), .arith(arith), .sa(sa), .data_out(data_out));

    integer i,j,k;
    initial begin
        data_in = 4'b1010;
        for(i=0 ;i <2 ;i=i+1) begin
            for(j=0; j<2 ; j=j+1) begin
                for(k=0;k<4;k=k+1) begin
                    right = i;
                    arith = j;
                    sa=k;
                    #10;
                end
            end
        end
        $finish;
    end
    initial begin
        $monitor($time,"ns --> data_in  = %b , right = %b , arith = %b , sa = %d , data_out = %b ", data_in, right, arith, sa, data_out);
    end

endmodule