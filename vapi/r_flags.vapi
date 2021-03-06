/* radare - LGPL - Copyright 2010-2016 pancake<@nopcode.org> */

[CCode (cheader_filename="r_flag.h,r_list.h,r_types_base.h", cprefix="r_flag_", lower_case_cprefix="r_flag_")]
namespace Radare {
	[Compact]
	[CCode (cprefix="r_flag_item_", cname="RFlagItem", free_function="")]
	public class RFlagItem {
		public char name[128]; // FIXME proper static strings w/o hardcoded size
		//public uint64 namehash;
		public int space;
		public uint64 size;
		public uint64 offset;
		//public string cmd;
		//public void set_name(string name, string realname);
		public void set_alias(string alias);
		public void set_comment(string comment);
	}

	[Compact]
	[CCode (cname="RFlag", free_function="r_flag_free", cprefix="r_flag_")]
	public class RFlag {
		public int space_idx;
		public RFlag();
		public RList<RFlagItem> flags;
		public void list(bool rad, string? pfx = null);
		public RFlagItem get(string name);
		public RFlagItem get_i(uint64 addr);
		public bool unset_name(string name);
		public bool unset_off(uint64 addr);
		public bool sort(int namesort);
		//public static bool name_check(string name);
		//public static bool name_filter(string name);
		public RFlagItem set(string name, uint64 addr, int size=1); //, bool dup=false);

		public bool space_list(int type);
		public unowned string? space_get_i(int idx);
		public int space_get(string name);
		//public int space_get_i(string fsname);
		public void space_set(string name);
	}
}
