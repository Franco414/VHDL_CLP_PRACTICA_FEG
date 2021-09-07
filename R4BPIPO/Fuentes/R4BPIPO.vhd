library IEEE;
use IEEE.std_logic_1164.all;

entity R4BPIPO is
    port(
        ena_i : in std_logic;
        clk_i : in std_logic;
        rst_i : in std_logic;
        d_i   : in std_logic_vector(3 downto 0);
        s_o   : out std_logic_vector(3 downTo 0)
    );
end;

architecture R4BPIPO_arq of R4BPIPO is
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
    signal arst_c : std_logic :='0';
begin   
    -- Parte descriptiva
    loop_i: for i in 0 to 3 generate
        ffd_inst: ffd
            port map(
                clk_i => clk_i,
                arst_i => arst_c,
                rst_i => rst_i,
                ena_i => ena_i,
                d_i => d_i(i),
                q_o => s_o(i)
            ); 
    end generate loop_i;
end;