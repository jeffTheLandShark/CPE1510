-- ******************************************************************
-- * project:	   scp
-- * filename:	   alu.vhd
-- * author:	   << insert your name here >> 
-- * date:	   MSOE Spring 2024
-- * provides:	   32-bit ALU for the CPE1510 ARM processor
-- ******************************************************************
-- * alus: 0=+, 1=-, 2=and, 3=or, 4=xor, 5=pass A, 6=pass B, 7= not B
-- ******************************************************************

-- library packages
--   std_logic_1164: 9-valued logic signal voltages 
--   numeric_std: unsigned, type conversions 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- function block symbol
-- A, B, and F are 32-bit voltage vectors
-- S is a 3-bit voltage vector selecting a particular function
-- C, V, N, and Z are single output voltages
entity ALU is 
port(A:		in std_logic_vector(31 downto 0);
     B:		<< complete >> 
     S:         << complete >>
     F:		<< complete >> 
     C,V,N,Z: out std_logic);
end entity ALU;


-- internal circuit  
architecture DATAFLOW of ALU is 

  -- 32-bit addition results in carry-out to column 32. 
  -- use 33-bit unsigned number to store that extra carry-out bit
  
  -- signed and unsigned matter when doing comparison 
  -- ALU doesn't do comparison; type unsigned is fine  
  
  signal INTA: unsigned(32 downto 0);
  signal INTB: << complete unsigned type declaration >> 
  signal INTF: << complete unsigned type declaration >> 
  
  -- overflow occurs when two positives add to a negative 
  -- overflow occurs when two negatives add to a positive 
  -- overflow occurs when negative minus positive gives positive 
  -- overflow occurs when positive minus negative gives negative 
  -- use internal signal and create logic equation  
  signal INTV: std_logic;
  
begin

  -- connect INTA and INTB to the inputs 
  INTA(32) <= '0';
  INTA(31 downto 0) <= unsigned(A);
  INTB(32) <= '0';
  INTB(31 downto 0) <= << complete type cast of input B>> ;
  
  -- complete the arithmetic and logic 
  -- numeric_std defines +, -, etc. on unsigned type
  with S select 
  INTF <= INTA+INTB when B"000", 		-- addition 
          << complete >> when B"001", 	-- subtraction 
  	   << complete 2 through 6>>, 	-- complete all others
	   33X"1" when others; 		-- constant 1 as 33-bit hex
				
			 		 
  -- typecast the lower 32-bits of the unsigned to the
  -- output as a std_logic_vector: hint use 31 downto 0
  F <= std_logic_vector(<< complete this type cast >>)
  
  -- create the std_logic flag bits to announce particular result events
  C <= std_logic(<< complete type cast of bit 32 >>) -- the carry out to column 32
   
  N <= << complete type cast of bit 31 >> -- negative is just MSB of 32-bit result 
  
  Z <= << complete >> -- '1' when internal 32-bit unsigned = 0
  
  -- COMPLETE the truth table for signed overflow
  --   overflow occurs when two positives add to a negative 
  --   overflow occurs when two negatives add to a positive 
  --   overflow occurs when negative minus positive gives positive 
  --   overflow occurs when positive minus negative gives negative 
  --   remember that the sign bit of each number is is bit 31 
  --
  -- COMPLETE TRUTH TABLE BY FILLING IN VALUES FOR V 
  -- USING SELECT SIGNAL S(0) TO DIFFERENTIATE BETWEEN ADD AND SUBTRACT
  -- 
  -- S(0) INTA(31) INTB(31) INTF(31) | V   COMPLETE COMMENTS BEHIND V ALSO
  -- ------------------------------------
  -- 0    0        0        0        | 0   + plus + = +
  -- 0    0        0        1        | 1   + plus + = -
  -- 0    0        1        0        | 0   + plus - = + 
  -- 0    0        1        1        |    
  -- 0    1        0        0        |    
  -- 0    1        0        1        |    
  -- 0    1        1        0        |    
  -- 0    1        1        1        |    
  -- 
  -- 1    0        0        0        | 0   + minus + = +
  -- 1    0        0        1        | 0   + minus + = -
  -- 1    0        1        0        | 0   + minus - = + 
  -- 1    0        1        1        |  
  -- 1    1        0        0        | 
  -- 1    1        0        1        | 
  -- 1    1        1        0        | 
  -- 1    1        1        1        | 
  
  
  -- implement V as a canonical logic equation pulled from 
  -- your truth table. bits of unsigned work like logic bits so 
  -- typecasting is not needed. 
  V <= (not S(0) and not INTA(31) and not INTB(31) and INTF(31)) or -- minterm 1
                                                                    -- COMPLETE minterms
  
end architecture DATAFLOW;
