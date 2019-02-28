library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.Numeric_std.all;

entity tb_clock_div is
end tb_clock_div;

architecture clk_tb of tb_clock_div is
  component clock_div
  port (
    clk : in std_logic;
    div : out std_logic
  );
  end component;
  signal clk : std_logic := '0';
  signal div : std_logic := '0';
begin
  dut: clock_div port map(clk => clk, 
                          div => div);
  process 
  begin
      clk <= '1';
      wait for 4 ns;
      clk <= '0';
      wait for 4 ns;
  end process;
end clk_tb;
