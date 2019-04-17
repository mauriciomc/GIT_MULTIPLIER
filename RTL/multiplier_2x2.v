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
// PURPOSE     : 2x2 Vedic Multiplier
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


module multiplier_2x2 ( 
                        op1,
                        op2,
                        out
                      );

  parameter WIDTH_IN  = 2;
  parameter WIDTH_OUT = WIDTH_IN*2;
  
  input   [ WIDTH_IN-1:0] op1;
  input   [ WIDTH_IN-1:0] op2;
  output  [WIDTH_OUT-1:0] out;
  
  assign out[0] = op1[0] & op2[0];
  assign out[1] = ( op1[1] & op2[0] ) ^ ( op1[0] & op2[1] );
  assign out[2] = ( ( op1[1] & op2[0] ) & ( op1[0] & op2[1] ) ) ^ ( op1[1] & op2[1] );
  assign out[3] = ( ( op1[1] & op2[1] ) & ( ( op1[1] & op2[0] )  &  ( op1[0] & op2[1] ) ) );
  
  
endmodule

// Local Variables:
// verilog-library-directories:(".")
// verilog-library-flags:("-f /home/mauricio/Desktop/GIT_FIR_N/RTL/*")
// eval:(verilog-read-defines)
// eval:(verilog-read-includes)
// End:
