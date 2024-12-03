LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY adder1bit IS
PORT (A, B: IN STD_LOGIC;
Ci: IN STD_LOGIC;
S: OUT STD_LOGIC;
Co: OUT STD_LOGIC);
END adder1bit;
------------------------------------------------
ARCHITECTURE adder_rtl OF adder1bit IS
SIGNAL xor_out, and1_out, and2_out : STD_LOGIC; 
BEGIN
xor_out <= A XOR B; 
and1_out <= A AND B; 
and2_out <= Ci AND xor_out; 
S <= xor_out XOR Ci; 
Co <= and1_out OR and2_out; 
END adder_rtl;