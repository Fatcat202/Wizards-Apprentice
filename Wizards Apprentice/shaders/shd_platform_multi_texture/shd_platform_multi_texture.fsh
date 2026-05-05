varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D shape_texture;

// Corners used to fill platforms
uniform sampler2D corner_top_right;
uniform sampler2D corner_top_left;
uniform sampler2D corner_bottom_right;
uniform sampler2D corner_bottom_left;


// Combines together shape and texture sprites to automatically fill platform textures
void main()
{
	// Main texture to use
	vec4 base_tex_color = texture2D(gm_BaseTexture, v_vTexcoord);
	
	// Shape to use
	vec4 shape_tex_color = texture2D(shape_texture, v_vTexcoord);

	// Top left corner
	vec4 corner_tex_top_left = texture2D(corner_top_left, v_vTexcoord);
	
	// Top right corner
	vec4 corner_tex_top_right = texture2D(corner_top_right, v_vTexcoord);
	
	// Bottom Right corner
	vec4 corner_tex_bottom_right = texture2D(corner_bottom_right, v_vTexcoord);
	
	// Bottom left corner
	vec4 corner_tex_bottom_left = texture2D(corner_bottom_left, v_vTexcoord);
	
	// Sum of all corners
	float corner_alpha = corner_tex_top_left.a + corner_tex_top_right.a + corner_tex_bottom_right.a + corner_tex_bottom_left.a;
	shape_tex_color.a += corner_alpha;

	// Combine shape and color
	vec4 final_tex_color = vec4(base_tex_color.rgb, base_tex_color.a * shape_tex_color.a);
	
	// Set shader for display
    gl_FragColor = v_vColour * final_tex_color;
}
