library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity Counter4bWP is
    port(
        e_i : in std_logic;
        c_i : in std_logic;
        r_i : in std_logic;
        s_o : out std_logic_vector(3 downto 0)
    );
end;

architecture Counter4bWP_arq of Counter4bWP is
    -- Parte declarativa
    signal count : unsigned(3 downto 0):="1111";

begin   
    -- Parte descriptiva
    process(c_i,r_i)
    begin
    cond1: if r_i = '0' then    
        cond2: if rising_edge(c_i) then
            cond3: if e_i = '1' then
                cond4: if count = 15 then
                    count <= "0000";
                else
                    count <= count + 1;
                end if;
            end if;
        end if;
    else
        count <= "0000";
    end if;
    s_o <= std_logic_vector(unsigned(count));
    end process;
end;