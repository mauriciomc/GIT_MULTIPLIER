// -----------------------------------------------------------------------------
// Copyright (c) Neochip LTD, Inc. All rights reserved
// Neochip Confidential Proprietary
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


module testbench_top (
                      input clk,
                      input nrst
                     );
  
  generate 

  `INC_TEST_FILE
    
  endgenerate
 
endmodule

// Local Variables:
// verilog-library-directories:(".")
// verilog-library-flags:("-f /home/mauricio/Desktop/GIT_FIR_N/RTL/*")
// eval:(verilog-read-defines)
// eval:(verilog-read-includes)
// End:
