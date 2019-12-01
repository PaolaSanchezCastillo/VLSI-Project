library ieee;
use ieee.std_logic_1164.all;

entity bt is 
port	(	clk12Mhz:	in std_logic;
			rx : in std_logic;
			ledsmatriz: out std_logic_vector (15 downto 0);
			din : inout std_logic_vector(7 downto 0):= x"00"
);
end entity bt;

architecture behavior of bt is
signal tick : std_logic;
signal rx_done : std_logic;
signal tx_done : std_logic;
begin
u1: entity work.baudRateGenerator(behavior) port map (clk12MHz, tick);
u2 : entity work.rx_sampler(behavior) port map(rx,tick,din,rx_done);
u3 : entity work.matriz(behavior) port map(clk12MHz,din,ledsmatriz);

end architecture;