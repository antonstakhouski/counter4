----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/13/2016 05:16:57 PM
-- Design Name: 
-- Module Name: Main_s - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Main_s is
    Port ( 
        data : in std_logic_vector(3 downto 0);
        mr : in std_logic;
        pl : in std_logic;
        cpu : in std_logic;
        cpd : in std_logic;
        tcd : out std_logic;
        tcu : out std_logic;
        output: out std_logic_vector(3 downto 0)
    );
end Main_s;

architecture Behavioral of Main_s is
    component T_trigger
        Port (
            Rt : in std_logic;
            St : in std_logic;
            Tt : in std_logic;
            Qt : out std_logic;
            nQt: out std_logic
        );
    end component;

    signal y : std_logic_vector(15 downto 0) := x"0000";
    signal y00 : std_logic := '0';
    signal y01 : std_logic := '0';
    signal y02 : std_logic := '0';
    signal y03 : std_logic := '0';
    signal y04 : std_logic := '0';
    signal y05 : std_logic := '0';
    signal y06 : std_logic := '0';
    signal y07 : std_logic := '0';
    signal y08 : std_logic := '0';
    signal y09 : std_logic := '0';
    signal y0A : std_logic := '0';
    signal y0B : std_logic := '0';
    
    signal y10 : std_logic := '0';
    signal y11 : std_logic := '0';
    signal y12 : std_logic := '0';
    signal y13 : std_logic := '0';
    
    signal y20 : std_logic := '0';
    signal y21 : std_logic := '0';
    signal y22 : std_logic := '0';
    signal y23 : std_logic := '0';
    
    signal r0 : std_logic := '0';
    signal r1 : std_logic := '0';
    signal r2 : std_logic := '0';
    signal r3 : std_logic := '0';
    
    signal nQ0 : std_logic := '0';
    signal nQ1 : std_logic := '0';
    signal nQ2 : std_logic := '0';
    signal nQ3 : std_logic := '0';
    
    signal Q0 : std_logic := '0';
    signal Q1 : std_logic := '0';
    signal Q2 : std_logic := '0';
    signal Q3 : std_logic := '0';
    
    signal t0 : std_logic := '0';
    signal t1 : std_logic := '0';
    signal t2 : std_logic := '0';
    signal t3 : std_logic := '0';
    
begin
    
    t_tr0 : T_trigger port map(
        Rt => r0,
        St => y00,
        Tt => t0,
        Qt => Q0,
        nQt => nQ0
    );
    
    t_tr1 : T_trigger port map(
        Rt => r1,
        St => y01,
        Tt => t1,
        Qt => Q1,
        nQt => nQ1
    );
    
    t_tr2 : T_trigger port map(
        Rt => r2,
        St => y05,
        Tt => t2,
        Qt => Q2,
        nQt => nQ2
    );
    
    t_tr3 : T_trigger port map(
        Rt => r3,
        St => y08,
        Tt => t3,
        Qt => Q3,
        nQt => nQ3
    );

    y00 <= not (data(0) and (not pl) and (not mr));
    y01 <= not (data(1) and (not pl) and (not mr));
    y02 <= (not cpd) and nQ0 and y04;
    y03 <= Q0 and nQ3 and (not cpu);
    y04 <= not (nQ1 and nQ2 and nQ3);  
    y05 <= not (data(2) and (not pl) and (not mr));
    y06 <= (not cpd) and nQ0 and nQ1 and y04;    
    y07 <= Q0 and Q1 and (not cpu);
    y08 <= not (data(3) and (not pl) and (not mr));
    y09 <= (not cpd) and nQ0 and nQ1 and nQ2;
    y0A <= Q0 and Q3 and (not cpu);
    y0B <= Q0 and Q1 and Q2 and (not cpu);
    
    tcd <= not ((not cpd) and nQ0 and nQ1 and nQ2 and nQ3);
    tcu <= not (Q0 and Q3 and (not cpu));
        
    y10 <= (not cpd) or (not cpu);
    y11 <= y02 or y03;
    y12 <= y06 or y07;
    y13 <= y09 or y0A or y0B;
    
    y20 <= not (y00 and (not pl));
    y21 <= not (y01 and (not pl));
    y22 <= not (y05 and (not pl));
    y23 <= not (y08 and (not pl));
    
    r0 <= (y20 and (not mr));
    r1 <= (y21 and (not mr));
    r2 <= (y22 and (not mr));
    r3 <= (y23 and (not mr));
    
    t0 <= not y10;
    t1 <= not y11;
    t2 <= not y12;
    t3 <= not y13;
    
    output(3) <= Q3;
    output(2) <= Q2;
    output(1) <= Q1;
    output(0) <= Q0;
    
end Behavioral;
