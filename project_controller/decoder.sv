module Decode( clock, reset, enable_decode, instr_dout, E_Control, npc_in, Mem_Control, W_Control, IR, npc_out);

input clock, reset, enable_decode;
input [15:0] instr_dout;
input [15:0] npc_in;
input [2:0]psr;
output [1:0] W_Control;
output Mem_Control;
output [5:0] E_Control;
output reg [15:0] IR;
output reg [15:0] npc_out;

//reg [15:0] M_Control;
reg M_Control;
reg [1:0] pcselect1, alu_control;
reg pcselect2, op2select;
wire [3:0] opcode=instr_dout[15:12];

assign Mem_Control = M_Control;
assign E_Control = {alu_control, pcselect1,pcselect2, op2select};

//IR and npc_out handling block 
always @(posedge clock)
begin
	if(reset)
	begin
		IR <= 0;
		npc_out <= 0;
	end
	else 
	begin
		if (enable_decode)
		begin
			IR <= instr_dout;
			npc_out <= npc_in;
		end
		else
		begin
			IR<=IR;
			npc_out<=npc_out;
		end
	end
end


//E_Control handling block
always @(posedge clock)
begin
	if(reset)
	begin
		alu_control <= 0;
		op2select <= 0;
		pcselect1 <= 0;
		pcselect2 <= 0;
	end
	else if (enable_decode)
	begin
		case(opcode[1:0])
		2'b00:
		begin
			alu_control <= alu_control;
			op2select <= op2select;
			
			case (opcode[3:2])
			2'b00:
			begin
				pcselect1 <= 2'd1
				pcselect2 <= 1'b1;
			end
			2'b11:
			begin
				pcselect1 <= 2'd3;
				pcselect2 <= 1'b0;
			end
			default:
			begin
				pcselect1 <= pcselect1;
				pcselect2 <= pcselect2;
			end
			endcase
		end

		2'b01:
		begin
			pcselect1 <= pcselect1;
			pcselect2 <= pcselect2;
			op2select <= ~(instr_dout[5]);
			op2select <= instr_dout[5];
			
			case (opcode[3:2])
			2'b00: alu_control <= 2'd0;
			2'b01: alu_control <= 2'd1;
			2'b10: alu_control <= 2'd2;
			default: alu_control<= alu_control;
			endcase
		end

		2'b10:
		begin
			alu_control<= alu_control;
			op2select<=op2select;
			if (opcode[3:2]==2'b01)
			begin
				pcselect1 <=2'd2;
				pcselect2 <=1'd0;
			end
			
			else
			begin
				pcselect1 <= 2'd1;
				pcselect2 = 1'b1;
			end
		end

		2'b11:
		begin
			alu_control<=alu_control;
			op2select <= op2select;
			if (opcode[3:2]==2'b01)
			begin
				pcselect1 <=2'd2;
				pcselect2 <=1'b0;
			end
			
			else
			begin
				pcselect1 <= 2'd1;
				pcselect2 <= 1'b1;
			end
		end
		endcase
	end
end
end

//W_control handling block
always @(posedge clock)
begin
	if(reset)
	begin
		W_Control <= 2'd0;
	end
	else if (enable_decode)
	begin
		case(opcode[1:0])	
		2'b00:
		begin
			W_Control <= 2'd0;
		end
		
		2'b01:
		begin
			W_Control <= 2'd0;
		end

		2'b10:
		begin
			if (opcode[3:2]==2'b11)
			begin
				W_Control<=2'd2;
			end
			else
				W_Control<=2'd1;
		end

		2'b11:
		begin
			W_Control<=2'd0;
		end
		endcase
	end
end

//Mem_control handling block
always @(posedge clock)
begin
	if (reset)
	begin	
		M_Control <= 0;
	end
	
	else if (enable_decode)
	begin
		case(opcode[1:0])	
		2'b00:
		begin
			M_Control <= M_Control;
		end

		2'b01:
		begin
			M_Control <= M_Control;
		end

		2'b10:
		begin
			if (opcode[3:2]==2'b11)
			M_Control <= M_Control;
			else
			M_Control <= (opcode[3:2]!=2'b10) ? 0 : 1;
		end

		2'b11:
		begin
			M_Control <= (opcode[3:2]==2'b10) ? 1 : 0;
		end
		endcase
	end
end
endmodule

