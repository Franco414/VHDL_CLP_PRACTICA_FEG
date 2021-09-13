library IEEE;
use IEEE.std_logic_1164.all;

entity Exercise18_tb is
end;

architecture Exercise18_tb_arq of Exercise18_tb is
    -- Parte declarativa
    component Exercise18 is
        generic(
            N:natural:=15000000
        );
        port(
            ena_i : in std_logic;
            rst_i : in std_logic;
            clk_i : in std_logic;
            co_o  : out std_logic;
            s_o : out std_logic_vector(3 downto 0)
        );
    end component;

    signal N_tb: natural := 4;
    signal rst_tb: std_logic := '0';
    signal clk_tb: std_logic := '0';
    signal ena_tb: std_logic := '0';
    signal co_tb: std_logic := '0';
    signal s_tb: std_logic_vector(3 downto 0);

begin 

    clk_tb <= not clk_tb after 33 ns;
    
    rst_tb <= '1' after 50 ns, '0' after 200 ns,'1' after 4200 ns, '0' after 4500 ns;
    
    ena_tb <= '1' after 100 ns,'0' after 300 ns, '1' after 700 ns,'0' after 7000 ns,'1' after 9500 ns;

    uut: Exercise18
    generic map(
        N => N_tb
    )
    port map(
        ena_i => ena_tb,
        rst_i => rst_tb,
        clk_i => clk_tb,
        co_o  => co_tb,
        s_o => s_tb
    );
end;