library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;





entity VendingMachine_soda is
    Port ( clk,reset : in std_logic;
           CoinIn : in std_logic_vector(1 downto 0);
           CoinOut : out std_logic_vector(1 downto 0);
           Soda : out std_logic);
end VendingMachine_soda;

architecture Behavioral of VendingMachine_soda is
type state_type is ( start			 		 -- Types of States in machine  -- Start/idle state
				,ent_money										  --	enter money state
				,inp1											  -- input $1 state
				,inp3											  -- input $3 state
				,inp5											  -- input $5 state
				,inp6											  -- input $6 state
				,change_1											  -- change state
				,Soda_Out); 										  -- SodaOut state
signal curr_state,next_state:state_type;

begin
process(clk,reset)
begin
 if(reset='1') then
   curr_state <= start;
 elsif (clk'event and clk='1') then
 	curr_state <= next_state;
 end if;
end process;


process(curr_state,CoinIn)
begin
case curr_state is
  when start => 
  	Soda <= '0';
	CoinOut <= "00";
	next_state <= ent_money;

	when ent_money =>
		if(CoinIn = "00") then		      -- idle/start State
			Soda <= '0';
			CoinOut <= "00";
			next_state <= ent_money;
		elsif(CoinIn = "01") then		 --  $1 Coin Enter 
			Soda <= '0';
			CoinOut <= "00";
			next_state <= inp1;			 
		elsif(CoinIn = "10") then		 -- $2 Coin Enter
			Soda <= '0';
			CoinOut <= "00";
			next_state <= Soda_Out;
		elsif(CoinIn <= "11") then		 -- $5 Coin Enter
			Soda <= '0';
			CoinOut <= "00";
			next_state <= inp5;
		end if;
			
	when	inp1 =>					  -- input $1 State
		if(CoinIn = "00") then
			Soda <= '0';
			CoinOut <= "00";
			next_state <= inp1;
		elsif(CoinIn = "01") then
			Soda <= '0';
			CoinOut <= "00";
			next_state <= Soda_Out;
		elsif(CoinIn = "10") then
			Soda <= '0';
			CoinOut <= "00";
			next_state <= inp3;
		elsif(CoinIn = "11") then
			Soda <= '0';
			CoinOut <= "00";
			next_state <= inp6;
		end if;

	when inp3 =>					  -- input $3 State
		Soda <= '0';
		CoinOut <= "01";
		next_state <= Soda_Out;

	when inp6 =>					  -- input $6 State
		Soda <= '0';
		CoinOut <= "01";
		next_state <= inp5;
	
	when inp5 =>					  -- input $5 State
		Soda <= '0';
		CoinOut <= "10";			   -- $5-$2(10) = $3
		next_state <= change_1;
	   
	When change_1 =>				  -- change_1 state
		Soda <= '0';
		CoinOut <= "01";			  -- $3 - $1(01) = $2..
		next_state <= Soda_Out;
	
	when	Soda_Out =>
		Soda <= '1';
		CoinOut <= "00";
		next_state <= ent_money;
  end case;
 end process;
end Behavioral;
