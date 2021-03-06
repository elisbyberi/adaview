-------------------------------------------------------------------------------
-- GhostScript API Ada binding                                               --
--                                                                           --
-- Copyright (c) 2014 Zhu Qun-Ying.                                          --
--                                                                           --
-- This file is part of Adaview.                                             --
--                                                                           --
-- Adaview is free software; you can redistribute it and/or modify           --
-- it under the terms of the GNU General Public License as published by      --
-- the Free Software Foundation; either version 3 of the License, or         --
-- (at your option) any later version.                                       --
--                                                                           --
-- Adaview is distributed in the hope that it will be useful,                --
-- but WITHOUT ANY WARRANTY; without even the implied warranty of            --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the             --
-- GNU General Public License for more details.                              --
--                                                                           --
-- You should have received a copy of the GNU General Public License         --
-- along with this program; if not, see <http://www.gnu.org/licenses/>.      --
-------------------------------------------------------------------------------

-- error definitions from ghostscript/ierrors.h
package GS.Errors is

   type Code_t is new Integer;

   no_error		: constant Code_t := 0;

   -- definition of error codes, PostScript Level 1 errors
   e_unknownerror       : constant Code_t := -1;
   e_dictfull           : constant Code_t := -2;
   e_dictstackoverflow  : constant Code_t := -3;
   e_dictstackunderflow : constant Code_t := -4;
   e_execstackoverflow  : constant Code_t := -5;
   e_interrupt          : constant Code_t := -6;
   e_invalidaccess      : constant Code_t := -7;
   e_invalidexit        : constant Code_t := -8;
   e_invalidfileaccess  : constant Code_t := -9;
   e_invalidfont        : constant Code_t := -10;
   e_invalidrestore     : constant Code_t := -11;
   e_ioerror            : constant Code_t := -12;
   e_limitcheck         : constant Code_t := -13;
   e_nocurrentpoint     : constant Code_t := -14;
   e_rangecheck         : constant Code_t := -15;
   e_stackoverflow      : constant Code_t := -16;
   e_stackunderflow     : constant Code_t := -17;
   e_syntaxerror        : constant Code_t := -18;
   e_timeout            : constant Code_t := -19;
   e_typecheck          : constant Code_t := -20;
   e_undefined          : constant Code_t := -21;
   e_undefinedfilename  : constant Code_t := -22;
   e_undefinedresult    : constant Code_t := -23;
   e_unmatchedmark      : constant Code_t := -24;
   e_VMerror            : constant Code_t := -25; -- must be the last Level 1 error

   ------ Additional Level 2 errors (also in DPS)
   e_configurationerror : constant Code_t := -26;
   e_undefinedresource  : constant Code_t := -27;
   e_unregistered       : constant Code_t := -28;

   ------ Additional DPS errors ------
   e_invalidcontext : constant Code_t := -29;
   e_invalidid      : constant Code_t := -30; -- invalidid is for the NeXT DPS
                                       -- extension.

   -- Pseudo-errors used internally

   e_Fatal : constant Code_t := -100;
   -- Internal code for a fatal error gs_interpret also returns this for a
   -- .quit with a positive exit code.

   e_Quit : constant Code_t := -101;
   -- Internal code for the .quit operator. The real quit code is an integer on
   -- the operand stack. gs_interpret returns this only for a .quit with a zero
   -- exit code.

   e_InterpreterExit : constant Code_t := -102;
   -- Internal code for a normal exit from the interpreter. Do not use outside
   -- of interp.c.

   e_RemapColor : constant Code_t := -103;
   -- Internal code that indicates that a procedure has been stored in the
   -- remap_proc of the graphics state, and should be called before retrying
   -- the current token. This is used for color remapping involving a call back
   -- into the interpreter -- inelegant, but effective.

   e_ExecStackUnderflow : constant Code_t := -104;
   -- Internal code to indicate we have underflowed the top block of the
   -- e-stack.

   e_VMreclaim : constant Code_t := -105;
   -- Internal code for the vmreclaim operator with a positive operand. We need
   -- to handle this as an error because otherwise the interpreter won't reload
   -- enough of its state when the operator returns.

   e_NeedInput : constant Code_t := -106;
   -- Internal code for requesting more input from run_string.

   e_Info : constant Code_t := -110;
   -- Internal code for a normal exit when usage info is displayed. This allows
   -- Window versions of Ghostscript to pause until the message can be read.

   function is_interrupt (ecode : Code_t) return Boolean;
   pragma Inline (is_interrupt);
   -- Define which error codes require re-executing the current object
end GS.Errors;
