library IEEE;
use IEEE.std_logic_1164.all;

entity SumRest4b is
    port(
    a_4b_i     :   in std_logic_vector(3 downTo 0);
    b_4b_i     :   in std_logic_vector(3 downTo 0);
    sr_4b_i    :  in std_logic;
    s_4b_o     :  out std_logic_vector(3 downTo 0);
    co_4b_o    :  out std_logic
    );
end;

architecture SumRest4b_arq of SumRest4b is
    -- Parte declarativa
    component Sum1b is
        port(
            a_i: in std_logic;
            b_i: in std_logic;
            ci_i: in std_logic;
            s_o: out std_logic;
            co_o: out std_logic
        );
    end component;
    signal auxConnect : std_logic_vector(3 downTo 0):="0000";
    signal auxXOR : std_logic_vector(3 downTo 0);
begin   
    -- Parte descriptiva

    auxXOR(0) <= b_4b_i(0) xor sr_4b_i;
    auxXOR(1) <= b_4b_i(1) xor sr_4b_i;
    auxXOR(2) <= b_4b_i(2) xor sr_4b_i;
    auxXOR(3) <= b_4b_i(3) xor sr_4b_i;

    sum1b_inst_0: Sum1b
        port map(
            a_i => a_4b_i(0),
            b_i => auxXOR(0),
            ci_i => sr_4b_i,
            s_o  => s_4b_o(0),
            co_o => auxConnect(0)
        );

    sum1b_inst_1: Sum1b
        port map(
            a_i => a_4b_i(1),
            b_i => auxXOR(1),
            ci_i => auxConnect(0),
            s_o  => s_4b_o(1),
            co_o => auxConnect(1)
        );

    sum1b_inst_2: Sum1b
        port map(
            a_i => a_4b_i(2),
            b_i => auxXOR(2),
            ci_i => auxConnect(1),
            s_o  => s_4b_o(2),
            co_o => auxConnect(2)
        );    

    sum1b_inst_3: Sum1b
        port map(
            a_i => a_4b_i(3),
            b_i => auxXOR(3),
            ci_i => auxConnect(2),
            s_o  => s_4b_o(3),
            co_o => auxConnect(3)
        );
        co_4b_o <= auxConnect(3);
end;