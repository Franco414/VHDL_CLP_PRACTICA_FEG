library IEEE;
use IEEE.std_logic_1164.all;

entity Mux4B2TO1_tb is
end;

architecture Mux4B2TO1_tb_arq of Mux4B2TO1_tb is
    -- Parte declarativa
    component Mux4B2TO1 is
        port(
            a_i: in std_logic_vector(3 downto 0);
			b_i: in std_logic_vector(3 downto 0);
			sel_i: in std_logic;
			s_o: out std_logic_vector(3 downto 0)
        );
    end component;

    -- Declaracion de senales de prueba
	signal a_tb: std_logic_vector(3 downto 0):="1010";
	signal b_tb: std_logic_vector(3 downto 0):="0000";
	signal sel_tb: std_logic := '0';
	signal s_tb: std_logic_vector(3 downto 0);

begin 

    -- a_tb <= '1' after 100 ns, '0' after 500 ns;
	-- b_tb <= '1' after 200 ns, '0' after 400 ns;
	-- ci_tb <= '1' after 150 ns, '0' after 900 ns;
	sel_tb <= '1' after 40 ns, '0' after 90 ns,'1' after 250 ns,'0' after 350 ns;
    a_tb <= "1100" after 100 ns;
	b_tb <= "0011" after 70 ns;

    DUT: Mux4B2TO1
    port map(
            a_i	 => a_tb, 
			b_i	 => b_tb,
			sel_i => sel_tb,
			s_o	 => s_tb
    );
end;