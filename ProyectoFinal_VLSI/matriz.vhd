library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity matriz is
    Port ( reloj: 		in  STD_LOGIC;
           leds: 			in  STD_LOGIC_VECTOR (7 downto 0);
          ledsmatriz: 	out  STD_LOGIC_VECTOR (15 downto 0)
			 );
end matriz;

architecture behavior of matriz is
Signal seg: 							std_logic;
Signal rap: 							std_logic;
Signal Q: 								std_logic_vector (2 downto 0);
Signal renglon:						std_logic_vector (2 downto 0);
Signal L0,L1,L2,L3,L4,L5,L6,L7: 	std_logic_vector (7 downto 0);
signal data:							std_logic_vector (63 downto 0);

begin
divi: process (reloj)
		variable cuenta : std_logic_vector (27 downto 0):=X"0000000";
			begin
				if rising_edge (reloj) then
					if cuenta =X"48009E0" then
						cuenta:=X"0000000";
						else
							cuenta:=cuenta+1;
					end if; 
				end if;
				seg <= cuenta(20);
				rap <= cuenta(10);
			end process;
			
conta: process (seg)
		variable cuenta : std_logic_vector (2 downto 0):="000";
		begin
			if rising_edge (seg) then
				if cuenta = "111" then
					cuenta:="000";
				else
					cuenta:=cuenta+1;
				end if;
			end if;
			Q <= cuenta;
		end process;
		
conra : process (rap)
		variable cuenta : std_logic_vector (2 downto 0):="000";
		begin
			if rising_edge (rap) then
					cuenta:=cuenta+1;
			end if;
			renglon <= cuenta;
		end process;
		
gene: process (Q)
		begin
		case Q is 
		when "000" => L0 <=	data (63 downto 56);
		when "001" => L0 <= data (55 downto 48);
		when "010" => L0 <= data (47 downto 40);
		when "011" => L0 <= data (39 downto 32);
		when "100" => L0 <= data (31 downto 24);
		when "101" => L0 <= data (23 downto 16);
		when "110" => L0 <= data (15 downto 8);
		when others => L0 <= data (7 downto 0);
		end case;
		end process;

d0: process (seg)
	begin
	if rising_edge (seg) then
	L1 <= L0;
	end if;
	end process;
		
d1: process (seg)
	begin
	if rising_edge (seg) then
	L2 <= L1;
	end if;
	end process;
	
d2: process (seg)
	begin
	if rising_edge (seg) then
	L3 <= L2;
	end if;
	end process;

d3: process (seg)
	begin
	if rising_edge (seg) then
	L4 <= L3;
	end if;
	end process;
	
d4: process (seg)
	begin
	if rising_edge (seg) then
	L5 <= L4;
	end if;
	end process;
	
d5: process (seg)
	begin
	if rising_edge (seg) then
	L6 <= L5;
	end if;
	end process;
	
d6: process (seg)
	begin
	if rising_edge (seg) then
	L7 <= L6;
	end if;
	end process;
	

muxy: process (renglon)
		begin 
		case renglon is 
		when "000" => 	ledsmatriz(15 downto 8) <= L0;
							ledsmatriz(7 downto 0) <= "01111111";
		when "001" => 	ledsmatriz(15 downto 8) <= L1;
							ledsmatriz(7 downto 0) <= "10111111";
		when "010" => 	ledsmatriz(15 downto 8) <= L2;
							ledsmatriz(7 downto 0) <= "11011111";
		when "011" => 	ledsmatriz(15 downto 8) <= L3;
							ledsmatriz(7 downto 0) <= "11101111";
		when "100" => 	ledsmatriz(15 downto 8) <= L4;
							ledsmatriz(7 downto 0) <= "11110111";
		when "101" => 	ledsmatriz(15 downto 8) <= L5;
							ledsmatriz(7 downto 0) <= "11111011";
		when "110" => 	ledsmatriz(15 downto 8) <= L6;
							ledsmatriz(7 downto 0) <= "11111101";
		when others => ledsmatriz(15 downto 8) <= L7;
							ledsmatriz(7 downto 0) <= "11111110";
		end case;
		end process;
		
deco:	process (leds)
		begin
			case leds is
				when x"61" => data <= x"00003C1824241800";	--	 a
				when x"62" => data <= x"0000182424183F00"; 	--  b
				when x"63" => data <= x"0000424242241800"; 	--  c
				when x"64" => data <= x"00003F1824241800"; 	--  d
				when x"65" => data <= x"00002629291e0000"; 	--  e
				when x"66" => data <= x"00000201093E0800"; 	--  f
				when x"67" => data <= x"00003F4649290600"; 	--  g
				when x"68" => data <= x"00380404083F0000"; 	--  h
				when x"69" => data <= x"000000003D000000"; 	--  i
				when x"6A" => data <= x"0000001D20201000"; 	--  j
				when x"6B" => data <= x"00002014083E0000"; 	--  k
				when x"6C" => data <= x"000000003E000000"; 	--  l
				when x"6D" => data <= x"003C020C02043E00"; 	--  m
				when x"6E" => data <= x"00003C0202043E00"; 	--  n
				when x"6F" => data <= x"0000182442422418"; 	--  o
				when x"70" => data <= x"00000C12120C7E00"; 	--  p
				when x"71" => data <= x"00007E0C12120C00"; 	--  q
				when x"72" => data <= x"00000202043E0000"; 	--  r
				when x"73" => data <= x"0000324949260000"; 	--  s
				when x"74" => data <= x"002040443F040000"; 	--  t
				when x"75" => data <= x"00003E1020201E00"; 	--  u
				when x"76" => data <= x"0006081020100806"; 	--  v
				when x"77" => data <= x"000E10080408100E"; 	--  w
				when x"78" => data <= x"0021120C0C122100"; 	--  x
				when x"79" => data <= x"0000020408142200"; 	--  y
				when x"7A" => data <= x"000022262A322200"; 	--  z
				when x"31" => data <= x"000040407F424400"; 	--  1
				when x"32" => data <= x"0000444A51614600"; 	--  2
				when x"33" => data <= x"0000364941220000"; 	--  3
				when x"34" => data <= x"00007F08080F0000"; 	--  4
				when x"35" => data <= x"00003945452F0000"; 	--  5
				when x"36" => data <= x"00304949513E0000"; 	--  6
				when x"37" => data <= x"0000030D31410100"; 	--  7
				when x"38" => data <= x"0000003649493600"; 	--  8
				when x"39" => data <= x"00007F0609090600"; 	--  9
				when x"30" => data <= x"00003E4141413E00"; 	--  0
				
				when others => data <= x"0000081210120800";
			end case;
		end process;
		
end behavior;