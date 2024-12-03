library ieee;
use ieee.std_logic_1164.all;

package alulib is

component mux2to1
  port (A, B: STD_LOGIC_VECTOR(7 downto 0); 
	S : in STD_LOGIC;
     Z : out STD_LOGIC_VECTOR(7 downto 0)); 
end component mux2to1;

component mux4to1
port(A,B,C,D : in STD_LOGIC_VECTOR(7 downto 0);
     S0,S1: in STD_LOGIC;
     Z: out STD_LOGIC_VECTOR(7 downto 0)
  );
end component mux4to1;

component adder8bit
port (A, B: in STD_LOGIC_VECTOR(7 downto 0);
Ci: in STD_LOGIC;
S: out STD_LOGIC_VECTOR(7 downto 0);
Co: out STD_LOGIC_VECTOR(7 downto 0));
end component adder8bit;

end package alulib;