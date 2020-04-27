


--------------------------------------------------------- 
-- Design Name :  ram_sp_sr_sw 
-- File Name   :  ram_sp_sr_sw.vhd 
-- Description :  Single port, synchronous read/write RAM  
--------------------------------------------------------- 
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ram_test is
 generic (data_bus :integer:=8;
          addr_bus :integer:=8);
 port(clk:in std_logic;                 
we      :in  std_logic;
address :in  std_logic_vector (addr_bus-1 downto 0);
data_in :in  std_logic_vector (data_bus-1 downto 0);
data_out:out std_logic_vector (data_bus-1 downto 0)
); end entity;

architecture rtl of ram_test is
constant ram_depth :integer := 2**addr_bus;
type RAM is array (integer range <>)of std_logic_vector
                                       (data_bus-1 downto 0);
signal mem : RAM (0 to ram_depth-1);
begin
   mem_write: process (clk)
    begin
	  if (rising_edge(clk)) then
	          if (we = '1') then
	             mem(to_integer(unsigned(address))) <= data_in;
	          end if;
	         end if;
	     end process mem_write;
	 mem_read: process (clk)
    begin
	         if (rising_edge(clk)) then 
	             data_out <= mem(to_integer((unsigned(address)))); 
	         end if; 
	     end process; 
	 end architecture;
