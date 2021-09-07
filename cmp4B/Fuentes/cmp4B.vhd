library IEEE;
use IEEE.std_logic_1164.all;

entity cmp4B is
    port(
        a_i : in std_logic_vector(3 downto 0);
        s_o : out std_logic
    );
end;

architecture cmp4B_arq of cmp4B is
    -- Parte declarativa
begin   
    -- Parte descriptiva
    process(a_i)
    begin
        A1:if a_i = "1001" then
            s_o <= '1';
        else 
            s_o <= '0';
        end if;
    end process;
end;