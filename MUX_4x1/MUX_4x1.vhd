library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;
	
entity MUX_4x1 is
	port(
		sel	:	in std_logic_vector(1 downto 0);
		reg1	:	in	std_logic_vector(7 downto 0);
		reg2	:	in	std_logic_vector(7 downto 0);
		reg3	:	in	std_logic_vector(7 downto 0);
		reg4	:	in	std_logic_vector(7 downto 0);
		Q		:	out std_logic_vector(7 downto 0)
	);
end MUX_4x1;

architecture BEH of MUX_4x1 is

begin
	Q <=	reg1 when sel = "00" else
			reg2 when sel = "01" else
			reg3 when sel = "10" else
			reg4 when sel = "11" else
			(others => '0');
end BEH;