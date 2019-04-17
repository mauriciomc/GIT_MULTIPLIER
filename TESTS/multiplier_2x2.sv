// -----------------------------------------------------------------------------
// Copyright (c) Neochip LTD, Inc. All rights reserved
// Confidential Proprietary
// -----------------------------------------------------------------------------
// FILE NAME      : 
// AUTHOR         : $Author$
// AUTHOR’S EMAIL : mauricio.carvalho@neochip.co.uk
// -----------------------------------------------------------------------------
// RELEASE HISTORY 
// VERSION DATE        AUTHOR  DESCRIPTION
// $Rev$     $Date$  name $Author$       
// -----------------------------------------------------------------------------
// KEYWORDS    : General file searching keywords, leave blank if none.
// -----------------------------------------------------------------------------
// PURPOSE     : Short description of functionality
// -----------------------------------------------------------------------------
// PARAMETERS
//     PARAM NAME      RANGE    : DESCRIPTION       : DEFAULT : UNITS
// e.g.DATA_WIDTH     [32,16]   : width of the data : 32      :
// -----------------------------------------------------------------------------
// REUSE ISSUES
//   Reset Strategy        :
//   Clock Domains         :
//   Critical Timing       :
//   Test Features         :
//   Asynchronous I/F      :
//   Scan Methodology      :
//   Instantiations        :
//   Synthesizable (y/n)   :
//   Other                 :
// -----------------------------------------------------------------------------

// Local Variables:
// verilog-library-flags:("-y ./ ")
// verilog-library-extensions:(".v" ".h" ".sv" ".vs")
// eval:(verilog-read-defines)
// eval:(verilog-read-includes)
// eval:(setq verilog-auto-read-includes t)
// End:

//Port mapping and any other logic without encapsulating between module / endmodule

  reg  [ 1:0] op1 ;
  reg  [ 1:0] op2 ;
  wire [ 3:0] out ;

  reg   [4:0] counter;
 
  multiplier_2x2 multiplier_2x2_u1(.op1 (op1),
                                   .op2 (op2),
                                   .out (out)
                                  );

  always @(posedge clk)
  begin : INPUT_GENERATION
    if ( !nrst )
    begin
        op1     <= 0;
        op2     <= 0;
        counter <= 0;
    end
    else 
    begin
       counter <= counter + 1;
       op1 <= $random;
       op2 <= $random;
    end
    
    //finish simulation
    if ( counter >= 30 )
      $finish;
  end 

// Local Variables:                                              
// verilog-library-directories:(".")                             
// verilog-library-flags:("-f /home/mauricio/Desktop/GIT_MULTIPLIER/RTL/*")
// eval:(verilog-read-defines)                                   
// eval:(verilog-read-includes)                                  
// End:            
