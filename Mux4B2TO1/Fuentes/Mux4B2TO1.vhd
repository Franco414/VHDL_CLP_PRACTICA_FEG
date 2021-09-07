library IEEE;
use IEEE.std_logic_1164.all;

entity Mux4B2TO1 is
    port(
        a_i: in std_logic_vector(3 downto 0);
		b_i: in std_logic_vector(3 downto 0);
		sel_i: in std_logic;
		s_o: out std_logic_vector(3 downto 0)
    );
end;

architecture Mux4B2TO1_arq of Mux4B2TO1 is
    -- Parte declarativa
begin   
    -- Parte descriptiva
    process(sel_i,a_i,b_i)
    begin
    cond1: if sel_i = '1' then
        s_o <= a_i;
    else
        s_o <= b_i;
    end if;    
    end process;
end;