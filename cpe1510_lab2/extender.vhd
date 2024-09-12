-- ********************************************************
-- * project:     scp
-- * filename:    extender.vhd
-- * author:      << insert your name here >>
-- * date:        MSOE Spring 2024
-- * provides:    a component to convert 8, 12, or 24-bit
-- *              ARMV4 constants to 32-bit ALU values 
-- * approach:    use a multiplexer to choose 32-bit values
-- *              created from smaller values
-- ********************************************************

-- library packages 
--   std_logic_1164: 9-valued logic signal voltages 
 
<< complete >> 

-- function block symbol 
-- IMM8 is the 8-bit arithmetic immediate field input
-- IMM12 is the 12-bit load-store immediate field input
-- IMM24 is the 24-bit branch immediate field input
-- EXTS selects the size of extension based on instruction
-- IMM32 is the extended constant output for use by the ALU
entity EXTENDER is 
port(IMM8:  in << complete >> ;
     IMM12: in << complete >> ;
     IMM24: in << complete >> ;
     EXTS:  in << complete >> ;
     IMM32: out << complete >>);
end << complete >> ;

-- circuit description 
architecture DATAFLOW of EXTENDER is 

   -- declare three internal 32-bit signals
   -- one signal per EXTS choice
   -- call them SIG_EXT8, SIG_EXT12, SIG_EXT24 
	
begin

   -- truth table 
   -- EXTS  SELECTS THIS IMM32 OUTPUT BEHAVIOR   
   -- *****************************************                                  
   -- 0     put zeros into the upper 24 bits of SIG_EXT8, 
   --       IMM8 into the lower 8-bits of SIG_EXT8
   -- 
   -- 1     put zeros into the upper 20 bits of SIG_EXT12,
   --       IMM12 into the lower 12 bits of SIG_EXT12
   -- 
   -- 2     put IMM24(23) into the upper 6 bits of SIG_EXT24, 
   --       put IMM24 into the next bits of SIG_EXT24
   --       put 00 into bits 1 and 0 of SIG_EXT24 
   --
   -- 3     unused: output IMM32 = 0
	
   -- create internal signals 
   SIG_EXT8 <= << complete >> ; 
	
	
   -- use a multiplexer to pass the correct internal signal
   -- to the output port 
   with EXTS select 
   IMM32 <= SIG_EXT8 when B"00",  -- data processing
	     << complete >> 		   -- load-store
	     << complete >> 		   -- branch
            << complete >> when others; -- reserved
   
 end architecture DATAFLOW;
