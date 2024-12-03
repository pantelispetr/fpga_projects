LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
ENTITY adder8bits IS
PORT (A, B: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
Ci: IN STD_LOGIC;
S: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
Co: OUT STD_LOGIC_VECTOR(7 downto 0));
END adder8bits;
------------------------------------------------
ARCHITECTURE structural OF adder8bits is
COMPONENT adder1bit
PORT (A, B: IN STD_LOGIC;
Ci: IN STD_LOGIC;
S: OUT STD_LOGIC;
Co: OUT STD_LOGIC);
END COMPONENT;

signal Cout_temp : STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN

block1: adder1bit port map(A=>A(0),B=>B(0),Ci=>Ci,S=>S(0),Co=>Cout_temp(0));

GEN_ADD: for I in 0 to 5 generate
	ADDER_BLOCK : adder1bit port map (A=>A(I+1),B=>B(I+1),Ci=>Cout_temp(I),S=>S(I+1),Co=>Cout_temp(I+1));
end generate GEN_ADD;

block2: adder1bit port map(A=>A(7),B=>B(7),Ci=>Cout_temp(6),S=>S(7),Co=>Cout_temp(7));

Co<=Cout_temp;

end structural;
