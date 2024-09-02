-- ********************************************************
-- * project:     scp
-- * filename:    control.vhd
-- * author:      Leigh Goetsch
-- * date:        MSOE Spring 2024
-- * provides:    a control circuit for the ARMv4 ISA
-- *              instructions implemented in the CPE1510
-- *              single-cycle processor
-- * approach:    use when-else statements 
-- ********************************************************

-- use library packages 
-- std_logic_1164: 9-valued logic signal voltages 
library ieee; 
use ieee.std_logic_1164.all;

-- functional block symbol
-- inputs
--    IBUS is the upper 12-bits of the 32-bit machine code
--    BIT4 is ibus bit 4 used to identify register-shifted register mode
--    C,V,N,Z are the condition code flags from the CPSR
-- outputs 
--    PCSEL:   0 = BranchAddress    1 = PC+4
--    A3SEL:   0 = Rs               1 = Rd 
--    ROTSEL:  0 = ROTATE field	   1 = constant 0
--    SHAMTSEL:0 = SHAMT field	   1 = RS output lower five bits
--    SRC2SEL: 0 = SHIFTED RM	      1 = immediate
--    REGWR:   0 = Regfile Write    1 = Regfile does not write 
--    ALUS:    0 = ADD              1 = SUB
--             2 = AND              3 = OR
--             4 = XOR              5 = A
--             6 = B                7 = 0X00000001
--    CSPRWR:  0 = CPSR Write       1 = CPSR does not write 
--    MEMWR:   0 = Mem Write (STR)  1 = not an STR
--    MEMRD:   0 = Mem Read (LDR)   1 = not an LDR
--    WD4SEL:  0 = Data Mem Value   1 = ALU Value

entity CONTROL is 
port(IBUS:     in  std_logic_vector(31 downto 20);
     BIT4:     in  std_logic;
     C,V,N,Z:  in  std_logic;
     PCSEL:    out std_logic; 
     A3SEL:    out std_logic; 
     ROTSEL:   out std_logic; 
     SHAMTSEL: out std_logic;
     SRC2SEL:  out std_logic;
     REGWR:    out std_logic;
     ALUS:     out std_logic_vector(2 downto 0);
     CPSRWR:   out std_logic; 
     MEMWR:    out std_logic;
     MEMRD:    out std_logic;
     WD4SEL:   out std_logic);
end entity CONTROL;

-- circuit description 
architecture DATAFLOW of CONTROL is 
   -- declare signals for the IBUS bit fields 
   -- data processing 
   signal COND :  std_logic_vector(3 downto 0);
   signal OPCODE: std_logic_vector(1 downto 0);
   signal I: 		std_logic;
   signal CMD: 	std_logic_vector(3 downto 0);
   signal S: 		std_logic;
   -- load-store
   signal IBAR: 	std_logic;
   signal PUBW: 	std_logic_vector(3 downto 0);
   signal L: 		std_logic;
   -- branch 
   signal BL: 		std_logic; -- the branch L bit is a different bit than memory L
   
begin

   -- assign IBUS bits to internal signals 
   COND 		<= IBUS(31 downto 28);
   OPCODE 	<= IBUS(27 downto 26) ;
   I 			<= IBUS(25);
   CMD 		<= IBUS(24 downto 21);
   S 			<= IBUS(20);
   IBAR 		<= IBUS(25);
   PUBW 		<= IBUS(24 downto 21);
   L 			<= IBUS(20); -- memory instruction L bit
   BL 		<= IBUS(24); -- branch instruction L bit
   
   -- write output equations using when-else syntax 
   -- include rows from data processing, load-store, and branch truth tables
	
	--    PCSEL:   0 = BranchAddress    1 = PC+4
   PCSEL <= '0' when COND=X"0" and OPCODE=B"10" and BL='0' and Z='1' else -- beq taking branch
            '0' when COND=X"1" and OPCODE=B"10" and BL='0' and Z='0' else -- bne taking branch 
            '0' when COND=X"E" and OPCODE=B"10" and BL='0' and Z='1' else -- branch always 
            '0' when COND=X"E" and OPCODE=B"10" and BL='0' and Z='0' else -- branch always
            '1'; -- PC+4 for all other instructions 
	
	--    A3SEL:   0 = Rs               1 = Rd 
   A3SEL <= '1' when COND=X"E" and OPCODE=B"01" and PUBW=X"C" and L='0' 	else  	--STR (Rd)
				'0' when COND=X"E" and OPCODE=B"00" and I='0' 	  and BIT4='1' else 		--(Rs)
				'0';
	
   --    ROTSEL:  0 = ROTATE field	   1 = constant 0
   ROTSEL <= 	'0' when OPCODE=B"00" and I='1' else --imm
					'1';
					
	--    SHAMTSEL:0 = SHAMT field	   1 = RS output lower five bits
		SHAMTSEL <= '1' when I = '0' and BIT4 = '1' else --rsr 
						'0';
		
   --    REGWR:   0 = Regfile Write    1 = Regfile does not write 		
   REGWR <= 	'1' when COND=X"E" and OPCODE=B"00" and S='1' else --CMN and CMP
					'1' when COND=X"E" and OPCODE=B"01" and L='0' else --STR
					'1' when OPCODE=B"10" else --branches
					'0';
   
	--    SRC2SEL: 0 = SHIFTED RM	      1 = immediate
   SRC2SEL <= 	'1' when I or IBAR else 
					'0';
					
   --    ALUS:    0 = ADD              1 = SUB
	--             2 = AND              3 = OR
	--             4 = XOR              5 = A
	--             6 = B                7 = 0X00000001      
   ALUS <= 	B"000" when OPCODE=B"00" and (CMD=X"4" or CMD=X"B") else --ADD (add and cmp not)
				B"001" when OPCODE=B"00" and (CMD=X"2" or CMD=X"A") else --SUB (sub and cmp)
				B"010" when OPCODE=B"00" and CMD=X"0" else --AND
				B"011" when OPCODE=B"00" and CMD=X"C" else --ORR
				B"100" when OPCODE=B"00" and CMD=X"1" else --XOR
--				B"101" when OPCODE=B"00" and CMD=X"" else --A (is not used)
				B"110" when OPCODE=B"00" and CMD=X"D" else --B (shifts and mov)
				B"111" when OPCODE=B"00" and CMD=X"F" else -- 0X00000001 (not)
				B"000"; --default and
			
	--    CSPRWR:  0 = CPSR Write       1 = CPSR does not write 
   CPSRWR <= 	'0' when COND=X"E" and OPCODE=B"00" and S='1' else --CMN and CMP
					'1';
         
	--    MEMWR:   0 = Mem Write (STR)  1 = not an STR
   MEMWR <= '0' when COND=X"E" and OPCODE=B"01" and PUBW=X"C" and L='0' else --STR
				'1';
      
   --    MEMRD:   0 = Mem Read (LDR)   1 = not an LDR      
   MEMRD <= '0' when COND=X"E" and OPCODE=B"01" and IBAR='0' and PUBW=X"C" and L='1' else -- LDR
            '1'; -- all other instructions are not reading from memory
          
	--    WD4SEL:  0 = Data Mem Value   1 = ALU Value  		 
   WD4SEL <= '0' when COND=X"E" and OPCODE=B"01" and PUBW=X"C" and L='1' else -- LDR
             '1'; -- all other instructions are not reading from memory
              
end architecture DATAFLOW;