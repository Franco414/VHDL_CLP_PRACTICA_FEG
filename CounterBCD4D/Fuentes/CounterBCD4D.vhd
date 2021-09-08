library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity CounterBCD4D is
    port(
        ena_i : in std_logic;
        rst_i : in std_logic;
        clk_i : in std_logic;
        co_o  :out std_logic;
        d1_o : out std_logic_vector(3 downto 0);
        d2_o : out std_logic_vector(3 downto 0);
        d3_o : out std_logic_vector(3 downto 0);
        d4_o : out std_logic_vector(3 downto 0)
    );
end;

architecture CounterBCD4D_arq of CounterBCD4D is
    -- Parte declarativa
    component CounterBCD1BWP is
        port(
            ena_i : in std_logic;
            rst_i : in std_logic;
            clk_i : in std_logic;
            co_o  : out std_logic;
            s_o : out std_logic_vector(3 downto 0)
        );
    end component;
    signal andAux: std_logic_vector(3 downto 0);
    signal coAux: std_logic_vector(3 downto 0);
    type salidas is array(0 to 3) of std_logic_vector(3 downto 0);
    signal sAux: salidas;
begin   
    -- Parte descriptiva
    andAux(0)<=ena_i;
    loop1: for i in 0 to 3 generate
        
        A1:if i>0 generate
            andAux(i) <= andAux(i-1) and coAux(i-1);
        end generate;

        BCD1D_inst: CounterBCD1BWP
        port map(
            ena_i => andAux(i),
            rst_i => rst_i,
            clk_i => clk_i,
            co_o  => coAux(i),
            s_o => sAux(i)
        );
    end generate;
    co_o <= coAux(3);
    d1_o <= sAux(0);
    d2_o <= sAux(1);
    d3_o <= sAux(2);
    d4_o <= sAux(3);
end;