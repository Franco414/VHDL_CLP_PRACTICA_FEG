library IEEE;
use IEEE.std_logic_1164.all;

entity SRRS2SWP is
    port(
        e_i : in std_logic;
        clk_i : in std_logic;
        s_o : out std_logic
    );
end;

architecture SRRS2SWP_arq of SRRS2SWP is
    -- Parte declarativa
    signal DxConnections: std_logic_vector(3 downto 0):="0000";
begin   
    -- Parte descriptiva
    process(clk_i)
    begin
        if(rising_edge(clk_i)) then
            DxConnections(1)<=DxConnections(0);
            DxConnections(2)<=DxConnections(1);
            DxConnections(3)<=DxConnections(2);
            DxConnections(0)<=e_i;
            s_o <= DxConnections(3);
        end if;
    end process;
end;