library IEEE;
use IEEE.std_logic_1164.all;

entity comp_tb is
end;

architecture comp_tb_arq of comp_tb is
    -- Parte declarativa
    component Nombre_componente is
        port(
            a_i : in std_logic;
            s_o : out std_logic
        );
    end component;

    signal a_tb: std_logic := '1';

begin 

    --a_tb <= '0' after 150 ns,'1' after 300 ns,'0' after 500 ns;
    --a_tb <= not a_tb after 100 ns; # Example of the one clock.
    Nombre_Instancia: Nombre_componente
    port map(
        a_i : in std_logic;
        s_o : out std_logic
    );
end;