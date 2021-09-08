library IEEE;
use IEEE.std_logic_1164.all;

entity CounterBCD1BWP_tb is
end;

architecture CounterBCD1BWP_tb_arq of CounterBCD1BWP_tb is
    -- Parte declarativa
    component CounterBCD1BWP is
        port(
            ena_i : in std_logic;
            rst_i : in std_logic;
            clk_i : in std_logic;
            s_o : out std_logic_vector(3 downto 0)
        );
    end component;

    signal ena_tb: std_logic := '0';
    signal rst_tb: std_logic := '0';
    signal clk_tb: std_logic := '0';
    signal s_tb: std_logic_vector(3 downto 0);

begin 

    --a_tb <= '0' after 150 ns,'1' after 300 ns,'0' after 500 ns;
    --a_tb <= not a_tb after 100 ns; # Example of the one clock.

    clk_tb <= not clk_tb after 25 ns;
    
    rst_tb <= '1' after 50 ns, '0' after 200 ns,'1' after 1200 ns, '0' after 1500 ns;
    
    ena_tb <= '1' after 100 ns,'0' after 900 ns, '1' after 1300 ns;

    DUT: CounterBCD1BWP
    port map(
        ena_i => ena_tb,
        rst_i => rst_tb,
        clk_i => clk_tb,
        s_o => s_tb
    );
end;