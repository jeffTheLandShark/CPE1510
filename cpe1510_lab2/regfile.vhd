-- ******************************************************************
-- * project:	   regfile
-- * filename:	   regfile.vhd
-- * author:	   << insert your name here >> 
-- * date:	      MSOE Spring 2024
-- * provides:	   a register file for the CPE1510 processor
-- ******************************************************************

-- use library packages
--  std_logic_1164: 9-valued logic signal voltages  
<< complete>>


-- function block symbol
-- inputs: 
--    A1,A2,A3: 4-bit addresses specifying output registers RD1, RD2, and RD3
--    A4      : 4-bit address specifying register to write WD4 data into 
--    WD4     : 32-bit data to be stored in register addressed by A4 
--    REGWR   : control signal to determine if input WD4 data gets stored 
--    RST     : active-low synchronous reset signal
--    CLK     : clock for synchronized register behavior 
-- outputs: 
--    RD1     : 32-bit output from register specified by address A1 
--    RD2     : 32-bit output from register specified by address A2
--    RD3     : 32-bit output from register specified by address A3 
entity REGFILE is 
<< complete >> 
end entity REGFILE;

-- circuit description 
architecture BEHAVIORAL of REGFILE is 
   -- declare 16 internal signals that will become register outputs
   signal R0: std_logic_vector(31 downto 0); 
   signal R9: std_logic_vector(31 downto 0);
   << complete >> 
	
begin

  -- use A1, A2, and A3 to control three multiplexers choosing
  -- outputs RD1, RD2, and RD3
  with A1 select 
  RD1 <= R0 when B"0000", 
         << complete >>  
         
  with A2 select 
  RD2 <= R0 when B"0000", 
         R1 when B"0001", 
         << complete >> 
         
  with A3 select 
  RD3 <= R0 when B"0000", 
         R1 when B"0001", 
         R2 when B"0010", 
         << complete >> 
         
  -- implement sixteen registers with active-low synchronous reset 
  -- and active-low synchronous load 
  reg0: process(rst,clk) 
  begin 
    if rising_edge(clk) then 
      if RST = '0' then R0 <= X"00000000"; 
      elsif REGWR = '0' then 
        if A4 = B"0000" then R0 <= WD4; 
        end if;
      end if;
    end if;
  end process;    
    
  << complete >> 
  
  reg15: process(rst,clk) 
  begin 
    if rising_edge(clk) then 
      if RST = '0' then R15 <= X"00000000"; 
      elsif REGWR = '0' then 
        if A4 = B"1111" then R15 <= WD4; 
        end if;
      end if;
    end if;
  end process;
  
end architecture BEHAVIORAL;
