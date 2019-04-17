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
// PURPOSE     : 4x4 vedic multiplier
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


module multiplier_4x4 ( 
                        op1,
                        op2,
                        out
               );

  parameter WIDTH_IN  = 4;
  parameter WIDTH_OUT = WIDTH_IN*2;
  
  input   [ WIDTH_IN-1:0] op1;
  input   [ WIDTH_IN-1:0] op2;
  output  [WIDTH_OUT-1:0] out;
    
  wire    [ WIDTH_IN-1:0] out1; 
  wire    [ WIDTH_IN-1:0] out2; 
  wire    [ WIDTH_IN-1:0] out3; 
  wire    [ WIDTH_IN-1:0] out4; 
  
  
 multiplier_2x2 multiplier_2x2_u1 ( .op1 ( op1[1:0]), 
                                    .op2 ( op2[1:0]), 
                                    .out ( out1    ) 
                                  );

 multiplier_2x2 multiplier_2x2_u2 ( .op1 ( op1[3:2]),
                                    .op2 ( op2[1:0]),
                                    .out ( out2    ) 
                                  );

 multiplier_2x2 multiplier_2x2_u3 ( .op1 ( op1[1:0]),
                                    .op2 ( op2[3:2]),
                                    .out ( out3    ) 
                                  );

 multiplier_2x2 multiplier_2x2_u4 ( .op1 ( op1[3:2]),
                                    .op2 ( op2[3:2]),
                                    .out ( out4    ) 
                                  );

assign out =  { ( { { out4 , 2'd0 } + {2'd0, out3 } } + {  out2  + { 2'd0, out1[3:2] } } ) , out1[1:0] };
    
     
endmodule

// Local Variables:
// verilog-library-directories:(".")
// verilog-library-flags:("-f /home/mauricio/Desktop/GIT_FIR_N/RTL/*")
// eval:(verilog-read-defines)
// eval:(verilog-read-includes)
// End:
