note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	testing: "type/manual"

class
	FLAT_RENDERER_TEST_SET

inherit
	EQA_TEST_SET
		rename
			assert as assert_old
		end

	EQA_COMMONLY_USED_ASSERTIONS
		undefine
			default_create
		end

feature -- Test routines

	creation_test
			-- New test routine
		local
			l_rend: FLAT_RENDERER
			l_data: ARRAYED_LIST [ARRAY [ANY]]
		do
			create l_rend
			create l_data.make (3)
			l_data.force (<<create {DATE}.make (2018, 1, 2), create {DECIMAL}.make_from_string ("25.01"), "Larry", "Curly", "Moe", "Shemp", 1001, 100.99099>>)
			l_data.force (<<"blah_stuff", 1, 2, 3>>)
			l_data.force (<<10, 20, create {TIME}.make (10, 20, 59)>>)

			assert_strings_equal ("data_1", data_1_string, l_rend.dump_01 (l_data))
		end

feature {NONE} -- Support

	data_1_string: STRING = "[
1:1:01/02/2018,2:25.01,3:Larry,4:Curly,5:Moe,6:Shemp,7:1001,8:100.99099
2:1:blah_stuff,2:1,3:2,4:3
3:1:10,2:20,3:10:20:59.000 AM


]"

end


