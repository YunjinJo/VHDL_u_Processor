library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;
	
entity Program_Counter is
	port(
		nRst	: in std_logic;
		clk	: in std_logic;
		Address	: out std_logic_vector(15 downto 0)
	);
end Program_Counter;

architecture BEH of Program_Counter is
	signal sig_Address : std_logic_vector(15 downto 0);

begin

	process(nRst, clk)
	begin
		if(nRst = '0') then
			sig_Address <= (others => '0');
		
		elsif rising_edge(clk) then
			sig_Address <= sig_Address + 1;
		
		end if;
	end process;
	
	Address <= sig_Address;
	
end BEH;
		