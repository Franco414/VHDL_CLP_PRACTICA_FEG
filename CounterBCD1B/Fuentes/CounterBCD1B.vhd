library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity CounterBCD1B is
    port(
        ena_i : in std_logic;
        rst_i : in std_logic;
        clk_i : in std_logic;
        s_o : out std_logic_vector(3 downto 0)
    );
end;

architecture CounterBCD1B_arq of CounterBCD1B is
    -- Parte declarativa
    component R4BPIPO is
        port(
        ena_i : in std_logic;
        clk_i : in std_logic;
        rst_i : in std_logic;
        d_i   : in std_logic_vector(3 downto 0);
        s_o   : out std_logic_vector(3 downTo 0)
    );
    end component;

    component Mux4B2TO1 is
        port(
            a_i: in std_logic_vector(3 downto 0);
            b_i: in std_logic_vector(3 downto 0);
            sel_i: in std_logic;
            s_o: out std_logic_vector(3 downto 0)
        );
    end component;
    
    component inc4B is
        port(
            a_i : in std_logic_vector(3 downto 0);
            s_o : out std_logic_vector(3 downto 0)
        );
    end component;
    
    component cmp4B is
        port(
            a_i : in std_logic_vector(3 downto 0);
            s_o : out std_logic
        );
    end component;

    Signal qAux : std_logic_vector(3 downto 0);
    Signal salCmp: std_logic:='0';
    Signal reset: std_logic:='0';
    Signal salMux: std_logic_vector(3 downto 0):="0000";
    Signal salInc: std_logic_vector(3 downto 0):="0000";

begin   
    -- Parte descriptiva
    comparador: cmp4B
    port map(
        a_i => qAux,
        s_o => salCmp
    );

    incrementador: inc4B
    port map(
        a_i => qAux,
        s_o => salInc
    );

    multiplexor: Mux4B2TO1
    port map(
        a_i => salInc,
		b_i => qAux,
		sel_i => ena_i,
		s_o => salMux
    );

    Registro: R4BPIPO
    port map(
        ena_i => ena_i,
        clk_i => clk_i,
        rst_i => reset,
        d_i   => salMux,
        s_o   => qAux
    );
    reset <= rst_i or salCmp;
    s_o <= qAux;

end;