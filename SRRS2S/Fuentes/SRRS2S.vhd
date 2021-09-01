library IEEE;
use IEEE.std_logic_1164.all;

entity SRRS2S is
    port(
        e_i : in std_logic;
        clk_i : in std_logic;
        s_o : out std_logic
    );
end;

architecture SRRS2S_arq of SRRS2S is
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

    signal arst : std_logic:='0';
    signal rst : std_logic:='0';
    signal ena : std_logic:='1';
    signal d : std_logic_vector(4 downTo 0):="00000";
begin   
    -- Parte descriptiva

    d(0) <= e_i;

    FFD_inst_0: FFD
        port map(
            clk_i => clk_i,
            arst_i => arst,
            rst_i => rst,
            ena_i => ena,
            d_i => d(0),
            q_o => d(1)
        );

    FFD_inst_1: FFD
        port map(
            clk_i => clk_i,
            arst_i => arst,
            rst_i => rst,
            ena_i => ena,
            d_i => d(1),
            q_o => d(2)
        );

    FFD_inst_2: FFD
        port map(
            clk_i => clk_i,
            arst_i => arst,
            rst_i => rst,
            ena_i => ena,
            d_i => d(2),
            q_o => d(3)
        );

    FFD_inst_3: FFD
        port map(
            clk_i => clk_i,
            arst_i => arst,
            rst_i => rst,
            ena_i => ena,
            d_i => d(3),
            q_o => d(4)
        );
    s_o <= d(4);
end;