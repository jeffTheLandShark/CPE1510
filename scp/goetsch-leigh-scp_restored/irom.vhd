-- ******************************************************************
-- * project:	   scp
-- * filename:	   irom.vhd
-- * author:	   Leigh Goetsch
-- * date:	      MSOE Spring 2024
-- * provides:	   an instruction ROM for the CPE1510 processor
-- ******************************************************************

-- NOTE: THIS FILE IS GIVEN IN COMPLETE FORM. 
-- NOTE: THERE IS NO ADDITIONAL WORK FOR STUDENTS TO COMPLETE 
-- NOTE: Review for reference. 

-- use library packages
--  std_logic_1164: 9-valued logic signal voltages 
library ieee;
use ieee.std_logic_1164.all;


-- function block symbol
-- inputs: 
--    ADDR  : 32-bit address requesting instruction 
-- outputs: 
--    Q     : 32-bit output of machine code instruction 
-- notes    : ROMs do not reset on power-up so no reset signal 
--          : ROMs do not load in user mode so no load signal  
entity IROM is 
port(ADDR  : in std_logic_vector(31 downto 0);
     Q     : out std_logic_vector(31 downto 0));
end entity IROM;

-- circuit description 
architecture MULTIPLEXER of IROM is 
begin

  -- use address to output correct binary machine code number 
  with ADDR select 
  Q <= X"E3A0_800A" when X"0000_0000",  -- mov r8,#10
       X"E3A0_9000" when X"0000_0004",  -- mov r9,#0
       X"E358_0000" when X"0000_0008", 	-- cmp r8,#0
       X"0A00_000B" when X"0000_000C", 	-- beq 0x00000040
       X"E089_9008" when X"0000_0010", 	-- add r9,r9,r8
       X"E248_8001" when X"0000_0014", 	-- sub r8,r8,#1
       X"E358_0000" when X"0000_0018", 	-- cmp r8,#0
       X"1AFF_FFF9" when X"0000_001C", 	-- bne 0x00000008
       X"E3A0_A000" when X"0000_0020", 	-- mov r10,#0
       X"E24A_A020" when X"0000_0024",  -- sub r10,r10,#32
       X"E009_A00A" when X"0000_0028", 	-- and r10,r9,r10
       X"E35A_0000" when X"0000_002C", 	-- cmp r10,#0
       X"0A00_0002" when X"0000_0030", 	-- beq 0x00000040
       X"E3A0_B001" when X"0000_0034", 	-- mov r11,#1
       X"E3A0_C004" when X"0000_0038", 	-- mov r12,#4
       X"E58C_B000" when X"0000_003C", 	-- str r11,[r12]
       X"E59C_6000" when X"0000_0040", 	-- ldr r6,[r12]
       X"EAFF_FFFD" when others;        -- b 0x00000040
  


 end architecture MULTIPLEXER;