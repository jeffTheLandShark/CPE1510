-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "05/05/2024 20:40:06"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          scp
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY scp_vhd_vec_tst IS
END scp_vhd_vec_tst;
ARCHITECTURE scp_arch OF scp_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL A3SEL : STD_LOGIC;
SIGNAL ALUF : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL ALUS : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL BRADDR : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL C : STD_LOGIC;
SIGNAL CLK : STD_LOGIC;
SIGNAL CPSRWR : STD_LOGIC;
SIGNAL IBUS : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL MEMRD : STD_LOGIC;
SIGNAL MEMWR : STD_LOGIC;
SIGNAL N : STD_LOGIC;
SIGNAL PC4 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL PCSEL : STD_LOGIC;
SIGNAL REGWR : STD_LOGIC;
SIGNAL ROTSEL : STD_LOGIC;
SIGNAL RST : STD_LOGIC;
SIGNAL SHAMTSEL : STD_LOGIC;
SIGNAL SRC1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL SRC2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL SRC2SEL : STD_LOGIC;
SIGNAL V : STD_LOGIC;
SIGNAL WD4 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL WD4SEL : STD_LOGIC;
SIGNAL Z : STD_LOGIC;
COMPONENT scp
	PORT (
	A3SEL : OUT STD_LOGIC;
	ALUF : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	ALUS : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	BRADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	C : OUT STD_LOGIC;
	CLK : IN STD_LOGIC;
	CPSRWR : OUT STD_LOGIC;
	IBUS : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	MEMRD : OUT STD_LOGIC;
	MEMWR : OUT STD_LOGIC;
	N : OUT STD_LOGIC;
	PC4 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	PCSEL : OUT STD_LOGIC;
	REGWR : OUT STD_LOGIC;
	ROTSEL : OUT STD_LOGIC;
	RST : IN STD_LOGIC;
	SHAMTSEL : OUT STD_LOGIC;
	SRC1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	SRC2 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	SRC2SEL : OUT STD_LOGIC;
	V : OUT STD_LOGIC;
	WD4 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	WD4SEL : OUT STD_LOGIC;
	Z : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : scp
	PORT MAP (
-- list connections between master ports and signals
	A3SEL => A3SEL,
	ALUF => ALUF,
	ALUS => ALUS,
	BRADDR => BRADDR,
	C => C,
	CLK => CLK,
	CPSRWR => CPSRWR,
	IBUS => IBUS,
	MEMRD => MEMRD,
	MEMWR => MEMWR,
	N => N,
	PC4 => PC4,
	PCSEL => PCSEL,
	REGWR => REGWR,
	ROTSEL => ROTSEL,
	RST => RST,
	SHAMTSEL => SHAMTSEL,
	SRC1 => SRC1,
	SRC2 => SRC2,
	SRC2SEL => SRC2SEL,
	V => V,
	WD4 => WD4,
	WD4SEL => WD4SEL,
	Z => Z
	);

-- RST
t_prcs_RST: PROCESS
BEGIN
	RST <= '0';
	WAIT FOR 30000 ps;
	RST <= '1';
WAIT;
END PROCESS t_prcs_RST;

-- CLK
t_prcs_CLK: PROCESS
BEGIN
LOOP
	CLK <= '0';
	WAIT FOR 5000 ps;
	CLK <= '1';
	WAIT FOR 5000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_CLK;
END scp_arch;
