-- code generated from the following source code:
--   ../vm/fail.ecl
--   ../vm/value.ecl
--   ../vm/ram.ecl
--   ../vm/frames.ecl
--   ../vm/vm.ecl
--   ../vm/main.ecl
--
-- with the following command:
--
--    ./eclat -arg=true -relax -notyB ../vm/fail.ecl ../vm/value.ecl ../vm/ram.ecl ../vm/frames.ecl ../vm/vm.ecl ../vm/main.ecl

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.runtime.all;


entity main is
  
  port(signal clk    : in std_logic;
       signal reset  : in std_logic;
       signal run    : in std_logic;
       signal rdy    : out value(0 to 0);
       signal argument : in value(0 to 0);
       signal result : out value(0 to 0));
       
end entity;
architecture rtl of main is

  type t_state is (compute167, forever85);
  signal \state\: t_state;
  type t_state_var211 is (compute191, \$33_forever85\, pause_setI193, pause_setI199, pause_setII194, pause_setII200, q_wait195, q_wait201);
  signal state_var211: t_state_var211;
  type t_state_var210 is (compute188);
  signal state_var210: t_state_var210;
  type t_state_var209 is (compute183);
  signal state_var209: t_state_var209;
  type t_state_var208 is (compute171, \$30_forever85\, pause_getI173, pause_getII174, q_wait175, vm_run_code75);
  signal state_var208: t_state_var208;
  type array_value_32 is array (natural range <>) of value(0 to 31);
  type array_value_40 is array (natural range <>) of value(0 to 39);
  signal arr160 : array_value_32(0 to 99) := (others => (others => '0'));
  signal \$arr160_value\ : value(0 to 31);
  signal \$arr160_ptr\ : natural range 0 to 99;
  signal \$arr160_ptr_write\ : natural range 0 to 99;
  signal \$arr160_write\ : value(0 to 31);
  signal \$arr160_write_request\ : std_logic := '0';
  signal arr161 : array_value_32(0 to 99) := (others => (others => '0'));
  signal \$arr161_value\ : value(0 to 31);
  signal \$arr161_ptr\ : natural range 0 to 99;
  signal \$arr161_ptr_write\ : natural range 0 to 99;
  signal \$arr161_write\ : value(0 to 31);
  signal \$arr161_write_request\ : std_logic := '0';
  signal arr162 : array_value_32(0 to 99) := (others => (others => '0'));
  signal \$arr162_value\ : value(0 to 31);
  signal \$arr162_ptr\ : natural range 0 to 99;
  signal \$arr162_ptr_write\ : natural range 0 to 99;
  signal \$arr162_write\ : value(0 to 31);
  signal \$arr162_write_request\ : std_logic := '0';
  signal arr163 : array_value_40(0 to 99) := (others => (others => '0'));
  signal \$arr163_value\ : value(0 to 39);
  signal \$arr163_ptr\ : natural range 0 to 99;
  signal \$arr163_ptr_write\ : natural range 0 to 99;
  signal \$arr163_write\ : value(0 to 39);
  signal \$arr163_write_request\ : std_logic := '0';
  signal arr164 : array_value_32(0 to 99) := (others => (others => '0'));
  signal \$arr164_value\ : value(0 to 31);
  signal \$arr164_ptr\ : natural range 0 to 99;
  signal \$arr164_ptr_write\ : natural range 0 to 99;
  signal \$arr164_write\ : value(0 to 31);
  signal \$arr164_write_request\ : std_logic := '0';
  
  begin
    process (clk)
            begin
            if (rising_edge(clk)) then
                  if \$arr160_write_request\ = '1' then
                    arr160(\$arr160_ptr_write\) <= \$arr160_write\;
                  else
                   \$arr160_value\ <= arr160(\$arr160_ptr\);
                  end if;
            end if;
        end process;
    
    process (clk)
            begin
            if (rising_edge(clk)) then
                  if \$arr161_write_request\ = '1' then
                    arr161(\$arr161_ptr_write\) <= \$arr161_write\;
                  else
                   \$arr161_value\ <= arr161(\$arr161_ptr\);
                  end if;
            end if;
        end process;
    
    process (clk)
            begin
            if (rising_edge(clk)) then
                  if \$arr162_write_request\ = '1' then
                    arr162(\$arr162_ptr_write\) <= \$arr162_write\;
                  else
                   \$arr162_value\ <= arr162(\$arr162_ptr\);
                  end if;
            end if;
        end process;
    
    process (clk)
            begin
            if (rising_edge(clk)) then
                  if \$arr163_write_request\ = '1' then
                    arr163(\$arr163_ptr_write\) <= \$arr163_write\;
                  else
                   \$arr163_value\ <= arr163(\$arr163_ptr\);
                  end if;
            end if;
        end process;
    
    process (clk)
            begin
            if (rising_edge(clk)) then
                  if \$arr164_write_request\ = '1' then
                    arr164(\$arr164_ptr_write\) <= \$arr164_write\;
                  else
                   \$arr164_value\ <= arr164(\$arr164_ptr\);
                  end if;
            end if;
        end process;
    
    process(clk)
      variable \$v123\, \$v111\ : value(0 to 1) := (others => '0');
      variable \$v198\ : value(0 to 35) := (others => '0');
      variable vm_run_code75_arg : value(0 to 262) := (others => '0');
      variable \$v180\, \$v177\, \$v207\, is_loaded, \$v196\, result165, 
               result186, \$v205\, \$v185\, rdy190, \$v192\, rdy187, \$v178\, 
               \$v168\, \$v204\, \$v202\, rdy170, \$v176\, rdy166, result189, 
               \$v122\, result169, rdy182 : value(0 to 0) := (others => '0');
      variable \$v121\, \$v197\, result181, cy : value(0 to 31) := (others => '0');
      variable \$arr160_ptr_take\ : value(0 to 0) := "0";
      variable \$arr161_ptr_take\ : value(0 to 0) := "0";
      variable \$arr162_ptr_take\ : value(0 to 0) := "0";
      variable \$arr163_ptr_take\ : value(0 to 0) := "0";
      variable \$arr164_ptr_take\ : value(0 to 0) := "0";
      
    begin
      
      if rising_edge(clk) then
        if (reset = '1') then
          default_zero(vm_run_code75_arg); default_zero(cy); 
          default_zero(result181); default_zero(rdy182); 
          default_zero(result169); default_zero(\$v122\); 
          default_zero(result189); default_zero(rdy166); 
          default_zero(\$v176\); default_zero(rdy170); default_zero(\$v202\); 
          default_zero(\$v111\); default_zero(\$v198\); 
          default_zero(\$v204\); default_zero(\$v168\); 
          default_zero(\$v178\); default_zero(rdy187); default_zero(\$v192\); 
          default_zero(\$v197\); default_zero(rdy190); default_zero(\$v185\); 
          default_zero(\$v205\); default_zero(result186); 
          default_zero(result165); default_zero(\$v196\); 
          default_zero(\$v123\); default_zero(is_loaded); 
          default_zero(\$v207\); default_zero(\$v177\); 
          default_zero(\$v121\); default_zero(\$v180\); 
          rdy <= "1";
          rdy166 := "0";
          \state\ <= compute167;
          state_var211 <= compute191;
          state_var210 <= compute188;
          state_var209 <= compute183;
          state_var208 <= compute171;
          
        else if run = '1' then
          case \state\ is
          when forever85 =>
            \state\ <= forever85;
          when compute167 =>
            rdy166 := eclat_false;
            case state_var210 is
            when compute188 =>
              rdy187 := eclat_false;
              \$v205\ := \$v122\;
              if \$v205\(0) = '1' then
                result186 := eclat_true;
                rdy187 := eclat_true;
                state_var210 <= compute188;
              else
                case state_var211 is
                when \$33_forever85\ =>
                  state_var211 <= \$33_forever85\;
                when pause_setI193 =>
                  \$arr163_write_request\ <= '0';
                  state_var211 <= pause_setII194;
                when pause_setI199 =>
                  \$arr163_write_request\ <= '0';
                  state_var211 <= pause_setII200;
                when pause_setII194 =>
                  \$arr163_ptr_take\(0) := '0';
                  result189 := eclat_unit;
                  rdy190 := eclat_true;
                  state_var211 <= compute191;
                when pause_setII200 =>
                  \$arr163_ptr_take\(0) := '0';
                  \$v196\ := \$arr163_ptr_take\;
                  if \$v196\(0) = '1' then
                    state_var211 <= q_wait195;
                  else
                    \$arr163_ptr_take\(0) := '1';
                    \$v192\ := eclat_unit;
                    \$arr163_ptr_write\ <= 1;
                    \$arr163_write_request\ <= '1';
                    \$arr163_write\ <= "0111" & \$v192\&"000"& X"00000000";
                    state_var211 <= pause_setI193;
                  end if;
                when q_wait195 =>
                  \$v196\ := \$arr163_ptr_take\;
                  if \$v196\(0) = '1' then
                    state_var211 <= q_wait195;
                  else
                    \$arr163_ptr_take\(0) := '1';
                    \$v192\ := eclat_unit;
                    \$arr163_ptr_write\ <= 1;
                    \$arr163_write_request\ <= '1';
                    \$arr163_write\ <= "0111" & \$v192\&"000"& X"00000000";
                    state_var211 <= pause_setI193;
                  end if;
                when q_wait201 =>
                  \$v202\ := \$arr163_ptr_take\;
                  if \$v202\(0) = '1' then
                    state_var211 <= q_wait201;
                  else
                    \$arr163_ptr_take\(0) := '1';
                    \$v197\ := X"000000" & X"2a";
                    \$v198\ := "0001" & \$v197\;
                    \$arr163_ptr_write\ <= 0;
                    \$arr163_write_request\ <= '1';
                    \$arr163_write\ <= "0101" & \$v198\;
                    state_var211 <= pause_setI199;
                  end if;
                when compute191 =>
                  rdy190 := eclat_false;
                  \$v202\ := \$arr163_ptr_take\;
                  if \$v202\(0) = '1' then
                    state_var211 <= q_wait201;
                  else
                    \$arr163_ptr_take\(0) := '1';
                    \$v197\ := X"000000" & X"2a";
                    \$v198\ := "0001" & \$v197\;
                    \$arr163_ptr_write\ <= 0;
                    \$arr163_write_request\ <= '1';
                    \$arr163_write\ <= "0101" & \$v198\;
                    state_var211 <= pause_setI199;
                  end if;
                end case;
                \$v204\ := eclat_not(rdy190);
                if \$v204\(0) = '1' then
                  result189 := eclat_unit;
                end if;
                \$v123\ := result189 & rdy190;
                result186 := ""&\$v123\(1);
                rdy187 := eclat_true;
                state_var210 <= compute188;
              end if;
            end case;
            \$v207\ := eclat_not(rdy187);
            if \$v207\(0) = '1' then
              result186 := eclat_false;
            end if;
            \$v122\ := result186;
            is_loaded := result186;
            case state_var209 is
            when compute183 =>
              rdy182 := eclat_false;
              result181 := eclat_if(is_loaded & eclat_add(\$v121\ & "00000000000000000000000000000001") & \$v121\);
              rdy182 := eclat_true;
              state_var209 <= compute183;
            end case;
            \$v185\ := eclat_not(rdy182);
            if \$v185\(0) = '1' then
              result181 := "00000000000000000000000000000000";
            end if;
            \$v121\ := result181;
            cy := result181;
            case state_var208 is
            when \$30_forever85\ =>
              state_var208 <= \$30_forever85\;
            when pause_getI173 =>
              state_var208 <= pause_getII174;
            when pause_getII174 =>
              \$arr163_ptr_take\(0) := '0';
              eclat_print_string(of_string("todo :-)"));
              
              eclat_print_newline(eclat_unit);
              
              eclat_print_string(of_string("(exit) bye bye."));
              
              eclat_print_newline(eclat_unit);
              
              state_var208 <= \$30_forever85\;
            when q_wait175 =>
              \$v176\ := \$arr163_ptr_take\;
              if \$v176\(0) = '1' then
                state_var208 <= q_wait175;
              else
                \$arr163_ptr_take\(0) := '1';
                \$arr163_ptr\ <= to_integer(unsigned(vm_run_code75_arg(64 to 95)));
                state_var208 <= pause_getI173;
              end if;
            when vm_run_code75 =>
              \$v177\ := ""&vm_run_code75_arg(262);
              if \$v177\(0) = '1' then
                eclat_print_string(of_string("[sp:"));
                
                eclat_print_int(vm_run_code75_arg(0 to 31));
                
                eclat_print_string(of_string("|env:"));
                
                eclat_print_int(vm_run_code75_arg(32 to 63));
                
                eclat_print_string(of_string("|pc:"));
                
                eclat_print_int(vm_run_code75_arg(64 to 95));
                
                eclat_print_string(of_string("|fp:"));
                
                eclat_print_int(vm_run_code75_arg(96 to 127));
                
                eclat_print_string(of_string("]"));
                
                eclat_print_string(of_string("|gp:"));
                
                eclat_print_int(vm_run_code75_arg(128 to 159));
                
                eclat_print_string(of_string("|hp:"));
                
                eclat_print_int(vm_run_code75_arg(128 to 159));
                
                eclat_print_newline(eclat_unit);
                
                \$v176\ := \$arr163_ptr_take\;
                if \$v176\(0) = '1' then
                  state_var208 <= q_wait175;
                else
                  \$arr163_ptr_take\(0) := '1';
                  \$arr163_ptr\ <= to_integer(unsigned(vm_run_code75_arg(64 to 95)));
                  state_var208 <= pause_getI173;
                end if;
              else
                \$v176\ := \$arr163_ptr_take\;
                if \$v176\(0) = '1' then
                  state_var208 <= q_wait175;
                else
                  \$arr163_ptr_take\(0) := '1';
                  \$arr163_ptr\ <= to_integer(unsigned(vm_run_code75_arg(64 to 95)));
                  state_var208 <= pause_getI173;
                end if;
              end if;
            when compute171 =>
              rdy170 := eclat_false;
              eclat_print_string(of_string("START (cy="));
              
              eclat_print_int(cy);
              
              eclat_print_string(of_string(")"));
              
              eclat_print_newline(eclat_unit);
              
              \$v178\ := eclat_unit;
              vm_run_code75_arg := "00000000000000000000000000000000" & "00000000000000000000000000000000" & "00000000000000000000000000000000" & "00000000000000000000000000000000" & "00000000000000000000000000000000" & "00000000000000000000000000000000" & eclat_false & "00000000000000000000000000000000" & "0010" & \$v178\&"000"& X"0000000" & eclat_false & argument;
              state_var208 <= vm_run_code75;
            end case;
            \$v180\ := eclat_not(rdy170);
            if \$v180\(0) = '1' then
              result169 := eclat_unit;
            end if;
            \$v111\ := result169 & rdy170;
            \$v168\ := ""&\$v111\(1);
            if \$v168\(0) = '1' then
              eclat_print_string(of_string("END (cy="));
              
              eclat_print_int(cy);
              
              eclat_print_string(of_string(")"));
              
              eclat_print_newline(eclat_unit);
              
              result165 := eclat_unit;
              eclat_print_newline(eclat_unit);
              
              rdy166 := eclat_true;
              \state\ <= compute167;
            else
              result165 := eclat_unit;
              rdy166 := eclat_true;
              \state\ <= compute167;
            end if;
          end case;
          
          result <= result165;
          rdy <= rdy166;
          
        end if;
      end if;
    end if;
  end process;
end architecture;
