-- ******************************************************************
-- project:	scp
-- filename:	cpsr.vhd
-- author:	<< insert your name here >> 
-- date:	MSOE Spring 2024
-- provides:	a 4-bit wide CPSR register with active-low RST and LD
-- ******************************************************************

-- use library packages
--  std_logic_1164: 9-valued logic signal voltages 
<< complete >>

-- function block symbol
-- inputs:
--   D3,D2,D1,D0 are input bits for storage 
--   LD is an active-low load control signal 
--   RST is an active-low synchronous reset signal 
--   CLK is a rising-edge triggered clock 
-- outputs
--   Q3,Q2,Q1,Q0 are stored output bits
--   do not convert to bus! see reference diagrams
entity CPSR is 
port(D3, D2, D1, D0: in std_logic;
     LD: in std_logic; 
     RST: in std_logic;
     CLK: in std_logic;
     Q3, Q2, Q1, Q0: out std_logic);
end entity CPSR;

-- circuit description 
architecture BEHAVIORAL of CPSR is 
begin

  reg: process(LD, RST, CLK)
  begin
    if RST='0' then Q3<='0'; Q2<='0'; << complete >> 
    elsif rising_edge(CLK) then 
      if LD='0' then Q3<=D3; Q2<=D2; << complete >> 
      end if ;
    end if;
  end process reg;
  
end architecture BEHAVIORAL;