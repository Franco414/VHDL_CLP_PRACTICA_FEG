library IEEE;
use IEEE.std_logic_1164.all;

entity Mux is
    port(
        a_i: in std_logic;
		b_i: in std_logic;
		sel_i: in std_logic;
		s_o: out std_logic
    );
end;

architecture Mux_arq of Mux is
    -- Parte declarativa
begin   
    -- Parte descriptiva
    s_o <= (a_i and not sel_i) or (b_i and sel_i);
end;