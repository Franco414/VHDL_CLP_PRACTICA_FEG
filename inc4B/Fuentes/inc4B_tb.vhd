library IEEE;
use IEEE.std_logic_1164.all;

entity inc4B_tb is
end;

architecture inc4B_tb_arq of inc4B_tb is
    -- Parte declarativa
    component inc4B is
        port(
        a_i : in std_logic_vector(3 downto 0);
        s_o : out std_logic_vector(3 downto 0)
        );
    end component;

    signal a_tb : std_logic_vector(3 downto 0):="0000";
    signal s_tb : std_logic_vector(3 downto 0):="0000";

begin 

    --a_tb <= '0' after 150 ns,'1' after 300 ns,'0' after 500 ns;
    --a_tb <= not a_tb after 100 ns; # Example of the one clock.
    a_tb <= "0000" after 50 ns,"0100" after 100 ns,"0001" after 150 ns;
    DUT: inc4B
    port map(
        a_i => a_tb,
        s_o => s_tb
    );
end;