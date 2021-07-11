library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;
	
entity Program_Memory is
	port(
		nRst			: in 	std_logic;
		clk			: in 	std_logic;
		address_bus	: in 	std_logic_vector(15 downto 0);
		data_bus		: out std_logic_vector(7 downto 0)
	);
end Program_Memory;

architecture BEH of Program_Memory is

	type	mem_array is array (0 to 31) of std_logic_vector(7 downto 0);
	signal mem : mem_array;
	
begin
	
		process(nRst, clk, address_bus)
			variable index	: integer range 0 to 31 := 0;
		begin
			if(nRst = '0') then
				mem(0)	<= "01000000";	--LD R1
				mem(1)	<= "00001010";	--Data 10
				mem(2)	<= "01010000";	--LD R2
				mem(3)	<= "00000101";	--Data 5
				mem(4)	<= "11000000";	--Add 
				
				mem(5)	<= "01000000"; --LD R1
				mem(6)	<= "00001111";	--Data 15
				mem(7)	<= "01010000";	--LD R2
				mem(8)	<= "00000110";	--Data 6
				mem(9)	<= "11000001";	--Sub
				
				mem(10) 	<= "01000000"; --LD R1
				mem(11)	<= "00000111";	--Data 7
				mem(12)	<= "01010000";	--LD R2
				mem(13)	<= "00000001";	--Data 1
				mem(14)	<= "11000010";	--AND
				
				mem(15)	<= "01000000";	--LD R1
				mem(16)	<= "00001000";	--Data 8
				mem(17)	<= "01010000";	--LD R2
				mem(18)	<=	"00000111";	--Data 7
				mem(19)	<= "11000011";	--OR
			elsif rising_edge(clk) then
				index 	:= conv_integer(address_bus(4 downto 0));
				data_bus <= mem(index);
			end if;
		end process;
		
end BEH;