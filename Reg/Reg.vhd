library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;
	
entity Reg is
	port(
		clk		:	in std_logic;
		load		:	in std_logic;
		in_data	:	in std_logic_vector(7 downto 0);
		q			:	out std_logic_vector(7 downto 0)
	);
end Reg;

architecture BEH of Reg is

begin

	process(clk, load)
	begin
		if (load = '1') then
			if falling_edge (clk) then
				q <= in_data;
			end if;
		end if;
	end process;
end BEH;