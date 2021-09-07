library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity inc4B is
    port(
        a_i : in std_logic_vector(3 downto 0);
        s_o : out std_logic_vector(3 downto 0)
    );
end;

architecture inc4B_arq of inc4B is
    -- Parte declarativa
begin   
    -- Parte descriptiva
    s_o <= std_logic_vector(unsigned(a_i)+1);
end;