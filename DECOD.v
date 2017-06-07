module DECOD(SEG,MINU,H,d0,d1,d2,d3,d4,d5,d6,d7);
    input [12:0] SEG;
    input [6:0] MINU;
    input [5:0] H;
    
    reg [12:0] seg;
    reg [6:0] minu;
    reg [5:0] h;
    
    
    output reg [6:0] d0,d1,d2,d3,d4,d5,d6,d7; // reg abcdefg
    // d0 centésimo de segundo
    // d1 décimo de segundo
    // d2 segundo
    // assim por diante
    initial begin
        seg = SEG;
        minu = MINU;
        h = H;
    end
    
    always@(*) begin
    
        case(seg%10)
            0: d0 <= 7'b0000001;
            1: d0 <= 7'b1001111;
            2: d0 <= 7'b0010010;
            3: d0 <= 7'b0000110;
            4: d0 <= 7'b1001100;
            5: d0 <= 7'b0100100;
            6: d0 <= 7'b0100000;
            7: d0 <= 7'b0001111;
            8: d0 <= 7'b0000000;
            9: d0 <= 7'b0000100;
        endcase
        
        case((seg/10)%10)
            0: d1 <= 7'b0000001;
            1: d1 <= 7'b1001111;
            2: d1 <= 7'b0010010;
            3: d1 <= 7'b0000110;
            4: d1 <= 7'b1001100;
            5: d1 <= 7'b0100100;
            6: d1 <= 7'b0100000;
            7: d1 <= 7'b0001111;
            8: d1 <= 7'b0000000;
            9: d1 <= 7'b0000100;
        endcase
        
        case((seg/100)%10)
            0: d2 <= 7'b0000001;
            1: d2 <= 7'b1001111;
            2: d2 <= 7'b0010010;
            3: d2 <= 7'b0000110;
            4: d2 <= 7'b1001100;
            5: d2 <= 7'b0100100;
            6: d2 <= 7'b0100000;
            7: d2 <= 7'b0001111;
            8: d2 <= 7'b0000000;
            9: d2 <= 7'b0000100;
        endcase
        
        case((seg/1000)%10)
            0: d3 <= 7'b0000001;
            1: d3 <= 7'b1001111;
            2: d3 <= 7'b0010010;
            3: d3 <= 7'b0000110;
            4: d3 <= 7'b1001100;
            5: d3 <= 7'b0100100;
            6: d3 <= 7'b0100000;
            7: d3 <= 7'b0001111;
            8: d3 <= 7'b0000000;
            9: d3 <= 7'b0000100;
        endcase
        
        case(min%10)
            0: d4 <= 7'b0000001;
            1: d4 <= 7'b1001111;
            2: d4 <= 7'b0010010;
            3: d4 <= 7'b0000110;
            4: d4 <= 7'b1001100;
            5: d4 <= 7'b0100100;
            6: d4 <= 7'b0100000;
            7: d4 <= 7'b0001111;
            8: d4 <= 7'b0000000;
            9: d4 <= 7'b0000100;
        endcase
        
        case((min/10)%10)
            0: d5 <= 7'b0000001;
            1: d5 <= 7'b1001111;
            2: d5 <= 7'b0010010;
            3: d5 <= 7'b0000110;
            4: d5 <= 7'b1001100;
            5: d5 <= 7'b0100100;
            6: d5 <= 7'b0100000;
        endcase
        
        case((h)%10)
            0: d6 <= 7'b0000001;
            1: d6 <= 7'b1001111;
            2: d6 <= 7'b0010010;
            3: d6 <= 7'b0000110;
            4: d6 <= 7'b1001100;
            5: d6 <= 7'b0100100;
            6: d6 <= 7'b0100000;
            7: d6 <= 7'b0001111;
            8: d6 <= 7'b0000000;
            9: d6 <= 7'b0000100;
        endcase
        
        case((h/10)%10)
            0: d7 <= 7'b0000001;
            1: d7 <= 7'b1001111;
            2: d7 <= 7'b0010010;
        endcase
        
        
    end
    
endmodule