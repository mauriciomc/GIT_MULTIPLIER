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
// PURPOSE     : 8x8 Vedic Multiplier
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


module multiplier_8x8 ( 
                        op1,
                        op2,
                        out
                     );


  parameter WIDTH_IN  = 8;
  parameter WIDTH_OUT = WIDTH_IN*2;

  input   [ WIDTH_IN-1:0] op1;
  input   [ WIDTH_IN-1:0] op2;
  output  [WIDTH_OUT-1:0] out;

  wire    [ WIDTH_IN-1:0] out1; 
  wire    [ WIDTH_IN-1:0] out2; 
  wire    [ WIDTH_IN-1:0] out3; 
  wire    [ WIDTH_IN-1:0] out4; 

  multiplier_4x4 multiplier_4x4_u1 ( .op1 ( op1[3:0]), 
                                     .op2 ( op2[3:0]), 
                                     .out ( out1    ) 
                                   );

  multiplier_4x4 multiplier_4x4_u2 ( .op1 ( op1[7:4]),
                                     .op2 ( op2[3:0]),
                                     .out ( out2    ) 
                                   );

  multiplier_4x4 multiplier_4x4_u3 ( .op1 ( op1[3:0]),
                                     .op2 ( op2[7:4]),
                                     .out ( out3    ) 
                                   );

  multiplier_4x4 multiplier_4x4_u4 ( .op1 ( op1[7:4]),
                                     .op2 ( op2[7:4]),
                                     .out ( out4    ) 
                                   );

  assign out = { ( { { out4 , 4'd0 } + {4'd0, out3 } } + { out2 + { 4'd0, out1[7:4] } } ), out1[3:0] };
    

endmodule

// Local Variables:
// verilog-library-directories:(".")
// verilog-library-flags:("-f /home/mauricio/Desktop/GIT_MULTIPLIER/RTL/*")
// eval:(verilog-read-defines)
// eval:(verilog-read-includes)
// End:
