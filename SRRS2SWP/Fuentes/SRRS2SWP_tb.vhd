library IEEE;
use IEEE.std_logic_1164.all;

entity SRRS2SWP_tb is
end;

architecture SRRS2SWP_tb_arq of SRRS2SWP_tb is
    -- Parte declarativa
    component SRRS2SWP is
        port(
            e_i : in std_logic;
            clk_i : in std_logic;
            s_o : out std_logic
        );
    end component;

    signal e_tb: std_logic := '0';
    signal clk_tb: std_logic := '0';
    signal s_tb: std_logic;
    signal data_tb: std_logic_vector(10 downTo 0):="10111010101";
begin 

    --a_tb <= '0' after 150 ns,'1' after 300 ns,'0' after 500 ns;
    --a_tb <= not a_tb after 100 ns; # Example of the one clock.
    clk_tb <= not clk_tb after 10 ns;
    e_tb <= data_tb(0) after 20 ns,data_tb(1) after 40 ns,data_tb(2) after 60 ns,data_tb(3) after 80 ns,data_tb(4) after 100 ns,data_tb(5) after 120 ns,data_tb(6) after 140 ns,data_tb(7) after 160 ns,data_tb(8) after 180 ns,data_tb(9) after 200 ns;

    DUT: SRRS2SWP
    port map(
        e_i => e_tb,
        clk_i => clk_tb,
        s_o => s_tb
    );
end;