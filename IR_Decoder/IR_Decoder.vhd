library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;
	
entity IR_Decoder is
	port(
		clk		:	in std_logic;
		nRst		:	in std_logic;
		Data_Bus	:	in std_logic_vector(7 downto 0);
		SEL_A		:	out std_logic_vector(1 downto 0);
		SEL_B		:	out std_logic_vector(1 downto 0);
		SEL_D		:	out std_logic_vector(1 downto 0);
		ALU_OP	:	out std_logic_vector(1 downto 0);
		Bus_Sel	:	out std_logic
	);
end IR_Decoder;

architecture BEH of IR_Decoder is

begin

	process(clk, nRst)
	begin
		if(nRst = '0') then
			SEL_A		<= "ZZ";
			SEL_B		<= "ZZ";
			SEL_D		<= "ZZ";
			ALU_OP	<= "ZZ";
			BUS_Sel	<= 'Z';
			
		elsif rising_edge(clk) then
			if(Data_Bus(7 downto 6) = "01") then  --LD 동작
				SEL_A		<= "ZZ";
				SEL_B		<= "ZZ";
				SEL_D		<= Data_Bus(5 downto 4);
				ALU_OP	<= "ZZ";
				BUS_Sel	<= '0';
				
			elsif(Data_Bus(7 downto 6) = "11") then  --ALU_OP
				SEL_A		<= "00";
				SEL_B		<= "01";
				SEL_D		<= "00";
				ALU_OP	<= Data_Bus(1 downto 0);
				BUS_Sel	<= '1';
				
			else
				SEL_A		<= "ZZ";
				SEL_B		<= "ZZ";
				SEL_D		<= "ZZ";
				ALU_OP	<= "ZZ";
				BUS_Sel	<= '0';
			end if;
		end if;
	end process;

end BEH;