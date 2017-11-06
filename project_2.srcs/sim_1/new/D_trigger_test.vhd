----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/13/2016 06:12:46 PM
-- Design Name: 
-- Module Name: testbench - Behavioral
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

entity D_trigger_test is
end D_trigger_test;

architecture Behavioral of D_trigger_test is
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
    
    signal D_int : std_logic :='0';
    signal C_int : std_logic := '0';
    signal Q_int : std_logic := '0';
    signal R_int : std_logic := '0';
    signal S_int : std_logic := '0';
    signal nQ_int : std_logic := '0';
    
    begin 
        d_trigger1 : D_trigger port map(
            R => R_int,
            S => S_int,   
            C => C_int,
            D => D_int,
            Q => Q_int,
            nQ => nQ_int
        );
        
       tb : Process
       variable rscd : std_logic_vector(3 downto 0);
       begin
            rscd := "0000";
            for i in 0 to 15 loop
                rscd := std_logic_vector(to_unsigned(i, rscd'length));
                R_int <= rscd(3);
                S_int <= rscd(2);
                D_int <= rscd(1);
                C_int <= rscd(0);
                wait for 10 ps;
            end loop;
            
            C_int <= '1';
            D_int <= '0';
            R_int <= '1';
            S_int <= '0';
            wait for 10 ps; 
            
            C_int <= '1';
            D_int <= '0';
            R_int <= '1';
            S_int <= '1';
            wait for 10 ps; 
            
            C_int <= '1';
            D_int <= '0';
            R_int <= '1';
            S_int <= '1';
            wait for 10 ps;
            
            C_int <= '1';
            D_int <= '1';
            R_int <= '1';
            S_int <= '1';
            wait for 10 ps;
            
	        assert false
                report "simulation ended"
                severity failure;  
            wait;
       end Process;
end Behavioral;
