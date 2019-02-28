library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity clock_div is
port (
  clk : in std_logic;
  div : out std_logic
);
end clock_div;

architecture clk_div of clock_div is
  signal count : std_logic_vector (25 downto 0) := (others => '0');
  signal temp : std_logic := '0';
begin
  process(clk) 
  begin
    if rising_edge(clk) then
        if(unsigned(count) < 62500000/2) then
        count <= std_logic_vector( unsigned(count) + 1 );
        else
        count <= (others => '0');
        temp <= NOT(temp);
        end if;
    end if;
  end process;
div <= temp;
end clk_div;
