library IEEE;
use IEEE.std_logic_1164.all;

entity R4BPIPO_tb is
end;

architecture R4BPIPO_tb_arq of R4BPIPO_tb is
    -- Parte declarativa
    component R4BPIPO is
        port(
            ena_i : in std_logic;
            clk_i : in std_logic;
            rst_i : in std_logic;
            d_i   : in std_logic_vector(3 downto 0);
            s_o   : out std_logic_vector(3 downTo 0)
        );
    end component;

    signal ena_tb: std_logic := '0';
    signal clk_tb: std_logic := '0';
    signal d_tb  : std_logic_vector(3 downTo 0):="0000";
    signal s_tb: std_logic_vector(3 downTo 0);
    signal rst_tb: std_logic:='0';

begin 

    --a_tb <= '0' after 150 ns,'1' after 300 ns,'0' after 500 ns;
    --a_tb <= not a_tb after 100 ns; # Example of the one clock.
    clk_tb <= not clk_tb after 50 ns;
    rst_tb <= '0' after 50 ns, '1' after 300 ns, '0' after 700 ns;
    ena_tb <= '0' after 25 ns, '1' after 50 ns, '0' after 300 ns, '1' after 500 ns;
    d_tb <= "1010" after 100 ns, "0101" after 300 ns, "1111" after 400 ns, "1100" after 600 ns;

    DUT: R4BPIPO
    port map(
        ena_i => ena_tb,
        clk_i => clk_tb,
        rst_i => rst_tb,
        d_i   => d_tb,
        s_o   => s_tb
    );
end;