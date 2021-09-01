library IEEE;
use IEEE.std_logic_1164.all;

entity FFD_tb is
end;

architecture FFD_tb_arq of FFD_tb is
    -- Parte declarativa
    component FFD is
        port(
            clk_i : in std_logic;
            arst_i : in std_logic;
            rst_i : in std_logic;
            ena_i : in std_logic;
            d_i : in std_logic;
            q_o : out std_logic
        );
    end component;

    -- Declaracion de senales de prueba
	signal clk_tb: std_logic := '0';
	signal arst_tb: std_logic := '0';
	signal rst_tb: std_logic := '1';
	signal ena_tb: std_logic := '1';
    signal d_tb: std_logic := '1';
    signal q_tb: std_logic;

begin 

    -- a_tb <= '1' after 100 ns, '0' after 500 ns;
	-- b_tb <= '1' after 200 ns, '0' after 400 ns;
	-- ci_tb <= '1' after 150 ns, '0' after 900 ns;
	clk_tb <= not clk_tb after 10 ns;
	arst_tb <= '1' after 610 ns;
    rst_tb <= '0' after 50 ns;
    d_tb <= '0' after 90 ns, '1' after 270 ns;
    ena_tb <= '0' after 150 ns, '1' after 240 ns;

    DUT: FFD
    port map(
            clk_i	 => clk_tb, 
			arst_i	 => arst_tb,
			rst_i => rst_tb,
            ena_i => ena_tb,
            d_i => d_tb,
			q_o	 => q_tb
    );
end;