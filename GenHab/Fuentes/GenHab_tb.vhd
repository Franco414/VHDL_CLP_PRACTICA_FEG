library IEEE;
use IEEE.std_logic_1164.all;

entity GenHab_tb is
end;

architecture GenHab_tb_arq of GenHab_tb is
    -- Parte declarativa
    component GenHab is
        generic(N:natural:=8);
        port(
            clk_i : in std_logic;
            rst_i : in std_logic;
            s_o : out std_logic
        );
    end component;

    signal clk_tb: std_logic := '0';
    signal rst_tb: std_logic := '0';
    signal s_tb: std_logic;
    signal N_tb: integer:=8;
begin 

    --a_tb <= '0' after 150 ns,'1' after 300 ns,'0' after 500 ns;
    --a_tb <= not a_tb after 100 ns; # Example of the one clock.
    rst_tb <= '1' after 300 ns, '0' after 800 ns,'1' after 1200 ns,'0' after 1300 ns,'1' after 4800 ns;
    clk_tb <= not clk_tb after 50 ns;

    DUT: GenHab
    generic map(
        N => N_tb
    )
    port map(
        clk_i => clk_tb,
        rst_i => rst_tb,
        s_o => s_tb
    );
end;