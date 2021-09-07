library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity CounterNbWP is
    generic( N: natural:=4 );
    port(
        e_i : in std_logic;
        c_i : in std_logic;
        r_i : in std_logic;
        s_o : out std_logic_vector(N-1 downto 0)
    );
end;

architecture CounterNbWP_arq of CounterNbWP is
    -- Parte declarativa
    signal count : unsigned(N-1 downto 0);
    signal limit : integer:=2**N;
begin   
    -- Parte descriptiva
    process(c_i,r_i)
    begin
    cond1: if r_i = '0' then    
        cond2: if rising_edge(c_i) then
            cond3: if e_i = '1' then
                cond4: if count = limit-1 then
                    A1: for i in 0 to N-1 loop
                        count(i) <= '0';
                    end loop;    
                else
                    count <= count + 1;
                end if;
            end if;
        end if;
    else
        A2: for i in 0 to N-1 loop
            count(i) <= '0';
        end loop;   
    end if;
    s_o <= std_logic_vector(unsigned(count));
    end process;
end;