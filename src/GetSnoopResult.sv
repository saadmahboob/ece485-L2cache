module GetSnoopResult(address,operation,snoopBus);
  // Configurable params for dynamic system
  parameter addressSize = 32;
  
  // Establish inputs and outputs of the module
  input [addressSize - 1:0] address;
  input [7:0]               operation;
  inout [1:0]               snoopBus;
  
  // Perform a consistant procedure
  always @(address,operation) begin
    if(address[3:0] == 4'h2 || address [3:0] == 4'h8)
      snoopBus <= 2'b01;
    else if(address[3:0] == 4'h4 || address[3:0] == 4'hC)
      snoopBus <= 2'b10;
    else
      snoopBus <= 2'b00;
  end
endmodule