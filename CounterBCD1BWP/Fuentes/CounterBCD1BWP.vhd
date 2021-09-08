library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity CounterBCD1BWP is
    port(
        ena_i : in std_logic;
        rst_i : in std_logic;
        clk_i : in std_logic;
        co_o  : out std_logic;
        s_o : out std_logic_vector(3 downto 0)
    );
end;

architecture CounterBCD1BWP_arq of CounterBCD1BWP is
    -- Parte declarativa
    signal count : integer:=0;
begin   
    -- Parte descriptiva
    process(clk_i,rst_i,ena_i)
    begin
        cond1: if ena_i='1' and rst_i ='0' then
            cond2: if rising_edge(clk_i) then
                    cond3: if count = 9 then    
                        count <= 0;
                    else
                        count <= count +1;
                    end if;
            end if;
        elsif rst_i = '1' then
            count <= 0;
        end if;
        cond4: if count = 9 then
            co_o <= '1';
        elsif count=0 then
            co_o <= '0';
        end if;
    end process;
    s_o <= std_logic_vector(to_unsigned(count,4));
end;