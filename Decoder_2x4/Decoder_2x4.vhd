library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;
	
entity Decoder_2x4 is
	port(
		SEL	:	in std_logic_vector(1 downto 0);
		A		:	out std_logic;
		B		:	out std_logic;
		C		:	out std_logic;
		D		:	out std_logic
	);
end Decoder_2x4;

architecture BEH of Decoder_2x4 is
begin

	A <= '1' when SEL = "00" else '0';
	B <= '1' when SEL = "01" else '0';
	C <= '1' when SEL = "10" else '0';
	D <= '1' when SEL = "11" else '0';

end BEH;

	