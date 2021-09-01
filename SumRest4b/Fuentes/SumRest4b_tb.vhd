library IEEE;
use IEEE.std_logic_1164.all;

entity SumRest4b_tb is
end;

architecture SumRest4b_tb_arq of SumRest4b_tb is
    -- Parte declarativa
    component SumRest4b is
        port(
            a_4b_i     :   in std_logic_vector(3 downTo 0);
            b_4b_i     :   in std_logic_vector(3 downTo 0);
            sr_4b_i    :  in std_logic;
            s_4b_o     :  out std_logic_vector(3 downTo 0);
            co_4b_o    :  out std_logic
        );
    end component;

    signal a_tb: std_logic_vector(3 downTo 0) := "0101";
    signal b_tb: std_logic_vector(3 downTo 0) := "1110";
    signal sr_tb: std_logic:='0';
    signal s_tb: std_logic_vector(3 downTo 0);
    signal co_tb: std_logic:='0';
begin 

    --a_tb <= '0' after 150 ns,'1' after 300 ns,'0' after 500 ns;
    --a_tb <= not a_tb after 100 ns;

    sr_tb <= '1' after 250 ns, '0' after 500 ns;

    uut: SumRest4b
    port map(
        a_4b_i => a_tb,
        b_4b_i => b_tb,
        sr_4b_i => sr_tb,
        s_4b_o => s_tb,
        co_4b_o => co_tb    
    );
end;