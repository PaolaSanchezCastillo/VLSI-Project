library ieee;
use ieee.std_logic_1164.all;

entity rx_sampler is 
port	(	rx:	in std_logic;
			tick: in std_logic;
			din:	out std_logic_vector (7 downto 0):= x"00";
			rx_done:	out std_logic:= '0'	);
end entity rx_sampler;

architecture behavior of rx_sampler is
type states is (idle, start, data, stop);
signal state: states:= idle;
signal b: std_logic_vector (7 downto 0);
begin
	
	process(tick)
	variable s: integer range 0 to 15:= 0;
	variable n: integer range 0 to 7:= 0;
		begin
			if rising_edge (tick) then 
			case state is
				when idle => rx_done <= '0';
								 if rx = '0' then 
										state <= start;
								 end if;
				
				when start => if s = 7 then
										s := 0;
										n := 0;
										state <= data;
								  else
										s := s + 1;
								  end if;
								  
				when data => if s = 15 then
										s := 0;
										b(n) <= rx;
											if n = 7 then
												state <= stop;
											else 
												n := n + 1;
											end if;
								 else
										s := s + 1;
								 end if;
								 
				when stop => if s = 15 then
										rx_done <= '1';
										din <= b;
										state <= idle;
								 else
										s := s + 1;
								 end if;
			end case;
		end if;
	end process;
end architecture behavior;	