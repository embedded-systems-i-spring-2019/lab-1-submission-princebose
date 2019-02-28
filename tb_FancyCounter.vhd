library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity fc_tb is
end fc_tb;

architecture Behavioral of fc_tb is
component FancyCounter
      Port (clk, clk_en, dir, en, ld, rst, updn: in std_logic;
            val: in std_logic_vector(3 downto 0);
            cnt: out std_logic_vector(3 downto 0));
end component;
signal clk, clk_en, en, dir, ld, rst, updn : std_logic := '0';
signal val: std_logic_vector(3 downto 0) := (others => '0');
signal cnt: std_logic_vector(3 downto 0) := (others => '0');
begin
dut: FancyCounter port map(clk => clk,
                            clk_en => clk_en,
                            en => en,
                            dir => dir,
                            ld => ld,
                            rst => rst,
                            updn => updn,
                            val => val,
                            cnt => cnt);
    process
        begin
      wait for 4 ns;
      clk <= '1';
      wait for 4 ns;
      clk <= '0';
   end process;
   process
        begin
        wait for 5ms;
        en <= '0';
        clk_en <= '1';
        dir <= '1';
        ld <= '1';
        val <= "1001";
        updn <= '1';
        rst <= '0';
        wait for 10ms;
        en <= '1';
        clk_en <= '0';
        ld <= '1';
        val <= "1001";
        updn <= '1';
        rst <= '1';
        wait for 5ms;
        rst <= '0';
        wait for 1ms;
        en <= '1';
        clk_en <= '1';
        dir <= '1';
        ld <= '1';
        val <= "1001";
        updn <= '1';
        wait for 8ns;
        clk_en <= '0';
        wait for 8ns;
        clk_en <= '1';
        wait for 8ns;
        clk_en <= '0';
        wait for 8ns;
        clk_en <= '1';
        wait for 8ns;
        clk_en <= '0';
        wait for 8ns;
        clk_en <= '1';
        wait for 8ns;
        clk_en <= '0';
        wait for 8ns;
        clk_en <= '1';
        wait for 8ns;
        clk_en <= '0';
        wait for 8ns;
        clk_en <= '1';
        wait for 8ns;
        clk_en <= '0';
        wait for 8ns;
        clk_en <= '1';
        wait for 8ns;
        clk_en <= '0';
        wait for 20ms;
        en <= '1';
        clk_en <= '1';
        dir <= '0';
        ld <= '0';
        val <= "1001";
        updn <= '1';
        wait for 8ns;
        clk_en <= '0';
        wait for 8ns;
        clk_en <= '1';
        wait for 8ns;
        clk_en <= '0';
        wait for 8ns;
        clk_en <= '1';
        wait for 8ns;
        clk_en <= '0';
        wait for 8ns;
        clk_en <= '1';
        wait for 8ns;
        clk_en <= '0';
        wait for 8ns;
        clk_en <= '1';
        wait for 8ns;
        clk_en <= '0';
        wait for 8ns;
        clk_en <= '1';
        wait for 8ns;
        clk_en <= '0';
        wait for 8ns;
        clk_en <= '1';
        wait for 8ns;
        clk_en <= '0';
        wait for 10ms;
        rst <= '1';
        clk_en <= '0';
        dir <= '0';
        ld <= '0';
        val <= "0000";
        updn <= '0';
        wait;
end process;    
end Behavioral;