module CRONO(clk,key0,key1,seg,minu,h);
    input clk,key0,key1;
    output reg [12:0] seg;
    output reg [5:0] minu;
    output reg [4:0] h;
    
    reg [15:0] counter;
    reg [5:0] estado;
    
    parameter update_sec= 0, update_minu = 1, update_h = 2, zerar_h = 3; //continuar daqui
    
    initial begin
        counter <= 0;
        seg     <= 0;
        minu    <= 0;
        h <= 0;
    end
    
    always@(posedge clk) begin  // incremeta seg a cada centésimo de segundo
        counter = counter + 1;
        if (counter > 50000) begin
            seg <= seg + 1;
            counter <= 0;
        end
    end
    
    
    
    
endmodule