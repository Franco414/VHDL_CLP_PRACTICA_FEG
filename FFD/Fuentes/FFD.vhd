library IEEE;
use IEEE.std_logic_1164.all;

entity FFD is
    port(
        clk_i : in std_logic;
        arst_i : in std_logic;
        rst_i : in std_logic;
        ena_i : in std_logic;
        d_i : in std_logic;
        q_o : out std_logic
    );
end;

architecture FFD_arq of FFD is
    -- Parte declarativa
begin   
    -- Parte descriptiva
    process(clk_i)
    begin
        if arst_i = '1' then
            q_o <= '0';
        elsif rising_edge(clk_i) then
            if rst_i = '1' then
                q_o <= '0';
            elsif ena_i ='1' then
                q_o <= d_i;
            end if;
        end if;
    end process;            
end;