-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "09/07/2024 10:47:06"

-- 
-- Device: Altera EP4CGX15BF14C6 Package FBGA169
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIV;
LIBRARY IEEE;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	ej2tp2a IS
    PORT (
	H : IN std_logic;
	K : IN std_logic;
	L : IN std_logic;
	T : OUT std_logic
	);
END ej2tp2a;

-- Design Ports Information
-- T	=>  Location: PIN_M4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- K	=>  Location: PIN_N6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- H	=>  Location: PIN_C6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- L	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF ej2tp2a IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_H : std_logic;
SIGNAL ww_K : std_logic;
SIGNAL ww_L : std_logic;
SIGNAL ww_T : std_logic;
SIGNAL \T~output_o\ : std_logic;
SIGNAL \K~input_o\ : std_logic;
SIGNAL \L~input_o\ : std_logic;
SIGNAL \H~input_o\ : std_logic;
SIGNAL \T~0_combout\ : std_logic;

BEGIN

ww_H <= H;
ww_K <= K;
ww_L <= L;
T <= ww_T;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X8_Y0_N2
\T~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \T~0_combout\,
	devoe => ww_devoe,
	o => \T~output_o\);

-- Location: IOIBUF_X12_Y0_N1
\K~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_K,
	o => \K~input_o\);

-- Location: IOIBUF_X14_Y31_N8
\L~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_L,
	o => \L~input_o\);

-- Location: IOIBUF_X14_Y31_N1
\H~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_H,
	o => \H~input_o\);

-- Location: LCCOMB_X12_Y18_N0
\T~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \T~0_combout\ = (\K~input_o\ & ((\H~input_o\) # (!\L~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \K~input_o\,
	datac => \L~input_o\,
	datad => \H~input_o\,
	combout => \T~0_combout\);

ww_T <= \T~output_o\;
END structure;


