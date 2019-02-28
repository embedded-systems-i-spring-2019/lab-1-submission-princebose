library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity divider_top is
Port (clk:in std_logic;
        led0:out std_logic );
end divider_top;

architecture Behavioral of divider_top is

component clock_divider
port( clk : in std_logic;
 div : out std_logic);
end component;

signal led: std_logic := '0';
signal CE: std_logic := '0';

begin
dut: clock_divider port map( clk => clk,
          div => CE);

process(clk)
begin
    if(rising_edge(clk)) then
        if(CE = '1') then
            led <= not led;
        end if;
    end if;
    led0 <= led;
end process;
end Behavioral;
