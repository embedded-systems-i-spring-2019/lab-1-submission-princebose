library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tb_debounce is
end tb_debounce;

architecture Behavioral of tb_debounce is
component debounce
    Port (clk: in std_logic;
        btn: in std_logic;
        dbnc: out std_logic );
end component;

signal tb_clk: std_logic := '0';
signal tb_btn: std_logic := '0';
signal tb_dbnc: std_logic := '0';

begin
devut: debounce port map(   clk => tb_clk,
btn => tb_btn,
dbnc => tb_dbnc);

clock:  process
begin
    tb_clk <= '1';
    wait for 4 ns;
    tb_clk <= '0';
    wait for 4 ns;
end process;

button: process
begin
tb_btn <= '0';
wait for 200us;
tb_btn <= '1';
wait for 60ms;
tb_btn <= '1';
wait for 2ms;
tb_btn <= '1';
wait for 1ms;
tb_btn <= '0';
tb_btn <= '1';
wait for 22ms;
tb_btn <= '0';
wait for 1ms;
tb_btn <= '1';
wait for 50 ms;
end process;


end Behavioral;
