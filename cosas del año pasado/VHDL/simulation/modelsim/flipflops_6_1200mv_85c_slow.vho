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

-- DATE "10/02/2023 10:49:14"

-- 
-- Device: Altera EP4CGX15BF14C6 Package FBGA169
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	flipflops IS
    PORT (
	D : IN std_logic;
	CLK : IN std_logic;
	set : IN std_logic;
	rst : IN std_logic;
	Q : BUFFER std_logic
	);
END flipflops;

-- Design Ports Information
-- Q	=>  Location: PIN_N6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- set	=>  Location: PIN_N4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_N11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D	=>  Location: PIN_L4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLK	=>  Location: PIN_M4,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF flipflops IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_D : std_logic;
SIGNAL ww_CLK : std_logic;
SIGNAL ww_set : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_Q : std_logic;
SIGNAL \Q~output_o\ : std_logic;
SIGNAL \set~input_o\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \Q~1_combout\ : std_logic;
SIGNAL \CLK~input_o\ : std_logic;
SIGNAL \D~input_o\ : std_logic;
SIGNAL \Q~3_combout\ : std_logic;
SIGNAL \Q~0_combout\ : std_logic;
SIGNAL \Q~reg0_emulated_q\ : std_logic;
SIGNAL \Q~2_combout\ : std_logic;
SIGNAL \ALT_INV_Q~0_combout\ : std_logic;

BEGIN

ww_D <= D;
ww_CLK <= CLK;
ww_set <= set;
ww_rst <= rst;
Q <= ww_Q;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_Q~0_combout\ <= NOT \Q~0_combout\;

-- Location: IOOBUF_X12_Y0_N2
\Q~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Q~2_combout\,
	devoe => ww_devoe,
	o => \Q~output_o\);

-- Location: IOIBUF_X10_Y0_N8
\set~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_set,
	o => \set~input_o\);

-- Location: IOIBUF_X26_Y0_N1
\rst~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: LCCOMB_X8_Y1_N6
\Q~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Q~1_combout\ = (!\rst~input_o\ & ((\set~input_o\) # (\Q~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \set~input_o\,
	datac => \rst~input_o\,
	datad => \Q~1_combout\,
	combout => \Q~1_combout\);

-- Location: IOIBUF_X8_Y0_N1
\CLK~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLK,
	o => \CLK~input_o\);

-- Location: IOIBUF_X8_Y0_N8
\D~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D,
	o => \D~input_o\);

-- Location: LCCOMB_X8_Y1_N0
\Q~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Q~3_combout\ = \Q~1_combout\ $ (\D~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Q~1_combout\,
	datad => \D~input_o\,
	combout => \Q~3_combout\);

-- Location: LCCOMB_X8_Y1_N20
\Q~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Q~0_combout\ = (\rst~input_o\) # (\set~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rst~input_o\,
	datad => \set~input_o\,
	combout => \Q~0_combout\);

-- Location: FF_X8_Y1_N1
\Q~reg0_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \Q~3_combout\,
	clrn => \ALT_INV_Q~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Q~reg0_emulated_q\);

-- Location: LCCOMB_X8_Y1_N2
\Q~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Q~2_combout\ = (!\rst~input_o\ & ((\set~input_o\) # (\Q~1_combout\ $ (\Q~reg0_emulated_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Q~1_combout\,
	datab => \Q~reg0_emulated_q\,
	datac => \rst~input_o\,
	datad => \set~input_o\,
	combout => \Q~2_combout\);

ww_Q <= \Q~output_o\;
END structure;


