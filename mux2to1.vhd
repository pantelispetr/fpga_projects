library ieee;
use ieee.std_logic_1164.all; 

entity mux2to1 is
  port (A, B: STD_LOGIC_VECTOR(7 downto 0); 
	S : in STD_LOGIC;
     Z : out STD_LOGIC_VECTOR(7 downto 0)); 
end mux2to1;

architecture behaviour of mux2to1 is 
begin
  process (A, B, S)
  begin
    if S = '0' then
	Z <= A;
    else
     	Z <= B;
    end if;
  end process;
end behaviour;