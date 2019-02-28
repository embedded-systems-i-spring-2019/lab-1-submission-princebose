library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity myckt_top is
    Port ( btn : in STD_LOGIC_VECTOR (3 downto 0);
           sw : in STD_LOGIC_VECTOR (3 downto 0);
           led : out STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC);
end myckt_top;

architecture Behavioral of myckt_top is

component clock_div
port (clk : in std_logic;
      div : out std_logic
);
end component;

component debounce
port( clk : in STD_LOGIC;
      btn : in STD_LOGIC;
      dbnc : out STD_LOGIC);
end component;

component FancyCounter
port ( clk : in STD_LOGIC;
       clk_en : in STD_LOGIC;
       dir : in STD_LOGIC;
       en : in STD_LOGIC;
       ld : in STD_LOGIC;
       rst : in STD_LOGIC;
       updn : in STD_LOGIC;
       val : in STD_LOGIC_VECTOR (3 downto 0);
       cnt : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal dev1_out,dev2_out,dev3_out,dev4_out,temp_div : std_logic:= '0';

begin

dev1: debounce
port map( btn => btn(0),
          clk => clk,
          dbnc => dev1_out);

dev2: debounce
port map( btn => btn(1),
          clk => clk,
          dbnc => dev2_out);

dev3: debounce
port map( btn => btn(2),
          clk => clk,
          dbnc => dev3_out);

dev4: debounce
port map( btn => btn(3),
          clk => clk,
          dbnc => dev4_out);

dut_clk: clock_div
port map( clk => clk,
          div => temp_div);

dut_fc: FancyCounter
port map( clk => clk,
          clk_en => temp_div,
          dir => sw(0),
          en => dev2_out,
          ld => dev4_out,
          rst => dev1_out,
          updn => dev3_out,
          val => sw,
          cnt => led);

end Behavioral;
