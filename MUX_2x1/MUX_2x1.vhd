library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;
	
entity MUX_2x1 is
	port(
		sel	:	in std_logic;
		A		:	in	std_logic_vector(7 downto 0);
		B		:	in	std_logic_vector(7 downto 0);
		Q		:	out std_logic_vector(7 downto 0)
	);
end MUX_2x1;

architecture BEH of MUX_2x1 is

begin
	Q <=	A when sel = '0' else
			B when sel = '1' else
			(others => '0');
end BEH;