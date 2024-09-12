-- *********************************************************************
-- project:	scp
-- filename:	pc.vhd
-- author:	<< insert your name here >> 
-- date:	MSOE Spring 2024
-- provides:	a 32-bit wide PC register with active-low reset and load
-- *********************************************************************

-- use library packages
--  std_logic_1164: 9-valued logic signal voltages 
<< complete >> 


-- function block symbol
-- inputs:
--   D is a 32-bit input number for storage 
--   LD is an active-low load control signal 
--   RST is an active-low synchronous reset signal 
--   CLK is a rising-edge triggered clock 
-- outputs
--   Q is a 32-bit stored output number

-- HINT: This is just a register. 
-- HINT: The design is a single process.


entity PC is 
port(D: in std_logic_vector(31 downto 0);
     LD: in std_logic; 
     RST: in std_logic;
     CLK: in std_logic;
     Q: out std_logic_vector(31 downto 0));
end entity PC;

-- circuit description 
architecture BEHAVIORAL of PC is 
begin

  reg: process(LD, RST, CLK)
  begin
   << complete >> 

  end process reg;
  
end architecture BEHAVIORAL;