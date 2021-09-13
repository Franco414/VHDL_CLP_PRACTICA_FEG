library IEEE;
use IEEE.std_logic_1164.all;

entity BarrelShifterWP_tb is
end;

architecture BarrelShifterWP_tb_arq of BarrelShifterWP_tb is
    -- Parte declarativa
    component BarrelShifterWP is
        generic (
            M: natural := 2;
            N: natural := 7
        );
        port(
            a_i : in std_logic_vector(N downto 0);
            des_i : in std_logic_vector(M downto 0);
            s_o : out std_logic_vector(N downto 0)
        );
    end component;

    signal M_tb : natural:=3;
    signal N_tb : natural:=15;
    signal a_tb : std_logic_vector(N_tb downTo 0);
    signal s_tb : std_logic_vector(N_tb downTo 0);
    signal des_tb : std_logic_vector(M_tb downTo 0);
begin 
    --a_tb <= '0' after 150 ns,'1' after 300 ns,'0' after 500 ns;
    --a_tb <= not a_tb after 100 ns; # Example of the one clock.
    des_tb <= "0100" after 20 ns;
    a_tb <= "1010101010101010" after 50 ns, "1111000011110000" after 100 ns,"1010101010101010" after 150 ns;

    DUT: BarrelShifterWP
    generic map(
        M => M_tb,
        N => N_tb 
    )
    port map(
        a_i => a_tb,
        des_i => des_tb,
        s_o => s_tb
    );
end;