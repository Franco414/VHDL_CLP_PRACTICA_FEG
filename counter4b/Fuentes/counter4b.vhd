library IEEE;
use IEEE.std_logic_1164.all;

entity counter4b is
    port(
        e_i : in std_logic;
        c_i : in std_logic;
        r_i : in std_logic;
        s_o : out std_logic_vector(3 downto 0)
    );
end;

architecture counter4b_arq of counter4b is
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
    signal andAux : std_logic_vector(2 downTo 0):="000";
    signal xorAux : std_logic_vector(3 downTo 0):="0000";
    signal qAux : std_logic_vector(3 downTo 0):="0000";

begin   
    -- Parte descriptiva
    xorAux(0) <= e_i xor qAux(0);

    FFD_inst_1: FFD
    port map(
        clk_i => c_i,
        arst_i => arst_c,
        rst_i => r_i,
        ena_i => e_i,
        d_i => xorAux(0),
        q_o => qAux(0)
    );

    andAux(0) <= e_i and qAux(0);
    xorAux(1) <= andAux(0) xor qAux(1);

    FFD_inst_2: FFD
    port map(
        clk_i => c_i,
        arst_i => arst_c,
        rst_i => r_i,
        ena_i => e_i,
        d_i => xorAux(1),
        q_o => qAux(1)
    );

    andAux(1) <= andAux(0) and qAux(1);
    xorAux(2) <= andAux(1) xor qAux(2);

    FFD_inst_3: FFD
    port map(
        clk_i => c_i,
        arst_i => arst_c,
        rst_i => r_i,
        ena_i => e_i,
        d_i => xorAux(2),
        q_o => qAux(2)
    );

    andAux(2) <= andAux(1) and qAux(2);
    xorAux(3) <= andAux(2) xor qAux(3);

    FFD_inst_4: FFD
    port map(
        clk_i => c_i,
        arst_i => arst_c,
        rst_i => r_i,
        ena_i => e_i,
        d_i => xorAux(3),
        q_o => qAux(3)
    );
    
    s_o <= qAux;
end;