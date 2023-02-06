module barrel_shifter #(
    parameter DATA_LENGTH = 8
) (
    input signed [DATA_LENGTH-1 : 0]data_in,
    input right, //To mention shift Right or left
    input arith, //To perform arithmetic or logical shift
    input [$clog2(DATA_LENGTH)-1  :0]sa, //Shift amount, For eight bit data only 7 shifts can be done
    output reg [DATA_LENGTH-1 : 0]data_out
);
    localparam LEFT_LOGICAL = 2'b00,
               RIGHT_LOGICAL = 2'b10,
               RIGHT_ARITHMETIC = 2'b11;
    always @(*) begin
        case({right, arith})

        LEFT_LOGICAL : data_out = data_in<<sa;
        RIGHT_LOGICAL : data_out = data_in>>sa;
        RIGHT_ARITHMETIC : data_out = data_in>>>sa;
        default : data_out = data_in;
        endcase
        
    end
    
endmodule