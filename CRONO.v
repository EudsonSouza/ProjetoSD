module CRONO(clk,key0,key1,seg,minu,h);
    input clk,key0,key1;
    output reg [12:0] seg;
    output reg [5:0] minu;
    output reg [4:0] h;
    
    reg [15:0] counter;
    reg [5:0] estado;
    
    parameter update_sec= 0, update_minu = 1, update_h = 2, zerar_h = 3, pause = 4, reset = 5;
    
    initial begin
        estado  <= reset;
        counter <= 0;
        seg     <= 0;
        minu    <= 0;
        h <= 0;
    end
    
    always@(posedge clk) begin  
        counter = counter + 1;
    end
    
    always@(*) begin // duvida se precisar botar o clock aq parar os minutos e horas n incremetarem dms
        case(estado) 
            update_sec: begin
                if (counter > 50000) begin
                    counter <= 0;
                    seg = seg +1;
                end
            end
            
            update_minu: begin
                seg  <= 0;
                minu <= minu +1;
            end
            
            update_h: begin
                minu <= 0;
                h    <= h+1;
            end
            
            zerar_h: begin
                h  <= 0;
            end
            
            pause: begin
                seg  <= seg;
                minu <= minu;
                h    <= h;
            end
            
            reset: begin
                seg  <= 0;
                minu <= 0;
                h    <= 0;
            end
            
            default: begin // faz diferença?
                seg  <= 0;
                minu <= 0;
                h    <= 0;
            end
            
        
        endcase
    end
    
    
    always@(posedge clk ) begin 
        case(estado) 
            update_sec: begin
               if(
               //else if(posedge key1) estado = pausa;
                if(seg >= 6000)  estado = update_minu;
                if (seg < 6000)     estado = update_sec;
            end
            
            update_minu: begin
                if(minu<60)  estado = update_sec;
                else estado = update_h;
            end
            
            update_h: begin
                if(h<24) estado = update_sec;
                else     estado = zerar_h;
            end
            
            zerar_h: begin
                estado = update_sec;
            end
            
            pause: begin
                //if(posedge key0)      estado = reset;
                //else if(posedge key1) estado = update_sec;
                
            end
            
            reset: begin
                seg  <= 0;
                minu <= 0;
                h    <= 0;
            end
            
            default: begin
                seg  <= 0;
                minu <= 0;
                h    <= 0;
            end
            
        
        endcase
    end
        
    
    
    
    
endmodule