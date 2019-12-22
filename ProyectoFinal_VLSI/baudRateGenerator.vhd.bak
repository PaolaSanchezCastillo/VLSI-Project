library ieee;
use ieee.std_logic_1164.all;

entity baudRateGenerator is 
port	(	clk12Mhz:	in std_logic;
			tick:			out std_logic:= '0');
end entity baudRateGenerator;

architecture behavior of baudRateGenerator is
begin 
	process(clk12MHz) is 
		variable cnt: integer := 0;
	begin 
		if rising_edge(clk12MHz) then 
			if cnt < 78 then
				cnt := cnt + 1;
				tick <= '0';
			else
				cnt := 0;
				tick <= '1';
			end if;
		end if;
	end process;
end architecture behavior;