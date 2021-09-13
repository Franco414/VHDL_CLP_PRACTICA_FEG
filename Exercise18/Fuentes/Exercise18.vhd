library IEEE;
use IEEE.std_logic_1164.all;

entity Exercise18 is
    generic(
        N:natural:=15000000
        );
    port(
        ena_i : in std_logic;
        rst_i : in std_logic;
        clk_i : in std_logic;
        co_o  : out std_logic;
        s_o : out std_logic_vector(3 downto 0)
        );
end;

architecture Exercise18_arq of Exercise18 is
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

    component GenHab is
        generic(N:natural:=15000000);
        port(
            clk_i : in std_logic;
            rst_i : in std_logic;
            s_o : out std_logic
        );
    end component;
    
    signal salDiv: std_logic:='0';
    signal salCount: std_logic_vector(3 downto 0);
begin   
    -- Parte descriptiva
    gen_inst: GenHab
    generic map(N => N)
    port map(
        clk_i => clk_i,
        rst_i => rst_i,
        s_o => salDiv
    );

    counterBCD_inst: CounterBCD1BWP
    port map(
            ena_i => ena_i,
            rst_i => rst_i,
            clk_i => salDiv,
            co_o  => co_o,
            s_o => salCount
        );
    s_o <= salCount;
end;