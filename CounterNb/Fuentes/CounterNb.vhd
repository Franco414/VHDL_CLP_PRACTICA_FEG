library IEEE;
use IEEE.std_logic_1164.all;

entity CounterNb is
    generic( N: natural:=4 );
    port(
        e_i : in std_logic;
        c_i : in std_logic;
        r_i : in std_logic;
        s_o : out std_logic_vector(N-1 downto 0)
    );
end;

architecture CounterNb_arq of CounterNb is
    -- Parte declarativa
    component FFD is
        port(
            clk_i : in std_logic;
            arst_i : in std_logic;
            rst_i : in std_logic;
            ena_i : in std_logic;
            d_i : in std_logic;
            q_o : out std_logic
        );
    end component;

    signal arst_c  : std_logic :='0';
    signal andAux : std_logic_vector(N-1 downTo 0);
    signal xorAux : std_logic_vector(N-1 downTo 0);
    signal qAux : std_logic_vector(N-1 downTo 0);

begin   
    -- Parte descriptiva
    loop_i: for i in 0 to N-1 generate
    
    cond1: if i = 0 generate
        andAux(i) <= e_i;    
    end generate cond1;

    cond2: if i > 0 generate
        andAux(i) <= andAux(i-1) and qAux(i-1);
    end generate cond2;
    
    xorAux(i) <= andAux(i) xor qAux(i);

        ffd_inst: ffd
        port map(
            clk_i => c_i,
            arst_i => arst_c,
            rst_i => r_i,
            ena_i => e_i,
            d_i => xorAux(i),
            q_o => qAux(i)
        );
    end generate loop_i;
    s_o <= qAux;
end;