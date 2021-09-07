library IEEE;
use IEEE.std_logic_1164.all;

entity Counter4bWP_tb is
end;

architecture Counter4bWP_tb_arq of Counter4bWP_tb is
    -- Parte declarativa
    component Counter4bWP is
        port(
            e_i : in std_logic;
            c_i : in std_logic;
            r_i : in std_logic;
            s_o : out std_logic_vector(3 downto 0)
        );
    end component;

    signal ena_tb: std_logic := '1';
    signal clk_tb: std_logic := '0';
    signal rst_tb: std_logic := '0';
    signal s_o_tb: std_logic_vector(3 downTo 0);

begin 

    --a_tb <= '0' after 150 ns,'1' after 300 ns,'0' after 500 ns;
    --a_tb <= not a_tb after 100 ns; # Example of the one clock.
    clk_tb <= not clk_tb after 25 ns;
    rst_tb <= '0' after 50 ns, '1' after 100 ns, '0' after 150 ns;
    ena_tb <= '0' after 700 ns, '1' after 1500 ns;
    DUT: Counter4bWP
    port map(
        e_i => ena_tb,
        c_i => clk_tb,
        r_i => rst_tb,
        s_o => s_o_tb
    );
end;