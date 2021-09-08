library IEEE;
use IEEE.std_logic_1164.all;

entity CounterBCD4D_tb is
end;

architecture CounterBCD4D_tb_arq of CounterBCD4D_tb is
    -- Parte declarativa
    component CounterBCD4D is
        port(
            ena_i : in std_logic;
            rst_i : in std_logic;
            clk_i : in std_logic;
            co_o  :out std_logic;
            d1_o : out std_logic_vector(3 downto 0);
            d2_o : out std_logic_vector(3 downto 0);
            d3_o : out std_logic_vector(3 downto 0);
            d4_o : out std_logic_vector(3 downto 0)
        );
    end component;

    signal ena_tb: std_logic := '0';
    signal rst_tb: std_logic := '0';
    signal clk_tb: std_logic := '0';
    signal co_tb: std_logic := '0';
    signal d1_tb: std_logic_vector(3 downto 0);
    signal d2_tb: std_logic_vector(3 downto 0);
    signal d3_tb: std_logic_vector(3 downto 0);
    signal d4_tb: std_logic_vector(3 downto 0);

begin 

    --a_tb <= '0' after 150 ns,'1' after 300 ns,'0' after 500 ns;
    --a_tb <= not a_tb after 100 ns; # Example of the one clock.

    clk_tb <= not clk_tb after 25 ns;
    
    rst_tb <= '1' after 50 ns, '0' after 200 ns,'1' after 1200 ns, '0' after 1500 ns;
    
    ena_tb <= '1' after 100 ns,'0' after 900 ns, '1' after 1300 ns;

    DUT: CounterBCD4D
    port map(
        ena_i => ena_tb,
        rst_i => rst_tb,
        clk_i => clk_tb,
        co_o  => co_tb,
        d1_o  => d1_tb,
        d2_o  => d2_tb,
        d3_o  => d3_tb,
        d4_o  => d4_tb
    );
end;