----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.10.2017 14:19:07
-- Design Name: 
-- Module Name: T_trigger - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity T_trigger is
    Port (
        Rt : in std_logic;
        St : in std_logic;
        Tt : in std_logic;
        Qt : out std_logic;
        nQt: out std_logic
    );
end T_trigger;

architecture Behavioral of T_trigger is
    component D_trigger
        Port ( 
            R : in std_logic;
            S : in std_logic;
            C : in std_logic;
            D : in std_logic;
            Q : out std_logic;
            nQ: out std_logic
        );
    end component;
    
    signal S_int : std_logic := '0';
    signal R_int : std_logic := '0';
    signal T_int : std_logic := '0';
    signal Q_int : std_logic := '0';
    signal nQ_int : std_logic := '0';
    
begin
    d_tr : D_trigger port map(
        R => Rt,
        S => St,
        C => Tt,
        D => nQ_int,
        Q => Q_int,
        nQ => nQ_int
    );
    Qt <= Q_int;
    nQt <= nQ_int;
end Behavioral;
