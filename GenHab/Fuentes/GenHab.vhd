library IEEE;
use IEEE.std_logic_1164.all;

entity GenHab is
    generic(N:natural:=8);
    port(
        clk_i : in std_logic;
        rst_i : in std_logic;
        s_o : out std_logic
    );
end;

architecture GenHab_arq of GenHab is
    -- Parte declarativa
    signal count: integer:=1;
begin   
    -- Parte descriptiva
    process(clk_i,rst_i)
        variable estado: std_logic:='0';
    begin
        A1: if rising_edge(clk_i) then
            A2: if rst_i = '0' then 
                A3: if count = N then
                    A4:if estado ='1' then
                        estado := '0';
                        count <= 1;
                    else 
                        estado := '1';
                    end if;
                elsif count < N then
                    count <= count +1;
                end if;
            else
                count <= 1;
                estado:='0';
            end if;
        end if;
        s_o <= estado;
    end process;
end;