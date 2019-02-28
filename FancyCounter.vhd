library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FancyCounter is
    Port ( clk : in STD_LOGIC;
           clk_en : in STD_LOGIC;
           dir : in STD_LOGIC;
           en : in STD_LOGIC;
           ld : in STD_LOGIC;
           rst : in STD_LOGIC;
           updn : in STD_LOGIC;
           val : in STD_LOGIC_VECTOR (3 downto 0);
           cnt : out STD_LOGIC_VECTOR (3 downto 0));
end FancyCounter;

architecture Behavioral of FancyCounter is

signal count: std_logic_vector(3 downto 0) := (others => '0');
signal uploadValue: std_logic_vector(3 downto 0) := (others => '0'); 
signal direction: std_logic := '0';

begin
process(clk,clk_en)
begin
    if (rst = '1') then
            count <= (others => '0');
            cnt <= count;
    end if;
    if (en ='1') then
        
            if(clk_en = '1') then
                if (ld = '1') then
                    uploadValue <= val;
                end if;
                if (updn = '1') then
                    direction <= dir;
                end if;
                if(direction = '1') then
                    if(unsigned(count) < unsigned(uploadValue)) then
                        count <= std_logic_vector(unsigned(count) + 1);
                        cnt <= count;
                     else
                        count <= (others => '0');
                        cnt <= count;
                     end if;
                else
                    if(unsigned(count) > "0000") then
                        count <= std_logic_vector(unsigned(count) - 1);
                        cnt <= count;
                    else
                        count <= uploadValue;
                        cnt <= count;
                    end if;
                end if;
            end if;
        end if;                                 
end process;
end Behavioral;