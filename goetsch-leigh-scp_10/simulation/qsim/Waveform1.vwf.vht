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
-- Generated on "05/05/2024 20:40:45"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          system
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY system_vhd_vec_tst IS
END system_vhd_vec_tst;
ARCHITECTURE system_arch OF system_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL A3SEL : STD_LOGIC;
SIGNAL ALUF : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL ALUS : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL BRADDR : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL C : STD_LOGIC;
SIGNAL CLK : STD_LOGIC;
SIGNAL CPSRWR : STD_LOGIC;
SIGNAL DATAS : STD_LOGIC;
SIGNAL IBUS : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL LD0 : STD_LOGIC;
SIGNAL LD1 : STD_LOGIC;
SIGNAL LD2 : STD_LOGIC;
SIGNAL LEDS : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL MEMRD : STD_LOGIC;
SIGNAL MEMWR : STD_LOGIC;
SIGNAL N : STD_LOGIC;
SIGNAL PC4 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL PCSEL : STD_LOGIC;
SIGNAL REGWR : STD_LOGIC;
SIGNAL ROTSEL : STD_LOGIC;
SIGNAL SEG0 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL SEG1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL SEG2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL SEG3 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL SEG4 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL SEG5 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL SHAMTSEL : STD_LOGIC;
SIGNAL SLIDERS : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL SRC1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL SRC2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL SRC2SEL : STD_LOGIC;
SIGNAL SYSRST : STD_LOGIC;
SIGNAL V : STD_LOGIC;
SIGNAL WD4 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL WD4SEL : STD_LOGIC;
SIGNAL Z : STD_LOGIC;
COMPONENT system
	PORT (
	A3SEL : OUT STD_LOGIC;
	ALUF : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	ALUS : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	BRADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	C : OUT STD_LOGIC;
	CLK : IN STD_LOGIC;
	CPSRWR : OUT STD_LOGIC;
	DATAS : OUT STD_LOGIC;
	IBUS : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	LD0 : OUT STD_LOGIC;
	LD1 : OUT STD_LOGIC;
	LD2 : OUT STD_LOGIC;
	LEDS : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
	MEMRD : OUT STD_LOGIC;
	MEMWR : OUT STD_LOGIC;
	N : OUT STD_LOGIC;
	PC4 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	PCSEL : OUT STD_LOGIC;
	REGWR : OUT STD_LOGIC;
	ROTSEL : OUT STD_LOGIC;
	SEG0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	SEG1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	SEG2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	SEG3 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	SEG4 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	SEG5 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	SHAMTSEL : OUT STD_LOGIC;
	SLIDERS : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
	SRC1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	SRC2 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	SRC2SEL : OUT STD_LOGIC;
	SYSRST : IN STD_LOGIC;
	V : OUT STD_LOGIC;
	WD4 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	WD4SEL : OUT STD_LOGIC;
	Z : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : system
	PORT MAP (
-- list connections between master ports and signals
	A3SEL => A3SEL,
	ALUF => ALUF,
	ALUS => ALUS,
	BRADDR => BRADDR,
	C => C,
	CLK => CLK,
	CPSRWR => CPSRWR,
	DATAS => DATAS,
	IBUS => IBUS,
	LD0 => LD0,
	LD1 => LD1,
	LD2 => LD2,
	LEDS => LEDS,
	MEMRD => MEMRD,
	MEMWR => MEMWR,
	N => N,
	PC4 => PC4,
	PCSEL => PCSEL,
	REGWR => REGWR,
	ROTSEL => ROTSEL,
	SEG0 => SEG0,
	SEG1 => SEG1,
	SEG2 => SEG2,
	SEG3 => SEG3,
	SEG4 => SEG4,
	SEG5 => SEG5,
	SHAMTSEL => SHAMTSEL,
	SLIDERS => SLIDERS,
	SRC1 => SRC1,
	SRC2 => SRC2,
	SRC2SEL => SRC2SEL,
	SYSRST => SYSRST,
	V => V,
	WD4 => WD4,
	WD4SEL => WD4SEL,
	Z => Z
	);

-- SYSRST
t_prcs_SYSRST: PROCESS
BEGIN
	SYSRST <= '1';
	WAIT FOR 10000 ps;
	SYSRST <= '0';
	WAIT FOR 10000 ps;
	SYSRST <= '1';
	WAIT FOR 1220000 ps;
	SYSRST <= '0';
	WAIT FOR 40000 ps;
	SYSRST <= '1';
	WAIT FOR 720000 ps;
	SYSRST <= '0';
	WAIT FOR 80000 ps;
	SYSRST <= '1';
WAIT;
END PROCESS t_prcs_SYSRST;

-- CLK
t_prcs_CLK: PROCESS
BEGIN
LOOP
	CLK <= '0';
	WAIT FOR 10000 ps;
	CLK <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 5000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_CLK;
-- SLIDERS[9]
t_prcs_SLIDERS_9: PROCESS
BEGIN
	SLIDERS(9) <= '0';
WAIT;
END PROCESS t_prcs_SLIDERS_9;
-- SLIDERS[8]
t_prcs_SLIDERS_8: PROCESS
BEGIN
	SLIDERS(8) <= '0';
WAIT;
END PROCESS t_prcs_SLIDERS_8;
-- SLIDERS[7]
t_prcs_SLIDERS_7: PROCESS
BEGIN
	SLIDERS(7) <= '0';
WAIT;
END PROCESS t_prcs_SLIDERS_7;
-- SLIDERS[6]
t_prcs_SLIDERS_6: PROCESS
BEGIN
	SLIDERS(6) <= '0';
WAIT;
END PROCESS t_prcs_SLIDERS_6;
-- SLIDERS[5]
t_prcs_SLIDERS_5: PROCESS
BEGIN
	SLIDERS(5) <= '0';
WAIT;
END PROCESS t_prcs_SLIDERS_5;
-- SLIDERS[4]
t_prcs_SLIDERS_4: PROCESS
BEGIN
	SLIDERS(4) <= '0';
	WAIT FOR 2080000 ps;
	SLIDERS(4) <= '1';
	WAIT FOR 2880000 ps;
	SLIDERS(4) <= '0';
WAIT;
END PROCESS t_prcs_SLIDERS_4;
-- SLIDERS[3]
t_prcs_SLIDERS_3: PROCESS
BEGIN
	SLIDERS(3) <= '0';
	WAIT FOR 80000 ps;
	SLIDERS(3) <= '1';
	WAIT FOR 2000000 ps;
	SLIDERS(3) <= '0';
	WAIT FOR 1000000 ps;
	SLIDERS(3) <= '1';
	WAIT FOR 1880000 ps;
	SLIDERS(3) <= '0';
WAIT;
END PROCESS t_prcs_SLIDERS_3;
-- SLIDERS[2]
t_prcs_SLIDERS_2: PROCESS
BEGIN
	SLIDERS(2) <= '0';
	WAIT FOR 1080000 ps;
	SLIDERS(2) <= '1';
	WAIT FOR 2000000 ps;
	SLIDERS(2) <= '0';
	WAIT FOR 1000000 ps;
	SLIDERS(2) <= '1';
	WAIT FOR 880000 ps;
	SLIDERS(2) <= '0';
WAIT;
END PROCESS t_prcs_SLIDERS_2;
-- SLIDERS[1]
t_prcs_SLIDERS_1: PROCESS
BEGIN
	SLIDERS(1) <= '0';
	WAIT FOR 80000 ps;
	SLIDERS(1) <= '1';
	WAIT FOR 2000000 ps;
	SLIDERS(1) <= '0';
	WAIT FOR 2000000 ps;
	SLIDERS(1) <= '1';
	WAIT FOR 880000 ps;
	SLIDERS(1) <= '0';
WAIT;
END PROCESS t_prcs_SLIDERS_1;
-- SLIDERS[0]
t_prcs_SLIDERS_0: PROCESS
BEGIN
	SLIDERS(0) <= '0';
	WAIT FOR 1080000 ps;
	SLIDERS(0) <= '1';
	WAIT FOR 1000000 ps;
	SLIDERS(0) <= '0';
	WAIT FOR 1000000 ps;
	SLIDERS(0) <= '1';
	WAIT FOR 1000000 ps;
	SLIDERS(0) <= '0';
WAIT;
END PROCESS t_prcs_SLIDERS_0;
END system_arch;
