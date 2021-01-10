module router_top (input		clock,
					input		resetn,
					input		pkt_valid,
					input	[7:0] data_in,
					input		read_enb_0,
					input		read_enb_1,
					input		read_enb_2,
					
					output	[7:0] data_out_0,
					output	[7:0] data_out_1,
					output  [7:0] data_out_2,
					output		  vld_out_0,
					output			vld_out_1,
					output			vld_out_2,
					output			busy,
					output			error);
					
	//internal wires
	wire [2:0] write_enb;
	wire [7:0] dout;
	
	//Module Instances
	
	router_fifo FIFO_0(.clock 		(clock),
					   .resetn		(resetn),
					   .write_enb	(write_enb[0]),
					   .read_enb	(read_enb_0),
					   .lfd_state	(lfd_state),
					   .data_in		(dout),
					   .data_out	(data_out_0),
					   .empty		(empty_0),
					   .full		(full_0)
					   .soft_reset	(soft_reset_0)
					  );
	router_fifo FIFO_1(.clock 		(clock),
					   .resetn		(resetn),
					   .write_enb	(write_enb[1]),
					   .read_enb	(read_enb_1),
					   .lfd_state	(lfd_state),
					   .data_in		(dout),
					   .data_out	(data_out_1),
					   .empty		(empty_1),
					   .full		(full_1)
					   .soft_reset	(soft_reset_1)
					  );
	router_fifo FIFO_2(.clock 		(clock),
					   .resetn		(resetn),
					   .write_enb	(write_enb[2]),
					   .read_enb	(read_enb_2),
					   .lfd_state	(lfd_state),
					   .data_in		(dout),
					   .data_out	(data_out_2),
					   .empty		(empty_2),
					   .full		(full_2)
					   .soft_reset	(soft_reset_2)
					  );
					  
	router_fsm FSM(.clock(clock) ,
				 .fifo_empty_0(empty_0),
				 .fifo_empty_1(empty_1),
				 .fifo_empty_2(empty_2),
				 .fifo_full(fifo_full),
				 .pkt_valid(pkt_valid),
				 .resetn(resetn),
				 .parity_done(parity_done),
				 .soft_reset_0(soft_reset_0),
				 .soft_reset_1(soft_reset_1),
				 .soft_reset_2(soft_reset_2),
				 .low_pkt_valid(low_pkt_valid),
				 .data_in(data_in[1:0]),
				 
				 .busy(busy),
				 .detect_add(detect_add),
				 .write_enb_reg(write_enb_reg),
				 .ld_state(ld_state),
				 .laf_state(laf_state),
				 .lfd_state(lfd_state),
				 .full_state(full_state),
				 .rst_int_reg(rst_int_reg));	
	
	router_sync SYNC(.clock(clock),
					.resetn(resetn),
					.detect_add(detect_add),
					.data_in(data_in[1:0]),
					.write_enb_reg(write_enb_reg),
					.empty_0(empty_0),
					.empty_1(empty_1),
					.empty_2(empty_2),
					.full_1(full_1),
					.full_2(full_2),
					.full_0(full_0),
					.read_enb_0(read_enb_0),
					.read_enb_1(read_enb_1),
					.read_enb_2(read_enb_2),
					.write_enb(write_enb),
					.fifo_full(fifo_full),
					.vld_out_0(vld_out_0),
					.vld_out_1(vld_out_1),
					.vld_out_2(vld_out_2),
					.soft_reset_0(soft_reset_0),
					.soft_reset_1(soft_reset_1),
					.soft_reset_2(soft_reset_2));
					
	router_reg REG( .clock(clock),
					.resetn(resetn),
					.pkt_valid(pkt_valid),
					.data_in(data_in),
					.fifo_full(fifo_full),
					.detect_add(detect_add),
					.ld_state(ld_state),
					.laf_state(laf_state),
					.lfd_state(lfd_state),
					.full_state(full_state),
					.rst_int_reg(rst_int_reg),
					.low_pkt_valid(low_pkt_valid),
					 .parity_done(parity_done),
					 .dout(dout),
					 .err(error)
					 );
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					