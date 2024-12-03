library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.alulib.all;

entity alu is
generic (n : integer := 8);
port ( ac : in std_logic_vector(n-1 downto 0);
 db : in std_logic_vector(n-1 downto 0);
 alus : in std_logic_vector(7 downto 1);
 dout : out std_logic_vector(n-1 downto 0));
end alu ;

architecture arch of alu is

signal not_bus , mux2to1_out ,mux3to1_out, mux4to1_out, adder8bit_out : std_logic_vector(7 downto 0);

signal and_out,e, nor_out , xor_out, not_out : std_logic_vector(7 downto 0);

begin
not_bus<= not db;
and_out<=ac and db;
nor_out<=ac nor db;
xor_out<=ac xor db;
not_bus<= not ac;
e<="00000000";


block1: mux2to1 port map
		(A=>e,B=>ac,S=>alus(1),Z=>mux2to1_out);
block2: mux4to1 port map
		(A=>e,B=>db,C=>not_bus,D=>e,S0=>alus(3),S1=>alus(2),Z=>mux3to1_out);
block3: adder8bit port map
		(A=>mux2to1_out,B=>mux3to1_out,Ci=>alus(4),Co=>adder8bit_out);
block4: mux4to1 port map
		(A=>and_out,B=>nor_out,C=>xor_out,D=>not_out,S0=>alus(6),S1=>alus(5),Z=>mux4to1_out);
block5: mux2to1 port map
		(A=>adder8bit_out,B=>mux4to1_out,S=>alus(7),Z=>dout);





end arch;