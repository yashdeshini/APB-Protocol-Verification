// [MODIFIED] AMBA APB Protocol Design
module AMBA_APB (
    input P_clk,
    input P_rst,
    input [31:0] P_addr,
    input P_selx,
    input P_enable,
    input P_write,
    input [31:0] P_wdata,
    
    output reg P_ready,
    output reg P_slverr,
    output reg [31:0] P_rdata
);

// [MODIFIED] Memory Declaration
reg [31:0] mem [31:0];

// [MODIFIED] State Declaration
parameter [1:0] IDLE = 2'b00;
parameter [1:0] SETUP = 2'b01;
parameter [1:0] ACCESS = 2'b10;

// [MODIFIED] Present and Next State Registers
reg [1:0] present_state, next_state;

// [MODIFIED] State Transition Logic
always @(posedge P_clk or posedge P_rst) begin
    if (P_rst) 
        present_state <= IDLE;
    else 
        present_state <= next_state;
end

// [MODIFIED] Next State Logic and Output Control
always @(*) begin
    // Default assignments
    P_ready = 0;
    P_slverr = 0;

    case (present_state)
        IDLE: begin
            if (P_selx && !P_enable) 
                next_state = SETUP;
            else
                next_state = IDLE;
        end

        SETUP: begin
            if (!P_selx || !P_enable) 
                next_state = IDLE; 
            else 
                next_state = ACCESS;
        end

        ACCESS: begin
            if (!P_selx || !P_enable) 
                next_state = IDLE;
            else begin
                P_ready = 1;
                if (P_write) begin
                    mem[P_addr] = P_wdata; // Write Operation
                end else begin
                    P_rdata = mem[P_addr]; // Read Operation
                end
            end
        end

        default: next_state = IDLE;
    endcase 
end

endmodule
